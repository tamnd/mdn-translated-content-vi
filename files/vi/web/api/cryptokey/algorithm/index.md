---
title: "CryptoKey: thuộc tính algorithm"
short-title: algorithm
slug: Web/API/CryptoKey/algorithm
page-type: web-api-instance-property
browser-compat: api.CryptoKey.algorithm
---

{{APIRef("Web Crypto API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`algorithm`** của giao diện {{DOMxRef("CryptoKey")}} trả về một đối tượng mô tả thuật toán mà khóa này có thể được dùng, cùng với mọi tham số bổ sung liên quan.

Đối tượng được trả về phụ thuộc vào thuật toán được dùng để tạo khóa.

## Giá trị

Một đối tượng khớp với:

- [`AesKeyGenParams`](/en-US/docs/Web/API/AesKeyGenParams) nếu thuật toán là một trong các biến thể AES.
- [`RsaHashedKeyGenParams`](/en-US/docs/Web/API/RsaHashedKeyGenParams) nếu thuật toán là một trong các biến thể RSA.
- [`EcKeyGenParams`](/en-US/docs/Web/API/EcKeyGenParams) nếu thuật toán là một trong các biến thể EC.
- [`HmacKeyGenParams`](/en-US/docs/Web/API/HmacKeyGenParams) nếu thuật toán là HMAC.

Đối với `RsaHashedKeyGenParams` và `HmacKeyGenParams`, thuộc tính `hash` luôn ở dạng đối tượng (với thuộc tính có tên `name`), không phải dạng chuỗi.

## Ví dụ

```js
const rawKey = window.crypto.getRandomValues(new Uint8Array(16));

// Nhập một khóa bí mật AES từ một ArrayBuffer chứa các byte thô.
// Hàm nhận một ArrayBuffer chứa các byte và trả về một Promise
// sẽ được resolve thành một CryptoKey đại diện cho khóa bí mật.
function importSecretKey(rawKey) {
  return window.crypto.subtle.importKey("raw", rawKey, "AES-GCM", true, [
    "encrypt",
    "decrypt",
  ]);
}

importSecretKey(rawKey).then((key) =>
  console.log(`Khóa này sẽ được sử dụng với thuật toán ${key.algorithm.name}.`),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
