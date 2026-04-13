---
title: "CryptoKey: thuộc tính usages"
short-title: usages
slug: Web/API/CryptoKey/usages
page-type: web-api-instance-property
browser-compat: api.CryptoKey.usages
---

{{APIRef("Web Crypto API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`usages`** của giao diện {{DOMxRef("CryptoKey")}} cho biết có thể làm gì với khóa.

## Giá trị

Một {{jsxref("Array")}} các chuỗi từ danh sách sau:

- `"encrypt"`: Khóa có thể được dùng để [mã hóa](/en-US/docs/Web/API/SubtleCrypto/encrypt) thông điệp.
- `"decrypt"`: Khóa có thể được dùng để [giải mã](/en-US/docs/Web/API/SubtleCrypto/decrypt) thông điệp.
- `"sign"`: Khóa có thể được dùng để [ký](/en-US/docs/Web/API/SubtleCrypto/sign) thông điệp.
- `"verify"`: Khóa có thể được dùng để [xác minh](/en-US/docs/Web/API/SubtleCrypto/verify) chữ ký.
- `"deriveKey"`: Khóa có thể được dùng để [suy ra khóa mới](/en-US/docs/Web/API/SubtleCrypto/deriveKey).
- `"deriveBits"`: Khóa có thể được dùng để [suy ra các bit](/en-US/docs/Web/API/SubtleCrypto/deriveBits).
- `"wrapKey"`: Khóa có thể được dùng để [bọc một khóa](/en-US/docs/Web/API/SubtleCrypto/wrapKey).
- `"unwrapKey"`: Khóa có thể được dùng để [mở bọc một khóa](/en-US/docs/Web/API/SubtleCrypto/unwrapKey).

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
  console.log(
    `Các mục đích sử dụng được báo cáo cho khóa này là: ${key.usages.toString()}`,
  ),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
