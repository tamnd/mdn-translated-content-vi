---
title: "EventSource: sự kiện message"
short-title: message
slug: Web/API/EventSource/message_event
page-type: web-api-event
browser-compat: api.EventSource.message_event
---

{{APIRef("Server Sent Events")}}{{AvailableInWorkers}}

Sự kiện **`message`** của giao diện {{domxref("EventSource")}} được kích hoạt khi dữ liệu được nhận qua một nguồn sự kiện.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("message", (event) => { })

onmessage = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Giao diện này cũng kế thừa các thuộc tính từ lớp cha của nó, {{domxref("Event")}}._

- {{domxref("MessageEvent.data")}} {{ReadOnlyInline}}
  - : Dữ liệu do bộ phát thông điệp gửi.
- {{domxref("MessageEvent.origin")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị origin của bộ phát thông điệp.
- {{domxref("MessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị ID duy nhất của sự kiện.
- {{domxref("MessageEvent.source")}} {{ReadOnlyInline}}
  - : Một `MessageEventSource` (có thể là đối tượng {{glossary("WindowProxy")}}, {{domxref("MessagePort")}}, hoặc {{domxref("ServiceWorker")}}) đại diện cho bộ phát thông điệp.
- {{domxref("MessageEvent.ports")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("MessagePort")}} đại diện cho các cổng liên kết với kênh đang được dùng để gửi thông điệp (nếu có, ví dụ trong channel messaging hoặc khi gửi thông điệp tới shared worker).

## Ví dụ

Trong ví dụ cơ bản này, một `EventSource` được tạo để nhận sự kiện từ máy chủ; một trang có tên `sse.php` chịu trách nhiệm tạo ra các sự kiện đó.

```js
const evtSource = new EventSource("sse.php");
const eventList = document.querySelector("ul");

evtSource.addEventListener("message", (e) => {
  const newElement = document.createElement("li");

  newElement.textContent = `message: ${e.data}`;
  eventList.appendChild(newElement);
});
```

### Tương đương với onmessage

```js
evtSource.onmessage = (e) => {
  const newElement = document.createElement("li");

  newElement.textContent = `message: ${e.data}`;
  eventList.appendChild(newElement);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using server-sent events](/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events)
- [`open`](/en-US/docs/Web/API/EventSource/open_event)
- [`error`](/en-US/docs/Web/API/EventSource/error_event)
