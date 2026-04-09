---
title: "Clipboard: phương thức read()"
short-title: read()
slug: Web/API/Clipboard/read
page-type: web-api-instance-method
browser-compat: api.Clipboard.read
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Phương thức **`read()`** của giao diện {{domxref("Clipboard")}} yêu cầu một bản sao nội dung của bảng nhớ tạm, hoàn thành {{jsxref("Promise")}} được trả về với dữ liệu đó.

Về lý thuyết, phương thức này có thể trả về dữ liệu tùy ý (không giống {{domxref("Clipboard.readText", "readText()")}}, vốn chỉ có thể trả về văn bản).
Trình duyệt thường hỗ trợ đọc dữ liệu văn bản, HTML và hình ảnh PNG.

## Cú pháp

```js-nolint
read()
read(formats)
```

### Tham số

- `formats` {{optional_inline}}
  - : Một đối tượng tùy chọn với các thuộc tính sau:
    - `unsanitized` {{optional_inline}}
      - : Một {{jsxref("Array")}} gồm các chuỗi chứa kiểu MIME của những định dạng dữ liệu không nên bị làm sạch khi đọc từ bảng nhớ tạm.

        Một số trình duyệt có thể làm sạch dữ liệu trên bảng nhớ tạm khi đọc để ngăn nội dung độc hại bị dán vào tài liệu. Ví dụ, Chrome (và các trình duyệt khác dựa trên Chromium) làm sạch dữ liệu HTML bằng cách loại bỏ các thẻ `<script>` và nội dung có khả năng nguy hiểm khác. Hãy dùng mảng `unsanitized` để chỉ định danh sách các kiểu MIME không nên bị làm sạch.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một mảng các đối tượng {{domxref("ClipboardItem")}} chứa nội dung của bảng nhớ tạm.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu không được phép đọc từ bảng nhớ tạm.

## Lưu ý về bảo mật

