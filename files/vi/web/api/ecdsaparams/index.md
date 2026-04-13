---
title: EcdsaParams
slug: Web/API/EcdsaParams
page-type: web-api-interface
browser-compat:
  - api.SubtleCrypto.sign
  - api.SubtleCrypto.verify
---

{{ APIRef("Web Crypto API") }}

Dictionary **`EcdsaParams`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng nên được truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.sign()")}} hoặc {{domxref("SubtleCrypto.verify()")}} khi sử dụng thuật toán [ECDSA](/en-US/docs/Web/API/SubtleCrypto/sign#ecdsa).

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên được đặt thành `ECDSA`.
- `hash`
  - : Một chuỗi hoặc đối tượng chứa thuộc tính duy nhất có tên `name` với giá trị chuỗi. Đây là định danh cho [thuật toán digest](/en-US/docs/Web/API/SubtleCrypto/digest) để sử dụng. Nên là một trong:
    - `SHA-256`: chọn thuật toán [SHA-256](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-384`: chọn thuật toán [SHA-384](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-512`: chọn thuật toán [SHA-512](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).

    > [!WARNING]
    > `SHA-1` cũng được hỗ trợ ở đây nhưng thuật toán [SHA-1](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms) được coi là dễ bị tấn công và không còn được sử dụng nữa.

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.sign()")}} hoặc {{domxref("SubtleCrypto.verify()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "ECDSA" cho các phương thức {{domxref("SubtleCrypto.sign()")}} và {{domxref("SubtleCrypto.verify()")}} sẽ hỗ trợ loại này.

{{Compat}}

## Xem thêm

- {{domxref("SubtleCrypto.sign()")}} và {{domxref("SubtleCrypto.verify()")}}.
