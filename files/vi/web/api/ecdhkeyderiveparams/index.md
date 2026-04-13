---
title: EcdhKeyDeriveParams
slug: Web/API/EcdhKeyDeriveParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-EcdhKeyDeriveParams
---

{{ APIRef("Web Crypto API") }}

Dictionary **`EcdhKeyDeriveParams`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng nên được truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.deriveKey()")}} và {{domxref("SubtleCrypto.deriveBits()")}}, khi sử dụng thuật toán [ECDH](/en-US/docs/Web/API/SubtleCrypto/deriveKey#ecdh) hoặc [X25519](/en-US/docs/Web/API/SubtleCrypto/deriveKey#x25519).

ECDH cho phép hai người mỗi người có cặp khóa gồm khóa công khai và khóa riêng tư để dẫn xuất bí mật chung. Họ trao đổi khóa công khai và sử dụng kết hợp khóa riêng tư của họ với khóa công khai của thực thể kia để dẫn xuất khóa bí mật mà chỉ họ chia sẻ.

Do đó, các tham số cho ECDH `deriveKey()` bao gồm khóa công khai của thực thể kia, được kết hợp với khóa riêng tư của thực thể này để dẫn xuất bí mật chung.

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên được đặt thành `ECDH` hoặc `X25519`, tùy thuộc vào thuật toán được sử dụng.
- `public`
  - : Đối tượng {{domxref("CryptoKey")}} đại diện cho khóa công khai của thực thể kia.

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.deriveKey()")}} và {{domxref("SubtleCrypto.deriveBits()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "ECDH" hoặc "X25519" cho phương thức {{domxref("SubtleCrypto.deriveKey()")}} sẽ hỗ trợ loại này.

## Xem thêm

- {{domxref("SubtleCrypto.deriveKey()")}}.
- {{domxref("SubtleCrypto.deriveBits()")}}
