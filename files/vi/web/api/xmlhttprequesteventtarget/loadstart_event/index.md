---
title: "XMLHttpRequestEventTarget: loadstart event"
short-title: loadstart
slug: Web/API/XMLHttpRequestEventTarget/loadstart_event
page-type: web-api-event
browser-compat:
  - api.XMLHttpRequest.loadstart_event
  - api.XMLHttpRequestUpload.loadstart_event
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Sự kiện **`loadstart`** được kích hoạt khi một yêu cầu bắt đầu tải dữ liệu.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("loadstart", (event) => { })

onloadstart = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("ProgressEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ProgressEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha là {{domxref("Event")}} cũng có sẵn._

- {{domxref("ProgressEvent.lengthComputable", "lengthComputable")}} {{ReadOnlyInline}}
  - : Cờ boolean cho biết tổng lượng công việc cần làm và lượng công việc đã hoàn thành bởi tiến trình nền có thể tính được hay không. Nói cách khác, nó cho biết mức tiến triển có đo được hay không.
- {{domxref("ProgressEvent.loaded", "loaded")}} {{ReadOnlyInline}}
  - : Giá trị số nguyên không dấu 64 bit cho biết lượng công việc mà tiến trình nền đã thực hiện. Tỷ lệ công việc đã làm có thể được tính bằng cách chia giá trị thuộc tính này cho `total`. Khi tải một tài nguyên bằng HTTP, giá trị này chỉ tính phần thân của thông điệp HTTP, không gồm header và phần phụ trội khác.
- {{domxref("ProgressEvent.total", "total")}} {{ReadOnlyInline}}
  - : Giá trị số nguyên không dấu 64 bit biểu thị tổng lượng công việc mà tiến trình nền đang thực hiện. Khi tải một tài nguyên bằng HTTP, đây là `Content-Length` (kích thước phần thân của thông điệp), không gồm các header và phần phụ trội khác.

## Ví dụ

### Dùng với XMLHttpRequest

#### HTML

```html
<div class="controls">
  <input
    class="xhr success"
    type="button"
    name="xhr"
    value="Click to start XHR (success)" />
  <input
    class="xhr error"
    type="button"
    name="xhr"
    value="Click to start XHR (error)" />
  <input
    class="xhr abort"
    type="button"
    name="xhr"
    value="Click to start XHR (abort)" />
</div>

<textarea readonly class="event-log"></textarea>
```

```css hidden
.event-log {
  width: 25rem;
  height: 4rem;
  border: 1px solid black;
  margin: 0.5rem;
  padding: 0.2rem;
}

input {
  width: 11rem;
  margin: 0.5rem;
}
```

#### JavaScript

```js
const xhrButtonSuccess = document.querySelector(".xhr.success");
const xhrButtonError = document.querySelector(".xhr.error");
const xhrButtonAbort = document.querySelector(".xhr.abort");
const log = document.querySelector(".event-log");

function handleEvent(e) {
  log.textContent = `${log.textContent}${e.type}: ${e.loaded} bytes transferred\n`;
}

function addListeners(xhr) {
  xhr.addEventListener("loadstart", handleEvent);
  xhr.addEventListener("load", handleEvent);
  xhr.addEventListener("loadend", handleEvent);
  xhr.addEventListener("progress", handleEvent);
  xhr.addEventListener("error", handleEvent);
  xhr.addEventListener("abort", handleEvent);
}

function runXHR(url) {
  log.textContent = "";

  const xhr = new XMLHttpRequest();
  addListeners(xhr);
  xhr.open("GET", url);
  xhr.send();
  return xhr;
}

xhrButtonSuccess.addEventListener("click", () => {
  runXHR("example-image.jpg");
});

xhrButtonError.addEventListener("click", () => {
  runXHR("https://example.com/notfound.jpg");
});

xhrButtonAbort.addEventListener("click", () => {
  runXHR("example-image.jpg").abort();
});
```

#### Kết quả

{{ EmbedLiveSample('Usage with XMLHttpRequest', '100%', '150px') }}

### Dùng với XMLHttpRequestUpload

Bạn có thể dùng sự kiện `loadstart` để phát hiện thời điểm bắt đầu tải lên. Để xem ví dụ mã đầy đủ tải lên tệp và hiển thị thanh tiến trình, hãy xem trang {{domxref("XMLHttpRequestUpload")}} chính.

```js
// Khi tải lên bắt đầu, chúng ta hiển thị thanh tiến trình
xhr.upload.addEventListener("loadstart", (event) => {
  progressBar.classList.add("visible");
  progressBar.value = 0;
  progressBar.max = event.total;
  log.textContent = "Uploading (0%)…";
  abortButton.disabled = false;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: {{domxref("XMLHttpRequestEventTarget/loadend_event", "loadend")}}, {{domxref("XMLHttpRequestEventTarget/load_event", "load")}}, {{domxref("XMLHttpRequestEventTarget/progress_event", "progress")}}, {{domxref("XMLHttpRequestEventTarget/error_event", "error")}}, {{domxref("XMLHttpRequestEventTarget/abort_event", "abort")}}
- [Giám sát tiến trình](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest#monitoring_progress)
