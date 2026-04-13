---
title: "MessagePort: sự kiện message"
short-title: message
slug: Web/API/MessagePort/message_event
page-type: web-api-event
browser-compat: api.MessagePort.message_event
---

{{APIRef("Channel Messaging API")}} {{AvailableInWorkers}}

Sự kiện **`message`** được kích hoạt trên đối tượng {{domxref('MessagePort')}} khi một tin nhắn đến channel đó.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("message", (event) => { })

onmessage = (event) => { }
```

## Loại sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Giao diện này cũng kế thừa các thuộc tính từ đối tượng cha, {{domxref("Event")}}._

- {{domxref("MessageEvent.data")}} {{ReadOnlyInline}}
  - : Dữ liệu được gửi bởi nguồn phát tin nhắn.
- {{domxref("MessageEvent.origin")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho nguồn gốc của nguồn phát tin nhắn.
- {{domxref("MessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho ID duy nhất của sự kiện.
- {{domxref("MessageEvent.source")}} {{ReadOnlyInline}}
  - : Một `MessageEventSource` (có thể là đối tượng {{glossary("WindowProxy")}}, {{domxref("MessagePort")}}, hoặc {{domxref("ServiceWorker")}}) đại diện cho nguồn phát tin nhắn.
- {{domxref("MessageEvent.ports")}} {{ReadOnlyInline}}
  - : Một mảng chứa tất cả các đối tượng {{domxref("MessagePort")}} được gửi cùng tin nhắn, theo thứ tự.

## Ví dụ

Giả sử một script tạo ra một [`MessageChannel`](/en-US/docs/Web/API/MessageChannel) và gửi một trong các cổng đến một browsing context khác, chẳng hạn như một [`<iframe>`](/en-US/docs/Web/HTML/Reference/Elements/iframe), bằng đoạn mã như sau:

```js
const channel = new MessageChannel();
const myPort = channel.port1;
const targetFrame = window.top.frames[1];
const targetOrigin = "https://example.org";

const messageControl = document.querySelector("#message");
const channelMessageButton = document.querySelector("#channel-message");

channelMessageButton.addEventListener("click", () => {
  myPort.postMessage(messageControl.value);
});

targetFrame.postMessage("init", targetOrigin, [channel.port2]);
```

Đích có thể nhận cổng và bắt đầu lắng nghe các tin nhắn và lỗi tin nhắn trên đó bằng đoạn mã như sau:

```js
window.addEventListener("message", (event) => {
  const myPort = event.ports[0];

  myPort.addEventListener("message", (event) => {
    received.textContent = event.data;
  });

  myPort.addEventListener("messageerror", (event) => {
    console.error(event.data);
  });

  myPort.start();
});
```

Lưu ý rằng trình lắng nghe phải gọi [`MessagePort.start()`](/en-US/docs/Web/API/MessagePort/start) trước khi bất kỳ tin nhắn nào được gửi đến cổng này. Điều này chỉ cần thiết khi dùng phương thức [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener): nếu bên nhận dùng `onmessage` thay thế, `start()` được gọi ngầm:

```js
window.addEventListener("message", (event) => {
  const myPort = event.ports[0];

  myPort.onmessage = (event) => {
    received.textContent = event.data;
  };

  myPort.onmessageerror = (event) => {
    console.error(event.data);
  };
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện liên quan: [`messageerror`](/en-US/docs/Web/API/MessagePort/messageerror_event).
- [Sử dụng channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
