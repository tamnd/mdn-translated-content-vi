---
title: "SubtleCrypto: phương thức wrapKey()"
short-title: wrapKey()
slug: Web/API/SubtleCrypto/wrapKey
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.wrapKey
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`wrapKey()`** của giao diện {{domxref("SubtleCrypto")}} "bọc" một khóa.
Điều này có nghĩa là nó xuất khóa ở định dạng bên ngoài, có thể di chuyển, sau đó mã hóa khóa đã xuất.
Việc bọc khóa giúp bảo vệ khóa trong các môi trường không đáng tin, chẳng hạn như trong kho lưu trữ không được bảo vệ hoặc khi truyền qua mạng không bảo mật.

Như với {{DOMxRef("SubtleCrypto.exportKey()")}}, bạn chỉ định một [định dạng xuất](/en-US/docs/Web/API/SubtleCrypto/importKey#supported_formats) cho khóa.
Để xuất một khóa, nó phải có {{DOMxRef("CryptoKey.extractable")}} được đặt thành `true`.

Nhưng vì `wrapKey()` cũng mã hóa khóa cần xuất, bạn cũng cần truyền khóa phải dùng để mã hóa nó.
Đôi khi đây được gọi là "khóa bọc khóa".

Ngược lại với `wrapKey()` là {{domxref("SubtleCrypto.unwrapKey()")}}: trong khi `wrapKey` được cấu thành từ export + encrypt, `unwrapKey` được cấu thành từ import + decrypt.

## Cú pháp

```js-nolint
wrapKey(format, key, wrappingKey, wrapAlgo)
```

### Tham số

- `format`
  - : Một chuỗi mô tả định dạng dữ liệu mà khóa sẽ được xuất trước khi được mã hóa. Nó có thể là một trong các giá trị sau:
    - `raw`
      - : Định dạng [Raw](/en-US/docs/Web/API/SubtleCrypto/importKey#raw).
    - `pkcs8`
      - : Định dạng [PKCS #8](/en-US/docs/Web/API/SubtleCrypto/importKey#pkcs_8).
    - `spki`
      - : Định dạng [SubjectPublicKeyInfo](/en-US/docs/Web/API/SubtleCrypto/importKey#subjectpublickeyinfo).
    - `jwk`
      - : Định dạng [JSON Web Key](/en-US/docs/Web/API/SubtleCrypto/importKey#json_web_key).
- `key`
  - : {{domxref("CryptoKey")}} cần bọc.
- `wrappingKey`
  - : {{domxref("CryptoKey")}} được sử dụng để mã hóa khóa đã xuất. Khóa phải có cách sử dụng `wrapKey`.
- `wrapAlgo`
  - : Một đối tượng chỉ định [thuật toán](/en-US/docs/Web/API/SubtleCrypto/encrypt#supported_algorithms) sẽ sử dụng để mã hóa khóa đã xuất, và bất kỳ tham số bổ sung nào cần thiết:
    - Để sử dụng [RSA-OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep),
      truyền một đối tượng [`RsaOaepParams`](/en-US/docs/Web/API/RsaOaepParams).
    - Để sử dụng [AES-CTR](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr),
      truyền một đối tượng [`AesCtrParams`](/en-US/docs/Web/API/AesCtrParams).
    - Để sử dụng [AES-CBC](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc),
      truyền một đối tượng [`AesCbcParams`](/en-US/docs/Web/API/AesCbcParams).
    - Để sử dụng [AES-GCM](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm),
      truyền một đối tượng [`AesGcmParams`](/en-US/docs/Web/API/AesGcmParams).
    - Để sử dụng [AES-KW](#aes-kw),
      truyền chuỗi `"AES-KW"`, hoặc một đối tượng có dạng `{ name: "AES-KW" }`.

### Giá trị trả về

Một [`Promise`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) được fulfill với một [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) chứa khóa đã xuất được mã hóa.

### Ngoại lệ

Promise bị reject khi gặp một trong các ngoại lệ sau:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném lên khi khóa bọc không phải là khóa cho thuật toán bọc được yêu cầu.
- `NotSupported` {{domxref("DOMException")}}
  - : Ném lên khi cố sử dụng một thuật toán không xác định hoặc không phù hợp để mã hóa hoặc bọc.
- {{jsxref("TypeError")}}
  - : Ném lên khi cố sử dụng một định dạng không hợp lệ.

## Các thuật toán được hỗ trợ

Tất cả [các thuật toán có thể sử dụng để mã hóa](/en-US/docs/Web/API/SubtleCrypto/encrypt#supported_algorithms) đều có thể sử dụng để bọc khóa, miễn là khóa có cách sử dụng "wrapKey".
Để bọc khóa, bạn có thêm lựa chọn [AES-KW](#aes-kw).

### AES-KW

AES-KW là một cách sử dụng bộ mã AES để bọc khóa.

Một ưu điểm của việc sử dụng AES-KW so với chế độ AES khác như AES-GCM là AES-KW không yêu cầu vector khởi tạo.
Để sử dụng AES-KW, đầu vào phải là bội số của 64 bit.

AES-KW được chỉ định trong [RFC 3394](https://datatracker.ietf.org/doc/html/rfc3394).

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/wrap-key/index.html) trên GitHub.

### Bọc Raw

Ví dụ này bọc một khóa AES.
Nó sử dụng "raw" làm định dạng xuất và AES-KW, với khóa phái sinh từ mật khẩu, để mã hóa nó. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/wrap-key/raw.js)

```js
let salt;

/*
Lấy một số tài liệu khóa để sử dụng làm đầu vào cho phương thức deriveKey.
Tài liệu khóa là mật khẩu do người dùng cung cấp.
*/
function getKeyMaterial() {
  const password = window.prompt("Enter your password");
  const enc = new TextEncoder();
  return window.crypto.subtle.importKey(
    "raw",
    enc.encode(password),
    { name: "PBKDF2" },
    false,
    ["deriveBits", "deriveKey"],
  );
}

/*
Với một số tài liệu khóa và một số salt ngẫu nhiên
phái sinh một khóa AES-KW bằng PBKDF2.
*/
function getKey(keyMaterial, salt) {
  return window.crypto.subtle.deriveKey(
    {
      name: "PBKDF2",
      salt,
      iterations: 100000,
      hash: "SHA-256",
    },
    keyMaterial,
    { name: "AES-KW", length: 256 },
    true,
    ["wrapKey", "unwrapKey"],
  );
}

/*
Bọc khóa đã cho.
*/
async function wrapCryptoKey(keyToWrap) {
  // lấy khóa mã hóa khóa
  const keyMaterial = await getKeyMaterial();
  salt = window.crypto.getRandomValues(new Uint8Array(16));
  const wrappingKey = await getKey(keyMaterial, salt);

  return window.crypto.subtle.wrapKey("raw", keyToWrap, wrappingKey, "AES-KW");
}

/*
Tạo một khóa bí mật mã hóa/giải mã,
sau đó bọc nó.
*/
window.crypto.subtle
  .generateKey(
    {
      name: "AES-GCM",
      length: 256,
    },
    true,
    ["encrypt", "decrypt"],
  )
  .then((secretKey) => wrapCryptoKey(secretKey))
  .then((wrappedKey) => console.log(wrappedKey));
```

### Bọc PKCS #8

Ví dụ này bọc một khóa riêng tư ký RSA. Nó sử dụng "pkcs8" làm định dạng xuất và AES-GCM, với khóa phái sinh từ mật khẩu, để mã hóa nó.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/wrap-key/pkcs8.js)

```js
let salt;
let iv;

/*
Lấy một số tài liệu khóa để sử dụng làm đầu vào cho phương thức deriveKey.
Tài liệu khóa là mật khẩu do người dùng cung cấp.
*/
function getKeyMaterial() {
  const password = window.prompt("Enter your password");
  const enc = new TextEncoder();
  return window.crypto.subtle.importKey(
    "raw",
    enc.encode(password),
    { name: "PBKDF2" },
    false,
    ["deriveBits", "deriveKey"],
  );
}

/*
Với một số tài liệu khóa và một số salt ngẫu nhiên
phái sinh một khóa AES-GCM bằng PBKDF2.
*/
function getKey(keyMaterial, salt) {
  return window.crypto.subtle.deriveKey(
    {
      name: "PBKDF2",
      salt,
      iterations: 100000,
      hash: "SHA-256",
    },
    keyMaterial,
    { name: "AES-GCM", length: 256 },
    true,
    ["wrapKey", "unwrapKey"],
  );
}

/*
Bọc khóa đã cho.
*/
async function wrapCryptoKey(keyToWrap) {
  // lấy khóa mã hóa khóa
  const keyMaterial = await getKeyMaterial();
  salt = window.crypto.getRandomValues(new Uint8Array(16));
  const wrappingKey = await getKey(keyMaterial, salt);
  iv = window.crypto.getRandomValues(new Uint8Array(12));

  return window.crypto.subtle.wrapKey("pkcs8", keyToWrap, wrappingKey, {
    name: "AES-GCM",
    iv,
  });
}

/*
Tạo một cặp khóa ký/xác minh,
sau đó bọc khóa riêng tư.
*/
window.crypto.subtle
  .generateKey(
    {
      name: "RSA-PSS",
      // Cân nhắc sử dụng khóa 4096-bit cho các hệ thống yêu cầu bảo mật dài hạn
      modulusLength: 2048,
      publicExponent: new Uint8Array([1, 0, 1]),
      hash: "SHA-256",
    },
    true,
    ["sign", "verify"],
  )
  .then((keyPair) => wrapCryptoKey(keyPair.privateKey))
  .then((wrappedKey) => {
    console.log(wrappedKey);
  });
```

### Bọc SubjectPublicKeyInfo

Ví dụ này bọc một khóa công khai mã hóa RSA. Nó sử dụng "spki" làm định dạng xuất và AES-CBC, với khóa phái sinh từ mật khẩu, để mã hóa nó.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/wrap-key/spki.js)

```js
let salt;
let iv;

/*
Lấy một số tài liệu khóa để sử dụng làm đầu vào cho phương thức deriveKey.
Tài liệu khóa là mật khẩu do người dùng cung cấp.
*/
function getKeyMaterial() {
  const password = window.prompt("Enter your password");
  const enc = new TextEncoder();
  return window.crypto.subtle.importKey(
    "raw",
    enc.encode(password),
    { name: "PBKDF2" },
    false,
    ["deriveBits", "deriveKey"],
  );
}

/*
Với một số tài liệu khóa và một số salt ngẫu nhiên
phái sinh một khóa AES-CBC bằng PBKDF2.
*/
function getKey(keyMaterial, salt) {
  return window.crypto.subtle.deriveKey(
    {
      name: "PBKDF2",
      salt,
      iterations: 100000,
      hash: "SHA-256",
    },
    keyMaterial,
    { name: "AES-CBC", length: 256 },
    true,
    ["wrapKey", "unwrapKey"],
  );
}

/*
Bọc khóa đã cho.
*/
async function wrapCryptoKey(keyToWrap) {
  // lấy khóa mã hóa khóa
  const keyMaterial = await getKeyMaterial();
  salt = window.crypto.getRandomValues(new Uint8Array(16));
  const wrappingKey = await getKey(keyMaterial, salt);
  iv = window.crypto.getRandomValues(new Uint8Array(16));

  return window.crypto.subtle.wrapKey("spki", keyToWrap, wrappingKey, {
    name: "AES-CBC",
    iv,
  });
}

/*
Tạo một cặp khóa mã hóa/giải mã,
sau đó bọc nó.
*/
window.crypto.subtle
  .generateKey(
    {
      name: "RSA-OAEP",
      // Cân nhắc sử dụng khóa 4096-bit cho các hệ thống yêu cầu bảo mật dài hạn
      modulusLength: 2048,
      publicExponent: new Uint8Array([1, 0, 1]),
      hash: "SHA-256",
    },
    true,
    ["encrypt", "decrypt"],
  )
  .then((keyPair) => wrapCryptoKey(keyPair.publicKey))
  .then((wrappedKey) => console.log(wrappedKey));
```

### Bọc JSON Web Key

Ví dụ này bọc một khóa riêng tư ký ECDSA. Nó sử dụng "jwk" làm định dạng xuất và AES-GCM, với khóa phái sinh từ mật khẩu, để mã hóa nó.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/wrap-key/jwk.js)

```js
let salt;
let iv;

/*
Lấy một số tài liệu khóa để sử dụng làm đầu vào cho phương thức deriveKey.
Tài liệu khóa là mật khẩu do người dùng cung cấp.
*/
function getKeyMaterial() {
  const password = window.prompt("Enter your password");
  const enc = new TextEncoder();
  return window.crypto.subtle.importKey(
    "raw",
    enc.encode(password),
    { name: "PBKDF2" },
    false,
    ["deriveBits", "deriveKey"],
  );
}

/*
Với một số tài liệu khóa và một số salt ngẫu nhiên
phái sinh một khóa AES-GCM bằng PBKDF2.
*/
function getKey(keyMaterial, salt) {
  return window.crypto.subtle.deriveKey(
    {
      name: "PBKDF2",
      salt,
      iterations: 100000,
      hash: "SHA-256",
    },
    keyMaterial,
    { name: "AES-GCM", length: 256 },
    true,
    ["wrapKey", "unwrapKey"],
  );
}

/*
Bọc khóa đã cho.
*/
async function wrapCryptoKey(keyToWrap) {
  // lấy khóa mã hóa khóa
  const keyMaterial = await getKeyMaterial();
  salt = window.crypto.getRandomValues(new Uint8Array(16));
  const wrappingKey = await getKey(keyMaterial, salt);
  iv = window.crypto.getRandomValues(new Uint8Array(12));

  return window.crypto.subtle.wrapKey("jwk", keyToWrap, wrappingKey, {
    name: "AES-GCM",
    iv,
  });
}

/*
Tạo một cặp khóa ký/xác minh,
sau đó bọc khóa riêng tư
*/
window.crypto.subtle
  .generateKey(
    {
      name: "ECDSA",
      namedCurve: "P-384",
    },
    true,
    ["sign", "verify"],
  )
  .then((keyPair) => wrapCryptoKey(keyPair.privateKey))
  .then((wrappedKey) => console.log(wrappedKey));
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`SubtleCrypto.exportKey()`](/en-US/docs/Web/API/SubtleCrypto/exportKey)
- [Định dạng PKCS #8](https://datatracker.ietf.org/doc/html/rfc5208).
- [Định dạng SubjectPublicKeyInfo](https://datatracker.ietf.org/doc/html/rfc5280#section-4.1).
- [Định dạng JSON Web Key](https://datatracker.ietf.org/doc/html/rfc7517).
- [Đặc tả kỹ thuật AES-KW](https://datatracker.ietf.org/doc/html/rfc3394).
