---
title: "Worker: event message"
short-title: message
slug: Web/API/Worker/message_event
page-type: web-api-event
browser-compat: api.Worker.message_event
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("window_and_worker_except_service")}}

Event `message` được kích hoạt trên một đối tượng {{domxref('Worker')}} khi cha của worker nhận được thông điệp từ worker của nó (tức là, khi worker gửi thông điệp bằng [`DedicatedWorkerGlobalScope.postMessage()`](/en-US/docs/Web/API/DedicatedWorkerGlobalScope/postMessage)).

Event này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên event trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính event handler.

```js-nolint
addEventListener("message", (event) => { })

onmessage = (event) => { }
```

## Loại event

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính event

_Giao diện này cũng kế thừa các thuộc tính từ cha, {{domxref("Event")}}._

- {{domxref("MessageEvent.data")}} {{ReadOnlyInline}}
  - : Dữ liệu được gửi bởi người phát thông điệp.
- {{domxref("MessageEvent.origin")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho nguồn gốc của người phát thông điệp.
- {{domxref("MessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho ID duy nhất cho event.
- {{domxref("MessageEvent.source")}} {{ReadOnlyInline}}
  - : Một `MessageEventSource` (có thể là một đối tượng {{glossary("WindowProxy")}}, {{domxref("MessagePort")}}, hoặc {{domxref("ServiceWorker")}}) đại diện cho người phát thông điệp.
- {{domxref("MessageEvent.ports")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("MessagePort")}} đại diện cho các cổng liên kết với kênh mà thông điệp đang được gửi qua (nếu phù hợp, ví dụ: trong channel messaging hoặc khi gửi thông điệp tới một shared worker).

## Ví dụ

Mã này tạo một worker mới và lắng nghe các thông điệp từ nó bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const worker = new Worker("static/scripts/worker.js");

worker.addEventListener("message", (event) => {
  console.log(`Received message from worker: ${event.data}`);
});
```

Ngoài ra, nó có thể lắng nghe bằng thuộc tính event handler `onmessage`:

```js
const worker = new Worker("static/scripts/worker.js");

worker.onmessage = (event) => {
  console.log(`Received message from worker: ${event.data}`);
};
```

Worker gửi thông điệp bằng [`self.postMessage()`](/en-US/docs/Web/API/DedicatedWorkerGlobalScope/postMessage):

```js
// static/scripts/worker.js

self.postMessage("I'm alive!");
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

## Xem thêm

- Các event liên quan: [`messageerror`](/en-US/docs/Web/API/Worker/messageerror_event).
- [`DedicatedWorkerGlobalScope.postMessage()`](/en-US/docs/Web/API/DedicatedWorkerGlobalScope/postMessage).
