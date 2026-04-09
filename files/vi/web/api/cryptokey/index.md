---
title: CryptoKey
slug: Web/API/CryptoKey
page-type: web-api-interface
browser-compat: api.CryptoKey
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Giao diện **`CryptoKey`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) biểu diễn một {{glossary("key", "khóa")}} mật mã thu được từ một trong các phương thức {{domxref("SubtleCrypto")}}: {{domxref("SubtleCrypto.generateKey", "generateKey()")}}, {{domxref("SubtleCrypto.deriveKey", "deriveKey()")}}, {{domxref("SubtleCrypto.importKey", "importKey()")}} hoặc {{domxref("SubtleCrypto.unwrapKey", "unwrapKey()")}}.

Vì lý do bảo mật, giao diện `CryptoKey` chỉ có thể được sử dụng trong [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

## Thuộc tính thể hiện

- {{domxref("CryptoKey.type")}} {{ReadOnlyInline}}
  - : Loại khóa mà đối tượng biểu diễn. Thuộc tính này có thể nhận một trong các giá trị sau: `"secret"`, `"private"` hoặc `"public"`.

- {{domxref("CryptoKey.extractable")}} {{ReadOnlyInline}}
  - : Giá trị boolean cho biết khóa có thể được trích xuất bằng [`SubtleCrypto.exportKey()`](/en-US/docs/Web/API/SubtleCrypto/exportKey) hoặc [`SubtleCrypto.wrapKey()`](/en-US/docs/Web/API/SubtleCrypto/wrapKey) hay không.

- {{domxref("CryptoKey.algorithm")}} {{ReadOnlyInline}}
  - : Một đối tượng mô tả thuật toán mà khóa này có thể dùng cùng với mọi tham số bổ sung liên quan.

- {{domxref("CryptoKey.usages")}} {{ReadOnlyInline}}
  - : Một {{jsxref("Array")}} các chuỗi, cho biết có thể làm gì với khóa. Các giá trị có thể có của phần tử mảng là `"encrypt"`, `"decrypt"`, `"sign"`, `"verify"`, `"deriveKey"`, `"deriveBits"`, `"wrapKey"` và `"unwrapKey"`.

## Ví dụ

Các ví dụ cho phương thức `SubtleCrypto` thường sử dụng đối tượng `CryptoKey`. Ví dụ:

- [`SubtleCrypto.generateKey()`](/en-US/docs/Web/API/SubtleCrypto/generateKey)
- [`SubtleCrypto.deriveKey()`](/en-US/docs/Web/API/SubtleCrypto/deriveKey)
- [`SubtleCrypto.importKey()`](/en-US/docs/Web/API/SubtleCrypto/importKey)
- [`SubtleCrypto.exportKey()`](/en-US/docs/Web/API/SubtleCrypto/exportKey)
- [`SubtleCrypto.wrapKey()`](/en-US/docs/Web/API/SubtleCrypto/wrapKey)
- [`SubtleCrypto.unwrapKey()`](/en-US/docs/Web/API/SubtleCrypto/unwrapKey)
- [`SubtleCrypto.encrypt()`](/en-US/docs/Web/API/SubtleCrypto/encrypt)
- [`SubtleCrypto.decrypt()`](/en-US/docs/Web/API/SubtleCrypto/decrypt)
- [`SubtleCrypto.sign()`](/en-US/docs/Web/API/SubtleCrypto/sign)
- [`SubtleCrypto.verify()`](/en-US/docs/Web/API/SubtleCrypto/verify)

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API)
- [Bảo mật web](/en-US/docs/Web/Security)
- [Quyền riêng tư, quyền hạn và bảo mật thông tin](/en-US/docs/Web/Privacy)
- {{domxref("Crypto")}} và {{domxref("Crypto.subtle")}}.
