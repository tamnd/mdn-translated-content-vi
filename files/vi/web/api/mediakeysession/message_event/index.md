---
title: "MediaKeySession: sự kiện message"
short-title: message
slug: Web/API/MediaKeySession/message_event
page-type: web-api-event
browser-compat: api.MediaKeySession.message_event
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Sự kiện **`message`** của giao diện {{domxref("MediaKeySession")}} kích hoạt khi một thông điệp được tạo ra bởi module giải mã nội dung.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("message", (event) => { })

onmessage = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MediaKeyMessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MediaKeyMessageEvent")}}

## Thuộc tính sự kiện

- {{domxref("MediaKeyMessageEvent.message")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("ArrayBuffer")}} với một thông điệp từ module giải mã nội dung. Các thông điệp thay đổi theo hệ thống khóa.
- {{domxref("MediaKeyMessageEvent.messageType")}} {{ReadOnlyInline}}
  - : Cho biết kiểu thông điệp. Có thể là một trong `license-request`, `license-renewal`, `license-release`, hoặc `individualization-request`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
