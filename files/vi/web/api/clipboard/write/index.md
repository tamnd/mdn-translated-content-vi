---
title: "Clipboard: phương thức write()"
short-title: write()
slug: Web/API/Clipboard/write
page-type: web-api-instance-method
browser-compat: api.Clipboard.write
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Phương thức **`write()`** của giao diện {{domxref("Clipboard")}} ghi dữ liệu {{domxref("ClipboardItem")}} bất kỳ như hình ảnh và văn bản vào bảng nhớ tạm, hoàn thành {{jsxref("Promise")}} được trả về khi thao tác hoàn tất.
Phương thức này có thể được dùng để triển khai chức năng cắt và sao chép.

Về lý thuyết, phương thức này có thể ghi dữ liệu tùy ý (không giống {{domxref("Clipboard.writeText", "writeText()")}}, vốn chỉ có thể ghi văn bản).
Trình duyệt thường hỗ trợ ghi dữ liệu văn bản, HTML và hình ảnh PNG.

## Cú pháp

```js-nolint
write(data)
```

### Tham số

- `data`
  - : Một mảng các đối tượng {{domxref("ClipboardItem")}} chứa dữ liệu sẽ được ghi vào bảng nhớ tạm.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết khi dữ liệu đã được ghi vào bảng nhớ tạm.
Lưu ý rằng nếu hệ điều hành bên dưới không hỗ trợ nhiều mục gốc trên bảng nhớ tạm hệ thống thì chỉ mục {{domxref("ClipboardItem")}} đầu tiên trong mảng mới được ghi.

Promise sẽ bị từ chối nếu bảng nhớ tạm không thể ghi dữ liệu.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu không được phép ghi vào bảng nhớ tạm.

## Lưu ý về bảo mật

