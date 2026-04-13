---
title: RsaHashedKeyGenParams
slug: Web/API/RsaHashedKeyGenParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-RsaHashedKeyGenParams
---

{{ APIRef("Web Crypto API") }}

Từ điển **`RsaHashedKeyGenParams`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng cần được truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.generateKey()")}}, khi tạo bất kỳ cặp khóa dựa trên RSA nào: tức là khi thuật toán được xác định là bất kỳ trong số [RSASSA-PKCS1-v1_5](/en-US/docs/Web/API/SubtleCrypto/sign#rsassa-pkcs1-v1_5), [RSA-PSS](/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss), hoặc [RSA-OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep).

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên đặt thành `RSASSA-PKCS1-v1_5`, `RSA-PSS`, hoặc `RSA-OAEP` tùy thuộc vào thuật toán bạn muốn sử dụng.
- `modulusLength`
  - : Một `Number`. Độ dài tính bằng bit của mô-đun RSA. Điều này nên ít nhất là 2048: xem ví dụ [SP 800-131A Rev. 2](https://csrc.nist.gov/pubs/sp/800/131/a/r2/final). Một số tổ chức hiện đang khuyến nghị nên là 4096.
- `publicExponent`
  - : Một {{jsxref("Uint8Array")}}. Số mũ công khai. Trừ khi bạn có lý do chính đáng để sử dụng thứ khác, hãy chỉ định 65537 ở đây (`[0x01, 0x00, 0x01]`).
- `hash`
  - : Một chuỗi hoặc đối tượng chứa thuộc tính duy nhất tên là `name` với giá trị chuỗi. Đây là mã định danh cho [thuật toán digest](/en-US/docs/Web/API/SubtleCrypto/digest) sử dụng. Nên là một trong:
    - `SHA-256`: chọn thuật toán [SHA-256](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-384`: chọn thuật toán [SHA-384](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).
    - `SHA-512`: chọn thuật toán [SHA-512](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms).

    > [!WARNING]
    > `SHA-1` cũng được hỗ trợ ở đây nhưng thuật toán [SHA-1](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms) được coi là dễ bị tấn công và không nên được sử dụng nữa.

## Ví dụ

Xem ví dụ cho {{domxref("SubtleCrypto.generateKey()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ bất kỳ thuật toán dựa trên RSA nào cho phương thức {{domxref("SubtleCrypto.generateKey()")}} sẽ hỗ trợ loại này.

## Xem thêm

- {{domxref("SubtleCrypto.generateKey()")}}.
