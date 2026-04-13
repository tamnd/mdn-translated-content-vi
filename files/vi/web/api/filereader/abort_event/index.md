---
title: "FileReader: sự kiện abort"
short-title: abort
slug: Web/API/FileReader/abort_event
page-type: web-api-event
browser-compat: api.FileReader.abort_event
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Sự kiện **`abort`** của giao diện {{domxref("FileReader")}} được kích hoạt khi thao tác đọc bị huỷ, ví dụ khi chương trình gọi {{domxref("FileReader.abort()")}}.

Sự kiện này không thể huỷ và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("abort", (event) => { })

onabort = (event) => { }
```

## Loại sự kiện

Một {{domxref("ProgressEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ProgressEvent")}}

## Thuộc tính sự kiện

_Cũng kế thừa các thuộc tính từ sự kiện cha {{domxref("Event")}}._

- {{domxref("ProgressEvent.lengthComputable")}} {{ReadOnlyInline}}
  - : Cờ boolean cho biết liệu tổng công việc cần thực hiện và lượng công việc đã làm bởi tiến trình bên dưới có thể tính toán được không. Nói cách khác, cho biết liệu tiến trình có thể đo lường hay không.
- {{domxref("ProgressEvent.loaded")}} {{ReadOnlyInline}}
  - : Giá trị số nguyên 64-bit không dấu cho biết lượng công việc đã được thực hiện bởi tiến trình bên dưới. Tỷ lệ công việc hoàn thành có thể tính bằng cách chia `total` cho giá trị của thuộc tính này. Khi tải tài nguyên qua HTTP, giá trị này chỉ tính phần thân của thông điệp HTTP, không tính tiêu đề và các phần mở rộng khác.
- {{domxref("ProgressEvent.total")}} {{ReadOnlyInline}}
  - : Giá trị số nguyên 64-bit không dấu đại diện cho tổng lượng công việc mà tiến trình bên dưới đang thực hiện. Khi tải tài nguyên qua HTTP, đây là `Content-Length` (kích thước phần thân thông điệp), không tính tiêu đề và các phần mở rộng khác.

## Ví dụ

### Ví dụ trực tiếp

#### HTML

```html
<div class="example">
  <div class="file-select">
    <label for="avatar">Choose a profile picture:</label>
    <input
      type="file"
      id="avatar"
      name="avatar"
      accept="image/png, image/jpeg" />
  </div>

  <img src="" class="preview" height="200" alt="Image preview" />

  <div class="event-log">
    <label for="eventLog">Event log:</label>
    <textarea readonly class="event-log-contents" id="eventLog"></textarea>
  </div>
</div>
```

```css hidden
img.preview {
  margin: 1rem 0;
}

.event-log-contents {
  width: 18rem;
  height: 5rem;
  border: 1px solid black;
  margin: 0.2rem;
  padding: 0.2rem;
  resize: none;
}

.example {
  display: grid;
  grid-template-areas:
    "select  log"
    "preview log";
}

.file-select {
  grid-area: select;
}

.preview {
  grid-area: preview;
}

.event-log {
  grid-area: log;
}

.event-log > label {
  display: block;
}
```

#### JavaScript

```js
const fileInput = document.querySelector('input[type="file"]');
const preview = document.querySelector("img.preview");
const eventLog = document.querySelector(".event-log-contents");
const reader = new FileReader();

function handleEvent(event) {
  eventLog.textContent += `${event.type}: ${event.loaded} bytes transferred\n`;

  if (event.type === "load") {
    preview.src = reader.result;
  }
}

function addListeners(reader) {
  reader.addEventListener("loadstart", handleEvent);
  reader.addEventListener("load", handleEvent);
  reader.addEventListener("loadend", handleEvent);
  reader.addEventListener("progress", handleEvent);
  reader.addEventListener("error", handleEvent);
  reader.addEventListener("abort", handleEvent);
}

function handleSelected(e) {
  eventLog.textContent = "";
  const selectedFile = fileInput.files[0];
  if (selectedFile) {
    addListeners(reader);
    reader.readAsDataURL(selectedFile);
  }
  reader.abort();
}

fileInput.addEventListener("change", handleSelected);
```

#### Kết quả

{{ EmbedLiveSample('Live_example', '100%', '300px') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện liên quan: {{domxref("FileReader.loadstart_event", "loadstart")}}, {{domxref("FileReader.loadend_event", "loadend")}}, {{domxref("FileReader.progress_event", "progress")}}, {{domxref("FileReader.error_event", "error")}}, {{domxref("FileReader.load_event", "load")}}.
