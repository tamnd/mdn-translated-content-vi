---
title: RsaPssParams
slug: Web/API/RsaPssParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-RsaPssParams
---

{{ APIRef("Web Crypto API") }}

Từ điển **`RsaPssParams`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng cần được truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.sign()")}} hoặc {{domxref("SubtleCrypto.verify()")}}, khi sử dụng thuật toán [RSA-PSS](/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss).

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên đặt thành `RSA-PSS`.
- `saltLength`
  - : Một số nguyên `long` đại diện cho độ dài của salt ngẫu nhiên cần sử dụng, tính bằng byte.

    [RFC 3447](https://datatracker.ietf.org/doc/html/rfc3447) nói rằng "Độ dài salt thông thường" là 0 hoặc độ dài đầu ra của [thuật toán digest](/en-US/docs/Web/API/SubtleCrypto#supported_algorithms) đã được chọn khi khóa này được [tạo](/en-US/docs/Web/API/SubtleCrypto/generateKey). Ví dụ, nếu bạn sử dụng [SHA-256](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms) làm thuật toán digest, đây có thể là 32.

    Kích thước tối đa của `saltLength` được cho bởi:

    ```js
    Math.ceil((keySizeInBits - 1) / 8) - digestSizeInBytes - 2;
    ```

    Vì vậy, đối với độ dài khóa 2048 bit và kích thước đầu ra digest là 32 byte, kích thước tối đa sẽ là 222.

## Ví dụ

Xem ví dụ cho {{domxref("SubtleCrypto.sign()")}} và {{domxref("SubtleCrypto.verify()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "RSA-PSS" cho phương thức {{domxref("SubtleCrypto.sign()")}} và {{domxref("SubtleCrypto.verify()")}} sẽ hỗ trợ loại này.

## Xem thêm

- [RFC 3447: RSASSA-PSS](https://datatracker.ietf.org/doc/html/rfc3447#section-8.1)
