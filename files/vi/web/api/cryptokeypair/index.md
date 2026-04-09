---
title: CryptoKeyPair
slug: Web/API/CryptoKeyPair
page-type: web-api-interface
spec-urls: https://w3c.github.io/webcrypto/#keypair
---

{{APIRef("Web Crypto API")}}

Dictionary **`CryptoKeyPair`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) biểu diễn một cặp khóa cho một thuật toán mật mã bất đối xứng, còn được gọi là thuật toán khóa công khai.

Bạn có thể lấy một đối tượng `CryptoKeyPair` bằng cách dùng {{domxref("SubtleCrypto.generateKey()")}}, khi thuật toán được chọn là một trong các thuật toán bất đối xứng sau: RSASSA-PKCS1-v1_5, RSA-PSS, RSA-OAEP, ECDSA hoặc ECDH.

Nó chứa hai thuộc tính, đều là các đối tượng [`CryptoKey`](/en-US/docs/Web/API/CryptoKey): thuộc tính `privateKey` chứa khóa riêng tư và thuộc tính `publicKey` chứa khóa công khai.

## Thuộc tính thực thể

- `CryptoKeyPair.privateKey`
  - : Một đối tượng [`CryptoKey`](/en-US/docs/Web/API/CryptoKey) biểu diễn khóa riêng tư. Với các thuật toán mã hóa và giải mã, khóa này được dùng để giải mã. Với các thuật toán ký và xác minh, khóa này được dùng để ký.
- `CryptoKeyPair.publicKey`
  - : Một đối tượng [`CryptoKey`](/en-US/docs/Web/API/CryptoKey) biểu diễn khóa công khai. Với các thuật toán mã hóa và giải mã, khóa này được dùng để mã hóa. Với các thuật toán ký và xác minh, khóa này được dùng để xác minh chữ ký.

## Ví dụ

Các ví dụ cho các phương thức của `SubtleCrypto` thường sử dụng các đối tượng `CryptoKeyPair`. Ví dụ:

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

## Các đặc tả

{{Specifications}}

## Xem thêm

- {{domxref("SubtleCrypto.generateKey")}}.
- {{domxref("SubtleCrypto.sign")}} và {{domxref("SubtleCrypto.verify")}}.
- {{domxref("SubtleCrypto.encrypt")}} và {{domxref("SubtleCrypto.decrypt")}}.
