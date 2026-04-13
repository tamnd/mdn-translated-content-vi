---
title: EcKeyGenParams
slug: Web/API/EcKeyGenParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-EcKeyGenParams
---

{{ APIRef("Web Crypto API") }}

Dictionary **`EcKeyGenParams`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng nên được truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.generateKey()")}}, khi tạo bất kỳ cặp khóa dựa trên đường cong elliptic nào: tức là khi thuật toán được xác định là [ECDSA](/en-US/docs/Web/API/SubtleCrypto/sign#ecdsa) hoặc [ECDH](/en-US/docs/Web/API/SubtleCrypto/deriveKey#ecdh).

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên được đặt thành `ECDSA` hoặc `ECDH`, tùy thuộc vào thuật toán bạn muốn sử dụng.
- `namedCurve`
  - : Một chuỗi đại diện cho tên của đường cong elliptic để sử dụng. Có thể là một trong các tên cho các đường cong được [NIST](https://www.nist.gov/) phê duyệt:
    - `P-256`
    - `P-384`
    - `P-521`

## Ví dụ

Xem các ví dụ cho {{domxref("SubtleCrypto.generateKey()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "ECDH" hoặc "ECDSA" cho phương thức {{domxref("SubtleCrypto.generateKey()")}} sẽ hỗ trợ loại này.

## Xem thêm

- {{domxref("SubtleCrypto.generateKey()")}}.
