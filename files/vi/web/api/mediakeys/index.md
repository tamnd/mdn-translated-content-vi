---
title: MediaKeys
slug: Web/API/MediaKeys
page-type: web-api-interface
browser-compat: api.MediaKeys
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Giao diện **`MediaKeys`** của [Encrypted Media Extensions API](/en-US/docs/Web/API/Encrypted_Media_Extensions_API) đại diện cho một tập hợp các key mà một {{domxref("HTMLMediaElement")}} được liên kết có thể sử dụng để giải mã dữ liệu media trong quá trình phát.

## Phương thức phiên bản

- {{domxref("MediaKeys.createSession()")}}
  - : Trả về {{domxref("MediaKeySession")}} mới đại diện cho một bối cảnh để trao đổi tin nhắn với máy chủ license.
- {{domxref("MediaKeys.getStatusForPolicy()")}}
  - : Trả về {{jsxref("Promise")}} thực hiện với chuỗi cho biết liệu hệ thống CDM sẽ cho phép trình chiếu dữ liệu được liên kết với các key dựa trên chính sách được chỉ định.
- {{domxref("MediaKeys.setServerCertificate()")}}
  - : Trả về {{jsxref("Promise")}} cho phép ứng dụng cung cấp cho hệ thống CDM chứng chỉ máy chủ, được sử dụng để mã hóa các tin nhắn cho máy chủ giấy phép đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
