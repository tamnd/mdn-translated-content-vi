---
title: "MessagePort: phương thức close()"
short-title: close()
slug: Web/API/MessagePort/close
page-type: web-api-instance-method
browser-compat: api.MessagePort.close
---

{{APIRef("Channel Messaging API")}} {{AvailableInWorkers}}

Phương thức **`close()`** của giao diện {{domxref("MessagePort")}} ngắt kết nối cổng, để nó không còn hoạt động nữa. Điều này dừng luồng tin nhắn đến cổng đó.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong đoạn mã dưới đây, bạn có thể thấy hàm xử lý `handleMessage`, được chạy khi một tin nhắn được gửi trở lại tài liệu này bằng {{domxref("EventTarget.addEventListener")}}.

```js
channel.port1.addEventListener("message", handleMessage);
function handleMessage(e) {
  para.innerHTML = e.data;
  textInput.value = "";
}

channel.port1.start();
```

Bạn có thể dừng gửi tin nhắn bất kỳ lúc nào bằng cách

```js
channel.port1.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
