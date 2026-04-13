---
title: "Clipboard: phương thức read()"
short-title: read()
slug: Web/API/Clipboard/read
page-type: web-api-instance-method
browser-compat: api.Clipboard.read
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Phương thức **`read()`** của giao diện {{domxref("Clipboard")}} yêu cầu bản sao nội dung của clipboard, phân giải {{jsxref("Promise")}} trả về với dữ liệu.

Về lý thuyết, phương thức này có thể trả về dữ liệu tùy ý (khác với {{domxref("Clipboard.readText", "readText()")}}, chỉ có thể trả về văn bản).
Các trình duyệt thường hỗ trợ đọc văn bản, HTML và dữ liệu hình ảnh PNG.

## Cú pháp

```js-nolint
read()
read(formats)
```

### Tham số

- `formats` {{optional_inline}}
  - : Một đối tượng tùy chọn với các thuộc tính sau:
    - `unsanitized` {{optional_inline}}
      - : Một {{jsxref("Array")}} chuỗi chứa các kiểu MIME của các định dạng dữ liệu không nên được sanitizing khi đọc từ clipboard.

        Một số trình duyệt có thể sanitize dữ liệu clipboard khi nó được đọc, để ngăn chặn nội dung độc hại được dán vào tài liệu. Ví dụ: Chrome (và các trình duyệt dựa trên Chromium khác) sanitizes dữ liệu HTML bằng cách loại bỏ các thẻ `<script>` và các nội dung có khả năng nguy hiểm khác. Sử dụng mảng `unsanitized` để chỉ định danh sách các kiểu MIME không nên được sanitizing.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với mảng các đối tượng {{domxref("ClipboardItem")}} chứa nội dung của clipboard.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Ném ra nếu việc đọc từ clipboard không được cho phép.

## Consideration về bảo mật

