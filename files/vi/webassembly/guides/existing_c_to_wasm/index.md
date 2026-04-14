---
title: Biên dịch mô-đun C hiện có sang WebAssembly
slug: WebAssembly/Guides/Existing_C_to_Wasm
page-type: guide
sidebar: webassemblysidebar
---

Một trường hợp sử dụng cốt lõi của WebAssembly là tận dụng hệ sinh thái thư viện C hiện có và cho phép các nhà phát triển sử dụng chúng trên web.

Các thư viện này thường dựa vào thư viện chuẩn của C, hệ điều hành, hệ thống tệp và các thứ khác. Emscripten cung cấp hầu hết các tính năng này, mặc dù có một số [hạn chế](https://emscripten.org/docs/porting/guidelines/api_limitations.html).

Như một ví dụ, hãy biên dịch một bộ mã hóa cho WebP sang Wasm. Mã nguồn của codec WebP được viết bằng C và [có sẵn trên GitHub](https://github.com/webmproject/libwebp) cùng với một số [tài liệu API](https://developers.google.com/speed/webp/docs/api) phong phú. Đây là điểm khởi đầu khá tốt.

```bash
git clone https://github.com/webmproject/libwebp
```

Để bắt đầu đơn giản, hãy hiển thị `WebPGetEncoderVersion()` từ `encode.h` sang JavaScript bằng cách viết một tệp C có tên `webp.c`:

```c
#include "emscripten.h"
#include "src/webp/encode.h"

EMSCRIPTEN_KEEPALIVE
int version() {
    return WebPGetEncoderVersion();
}
```

Đây là một chương trình đơn giản tốt để kiểm tra xem bạn có thể lấy mã nguồn của libwebp để biên dịch hay không, vì nó không yêu cầu bất kỳ tham số hoặc cấu trúc dữ liệu phức tạp nào để gọi hàm này.

Để biên dịch chương trình này, bạn cần cho trình biên dịch biết nơi nó có thể tìm thấy các tệp header của libwebp bằng cờ `-I` và cũng truyền cho nó tất cả các tệp C của libwebp mà nó cần. Một chiến lược hữu ích là chỉ cần cung cấp cho nó **tất cả** các tệp C và dựa vào trình biên dịch để loại bỏ mọi thứ không cần thiết. Có vẻ như nó hoạt động hoàn hảo cho thư viện này:

```bash
emcc -O3 -s WASM=1 -s EXPORTED_RUNTIME_METHODS='["cwrap"]' \
    -I libwebp \
    webp.c \
    libwebp/src/{dec,dsp,demux,enc,mux,utils}/*.c \
    libwebp/sharpyuv/*.c
```

> [!NOTE]
> Chiến lược này sẽ không hoạt động với mọi dự án C. Nhiều dự án dựa vào autoconf/automake để tạo code đặc thù cho hệ thống trước khi biên dịch. Emscripten cung cấp `emconfigure` và `emmake` để bao bọc các lệnh này và tiêm các tham số thích hợp. Bạn có thể tìm thêm trong [tài liệu Emscripten](https://emscripten.org/docs/compiling/Building-Projects.html).

Bây giờ bạn chỉ cần một số HTML và JavaScript để tải mô-đun mới của bạn:

```html
<script src="./a.out.js"></script>
<script>
  Module.onRuntimeInitialized = async () => {
    const api = {
      version: Module.cwrap("version", "number", []),
    };
    console.log(api.version());
  };
</script>
```

Và bạn sẽ thấy số phiên bản đúng trong [đầu ra](https://googlechrome.github.io/samples/webassembly/version.html):

![Ảnh chụp màn hình bảng điều khiển DevTools hiển thị số phiên bản đúng.](version.png)

> [!NOTE]
> libwebp trả về phiên bản hiện tại a.b.c dưới dạng số thập lục phân 0xabc. Ví dụ: v0.6.1 được mã hóa là 0x000601 = 1537.

## Lấy một hình ảnh từ JavaScript vào Wasm

Lấy số phiên bản của bộ mã hóa thật tốt, nhưng mã hóa một hình ảnh thực tế sẽ ấn tượng hơn. Làm thế nào để chúng ta làm điều đó?

Câu hỏi đầu tiên bạn cần trả lời là: làm thế nào để đưa hình ảnh vào Wasm? Nhìn vào [API mã hóa của libwebp](https://developers.google.com/speed/webp/docs/api#simple_encoding_api), bạn sẽ thấy rằng nó mong đợi một mảng byte ở RGB, RGBA, BGR hoặc BGRA. May mắn thay, Canvas API có {{domxref("CanvasRenderingContext2D.getImageData")}} — điều đó cung cấp cho bạn một {{jsxref("Uint8ClampedArray")}} chứa dữ liệu hình ảnh trong RGBA:

```js
async function loadImage(src) {
  // Load image
  const imgBlob = await fetch(src).then((resp) => resp.blob());
  const img = await createImageBitmap(imgBlob);
  // Make canvas same size as image
  const canvas = document.createElement("canvas");
  canvas.width = img.width;
  canvas.height = img.height;
  // Draw image onto canvas
  const ctx = canvas.getContext("2d");
  ctx.drawImage(img, 0, 0);
  return ctx.getImageData(0, 0, img.width, img.height);
}
```

Bây giờ chỉ là vấn đề sao chép dữ liệu từ JavaScript vào Wasm. Đối với điều đó, bạn cần hiển thị hai hàm bổ sung — một hàm phân bổ bộ nhớ cho hình ảnh bên trong Wasm và một hàm giải phóng bộ nhớ đó:

```c
#include <stdlib.h> // required for malloc definition

EMSCRIPTEN_KEEPALIVE
uint8_t* create_buffer(int width, int height) {
    return malloc(width * height * 4 * sizeof(uint8_t));
}

EMSCRIPTEN_KEEPALIVE
void destroy_buffer(uint8_t* p) {
    free(p);
}
```

Hàm `create_buffer()` phân bổ một bộ đệm cho hình ảnh RGBA — do đó 4 byte mỗi pixel. Con trỏ được trả về bởi `malloc()` là địa chỉ của ô bộ nhớ đầu tiên của bộ đệm đó. Khi con trỏ được trả về cho JavaScript, nó được xử lý như chỉ là một số. Sau khi hiển thị hàm cho JavaScript bằng cwrap, bạn có thể sử dụng số đó để tìm điểm bắt đầu của bộ đệm của chúng ta và sao chép dữ liệu hình ảnh:

```js
const api = {
  version: Module.cwrap("version", "number", []),
  create_buffer: Module.cwrap("create_buffer", "number", ["number", "number"]),
  destroy_buffer: Module.cwrap("destroy_buffer", "", ["number"]),
  encode: Module.cwrap("encode", "", ["number", "number", "number", "number"]),
  free_result: Module.cwrap("free_result", "", ["number"]),
  get_result_pointer: Module.cwrap("get_result_pointer", "number", []),
  get_result_size: Module.cwrap("get_result_size", "number", []),
};

const image = await loadImage("./image.jpg");
const p = api.create_buffer(image.width, image.height);
Module.HEAP8.set(image.data, p);
// … call encoder …
api.destroy_buffer(p);
```

## Mã hóa hình ảnh

Hình ảnh bây giờ có sẵn trong Wasm. Đã đến lúc gọi bộ mã hóa WebP để thực hiện công việc của nó. Nhìn vào [tài liệu WebP](https://developers.google.com/speed/webp/docs/api#simple_encoding_api), bạn sẽ thấy rằng `WebPEncodeRGBA` có vẻ là lựa chọn hoàn hảo. Hàm lấy một con trỏ đến hình ảnh đầu vào và các kích thước của nó, cũng như một tùy chọn chất lượng từ 0 đến 100. Nó cũng phân bổ một bộ đệm đầu ra cho chúng ta mà chúng ta cần giải phóng bằng `WebPFree()` khi chúng ta đã xong với hình ảnh WebP.

Kết quả của thao tác mã hóa là một bộ đệm đầu ra và độ dài của nó. Vì các hàm trong C không thể có mảng làm kiểu trả về (trừ khi bạn phân bổ bộ nhớ động), ví dụ này sử dụng một mảng toàn cục tĩnh. Đây có thể không phải là C sạch. Trên thực tế, nó dựa vào các con trỏ Wasm có độ rộng 32 bit. Nhưng đây là một phím tắt hợp lý để giữ mọi thứ đơn giản:

```c
int result[2];
EMSCRIPTEN_KEEPALIVE
void encode(uint8_t* img_in, int width, int height, float quality) {
    uint8_t* img_out;
    size_t size;

    size = WebPEncodeRGBA(img_in, width, height, width * 4, quality, &img_out);

    result[0] = (int)img_out;
    result[1] = size;
}

EMSCRIPTEN_KEEPALIVE
void free_result(uint8_t* result) {
  WebPFree(result);
}

EMSCRIPTEN_KEEPALIVE
int get_result_pointer() {
  return result[0];
}

EMSCRIPTEN_KEEPALIVE
int get_result_size() {
  return result[1];
}
```

Bây giờ với tất cả những điều đó, bạn có thể gọi hàm mã hóa, lấy con trỏ và kích thước hình ảnh, đặt nó vào bộ đệm JavaScript của riêng bạn và giải phóng tất cả các bộ đệm Wasm được phân bổ trong quá trình:

```js
api.encode(p, image.width, image.height, 100);
const resultPointer = api.get_result_pointer();
const resultSize = api.get_result_size();
const resultView = new Uint8Array(
  Module.HEAP8.buffer,
  resultPointer,
  resultSize,
);
const result = new Uint8Array(resultView);
api.free_result(resultPointer);
```

> [!NOTE]
> `new Uint8Array(someBuffer)` sẽ tạo một view mới trên cùng một đoạn bộ nhớ, trong khi `new Uint8Array(someTypedArray)` sẽ sao chép dữ liệu.

Tùy thuộc vào kích thước hình ảnh của bạn, bạn có thể gặp lỗi khi Wasm không thể tăng bộ nhớ đủ để chứa cả hình ảnh đầu vào và đầu ra:

![Ảnh chụp màn hình bảng điều khiển DevTools hiển thị lỗi.](error.png)

May mắn thay, giải pháp cho vấn đề này nằm trong thông báo lỗi. Bạn chỉ cần thêm `-s ALLOW_MEMORY_GROWTH=1` vào lệnh biên dịch của bạn.

Và đó là tất cả. Bạn đã biên dịch bộ mã hóa WebP và mã hóa hình ảnh JPEG sang WebP. Để chứng minh rằng nó đã hoạt động, hãy chuyển bộ đệm kết quả của bạn thành một blob và sử dụng nó trên một phần tử `<img>`:

```js
const blob = new Blob([result], { type: "image/webp" });
const blobURL = URL.createObjectURL(blob);
const img = document.createElement("img");
img.src = blobURL;
img.alt = "a useful description";
document.body.appendChild(img);
```

Chiêm ngưỡng vẻ đẹp của một hình ảnh WebP mới.

[Bản demo](https://googlechrome.github.io/samples/webassembly/image.html) | [Bài viết gốc](https://web.dev/articles/emscripting-a-c-library)

![Bảng điều khiển mạng DevTools và hình ảnh được tạo.](result.jpg)
