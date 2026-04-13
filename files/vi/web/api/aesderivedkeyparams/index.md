---
title: AesDerivedKeyParams
slug: Web/API/AesDerivedKeyParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-AesDerivedKeyParams
---

{{ APIRef("Web Crypto API") }}

**`AesDerivedKeyParams`** là một dictionary của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API), đại diện cho đối tượng cần truyền làm tham số `derivedKeyType` vào {{domxref("SubtleCrypto.deriveKey()")}} khi suy ra một khóa AES; tức là khi thuật toán được xác định là một trong các loại [AES-CBC](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc), [AES-CTR](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr), [AES-GCM](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm), hoặc [AES-KW](/en-US/docs/Web/API/SubtleCrypto/wrapKey#aes-kw).

## Thuộc tính thể hiện

- `name`
  - : Một chuỗi. Giá trị này phải được đặt thành `AES-CBC`, `AES-CTR`, `AES-GCM`, hoặc `AES-KW`, tùy theo thuật toán bạn muốn dùng.
- `length`
  - : Một `Number` - độ dài của khóa cần tạo, tính bằng bit. Giá trị này phải là một trong các giá trị: 128, 192, hoặc 256.

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.deriveKey()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ bất kỳ thuật toán nào dựa trên AES cho phương thức {{domxref("SubtleCrypto.deriveKey()")}} sẽ hỗ trợ kiểu này.

## Xem thêm

- {{domxref("SubtleCrypto.generateKey()")}}.