Việc ghi vào bảng nhớ tạm chỉ có thể được thực hiện trong [ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Các yêu cầu bảo mật bổ sung được trình bày trong phần [Lưu ý về bảo mật](/en-US/docs/Web/API/Clipboard_API#security_considerations) của trang tổng quan API.

## Ví dụ

### Ghi văn bản vào bảng nhớ tạm

Hàm ví dụ này thay thế nội dung hiện tại của bảng nhớ tạm bằng một chuỗi được chỉ định khi một nút được nhấn.
Lưu ý rằng trong trường hợp cụ thể này, bạn cũng có thể dùng `Clipboard.writeText()`.

```js
button.addEventListener("click", () => setClipboard("<empty clipboard>"));

async function setClipboard(text) {
  const type = "text/plain";
  const clipboardItemData = {
    [type]: text,
  };
  const clipboardItem = new ClipboardItem(clipboardItemData);
  await navigator.clipboard.write([clipboardItem]);
}
```

Hàm `setClipboard()` chỉ định kiểu MIME `"text/plain"` trong hằng `type`, rồi xác định một đối tượng `clipboardItemData` với một thuộc tính duy nhất: khóa của nó là kiểu MIME, còn giá trị là văn bản được truyền vào mà chúng ta muốn ghi vào bảng nhớ tạm. Sau đó, chúng ta tạo một đối tượng {{domxref("ClipboardItem")}} mới và truyền `clipboardItemData` vào đó.

Cuối cùng, `write()` được gọi với `await` để ghi dữ liệu vào bảng nhớ tạm.

### Ghi nội dung canvas vào bảng nhớ tạm

Ví dụ này vẽ một hình chữ nhật màu xanh lam lên canvas.
Bạn có thể nhấp vào hình chữ nhật để sao chép nội dung của canvas vào bảng nhớ tạm dưới dạng hình ảnh, rồi chọn một phần tử khác và dán nội dung từ bảng nhớ tạm vào đó.

#### HTML

Phần HTML chỉ định nghĩa phần tử `<canvas>` của chúng ta và phần tử `<div>` có id là `target`, nơi hình ảnh từ canvas sẽ được dán.

```html
<canvas id="canvas" width="100" height="100"></canvas>

<div id="target">Dán vào đây.</div>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 60px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

Đầu tiên, chúng ta định nghĩa một hàm `async` để sao chép một canvas thành blob.
Hàm này bao bọc phương thức {{domxref("HTMLCanvasElement.toBlob()")}} kiểu callback cũ thành một hàm dựa trên `Promise` trực quan hơn.

```js
// Phương thức Async/await thay thế callback của toBlob()
async function getBlobFromCanvas(canvas) {
  return new Promise((resolve, reject) => {
    canvas.toBlob((blob) => {
      if (blob) {
        resolve(blob);
      } else {
        reject(new Error("Canvas toBlob thất bại"));
      }
    });
  });
}
```

Tiếp theo, chúng ta thiết lập canvas và thêm một bộ lắng nghe sự kiện cho sự kiện `click`.

Khi bạn nhấp vào hình chữ nhật màu xanh, canvas hiển thị hình chữ nhật sẽ được sao chép vào một blob, sau đó blob được thêm vào một `ClipboardItem` rồi được ghi vào bảng nhớ tạm.

```js
const canvas = document.getElementById("canvas");

// Thiết lập canvas
const ctx = canvas.getContext("2d");
ctx.fillStyle = "cornflowerblue";
ctx.fillRect(0, 0, 100, 100);

canvas.addEventListener("click", copyCanvasContentsToClipboard);
const target = document.getElementById("target");

async function copyCanvasContentsToClipboard() {
  // Sao chép canvas thành blob
  try {
    const blob = await getBlobFromCanvas(canvas);
    // Tạo ClipboardItem với blob và kiểu của nó, rồi thêm vào một mảng
    const data = [new ClipboardItem({ [blob.type]: blob })];
    // Ghi dữ liệu vào bảng nhớ tạm
    await navigator.clipboard.write(data);
    log("Đã sao chép");
  } catch (error) {
    log(error);
  }
}
```

Lưu ý rằng nếu bạn đang lấy một kiểu tệp ít phổ biến hơn hoặc một tài nguyên mà bạn không biết trước kiểu của nó, bạn có thể muốn dùng {{domxref("ClipboardItem.supports_static", "ClipboardItem.supports()")}} để kiểm tra xem kiểu tệp đó có được hỗ trợ hay không, đồng thời cung cấp thông báo lỗi phù hợp cho người dùng nếu không được hỗ trợ.

Sau đó, chúng ta định nghĩa một bộ lắng nghe sự kiện cho [các sự kiện `paste`](/en-US/docs/Web/API/Element/paste_event) trên phần tử nơi chúng ta muốn hiển thị nội dung bảng nhớ tạm dưới dạng hình ảnh.
[FileReader API](/en-US/docs/Web/API/FileReader) cho phép chúng ta đọc blob bằng phương thức [`readAsDataURL`](/en-US/docs/Web/API/FileReader/readAsDataURL) và tạo một phần tử `<img>` với nội dung canvas:

```js
target.addEventListener("paste", (event) => {
  const items = (event.clipboardData || window.clipboardData).items;
  const blob = items[0].getAsFile();
  const reader = new FileReader();

  reader.addEventListener("load", (event) => {
    const img = new Image();
    img.src = event.target.result;
    target.appendChild(img);
  });

  reader.readAsDataURL(blob);
});
```

```css hidden
body {
  font-family: sans-serif;
}
#target {
  border: 2px solid;
  padding: 1rem;
  height: 150px;
}
img {
  margin: 0.5rem;
}
```

#### Kết quả

Kết quả được hiển thị bên dưới.
Trước tiên, hãy nhấp vào hình vuông màu xanh, sau đó chọn văn bản "Dán vào đây." và sử dụng tổ hợp phím dán tương ứng với hệ điều hành của bạn (chẳng hạn `Ctrl+V` trên Windows).

{{embedlivesample("write_canvas_contents_to_the_clipboard", "", "420", "", "", "", "clipboard-write")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
- [Image support for Async Clipboard article](https://web.dev/articles/async-clipboard)
- {{domxref("Clipboard.writeText()")}}
- {{domxref("Clipboard.read()")}}
- {{domxref("Clipboard.readText()")}}
