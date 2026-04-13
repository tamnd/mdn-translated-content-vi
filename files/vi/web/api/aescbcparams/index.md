---
title: AesCbcParams
slug: Web/API/AesCbcParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-AesCbcParams
---

{{ APIRef("Web Crypto API") }}

**`AesCbcParams`** là một dictionary của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API), đại diện cho đối tượng cần truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} khi dùng thuật toán [AES-CBC](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc).

## Thuộc tính thể hiện

- `name`
  - : Một chuỗi. Giá trị này phải được đặt thành `AES-CBC`.
- `iv`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}. Đây là vector khởi tạo. Giá trị này phải dài 16 byte, không thể đoán trước, và tốt nhất là ngẫu nhiên theo mặt mã hóa. Tuy nhiên, nó không cần phải bí mật (ví dụ, có thể được truyền không mã hóa cùng với bản mã).

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.encrypt()")}} và {{domxref("SubtleCrypto.decrypt()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "AES-CBC" cho các phương thức {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} sẽ hỗ trợ kiểu này.

## Xem thêm

- Chế độ CBC được định nghĩa trong mục 6.2 của [tiêu chuẩn NIST SP800-38A](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38a.pdf#%5B%7B%22num%22%3A70%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22Fit%22%7D%5D).
- {{domxref("SubtleCrypto.encrypt()")}}.
- {{domxref("SubtleCrypto.decrypt()")}}.
- {{domxref("SubtleCrypto.wrapKey()")}}.
- {{domxref("SubtleCrypto.unwrapKey()")}}.
