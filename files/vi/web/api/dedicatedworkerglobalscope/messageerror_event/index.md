---
title: "DedicatedWorkerGlobalScope: messageerror event"
short-title: messageerror
slug: Web/API/DedicatedWorkerGlobalScope/messageerror_event
page-type: web-api-event
browser-compat: api.DedicatedWorkerGlobalScope.messageerror_event
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("dedicated")}}

Sự kiện `messageerror` được kích hoạt trên một đối tượng {{domxref('DedicatedWorkerGlobalScope')}} khi nó nhận được một thông điệp không thể giải tuần tự hóa.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("messageerror", (event) => { })

onmessageerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("MessageEvent.data")}} {{ReadOnlyInline}}
  - : Dữ liệu được gửi bởi bên phát thông điệp.
- {{domxref("MessageEvent.origin")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho origin của bên phát thông điệp.
- {{domxref("MessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho ID duy nhất của sự kiện.
- {{domxref("MessageEvent.source")}} {{ReadOnlyInline}}
  - : Một `MessageEventSource` (có thể là một đối tượng {{glossary("WindowProxy")}}, {{domxref("MessagePort")}} hoặc {{domxref("ServiceWorker")}}) đại diện cho bên phát thông điệp.
- {{domxref("MessageEvent.ports")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("MessagePort")}} đại diện cho các cổng gắn với kênh mà thông điệp đang được gửi qua (khi phù hợp, ví dụ trong channel messaging hoặc khi gửi thông điệp tới shared worker).

## Ví dụ

Lắng nghe `messageerror` bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
// worker.js

self.addEventListener("messageerror", (event) => {
  self.postMessage("Error receiving message");
  console.error(event);
});
```

Tương tự, nhưng dùng thuộc tính trình xử lý sự kiện `onmessageerror`:

```js
// worker.js

self.onmessageerror = (event) => {
  self.postMessage("Error receiving message");
  console.error(event);
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DedicatedWorkerGlobalScope")}}
- {{domxref("WorkerGlobalScope")}}
- Các sự kiện liên quan: [`message`](/en-US/docs/Web/API/DedicatedWorkerGlobalScope/message_event)
- [`Worker.postMessage()`](/en-US/docs/Web/API/Worker/postMessage)
- [Using channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
