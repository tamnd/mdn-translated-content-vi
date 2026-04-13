---
title: RsaHashedImportParams
slug: Web/API/RsaHashedImportParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-RsaHashedImportParams
---

{{ APIRef("Web Crypto API") }}

Từ điển **`RsaHashedImportParams`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng cần được truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.importKey()")}} hoặc {{domxref("SubtleCrypto.unwrapKey()")}}, khi nhập bất kỳ cặp khóa dựa trên RSA nào: tức là khi thuật toán được xác định là bất kỳ trong số [RSASSA-PKCS1-v1_5](/en-US/docs/Web/API/SubtleCrypto/sign#rsassa-pkcs1-v1_5), [RSA-PSS](/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss), hoặc [RSA-OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep).

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên đặt thành `RSASSA-PKCS1-v1_5`, `RSA-PSS`, hoặc `RSA-OAEP` tùy thuộc vào thuật toán bạn muốn sử dụng.
- `hash`
  - : Một chuỗi hoặc đối tượng chứa thuộc tính duy nhất tên là `name` với giá trị chuỗi. Đây là mã định danh cho [thuật toán digest](/en-US/docs/Web/API/SubtleCrypto/digest) sử dụng. Nên là một trong:
    - `SHA-256`: chọn thuật toán [SHA-256](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-384`: chọn thuật toán [SHA-384](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-512`: chọn thuật toán [SHA-512](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).

    > [!WARNING]
    > `SHA-1` cũng được hỗ trợ ở đây nhưng thuật toán [SHA-1](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms) được coi là dễ bị tấn công và không nên được sử dụng nữa.

## Ví dụ

Xem ví dụ cho {{domxref("SubtleCrypto.importKey()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ bất kỳ thuật toán dựa trên RSA nào cho phương thức {{domxref("SubtleCrypto.importKey()")}} hoặc {{domxref("SubtleCrypto.unwrapKey()")}} sẽ hỗ trợ loại này.

## Xem thêm

- {{domxref("SubtleCrypto.importKey()")}}.
- {{domxref("SubtleCrypto.unwrapKey()")}}.
