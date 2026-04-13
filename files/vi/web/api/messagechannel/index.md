---
title: MessageChannel
slug: Web/API/MessageChannel
page-type: web-api-interface
browser-compat: api.MessageChannel
---

{{APIRef("Channel Messaging API")}} {{AvailableInWorkers}}

Giao diện **`MessageChannel`** của [Channel Messaging API](/en-US/docs/Web/API/Channel_Messaging_API) cho phép tạo một kênh tin nhắn mới và gửi dữ liệu qua đó thông qua hai thuộc tính {{domxref("MessagePort")}}.

## Hàm khởi tạo

- {{domxref("MessageChannel.MessageChannel", "MessageChannel()")}}
  - : Trả về một đối tượng `MessageChannel` mới với hai đối tượng {{domxref("MessagePort")}} mới.

## Thuộc tính phiên bản

- {{domxref("MessageChannel.port1")}} {{ReadOnlyInline}}
  - : Trả về port1 của kênh.
- {{domxref("MessageChannel.port2")}} {{ReadOnlyInline}}
  - : Trả về port2 của kênh.

## Ví dụ

Trong ví dụ sau, bạn có thể thấy một kênh mới được tạo bằng hàm khởi tạo {{domxref("MessageChannel.MessageChannel", "MessageChannel()")}}.

Khi IFrame đã tải, chúng ta đăng ký một trình xử lý {{domxref("MessagePort/message_event","onmessage")}} cho {{domxref("MessageChannel.port1")}} và chuyển {{domxref("MessageChannel.port2")}} đến IFrame bằng phương thức {{domxref("window.postMessage")}} cùng với một tin nhắn.

Khi nhận được tin nhắn phản hồi từ IFrame, hàm `onMessage` hiển thị tin nhắn vào một đoạn văn.

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

Để xem ví dụ đầy đủ, hãy xem [channel messaging basic demo](https://github.com/mdn/dom-examples/tree/main/channel-messaging-basic) trên GitHub ([chạy trực tiếp](https://mdn.github.io/dom-examples/channel-messaging-basic/)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
