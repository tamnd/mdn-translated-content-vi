---
title: "MessageChannel: MessageChannel() constructor"
short-title: MessageChannel()
slug: Web/API/MessageChannel/MessageChannel
page-type: web-api-constructor
browser-compat: api.MessageChannel.MessageChannel
---

{{APIRef("Channel Messaging API")}} {{AvailableInWorkers}}

Hàm khởi tạo **`MessageChannel()`** của giao diện {{domxref("MessageChannel")}} trả về một đối tượng {{domxref("MessageChannel")}} mới với hai đối tượng {{domxref("MessagePort")}} mới.

## Cú pháp

```js-nolint
new MessageChannel()
```

### Tham số

Không có ({{jsxref("undefined")}}).

### Giá trị trả về

Một đối tượng {{domxref("MessageChannel")}} mới.

## Ví dụ

Trong đoạn mã sau, bạn có thể thấy một kênh mới được tạo bằng hàm khởi tạo `MessageChannel()`. Khi {{HTMLElement("iframe")}} đã tải, chúng ta truyền {{domxref("MessageChannel.port2", "port2")}} đến `<iframe>` bằng {{domxref("MessagePort.postMessage")}} cùng với một tin nhắn. Trình xử lý `handleMessage` sau đó phản hồi tin nhắn gửi lại từ `<iframe>` (bằng {{domxref("MessagePort.message_event", "onmessage")}}), đưa nó vào một đoạn văn. {{domxref("MessageChannel.port1", "port1")}} được lắng nghe để kiểm tra khi tin nhắn đến.

```js
const channel = new MessageChannel();
const para = document.querySelector("p");

const ifr = document.querySelector("iframe");
const otherWindow = ifr.contentWindow;

ifr.addEventListener("load", iframeLoaded);

function iframeLoaded() {
  otherWindow.postMessage("Hello from the main page!", "*", [channel.port2]);
}

channel.port1.onmessage = handleMessage;
function handleMessage(e) {
  para.innerHTML = e.data;
}
```

Để xem ví dụ đầy đủ, hãy xem [channel messaging basic demo](https://github.com/mdn/dom-examples/tree/main/channel-messaging-basic) trên GitHub ([chạy trực tiếp](https://mdn.github.io/dom-examples/channel-messaging-basic/)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
