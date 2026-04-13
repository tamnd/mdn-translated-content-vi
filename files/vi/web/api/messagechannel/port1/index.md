---
title: "MessageChannel: port1 property"
short-title: port1
slug: Web/API/MessageChannel/port1
page-type: web-api-instance-property
browser-compat: api.MessageChannel.port1
---

{{APIRef("Channel Messaging API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`port1`** của giao diện {{domxref("MessageChannel")}} trả về cổng đầu tiên của kênh tin nhắn, là cổng được gắn với ngữ cảnh đã tạo ra kênh.

## Giá trị

Một đối tượng {{domxref("MessagePort")}}, là cổng đầu tiên của kênh, gắn với ngữ cảnh đã khởi tạo kênh.

## Ví dụ

Trong đoạn mã sau, bạn có thể thấy một kênh mới được tạo bằng hàm khởi tạo {{domxref("MessageChannel.MessageChannel", "MessageChannel()")}}. Khi {{HTMLElement("iframe")}} đã tải, chúng ta truyền {{domxref("MessageChannel.port2", "port2")}} đến {{HTMLElement("iframe")}} bằng {{domxref("MessagePort.postMessage")}} cùng với một tin nhắn. Trình xử lý `handleMessage` phản hồi tin nhắn gửi lại từ `<iframe>` (bằng {{domxref("MessagePort.message_event", "onmessage")}}), đưa nó vào một đoạn văn. Phương thức `handleMessage` được liên kết với `port1` để lắng nghe khi tin nhắn đến.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
