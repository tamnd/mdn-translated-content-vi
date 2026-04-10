---
title: Worker
slug: Web/API/Worker
page-type: web-api-interface
browser-compat: api.Worker
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("window_and_worker_except_service")}}

Giao diện **`Worker`** của [Web Workers API](/en-US/docs/Web/API/Web_Workers_API) đại diện cho một tác vụ nền có thể được tạo qua script, có thể gửi thông điệp trở lại trình tạo của nó.

Việc tạo một worker được thực hiện bằng cách gọi hàm tạo `Worker("path/to/worker/script")`.

Bản thân các worker có thể sinh ra các worker mới, miễn là các worker đó được lưu trữ tại cùng [nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy) với trang cha.

Lưu ý rằng không phải tất cả các giao diện và hàm đều khả dụng cho web workers. Xem [Các hàm và lớp khả dụng cho Web Workers](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers) để biết chi tiết.

{{InheritanceDiagram}}

## Constructors

- {{domxref("Worker.Worker", "Worker()")}}
  - : Tạo một dedicated web worker thực thi script tại URL được chỉ định. Phương thức này cũng hoạt động với [Blob URLs](/en-US/docs/Web/API/Blob).

## Thuộc tính instance

_Kế thừa thuộc tính từ cha, {{domxref("EventTarget")}}._

## Phương thức instance

_Kế thừa phương thức từ cha, {{domxref("EventTarget")}}._

- {{domxref("Worker.postMessage()")}}
  - : Gửi một thông điệp — bao gồm bất kỳ đối tượng JavaScript nào — tới phạm vi bên trong của worker.
- {{domxref("Worker.terminate()")}}
  - : Chấm dứt worker ngay lập tức. Phương thức này không cho phép worker hoàn thành các hoạt động của nó; worker bị dừng ngay lập tức. Các instance [`ServiceWorker`](/en-US/docs/Web/API/ServiceWorker) không hỗ trợ phương thức này.

## Events

- [`error`](/en-US/docs/Web/API/Worker/error_event)
  - : Xảy ra khi có lỗi trong worker.
- [`message`](/en-US/docs/Web/API/Worker/message_event)
  - : Xảy ra khi cha của worker nhận được thông điệp từ worker đó.
- [`messageerror`](/en-US/docs/Web/API/Worker/messageerror_event)
  - : Xảy ra khi một đối tượng `Worker` nhận được thông điệp không thể [giải tuần tự hóa](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).

## Ví dụ

Đoạn mã sau tạo một đối tượng `Worker` bằng cách sử dụng hàm tạo {{domxref("Worker.Worker", "Worker()")}}, sau đó sử dụng đối tượng worker:

```js
const myWorker = new Worker("/worker.js");
const first = document.querySelector("input#number1");
const second = document.querySelector("input#number2");

first.onchange = () => {
  myWorker.postMessage([first.value, second.value]);
  console.log("Message posted to worker");
};
```

Để biết ví dụ đầy đủ, xem [ví dụ dedicated worker cơ bản](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-web-worker) ([chạy dedicated worker](https://mdn.github.io/dom-examples/web-workers/simple-web-worker/)).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Hỗ trợ khác nhau tùy theo loại worker. Xem trang của từng loại worker để biết chi tiết cụ thể.

{{Compat}}

### Hành vi lỗi worker chéo nguồn gốc

Trong các phiên bản đầu của đặc tả kỹ thuật, việc tải script worker chéo nguồn gốc sẽ ném ra `SecurityError`. Ngày nay, một event {{domxref("Worker/error_event", "error")}} sẽ được ném ra thay thế.

## Xem thêm

- [Sử dụng Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
- [Các hàm và lớp khả dụng cho Web Workers](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers)
- Các loại worker khác: {{domxref("SharedWorker")}} và [Service Worker](/en-US/docs/Web/API/Service_Worker_API).
- Giao diện [`OffscreenCanvas`](/en-US/docs/Web/API/OffscreenCanvas)
