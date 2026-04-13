---
title: "SubtleCrypto: phương thức verify()"
short-title: verify()
slug: Web/API/SubtleCrypto/verify
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.verify
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`verify()`** của giao diện {{domxref("SubtleCrypto")}} xác minh một {{glossary("signature")}} số.

Nó nhận làm đối số một {{glossary("key")}} để xác minh chữ ký, một số tham số cụ thể cho thuật toán, chữ ký, và dữ liệu đã ký ban đầu.
Nó trả về một {{jsxref("Promise")}} sẽ được fulfill với giá trị boolean cho biết chữ ký có hợp lệ hay không.

## Cú pháp

```js-nolint
verify(algorithm, key, signature, data)
```

### Tham số

- `algorithm`
  - : Một chuỗi hoặc đối tượng xác định thuật toán sẽ sử dụng, và với một số lựa chọn thuật toán, một số tham số bổ sung.
    Các giá trị được truyền cho các tham số bổ sung phải khớp với những giá trị đã truyền vào lệnh gọi {{domxref("SubtleCrypto.sign()", "sign()")}} tương ứng.
    - Để sử dụng [RSASSA-PKCS1-v1_5](/en-US/docs/Web/API/SubtleCrypto/sign#rsassa-pkcs1-v1_5),
      truyền chuỗi `"RSASSA-PKCS1-v1_5"` hoặc một đối tượng có dạng `{ "name": "RSASSA-PKCS1-v1_5" }`.
    - Để sử dụng [RSA-PSS](/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss), truyền một đối tượng {{domxref("RsaPssParams")}}.
    - Để sử dụng [ECDSA](/en-US/docs/Web/API/SubtleCrypto/sign#ecdsa), truyền một đối tượng {{domxref("EcdsaParams")}}.
    - Để sử dụng [HMAC](/en-US/docs/Web/API/SubtleCrypto/sign#hmac), truyền chuỗi `"HMAC"` hoặc một đối tượng có dạng `{ "name": "HMAC" }`.
    - Để sử dụng [Ed25519](/en-US/docs/Web/API/SubtleCrypto/sign#ed25519), truyền một đối tượng có dạng `{ "name": "Ed25519" }`.
- `key`
  - : Một {{domxref("CryptoKey")}} chứa khóa sẽ dùng để xác minh chữ ký.
    Đây là khóa bí mật đối với thuật toán đối xứng và khóa công khai đối với hệ mật mã khóa công khai.
- `signature`
  - : Một {{jsxref("ArrayBuffer")}} chứa {{glossary("signature")}} cần xác minh.
- `data`
  - : Một {{jsxref("ArrayBuffer")}} chứa dữ liệu có chữ ký cần xác minh.

### Giá trị trả về

Một {{jsxref("Promise")}} được fulfill với một giá trị boolean: `true` nếu chữ ký hợp lệ, `false` nếu ngược lại.

### Ngoại lệ

Promise bị reject khi gặp ngoại lệ sau:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném lên khi khóa mã hóa không phải là khóa cho thuật toán xác minh được yêu cầu hoặc khi cố sử dụng một thuật toán không xác định hoặc không phù hợp cho thao tác xác minh.

## Các thuật toán được hỗ trợ

Phương thức `verify()` hỗ trợ các thuật toán tương tự như phương thức [`sign()`](/en-US/docs/Web/API/SubtleCrypto/sign#supported_algorithms).

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/sign-verify/index.html) trên GitHub.

### RSASSA-PKCS1-v1_5

Đoạn mã này sử dụng khóa công khai để xác minh một chữ ký.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/rsassa-pkcs1.js)

```js
/*
Lấy nội dung của hộp văn bản "message", và mã hóa nó
thành dạng chúng ta có thể sử dụng cho thao tác ký.
*/
function getMessageEncoding() {
  const messageBox = document.querySelector(".rsassa-pkcs1 #message");
  let message = messageBox.value;
  let enc = new TextEncoder();
  return enc.encode(message);
}

/*
Lấy thông báo đã mã hóa cần ký và xác minh nó với chữ ký đã lưu.
* Nếu hợp lệ, đặt lớp "valid" trên chữ ký.
* Ngược lại đặt lớp "invalid".
*/
async function verifyMessage(publicKey) {
  const signatureValue = document.querySelector(
    ".rsassa-pkcs1 .signature-value",
  );
  signatureValue.classList.remove("valid", "invalid");

  let encoded = getMessageEncoding();
  let result = await window.crypto.subtle.verify(
    "RSASSA-PKCS1-v1_5",
    publicKey,
    signature,
    encoded,
  );

  signatureValue.classList.add(result ? "valid" : "invalid");
}
```

### RSA-PSS

Đoạn mã này sử dụng khóa công khai để xác minh một chữ ký.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/rsa-pss.js)

```js
/*
Lấy nội dung của hộp văn bản "message", và mã hóa nó
thành dạng chúng ta có thể sử dụng cho thao tác ký.
*/
function getMessageEncoding() {
  const messageBox = document.querySelector(".rsa-pss #message");
  let message = messageBox.value;
  let enc = new TextEncoder();
  return enc.encode(message);
}

/*
Lấy thông báo đã mã hóa cần ký và xác minh nó với chữ ký đã lưu.
* Nếu hợp lệ, đặt lớp "valid" trên chữ ký.
* Ngược lại đặt lớp "invalid".
*/
async function verifyMessage(publicKey) {
  const signatureValue = document.querySelector(".rsa-pss .signature-value");
  signatureValue.classList.remove("valid", "invalid");

  let encoded = getMessageEncoding();
  let result = await window.crypto.subtle.verify(
    {
      name: "RSA-PSS",
      saltLength: 32,
    },
    publicKey,
    signature,
    encoded,
  );

  signatureValue.classList.add(result ? "valid" : "invalid");
}
```

### ECDSA

Đoạn mã này sử dụng khóa công khai để xác minh một chữ ký.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/ecdsa.js)

```js
/*
Lấy nội dung của hộp văn bản "message", và mã hóa nó
thành dạng chúng ta có thể sử dụng cho thao tác ký.
*/
function getMessageEncoding() {
  const messageBox = document.querySelector(".ecdsa #message");
  let message = messageBox.value;
  let enc = new TextEncoder();
  return enc.encode(message);
}

/*
Lấy thông báo đã mã hóa cần ký và xác minh nó với chữ ký đã lưu.
* Nếu hợp lệ, đặt lớp "valid" trên chữ ký.
* Ngược lại đặt lớp "invalid".
*/
async function verifyMessage(publicKey) {
  const signatureValue = document.querySelector(".ecdsa .signature-value");
  signatureValue.classList.remove("valid", "invalid");

  let encoded = getMessageEncoding();
  let result = await window.crypto.subtle.verify(
    {
      name: "ECDSA",
      hash: { name: "SHA-384" },
    },
    publicKey,
    signature,
    encoded,
  );

  signatureValue.classList.add(result ? "valid" : "invalid");
}
```

### HMAC

Đoạn mã này sử dụng khóa bí mật để xác minh một chữ ký.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/hmac.js)

