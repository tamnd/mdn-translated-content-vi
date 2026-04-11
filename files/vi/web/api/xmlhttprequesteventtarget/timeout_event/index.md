---
title: "XMLHttpRequestEventTarget: timeout event"
short-title: timeout
slug: Web/API/XMLHttpRequestEventTarget/timeout_event
page-type: web-api-event
browser-compat:
  - api.XMLHttpRequest.timeout_event
  - api.XMLHttpRequestUpload.timeout_event
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Sự kiện **`timeout`** được kích hoạt khi tiến trình bị chấm dứt do hết thời gian đặt trước.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("timeout", (event) => { })

ontimeout = (event) => { }
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

```js
const client = new XMLHttpRequest();
client.open("GET", "http://www.example.org/example.txt");
client.ontimeout = () => {
  console.error("Timeout!!");
};

client.send();
```

Bạn cũng có thể thiết lập bộ xử lý sự kiện bằng phương thức {{domxref("EventTarget/addEventListener", "addEventListener()")}}:

```js
client.addEventListener("timeout", () => {
  console.error("Timeout!!");
});
```

### Dùng với XMLHttpRequestUpload

Bạn có thể dùng sự kiện `timeout` để phát hiện một lượt tải lên bị dừng vì quá chậm. Để xem ví dụ mã đầy đủ tải lên tệp và hiển thị thanh tiến trình, hãy xem trang {{domxref("XMLHttpRequestUpload")}} chính.

Thời gian chờ được đặt trên đối tượng {{domxref("XMLHttpRequest")}} bằng thuộc tính {{domxref("XMLHttpRequest.timeout")}}.

```js
// Trong trường hợp timeout, chúng ta ẩn thanh tiến trình
// Lưu ý rằng sự kiện này cũng có thể được lắng nghe trên đối tượng xhr
function errorAction(event) {
  progressBar.classList.remove("visible");
  log.textContent = `Upload failed: ${event.type}`;
}
xhr.upload.addEventListener("timeout", errorAction);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: {{domxref("XMLHttpRequestEventTarget/loadstart_event", "loadstart")}}, {{domxref("XMLHttpRequestEventTarget/load_event", "load")}}, {{domxref("XMLHttpRequestEventTarget/loadend_event", "loadend")}}, {{domxref("XMLHttpRequestEventTarget/progress_event", "progress")}}, {{domxref("XMLHttpRequestEventTarget/error_event", "error")}}, {{domxref("XMLHttpRequestEventTarget/abort_event", "abort")}}
- [Giám sát tiến trình](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest#monitoring_progress)
