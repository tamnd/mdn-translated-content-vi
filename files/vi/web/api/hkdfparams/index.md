---
title: HkdfParams
slug: Web/API/HkdfParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-HkdfParams
---

{{ APIRef("Web Crypto API") }}

Dictionary **`HkdfParams`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng nên được truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.deriveKey()")}} khi sử dụng thuật toán [HKDF](/en-US/docs/Web/API/SubtleCrypto/deriveKey#hkdf).

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên được đặt thành `HKDF`.
- `hash`
  - : Một chuỗi hoặc đối tượng chứa thuộc tính duy nhất có tên `name` với giá trị chuỗi. Đây là định danh cho [thuật toán digest](/en-US/docs/Web/API/SubtleCrypto/digest) để sử dụng. Nên là một trong:
    - `SHA-256`: chọn thuật toán SHA-256.
    - `SHA-384`: chọn thuật toán SHA-384.
    - `SHA-512`: chọn thuật toán SHA-512.

    > [!WARNING]
    > `SHA-1` cũng được hỗ trợ ở đây nhưng được coi là dễ bị tấn công và không còn được sử dụng nữa.

- `salt`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}}. Đặc tả HKDF nêu rằng thêm salt "làm tăng đáng kể sức mạnh của HKDF". Lý tưởng nhất là salt là giá trị ngẫu nhiên hoặc giả ngẫu nhiên với cùng độ dài như đầu ra của hàm digest.
- `info`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} đại diện cho thông tin ngữ cảnh cụ thể cho ứng dụng. Nó được sử dụng để ràng buộc tài liệu khóa dẫn xuất với ngữ cảnh ứng dụng.

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.deriveKey()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "HKDF" cho phương thức {{domxref("SubtleCrypto.deriveKey()")}} sẽ hỗ trợ loại này.

## Xem thêm

- {{domxref("SubtleCrypto.deriveKey()")}}.