```js
/*
Lấy nội dung của hộp văn bản "message", và mã hóa nó
thành dạng chúng ta có thể sử dụng cho thao tác ký.
*/
function getMessageEncoding() {
  const messageBox = document.querySelector(".hmac #message");
  let message = messageBox.value;
  let enc = new TextEncoder();
  return enc.encode(message);
}

/*
Lấy thông báo đã mã hóa cần ký và xác minh nó với chữ ký đã lưu.
* Nếu hợp lệ, đặt lớp "valid" trên chữ ký.
* Ngược lại đặt lớp "invalid".
*/
async function verifyMessage(key) {
  const signatureValue = document.querySelector(".hmac .signature-value");
  signatureValue.classList.remove("valid", "invalid");

  let encoded = getMessageEncoding();
  let result = await window.crypto.subtle.verify(
    "HMAC",
    key,
    signature,
    encoded,
  );

  signatureValue.classList.add(result ? "valid" : "invalid");
}
```

### Ed25519

[Ví dụ trực tiếp Ed25519](/en-US/docs/Web/API/SubtleCrypto/sign#ed25519_key_generation_signing_and_verification) trong `SubtleCrypto.sign()` cho thấy cách tạo khóa công khai và khóa riêng tư, sử dụng khóa riêng tư để ký dữ liệu, rồi sử dụng khóa công khai để xác minh chữ ký.

Đoạn trích dưới đây cho thấy phần liên quan đến việc xác minh chữ ký bằng khóa công khai và dữ liệu đã mã hóa:

```js
// Verify the signature using the public key
const verifyResult = await crypto.subtle.verify(
  {
    name: "Ed25519",
  },
  publicKey,
  signature,
  encodedData,
);
// True nếu chữ ký hợp lệ.
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SubtleCrypto.sign()")}}.
- [RFC 3447](https://datatracker.ietf.org/doc/html/rfc3447) chỉ định RSASSA-PKCS1-v1_5.
- [RFC 3447](https://datatracker.ietf.org/doc/html/rfc3447) chỉ định RSA-PSS.
- [FIPS-186](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-4.pdf) chỉ định ECDSA.
- [FIPS 198-1](https://csrc.nist.gov/files/pubs/fips/198-1/final/docs/fips-198-1_final.pdf) chỉ định HMAC.
