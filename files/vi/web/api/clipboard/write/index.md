---
title: "Clipboard: phương thức write()"
short-title: write()
slug: Web/API/Clipboard/write
page-type: web-api-instance-method
browser-compat: api.Clipboard.write
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Phương thức **`write()`** của giao diện {{domxref("Clipboard")}} ghi dữ liệu {{domxref("ClipboardItem")}} tùy ý chẳng hạn như hình ảnh và văn bản vào clipboard, phân giải {{jsxref("Promise")}} trả về khi hoàn thành.
Phương thức này có thể được sử dụng để triển khai chức năng cắt và sao chép.

Về lý thuyết, phương thức này có thể ghi dữ liệu tùy ý (khác với {{domxref("Clipboard.writeText", "writeText()")}}, chỉ có thể ghi văn bản).
Các trình duyệt thường hỗ trợ ghi văn bản, HTML và dữ liệu hình ảnh PNG.

## Cú pháp

```js-nolint
write(data)
```

### Tham số

- `data`
  - : Một mảng các đối tượng {{domxref("ClipboardItem")}} chứa dữ liệu sẽ được ghi vào clipboard.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải khi dữ liệu đã được ghi vào clipboard.
Lưu ý rằng nếu hệ điều hành bên dưới không hỗ trợ nhiều mục clipboard gốc trên clipboard hệ thống, thì chỉ {{domxref("ClipboardItem")}} đầu tiên trong mảng được ghi.

Promise bị từ chối nếu clipboard không thể ghi vào clipboard.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Ném ra nếu việc ghi vào clipboard không được cho phép.

## Consideration về bảo mật

Việc ghi vào clipboard chỉ có thể được thực hiện trong [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Các yêu cầu bảo mật bổ sung được đề cập trong phần [Consideration về bảo mật](/en-US/docs/Web/API/Clipboard_API#security_considerations) của chủ đề tổng quan API.

## Ví dụ

### Ghi văn bản vào clipboard

Hàm ví dụ này thay thế nội dung hiện tại của clipboard bằng một chuỗi đã chỉ định khi nhấn nút.
Lưu ý rằng trong trường hợp này, bạn cũng có thể sử dụng `Clipboard.writeText()`.

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

Hàm `setClipboard()` chỉ định kiểu MIME `"text/plain"` trong hằng số `type`, sau đó chỉ định một đối tượng `clipboardItemData` với một thuộc tính duy nhất — khóa của nó là kiểu MIME, và giá trị của nó là văn bản được truyền vào mà chúng ta muốn ghi vào clipboard. Sau đó chúng ta xây dựng một đối tượng {{domxref("ClipboardItem")}} mới mà đối tượng `clipboardItemData` được truyền vào.

Cuối cùng, `write()` được gọi với `await` để ghi dữ liệu vào clipboard.

### Ghi nội dung canvas vào clipboard

Ví dụ này vẽ một hình chữ nhật màu xanh lên canvas.
Bạn có thể nhấp vào hình chữ nhật để sao chép nội dung của canvas vào clipboard dưới dạng hình ảnh, sau đó chọn phần tử khác và dán nội dung từ clipboard.

#### HTML

HTML chỉ định nghĩa phần tử `<canvas>` và phần tử `<div>` có id `target` nơi hình ảnh canvas sẽ được dán vào.

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

Đầu tiên chúng ta định nghĩa một hàm `async` để sao chép canvas vào blob.
Hàm này bao bọc phương thức {{domxref("HTMLCanvasElement.toBlob()")}} kiểu callback cũ thành hàm dựa trên `Promise` trực quan hơn.

```js
// Phương thức Async/await thay thế callback của toBlob()
async function getBlobFromCanvas(canvas) {
  return new Promise((resolve, reject) => {
    canvas.toBlob((blob) => {
      if (blob) {
        resolve(blob);
      } else {
        reject(new Error("Canvas toBlob failed"));
      }
    });
  });
}
```

Tiếp theo chúng ta thiết lập canvas và thêm trình lắng nghe sự kiện cho sự kiện `click`.

Khi bạn nhấp vào hình chữ nhật màu xanh, canvas hiển thị hình chữ nhật được sao chép vào blob, sau đó blob được thêm vào `ClipboardItem` và sau đó được ghi vào clipboard.

```js
const canvas = document.getElementById("canvas");

// Thiết lập canvas
const ctx = canvas.getContext("2d");
ctx.fillStyle = "cornflowerblue";
ctx.fillRect(0, 0, 100, 100);

canvas.addEventListener("click", copyCanvasContentsToClipboard);
const target = document.getElementById("target");

async function copyCanvasContentsToClipboard() {
  // Sao chép canvas vào blob
  try {
    const blob = await getBlobFromCanvas(canvas);
    // Tạo ClipboardItem với blob và kiểu của nó, thêm vào mảng
    const data = [new ClipboardItem({ [blob.type]: blob })];
    // Ghi dữ liệu vào clipboard
    await navigator.clipboard.write(data);
    log("Đã sao chép");
  } catch (error) {
    log(error);
  }
}
```

Lưu ý rằng nếu bạn đang fetch một loại tệp ít phổ biến hơn hoặc một tài nguyên mà bạn không biết kiểu trước, bạn có thể muốn sử dụng {{domxref("ClipboardItem.supports_static", "ClipboardItem.supports()")}} để kiểm tra xem loại tệp có được hỗ trợ không và cung cấp thông báo lỗi tốt cho người dùng trong trường hợp nó không được hỗ trợ.

Sau đó chúng ta định nghĩa trình lắng nghe sự kiện cho [sự kiện `paste`](/en-US/docs/Web/API/Element/paste_event) trên phần tử nơi chúng ta muốn hiển thị nội dung clipboard dưới dạng hình ảnh.
[API FileReader](/en-US/docs/Web/API/FileReader) cho phép chúng ta đọc blob bằng phương thức [`readAsDataUrl`](/en-US/docs/Web/API/FileReader/readAsDataURL) và tạo phần tử `<img>` với nội dung canvas:

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
Đầu tiên nhấp vào hình vuông màu xanh, sau đó chọn văn bản "Paste here" và sử dụng tổ hợp phím phù hợp với hệ điều hành của bạn để dán từ clipboard (chẳng hạn như `Ctrl+V` trên Windows).

{{embedlivesample("write_canvas_contents_to_the_clipboard", "", "420", "", "", "", "clipboard-write")}}

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Clipboard](/en-US/docs/Web/API/Clipboard_API)
- [Bài viết về hỗ trợ hình ảnh cho Async Clipboard](https://web.dev/articles/async-clipboard)
- {{domxref("Clipboard.writeText()")}}
- {{domxref("Clipboard.read()")}}
- {{domxref("Clipboard.readText()")}}
