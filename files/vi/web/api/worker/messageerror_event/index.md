---
title: "Worker: event messageerror"
short-title: messageerror
slug: Web/API/Worker/messageerror_event
page-type: web-api-event
browser-compat: api.Worker.messageerror_event
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("window_and_worker_except_service")}}

Event `messageerror` được kích hoạt trên một đối tượng {{domxref('Worker')}} khi nó nhận được một thông điệp không thể giải tuần tự hóa.

Event này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên event trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính event handler.

```js-nolint
addEventListener("messageerror", (event) => { })

onmessageerror = (event) => { }
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

Tạo một worker, và lắng nghe các event `message` và `messageerror` bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
// main.js

const worker = new Worker("static/scripts/worker.js");

worker.addEventListener("message", (event) => {
  console.error(`Received message from worker: ${event}`);
});

worker.addEventListener("messageerror", (event) => {
  console.error(`Error receiving message from worker: ${event}`);
});
```

Tương tự, nhưng sử dụng thuộc tính event handler `onmessageerror`:

```js
// main.js

const worker = new Worker("static/scripts/worker.js");

worker.onmessage = (event) => {
  console.error(`Received message from worker: ${event}`);
};

worker.onmessageerror = (event) => {
  console.error(`Error receiving message from worker: ${event}`);
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

## Xem thêm

- [`Worker.postMessage()`](/en-US/docs/Web/API/Worker/postMessage)
- Các event liên quan: [`message`](/en-US/docs/Web/API/Worker/message_event)
