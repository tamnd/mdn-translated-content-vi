---
title: HmacImportParams
slug: Web/API/HmacImportParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-HmacImportParams
---

{{ APIRef("Web Crypto API") }}

Dictionary **`HmacImportParams`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng nên được truyền khi nhập, giải nén hoặc dẫn xuất khóa cho thuật toán [HMAC](/en-US/docs/Web/API/SubtleCrypto/sign#hmac), như:

- Tham số `algorithm` cho {{domxref("SubtleCrypto.importKey()")}}
- Tham số `unwrappedKeyAlgorithm` cho {{domxref("SubtleCrypto.unwrapKey()")}}
- Tham số `derivedKeyType` cho {{domxref("SubtleCrypto.deriveKey()")}}.

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên được đặt thành `HMAC`.
- `hash`
  - : Một chuỗi hoặc đối tượng chứa thuộc tính duy nhất có tên `name` với giá trị chuỗi. Đây là định danh cho [thuật toán digest](/en-US/docs/Web/API/SubtleCrypto/digest) để sử dụng. Nên là một trong:
    - `SHA-256`: chọn thuật toán [SHA-256](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-384`: chọn thuật toán [SHA-384](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-512`: chọn thuật toán [SHA-512](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).

    > [!WARNING]
    > `SHA-1` cũng được hỗ trợ ở đây nhưng được coi là dễ bị tấn công và không còn được sử dụng nữa.

- `length` {{optional_inline}}
  - : Một `Number` đại diện cho độ dài tính bằng bit của khóa.

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.importKey()")}}, {{domxref("SubtleCrypto.unwrapKey()")}}, hoặc {{domxref("SubtleCrypto.deriveKey()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "HMAC" cho các phương thức {{domxref("SubtleCrypto.importKey()")}}, {{domxref("SubtleCrypto.unwrapKey()")}} hoặc {{domxref("SubtleCrypto.deriveKey()")}} sẽ hỗ trợ loại này.

## Xem thêm

- {{domxref("SubtleCrypto.importKey()")}}.
- {{domxref("SubtleCrypto.unwrapKey()")}}.
- {{domxref("SubtleCrypto.deriveKey()")}}.
