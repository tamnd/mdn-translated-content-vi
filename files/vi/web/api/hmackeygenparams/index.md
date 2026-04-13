---
title: HmacKeyGenParams
slug: Web/API/HmacKeyGenParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-HmacKeyGenParams
---

{{ APIRef("Web Crypto API") }}

Dictionary **`HmacKeyGenParams`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng nên được truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.generateKey()")}} khi tạo khóa cho thuật toán [HMAC](/en-US/docs/Web/API/SubtleCrypto/sign#hmac).

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên được đặt thành `HMAC`.
- `hash`
  - : Một chuỗi hoặc đối tượng chứa thuộc tính duy nhất có tên `name` với giá trị chuỗi. Đây là định danh cho [thuật toán digest](/en-US/docs/Web/API/SubtleCrypto/digest) để sử dụng. Nên là một trong:
    - `SHA-256`: chọn thuật toán [SHA-256](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-384`: chọn thuật toán [SHA-384](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-512`: chọn thuật toán [SHA-512](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).

    > [!WARNING]
    > `SHA-1` cũng được hỗ trợ ở đây nhưng thuật toán [SHA-1](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms) được coi là dễ bị tấn công và không còn được sử dụng nữa.

- `length` {{optional_inline}}
  - : Một `Number`, độ dài tính bằng bit của khóa. Nếu bị bỏ qua, độ dài của khóa bằng kích thước khối của hàm hash bạn đã chọn.

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.generateKey()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "HMAC" cho phương thức {{domxref("SubtleCrypto.generateKey()")}} sẽ hỗ trợ loại này.

## Xem thêm

- {{domxref("SubtleCrypto.generateKey()")}}.
