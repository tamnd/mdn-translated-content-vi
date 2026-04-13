---
title: MediaKeySystemAccess
slug: Web/API/MediaKeySystemAccess
page-type: web-api-interface
browser-compat: api.MediaKeySystemAccess
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Giao diện **`MediaKeySystemAccess`** của [Encrypted Media Extensions API](/en-US/docs/Web/API/Encrypted_Media_Extensions_API) cung cấp quyền truy cập vào hệ thống Key Media. Giao diện này cũng cấp phương thức tạo MediaKeys.

## Thuộc tính phiên bản

- {{domxref("MediaKeySystemAccess.keySystem")}} {{ReadOnlyInline}}
  - : Trả về chuỗi xác định hệ thống key.

## Phương thức phiên bản

- {{domxref("MediaKeySystemAccess.createMediaKeys()")}}
  - : Trả về {{jsxref("Promise")}} thực hiện với đối tượng {{domxref("MediaKeys")}} mới.
- {{domxref("MediaKeySystemAccess.getConfiguration()")}}
  - : Trả về một đối tượng {{domxref("MediaKeySystemConfiguration")}} với cấu hình hệ thống key media được hỗ trợ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
