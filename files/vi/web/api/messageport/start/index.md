---
title: "MessagePort: phương thức start()"
short-title: start()
slug: Web/API/MessagePort/start
page-type: web-api-instance-method
browser-compat: api.MessagePort.start
---

{{APIRef("Channel Messaging API")}} {{AvailableInWorkers}}

Phương thức **`start()`** của giao diện {{domxref("MessagePort")}} bắt đầu gửi các tin nhắn đã được xếp hàng trong cổng. Phương thức này chỉ cần thiết khi dùng {{domxref("EventTarget.addEventListener")}}; nó được ngụ ý khi dùng {{domxref("MessagePort.message_event", "onmessage")}}.

## Cú pháp

```js-nolint
start()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong đoạn mã dưới đây, bạn có thể thấy hàm xử lý `handleMessage`, được chạy khi một tin nhắn được gửi trở lại tài liệu này bằng `onmessage`:

```js
channel.port1.onmessage = handleMessage;
function handleMessage(e) {
  para.innerHTML = e.data;
}
```

Một lựa chọn khác là dùng {{domxref("EventTarget.addEventListener")}}, tuy nhiên, khi dùng phương thức này, bạn cần gọi `start()` một cách tường minh để bắt đầu luồng tin nhắn đến tài liệu này:

```js
channel.port1.addEventListener("message", handleMessage);
function handleMessage(e) {
  para.innerHTML = e.data;
  textInput.value = "";
}

channel.port1.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
