---
title: RsaOaepParams
slug: Web/API/RsaOaepParams
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#dfn-RsaOaepParams
---

{{ APIRef("Web Crypto API") }}

Từ điển **`RsaOaepParams`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) đại diện cho đối tượng cần được truyền làm tham số `algorithm` vào {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}}, khi sử dụng thuật toán [RSA_OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep).

## Thuộc tính phiên bản

- `name`
  - : Một chuỗi. Nên đặt thành `RSA-OAEP`.
- `label` {{optional_inline}}
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}, một mảng các byte không cần được mã hóa nhưng nên được gắn kết với bản mã. Một digest của nhãn là một phần của đầu vào cho thao tác mã hóa.

    Trừ khi ứng dụng của bạn yêu cầu nhãn, bạn có thể bỏ qua đối số này và nó sẽ không ảnh hưởng đến bảo mật của thao tác mã hóa.

## Ví dụ

Xem ví dụ cho {{domxref("SubtleCrypto.encrypt()")}} và {{domxref("SubtleCrypto.decrypt()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các trình duyệt hỗ trợ thuật toán "RSA-OAEP" cho phương thức {{domxref("SubtleCrypto.encrypt()")}}, {{domxref("SubtleCrypto.decrypt()")}}, {{domxref("SubtleCrypto.wrapKey()")}}, hoặc {{domxref("SubtleCrypto.unwrapKey()")}} sẽ hỗ trợ loại này.

## Xem thêm

- {{domxref("SubtleCrypto.encrypt()")}}.
- {{domxref("SubtleCrypto.decrypt()")}}.
- {{domxref("SubtleCrypto.wrapKey()")}}.
- {{domxref("SubtleCrypto.unwrapKey()")}}.
