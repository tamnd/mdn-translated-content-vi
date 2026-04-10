---
title: "SubtleCrypto: phương thức decrypt()"
short-title: decrypt()
slug: Web/API/SubtleCrypto/decrypt
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.decrypt
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`decrypt()`** của giao diện {{domxref("SubtleCrypto")}} giải mã một số dữ liệu đã mã hóa.
Nó nhận làm đối số một {{glossary("key")}} để giải mã, một số tham số bổ sung tùy chọn, và dữ liệu cần giải mã (còn được gọi là "ciphertext" - văn bản mã hóa).
Nó trả về một {{jsxref("Promise")}} sẽ được fulfill với dữ liệu đã giải mã (còn được gọi là "plaintext" - văn bản gốc).

## Cú pháp

```js-nolint
decrypt(algorithm, key, data)
```

### Tham số

- `algorithm`
  - : Một đối tượng chỉ định [thuật toán](#cac-thuat-toan-duoc-ho-tro) sẽ sử dụng, và bất kỳ tham số bổ sung nào khi cần.
    Các giá trị được truyền cho các tham số bổ sung phải khớp với những giá trị đã truyền vào lệnh gọi {{domxref("SubtleCrypto.encrypt()", "encrypt()")}} tương ứng.
    - Để sử dụng [RSA-OAEP](#rsa-oaep), truyền một đối tượng {{domxref("RsaOaepParams")}}.
    - Để sử dụng [AES-CTR](#aes-ctr), truyền một đối tượng {{domxref("AesCtrParams")}}.
    - Để sử dụng [AES-CBC](#aes-cbc), truyền một đối tượng {{domxref("AesCbcParams")}}.
    - Để sử dụng [AES-GCM](#aes-gcm), truyền một đối tượng {{domxref("AesGcmParams")}}.

- `key`
  - : Một {{domxref("CryptoKey")}} chứa khóa sẽ dùng để giải mã.
    Nếu sử dụng RSA-OAEP, đây là thuộc tính `privateKey` của đối tượng {{domxref("CryptoKeyPair")}}.
- `data`
  - : Một {{jsxref("ArrayBuffer")}}, một {{jsxref("TypedArray")}}, hoặc một {{jsxref("DataView")}} chứa dữ liệu cần giải mã (còn được gọi là {{glossary("ciphertext")}}).

### Giá trị trả về

Một {{jsxref("Promise")}} được fulfill với một {{jsxref("ArrayBuffer")}} chứa văn bản gốc.

### Ngoại lệ

Promise bị reject khi gặp các ngoại lệ sau:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném lên khi thao tác được yêu cầu không hợp lệ đối với khóa đã cung cấp (ví dụ: thuật toán mã hóa không hợp lệ, hoặc khóa không hợp lệ cho thuật toán mã hóa đã chỉ định).
- `OperationError` {{domxref("DOMException")}}
  - : Ném lên khi thao tác thất bại vì lý do cụ thể của thao tác (ví dụ: tham số thuật toán có kích thước không hợp lệ, hoặc có lỗi khi giải mã ciphertext).

## Các thuật toán được hỗ trợ

Phương thức `decrypt()` hỗ trợ các thuật toán tương tự như phương thức [`encrypt()`](/en-US/docs/Web/API/SubtleCrypto/encrypt#supported_algorithms).

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/encrypt-decrypt/index.html) trên GitHub.

### RSA-OAEP

Đoạn mã này giải mã `ciphertext` bằng RSA-OAEP. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/rsa-oaep.js)

```js
function decryptMessage(privateKey, ciphertext) {
  return window.crypto.subtle.decrypt(
    { name: "RSA-OAEP" },
    privateKey,
    ciphertext,
  );
}
```

### AES-CTR

Đoạn mã này giải mã `ciphertext` bằng AES ở chế độ CTR.
Lưu ý rằng `counter` phải khớp với giá trị đã sử dụng để mã hóa. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/aes-ctr.js)

```js
function decryptMessage(key, ciphertext) {
  return window.crypto.subtle.decrypt(
    { name: "AES-CTR", counter, length: 64 },
    key,
    ciphertext,
  );
}
```

### AES-CBC

Đoạn mã này giải mã `ciphertext` bằng AES ở chế độ CBC. Lưu ý rằng
`iv` phải khớp với giá trị đã sử dụng để mã hóa. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/aes-cbc.js)

```js
function decryptMessage(key, ciphertext) {
  // Giá trị iv giống như giá trị đã sử dụng để mã hóa
  return window.crypto.subtle.decrypt({ name: "AES-CBC", iv }, key, ciphertext);
}
```

### AES-GCM

Đoạn mã này giải mã `ciphertext` bằng AES ở chế độ GCM. Lưu ý rằng
`iv` phải khớp với giá trị đã sử dụng để mã hóa. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/aes-gcm.js)

```js
function decryptMessage(key, ciphertext) {
  // Giá trị iv giống như giá trị đã sử dụng để mã hóa
  return window.crypto.subtle.decrypt({ name: "AES-GCM", iv }, key, ciphertext);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SubtleCrypto.encrypt()")}}.
- [RFC 3447](https://datatracker.ietf.org/doc/html/rfc3447) chỉ định RSAOAEP.
- [NIST SP800-38A](https://csrc.nist.gov/pubs/sp/800/38/a/final) chỉ định chế độ CTR.
- [NIST SP800-38A](https://csrc.nist.gov/pubs/sp/800/38/a/final) chỉ định chế độ CBC.
- [NIST SP800-38D](https://csrc.nist.gov/pubs/sp/800/38/d/final) chỉ định chế độ GCM.
- [FIPS 198-1](https://csrc.nist.gov/files/pubs/fips/198-1/final/docs/fips-198-1_final.pdf) chỉ định HMAC.
