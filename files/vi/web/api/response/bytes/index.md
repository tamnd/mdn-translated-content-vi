---
title: "Response: phương thức bytes()"
short-title: bytes()
slug: Web/API/Response/bytes
page-type: web-api-instance-method
browser-compat: api.Response.bytes
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`bytes()`** của giao diện {{domxref("Response")}} nhận một luồng {{domxref("Response")}} và đọc nó đến hết. Phương thức này trả về một promise giải quyết với một {{jsxref("Uint8Array")}}.

## Cú pháp

```js-nolint
bytes()
```

### Tham số

Không có.

### Giá trị trả về

Một promise giải quyết với một {{jsxref("Uint8Array")}}.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Yêu cầu đã bị [hủy](/en-US/docs/Web/API/Fetch_API/Using_Fetch#canceling_a_request).
- {{jsxref("TypeError")}}
  - : Ném ra vì một trong các lý do sau:
    - Body phản hồi bị [disturbed hoặc locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Có lỗi giải mã nội dung body, ví dụ do header {{httpheader("Content-Encoding")}} không đúng.
- {{jsxref("RangeError")}}
  - : Ném ra nếu có sự cố khi tạo `ArrayBuffer` liên quan, ví dụ dữ liệu quá lớn.

## Ví dụ

### Fetch và giải mã một file

Đoạn mã dưới đây cho thấy cách bạn có thể fetch một file văn bản, trả body về dạng {{jsxref("Uint8Array")}}, rồi giải mã nó thành chuỗi.

```js
const response = await fetch("https://www.example.com/textfile.txt");
const textFile = await response.bytes();
const string = new TextDecoder().decode(textFile);
console.log(string);
```

### Lấy chữ ký file ảnh

Ví dụ này minh họa cách bạn có thể dùng `bytes()` để đọc các byte chữ ký của một số file ảnh và xác định loại file.

#### HTML

Trước hết chúng ta định nghĩa một phần tử {{htmlelement("select")}} để chọn loại file, với các giá trị tương ứng cho biết file cụ thể trên Wikimedia Commons cần fetch.

```html
<label for="file-select">Choose a file:</label>

<select name="Files" id="file-select">
  <option value="">--Select an image type--</option>
  <option
    value="https://upload.wikimedia.org/wikipedia/commons/7/70/Example.png">
    PNG
  </option>
  <option
    value="https://upload.wikimedia.org/wikipedia/commons/a/a9/Example.jpg">
    JPG
  </option>
  <option
    value="https://upload.wikimedia.org/wikipedia/commons/8/8f/Example.gif">
    GIF89a
  </option>
</select>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 100px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

Đoạn mã trước hết kiểm tra xem phương thức `bytes()` có được hỗ trợ hay không.
Nếu có, nó thêm một trình xử lý sự kiện cho sự kiện [`change`](/en-US/docs/Web/API/HTMLElement/change_event) trên phần tử `<select>`.
Khi giá trị thay đổi, nó truyền giá trị được chọn (một URL của file ảnh) tới phương thức `checkSignature()` được định nghĩa bên dưới.
Nếu không hỗ trợ, nó ghi thông tin này ra log.

```js
if ("bytes" in Response.prototype) {
  const selectFileElement = document.getElementById("file-select");
  selectFileElement.addEventListener("change", (event) => {
    try {
      checkSignature(event.target.value);
    } catch (e) {
      log(e);
    }
  });
} else {
  log("Response.bytes() not supported");
}
```

Phương thức `checkSignature()` được định nghĩa bên dưới.
Nó fetch một file tại `url` đã cho, và dùng `response.bytes()` để lấy nội dung dưới dạng mảng byte.
Các byte đầu tiên sau đó được so sánh với chữ ký đầu của một số loại file ảnh phổ biến.
Tên file và loại file sau đó được ghi log.

```js
async function checkSignature(url) {
  if (url === "") return;
  log(`File: ${url}`);
  const response = await fetch(url);
  const image = await response.bytes();

  // Chữ ký file từ: https://en.wikipedia.org/wiki/List_of_file_signatures
  const jpgSignature = [0xff, 0xd8, 0xff, 0xe0];
  const pngSignature = [0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a];
  const gif89aSignature = [0x47, 0x49, 0x46, 0x38, 0x39, 0x61];

  if (
    image
      .slice(0, jpgSignature.length)
      .every((byte, index) => byte === jpgSignature[index])
  ) {
    log(`JPG signature: FF D8 FF E0`);
  } else if (
    image
      .slice(0, pngSignature.length)
      .every((byte, index) => byte === pngSignature[index])
  ) {
    log(`PNG signature: 89 50 4E 47 0D 0A 1A 0A`);
  } else if (
    image
      .slice(0, gif89aSignature.length)
      .every((byte, index) => byte === gif89aSignature[index])
  ) {
    log(`GIF (GIF89a) signature: 47 49 46 38 39 61`);
  } else {
    log("Unknown format");
  }
}
```

#### Kết quả

Chọn một loại ảnh bằng danh sách chọn.
Sau đó log sẽ hiển thị tên file cùng loại file được xác định từ chữ ký của file.

{{EmbedLiveSample("Getting an image file signature", "100", "200px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