Việc đọc từ clipboard chỉ có thể được thực hiện trong [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Các yêu cầu bảo mật bổ sung được đề cập trong phần [Consideration về bảo mật](/en-US/docs/Web/API/Clipboard_API#security_considerations) của chủ đề tổng quan API.

## Ví dụ

### Đọc dữ liệu hình ảnh từ clipboard

Ví dụ này sử dụng phương thức `read()` để đọc dữ liệu hình ảnh từ clipboard và dán nó vào phần tử {{HTMLElement("img")}}.

#### HTML

```html
<img id="source" src="butterfly.jpg" alt="A butterfly" />
<img id="destination" src="" alt="Pasted image" />
<button id="reload" type="button">Reload</button>
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

Mã này cung cấp cơ chế ghi lại bất kỳ lỗi nào vào phần tử có id `log`.

```js
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `Error: ${text}`;
}
```

Chúng ta cũng thêm mã để tải lại và xóa ví dụ khi nhấn nút "Reload".

```js
const reload = document.querySelector("#reload");

reload.addEventListener("click", () => {
  window.location.reload(true);
});
```

Phần mã còn lại đọc clipboard khi phần tử đích được nhấp và sao chép dữ liệu hình ảnh vào phần tử `destinationImage`.
Nó ghi lại lỗi nếu không thể sử dụng phương thức `read()`, hoặc nếu clipboard không chứa dữ liệu ở định dạng PNG.

```js
const destinationImage = document.querySelector("#destination");
destinationImage.addEventListener("click", pasteImage);

async function pasteImage() {
  try {
    const clipboardContents = await navigator.clipboard.read();
    for (const item of clipboardContents) {
      if (!item.types.includes("image/png")) {
        throw new Error("Clipboard does not contain PNG image data.");
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

Sao chép hình ảnh bướm bên trái bằng cách nhấp chuột phải vào hình ảnh và chọn "Copy image" từ menu ngữ cảnh.
Sau đó nhấp vào khung trống bên phải.
Ví dụ sẽ fetch dữ liệu hình ảnh từ clipboard và hiển thị hình ảnh trong khung trống.

{{EmbedLiveSample("Reading image data from clipboard", "100%", "250", "", "", "", "clipboard-read")}}

> [!NOTE]
> Nếu được nhắc, hãy cấp quyền để dán hình ảnh.

### Đọc dữ liệu từ clipboard

Ví dụ này sử dụng phương thức `read()` để đọc dữ liệu từ clipboard và ghi lại bất kỳ dữ liệu nào được lưu trữ trong clipboard.

Điều này khác với phiên bản trước ở chỗ nó sẽ hiển thị các đối tượng {{domxref("ClipboardItem")}} văn bản, HTML và hình ảnh (thay vì chỉ hình ảnh).

#### HTML

```html
<img id="source_jpg" src="butterfly.jpg" alt="JPG butterfly image" />
<div id="destination">Nhấp vào đây để sao chép dữ liệu clipboard.</div>
<button id="reload" type="button">Reload</button>
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

Mã này cung cấp cơ chế ghi lại bất kỳ lỗi nào vào phần tử có id `log`.

```js
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `Error: ${text}`;
}
```

Chúng ta cũng thêm mã để tải lại và xóa ví dụ khi nhấn nút "Reload".

```js
const reload = document.querySelector("#reload");

reload.addEventListener("click", () => {
  window.location.reload(true);
});
```

Phần mã còn lại đọc clipboard khi phần tử đích được nhấp và hiển thị từng phần tử {{domxref("ClipboardItem")}} cùng với kiểu MIME của nó.
Nó ghi lại lỗi nếu không thể sử dụng phương thức `read()`, hoặc nếu clipboard chứa bất kỳ kiểu MIME nào khác.

```js
const destinationDiv = document.querySelector("#destination");
destinationDiv.addEventListener("click", pasteData);

async function pasteData() {
  destinationDiv.innerText = ""; // Xóa inner text
  try {
    const clipboardContents = await navigator.clipboard.read();
    for (const item of clipboardContents) {
      for (const mimeType of item.types) {
        const mimeTypeElement = document.createElement("p");
        mimeTypeElement.innerText = `MIME type: ${mimeType}`;
        destinationDiv.appendChild(mimeTypeElement);
        if (mimeType === "image/png") {
          const pngImage = new Image();
          pngImage.alt = "PNG image from clipboard";
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
          throw new Error(`${mimeType} not supported.`);
        }
      }
    }
  } catch (error) {
    log(error.message);
  }
}
```

#### Kết quả

Sao chép một số văn bản hoặc hình ảnh bướm (JPG) bên dưới (để sao chép hình ảnh, nhấp chuột phải vào chúng và chọn "Copy image" từ menu ngữ cảnh).
Chọn khung được chỉ dẫn bên dưới để dán thông tin này từ clipboard vào khung.

{{EmbedLiveSample("Reading data from the clipboard", "100%", "500", "", "", "", "clipboard-read")}}

Lưu ý:

- Mặc dù hình ảnh bướm là tệp JPG, khi đọc từ clipboard nó là PNG.
- Nếu được nhắc, bạn sẽ cần cấp quyền để dán hình ảnh.
- Điều này có thể không hoạt động trên các trình duyệt chromium vì khung mẫu không được cấp quyền [Permissions-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy) `clipboard-read` và `clipboard-write` ([yêu cầu bởi trình duyệt Chromium](/en-US/docs/Web/API/Clipboard_API#security_considerations)).

### Đọc HTML chưa sanitizing từ clipboard

Ví dụ này sử dụng tham số `formats` để đọc dữ liệu HTML từ clipboard và nhận mã ở dạng ban đầu, mà không cần trình browser sanitize trước.

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
    destinationTextarea.value = `Clipboard write failed: ${error}`;
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
      html || "Could not find HTML data in the clipboard.";
  } catch (error) {
    destinationTextarea.value = `Clipboard read failed: ${error}`;
  }
});

pasteUnsanitizedButton.addEventListener("click", async () => {
  try {
    const clipboardContents = await navigator.clipboard.read({
      unsanitized: ["text/html"],
    });
    const html = await getHTMLFromClipboardContents(clipboardContents);
    destinationTextarea.value =
      html || "Could not find HTML data in the clipboard.";
  } catch (error) {
    destinationTextarea.value = `Clipboard read failed: ${error}`;
  }
});
```

#### Kết quả

Đầu tiên nhấp vào nút "Copy HTML" để ghi mã HTML từ textarea đầu tiên vào clipboard. Sau đó nhấp vào nút "Paste HTML" hoặc nút "Paste unsanitized HTML" để dán mã HTML đã được sanitize hoặc chưa được sanitize vào textarea thứ hai.

{{EmbedLiveSample("Reading unsanitized HTML from the clipboard", "100%", "250", "", "", "", "clipboard-read; clipboard-write")}}

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Clipboard](/en-US/docs/Web/API/Clipboard_API)
- [Unblocking clipboard access](https://web.dev/articles/async-clipboard) trên web.dev
- [Unsanitized HTML in the Async Clipboard API](https://developer.chrome.com/docs/web-platform/unsanitized-html-async-clipboard) trên developer.chrome.com
- {{domxref("Clipboard.readText()")}}
- {{domxref("Clipboard.writeText()")}}
- {{domxref("Clipboard.write()")}}
