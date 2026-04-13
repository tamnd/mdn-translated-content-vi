---
title: MessagePort
slug: Web/API/MessagePort
page-type: web-api-interface
browser-compat: api.MessagePort
---

{{APIRef("Channel Messaging API")}} {{AvailableInWorkers}}

Giao diện **`MessagePort`** của [Channel Messaging API](/en-US/docs/Web/API/Channel_Messaging_API) đại diện cho một trong hai cổng của {{domxref("MessageChannel")}}, cho phép gửi tin nhắn từ một cổng và lắng nghe chúng đến cổng kia.

`MessagePort` là một [transferable object](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

{{InheritanceDiagram}}

## Phương thức phiên bản

_Kế thừa các phương thức từ đối tượng cha, {{domxref("EventTarget")}}_.

- {{domxref("MessagePort.postMessage","postMessage()")}}
  - : Gửi một tin nhắn từ cổng và tùy chọn, chuyển quyền sở hữu các đối tượng sang các browsing context khác.
- {{domxref("MessagePort.start","start()")}}
  - : Bắt đầu gửi các tin nhắn đã được xếp hàng trong cổng (chỉ cần thiết khi dùng {{domxref("EventTarget.addEventListener")}}; nó được ngụ ý khi dùng {{domxref("MessagePort.message_event", "onmessage")}}).
- {{domxref("MessagePort.close","close()")}}
  - : Ngắt kết nối cổng, để nó không còn hoạt động nữa.

## Sự kiện

_Kế thừa sự kiện từ đối tượng cha, {{domxref("EventTarget")}}_.

- {{domxref("MessagePort.message_event","message")}}
  - : Được kích hoạt khi đối tượng `MessagePort` nhận được một tin nhắn.
- {{domxref("MessagePort.messageerror_event","messageerror")}}
  - : Được kích hoạt khi đối tượng `MessagePort` nhận được tin nhắn không thể deserialize.

## Ví dụ

Trong ví dụ dưới đây, bạn có thể thấy một channel mới được tạo bằng hàm khởi tạo {{domxref("MessageChannel.MessageChannel","MessageChannel()")}}.

Khi IFrame đã tải, chúng ta đăng ký handler {{domxref("MessagePort/message_event","onmessage")}} cho {{domxref("MessageChannel.port1")}} và chuyển {{domxref("MessageChannel.port2")}} đến IFrame bằng phương thức {{domxref("window.postMessage")}} cùng với tin nhắn.

Khi nhận được tin nhắn trả lại từ IFrame, hàm `onMessage` xuất tin nhắn vào đoạn văn.

```js
const channel = new MessageChannel();
const output = document.querySelector(".output");
const iframe = document.querySelector("iframe");

// Wait for the iframe to load
iframe.addEventListener("load", onLoad);

function onLoad() {
  // Listen for messages on port1
  channel.port1.onmessage = onMessage;

  // Transfer port2 to the iframe
  iframe.contentWindow.postMessage("Hello from the main page!", "*", [
    channel.port2,
  ]);
}

// Handle messages received on port1
function onMessage(e) {
  output.innerHTML = e.data;
}
```

Để xem ví dụ đầy đủ đang hoạt động, hãy xem [channel messaging basic demo](https://github.com/mdn/dom-examples/tree/main/channel-messaging-basic) trên GitHub ([chạy trực tiếp](https://mdn.github.io/dom-examples/channel-messaging-basic/)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
