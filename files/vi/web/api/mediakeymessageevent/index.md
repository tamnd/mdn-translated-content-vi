---
title: MediaKeyMessageEvent
slug: Web/API/MediaKeyMessageEvent
page-type: web-api-interface
browser-compat: api.MediaKeyMessageEvent
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Giao diện **`MediaKeyMessageEvent`** của [Encrypted Media Extensions API](/en-US/docs/Web/API/Encrypted_Media_Extensions_API) chứa nội dung và thông tin liên quan khi hệ thống Content Decryption Module (CDM) tạo ra tin nhắn cho phiên.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("MediaKeyMessageEvent.MediaKeyMessageEvent()")}}
  - : Tạo đối tượng `MediaKeyMessageEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("MediaKeyMessageEvent.message")}} {{ReadOnlyInline}}
  - : Trả về {{jsxref("ArrayBuffer")}} chứa tin nhắn từ CDM.
- {{domxref("MediaKeyMessageEvent.messageType")}} {{ReadOnlyInline}}
  - : Trả về loại tin nhắn, giúp ứng dụng xác định cách phản hồi với tin nhắn.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha {{domxref("Event")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