Việc đọc từ bảng nhớ tạm chỉ có thể được thực hiện trong [ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Các yêu cầu bảo mật bổ sung được trình bày trong phần [Lưu ý về bảo mật](/en-US/docs/Web/API/Clipboard_API#security_considerations) của trang tổng quan API.

## Ví dụ

### Đọc dữ liệu hình ảnh từ bảng nhớ tạm

Ví dụ này sử dụng phương thức `read()` để đọc dữ liệu hình ảnh từ bảng nhớ tạm và dán nó vào một phần tử {{HTMLElement("img")}}.

#### HTML

```html
<img id="source" src="butterfly.jpg" alt="Một con bướm" />
<img id="destination" src="" alt="Hình ảnh đã dán" />
<button id="reload" type="button">Tải lại</button>
<p id="log"></p>
```

#### CSS

```css
img {
  height: 100px;
  width: 100px;
  margin: 0 1rem;
  border: 1px solid black;
}
#reload {
  display: block;
  margin: 0 1rem;
}
```

#### JavaScript

Đoạn mã này cung cấp cách ghi lại mọi lỗi vào phần tử có id là `log`.

```js
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `Lỗi: ${text}`;
}
```

Chúng ta cũng thêm mã để tải lại và xóa ví dụ khi nút "Tải lại" được nhấn.

```js
const reload = document.querySelector("#reload");

reload.addEventListener("click", () => {
  window.location.reload(true);
});
```

Phần mã còn lại sẽ đọc bảng nhớ tạm khi phần tử đích được nhấp vào và sao chép dữ liệu hình ảnh vào phần tử `destinationImage`.
Nó ghi lại lỗi nếu không thể sử dụng phương thức `read()`, hoặc nếu bảng nhớ tạm không chứa dữ liệu ở định dạng PNG.

```js
const destinationImage = document.querySelector("#destination");
destinationImage.addEventListener("click", pasteImage);

async function pasteImage() {
  try {
    const clipboardContents = await navigator.clipboard.read();
    for (const item of clipboardContents) {
      if (!item.types.includes("image/png")) {
        throw new Error("Bảng nhớ tạm không chứa dữ liệu hình ảnh PNG.");
      }
      const blob = await item.getType("image/png");
      destinationImage.src = URL.createObjectURL(blob);
    }
  } catch (error) {
    log(error.message);
  }
}
```

#### Kết quả

Hãy sao chép ảnh con bướm ở bên trái bằng cách nhấp chuột phải vào ảnh rồi chọn "Copy image" trong menu ngữ cảnh.
Sau đó nhấp vào khung trống ở bên phải.
Ví dụ sẽ lấy dữ liệu hình ảnh từ bảng nhớ tạm và hiển thị hình ảnh trong khung trống.

{{EmbedLiveSample("Reading image data from clipboard", "100%", "250", "", "", "", "clipboard-read")}}

> [!NOTE]
> Nếu được hỏi, hãy cấp quyền để dán hình ảnh.

### Đọc dữ liệu từ bảng nhớ tạm

Ví dụ này sử dụng phương thức `read()` để đọc dữ liệu từ bảng nhớ tạm và ghi lại bất kỳ dữ liệu nào đang được lưu trong bảng nhớ tạm.

Ví dụ này khác với phiên bản trước ở chỗ nó sẽ hiển thị các đối tượng {{domxref("ClipboardItem")}} là văn bản, HTML và hình ảnh (thay vì chỉ hiển thị hình ảnh).

#### HTML

```html
<img id="source_jpg" src="butterfly.jpg" alt="Ảnh bướm JPG" />
<div id="destination">Nhấp vào đây để sao chép dữ liệu bảng nhớ tạm.</div>
<button id="reload" type="button">Tải lại</button>
<p id="log"></p>
```

#### CSS

```css
img {
  height: 100px;
  width: 100px;
  margin: 0 1rem;
  border: 1px solid black;
}

#destination {
  min-height: 300px;
  min-width: 90%;
  margin: 0 1rem;
  border: 1px solid black;
}

#reload {
  display: block;
  margin: 0 1rem;
}
```

#### JavaScript

Đoạn mã này cung cấp cách ghi lại mọi lỗi vào phần tử có id là `log`.

```js
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `Lỗi: ${text}`;
}
```

Chúng ta cũng thêm mã để tải lại và xóa ví dụ khi nút "Tải lại" được nhấn.

```js
const reload = document.querySelector("#reload");

reload.addEventListener("click", () => {
  window.location.reload(true);
});
```

Phần mã còn lại sẽ đọc bảng nhớ tạm khi phần tử đích được nhấp vào và hiển thị từng phần tử {{domxref("ClipboardItem")}} cùng với kiểu MIME của nó.
Nó ghi lại lỗi nếu không thể sử dụng phương thức `read()`, hoặc nếu bảng nhớ tạm chứa bất kỳ kiểu MIME nào khác.

```js
const destinationDiv = document.querySelector("#destination");
destinationDiv.addEventListener("click", pasteData);

async function pasteData() {
  destinationDiv.innerText = ""; // Xóa văn bản bên trong
  try {
    const clipboardContents = await navigator.clipboard.read();
    for (const item of clipboardContents) {
      for (const mimeType of item.types) {
        const mimeTypeElement = document.createElement("p");
        mimeTypeElement.innerText = `Kiểu MIME: ${mimeType}`;
        destinationDiv.appendChild(mimeTypeElement);
        if (mimeType === "image/png") {
          const pngImage = new Image();
          pngImage.alt = "Hình PNG từ bảng nhớ tạm";
          const blob = await item.getType("image/png");
          pngImage.src = URL.createObjectURL(blob);
          destinationDiv.appendChild(pngImage);
        } else if (mimeType === "text/html") {
          const blob = await item.getType("text/html");
          const blobText = await blob.text();
          const clipHTML = document.createElement("pre");
          clipHTML.innerText = blobText;
          destinationDiv.appendChild(clipHTML);
        } else if (mimeType === "text/plain") {
          const blob = await item.getType("text/plain");
          const blobText = await blob.text();
          const clipPlain = document.createElement("pre");
          clipPlain.innerText = blobText;
          destinationDiv.appendChild(clipPlain);
        } else {
          throw new Error(`${mimeType} không được hỗ trợ.`);
        }
      }
    }
  } catch (error) {
    log(error.message);
  }
}
```

#### Kết quả

Hãy sao chép một ít văn bản hoặc ảnh con bướm (JPG) bên dưới (để sao chép ảnh, hãy nhấp chuột phải vào ảnh rồi chọn "Copy image" trong menu ngữ cảnh).
Chọn khung được chỉ định bên dưới để dán thông tin này từ bảng nhớ tạm vào trong khung.

{{EmbedLiveSample("Reading data from the clipboard", "100%", "500", "", "", "", "clipboard-read")}}

Lưu ý:

- Dù ảnh con bướm là tệp JPG, khi đọc từ bảng nhớ tạm nó sẽ là PNG.
- Nếu được hỏi, bạn sẽ cần cấp quyền để dán hình ảnh.
- Điều này có thể không hoạt động trên các trình duyệt Chromium vì khung mẫu không được cấp quyền [Permissions-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy) `clipboard-read` và `clipboard-write` ([được các trình duyệt Chromium yêu cầu](/en-US/docs/Web/API/Clipboard_API#security_considerations)).

### Đọc HTML chưa làm sạch từ bảng nhớ tạm

Ví dụ này sử dụng tham số `formats` để đọc dữ liệu HTML từ bảng nhớ tạm và lấy mã ở dạng ban đầu của nó, không để trình duyệt làm sạch trước.

#### HTML

```html
<textarea id="source" rows="5">
  <style>h1 {color: red;} p {color: blue;}</style>
  <h1>Hello world!</h1>
  <p>This is a test.</p>
  <script>alert('Hello world!');</script>
</textarea>
<button id="copy">Copy HTML</button>
<button id="paste_normal">Paste HTML</button>
<button id="paste_unsanitized">Paste unsanitized HTML</button>
<textarea id="destination" rows="5"></textarea>
```

#### CSS

```css
body {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 5px;
}

textarea {
  grid-column: 1 / span 3;
}
```

#### JavaScript

```js
const copyButton = document.getElementById("copy");
const pasteButton = document.getElementById("paste_normal");
const pasteUnsanitizedButton = document.getElementById("paste_unsanitized");
const sourceTextarea = document.getElementById("source");
const destinationTextarea = document.getElementById("destination");

copyButton.addEventListener("click", async () => {
  const text = sourceTextarea.value;
  const type = "text/html";
  const blob = new Blob([text], { type });
  const data = [new ClipboardItem({ [type]: blob })];

  try {
    await navigator.clipboard.write(data);
  } catch (error) {
    destinationTextarea.value = `Ghi vào bảng nhớ tạm thất bại: ${error}`;
  }
});

async function getHTMLFromClipboardContents(clipboardContents) {
  for (const item of clipboardContents) {
    if (item.types.includes("text/html")) {
      const blob = await item.getType("text/html");
      const blobText = await blob.text();
      return blobText;
    }
  }

  return null;
}

pasteButton.addEventListener("click", async () => {
  try {
    const clipboardContents = await navigator.clipboard.read();
    const html = await getHTMLFromClipboardContents(clipboardContents);
    destinationTextarea.value =
      html || "Không tìm thấy dữ liệu HTML trong bảng nhớ tạm.";
  } catch (error) {
    destinationTextarea.value = `Đọc bảng nhớ tạm thất bại: ${error}`;
  }
});

pasteUnsanitizedButton.addEventListener("click", async () => {
  try {
    const clipboardContents = await navigator.clipboard.read({
      unsanitized: ["text/html"],
    });
    const html = await getHTMLFromClipboardContents(clipboardContents);
    destinationTextarea.value =
      html || "Không tìm thấy dữ liệu HTML trong bảng nhớ tạm.";
  } catch (error) {
    destinationTextarea.value = `Đọc bảng nhớ tạm thất bại: ${error}`;
  }
});
```

#### Kết quả

Trước tiên, hãy nhấp vào nút "Copy HTML" để ghi mã HTML từ textarea đầu tiên vào bảng nhớ tạm. Sau đó, nhấp vào nút "Paste HTML" hoặc nút "Paste unsanitized HTML" để dán mã HTML đã được làm sạch hoặc chưa được làm sạch vào textarea thứ hai.

{{EmbedLiveSample("Reading unsanitized HTML from the clipboard", "100%", "250", "", "", "", "clipboard-read; clipboard-write")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
- [Unblocking clipboard access](https://web.dev/articles/async-clipboard) trên web.dev
- [Unsanitized HTML in the Async Clipboard API](https://developer.chrome.com/docs/web-platform/unsanitized-html-async-clipboard) trên developer.chrome.com
- {{domxref("Clipboard.readText()")}}
- {{domxref("Clipboard.writeText()")}}
- {{domxref("Clipboard.write()")}}
