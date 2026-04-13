---
title: MediaEncryptedEvent
slug: Web/API/MediaEncryptedEvent
page-type: web-api-interface
browser-compat: api.MediaEncryptedEvent
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Giao diện **`MediaEncryptedEvent`** của [Encrypted Media Extensions API](/en-US/docs/Web/API/Encrypted_Media_Extensions_API) chứa thông tin liên quan khi {{domxref("HTMLMediaElement")}} gặp một dữ liệu khởi tạo.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("MediaEncryptedEvent.MediaEncryptedEvent()")}}
  - : Tạo đối tượng `MediaEncryptedEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("MediaEncryptedEvent.initDataType")}} {{ReadOnlyInline}}
  - : Trả về chuỗi (không phân biệt chữ hoa chữ thường) với loại định dạng của dữ liệu khởi tạo liên quan.
- {{domxref("MediaEncryptedEvent.initData")}} {{ReadOnlyInline}}
  - : Trả về {{jsxref("ArrayBuffer")}} chứa dữ liệu khởi tạo liên quan. Nếu không có dữ liệu khởi tạo liên quan đến định dạng cụ thể, nó là `null`.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha {{domxref("Event")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
