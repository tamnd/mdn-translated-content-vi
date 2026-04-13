---
title: "MessageChannel: port2 property"
short-title: port2
slug: Web/API/MessageChannel/port2
page-type: web-api-instance-property
browser-compat: api.MessageChannel.port2
---

{{APIRef("Channel Messaging API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`port2`** của giao diện {{domxref("MessageChannel")}} trả về cổng thứ hai của kênh tin nhắn, là cổng được gắn với ngữ cảnh ở đầu kia của kênh, nơi tin nhắn ban đầu được gửi đến.

## Giá trị

Một đối tượng {{domxref("MessagePort")}} đại diện cho cổng thứ hai của kênh, gắn với ngữ cảnh ở đầu kia của kênh.

## Ví dụ

Trong đoạn mã sau, bạn có thể thấy một kênh mới được tạo bằng hàm khởi tạo {{domxref("MessageChannel.MessageChannel", "MessageChannel()")}}. Khi IFrame đã tải, chúng ta truyền `port2` đến IFrame bằng {{domxref("Window.postMessage()")}} cùng với một tin nhắn. Trình xử lý `handleMessage` phản hồi tin nhắn gửi lại từ IFrame (bằng {{domxref("MessagePort.message_event", "onmessage")}}), đưa nó vào một đoạn văn. {{domxref("MessageChannel.port1", "port1")}} được lắng nghe để kiểm tra khi tin nhắn đến.

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
