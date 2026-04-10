---
title: "SubtleCrypto: phương thức importKey()"
short-title: importKey()
slug: Web/API/SubtleCrypto/importKey
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.importKey
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`importKey()`** của giao diện {{domxref("SubtleCrypto")}} nhập một khóa: nghĩa là, nó nhận làm đầu vào một khóa ở định dạng bên ngoài, có thể di chuyển và cung cấp cho bạn một đối tượng {{domxref("CryptoKey")}} mà bạn có thể sử dụng trong [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API).

Hàm này chấp nhận nhiều định dạng nhập: xem [Các định dạng được hỗ trợ](#cac-dinh-dang-duoc-ho-tro) để biết chi tiết.

## Cú pháp

```js-nolint
importKey(format, keyData, algorithm, extractable, keyUsages)
```

### Tham số

- `format`
  - : Một chuỗi mô tả định dạng dữ liệu của khóa cần nhập. Nó có thể là một trong các giá trị sau:
    - `raw`: Định dạng [Raw](#raw).
    - `pkcs8`: Định dạng [PKCS #8](#pkcs-8).
    - `spki`: Định dạng [SubjectPublicKeyInfo](#subjectpublickeyinfo).
    - `jwk`: Định dạng [JSON Web Key](#json-web-key).
- `keyData`
  - : Một {{jsxref("ArrayBuffer")}}, một [TypedArray](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray),
    một {{jsxref("DataView")}}, hoặc một đối tượng `JSONWebKey` chứa khóa ở định dạng đã cho.
- `algorithm`
  - : Một đối tượng xác định loại khóa cần nhập và cung cấp các tham số bổ sung cụ thể cho thuật toán.
    - Đối với [RSASSA-PKCS1-v1_5](/en-US/docs/Web/API/SubtleCrypto/sign#rsassa-pkcs1-v1_5), [RSA-PSS](/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss),
      hoặc [RSA-OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep):
      truyền một đối tượng [`RsaHashedImportParams`](/en-US/docs/Web/API/RsaHashedImportParams).
    - Đối với [ECDSA](/en-US/docs/Web/API/SubtleCrypto/sign#ecdsa) hoặc [ECDH](/en-US/docs/Web/API/SubtleCrypto/deriveKey#ecdh):
      truyền một đối tượng [`EcKeyImportParams`](/en-US/docs/Web/API/EcKeyImportParams).
    - Đối với [HMAC](/en-US/docs/Web/API/SubtleCrypto/sign#hmac):
      truyền một đối tượng [`HmacImportParams`](/en-US/docs/Web/API/HmacImportParams).
    - Đối với [AES-CTR](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr), [AES-CBC](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc),
      [AES-GCM](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm), và [AES-KW](/en-US/docs/Web/API/SubtleCrypto/wrapKey#aes-kw):
      truyền chuỗi xác định thuật toán hoặc một đối tượng có dạng `{ name: ALGORITHM }`, trong đó `ALGORITHM` là tên của thuật toán.
    - Đối với [PBKDF2](/en-US/docs/Web/API/SubtleCrypto/deriveKey#pbkdf2): truyền chuỗi `PBKDF2` hoặc một đối tượng có dạng `{ name: "PBKDF2" }`.
    - Đối với [HKDF](/en-US/docs/Web/API/SubtleCrypto/deriveKey#hkdf): truyền chuỗi `HKDF` hoặc một đối tượng có dạng `{ name: "HKDF" }`.
    - Đối với [Ed25519](/en-US/docs/Web/API/SubtleCrypto/sign#ed25519): truyền chuỗi `Ed25519` hoặc một đối tượng có dạng `{ name: "Ed25519" }`.
    - Đối với [X25519](/en-US/docs/Web/API/SubtleCrypto/deriveKey#x25519): truyền chuỗi `X25519` hoặc một đối tượng có dạng `{ name: "X25519" }`.
- `extractable`
  - : Một giá trị boolean cho biết liệu có thể xuất khóa bằng {{domxref("SubtleCrypto.exportKey()")}} hoặc {{domxref("SubtleCrypto.wrapKey()")}} hay không.
- `keyUsages`
  - : Một {{jsxref("Array")}} cho biết những gì có thể thực hiện với khóa. Các giá trị có thể của mảng là:
    - `encrypt`: Khóa có thể được sử dụng để [mã hóa](/en-US/docs/Web/API/SubtleCrypto/encrypt) thông báo.
    - `decrypt`: Khóa có thể được sử dụng để [giải mã](/en-US/docs/Web/API/SubtleCrypto/decrypt) thông báo.
    - `sign`: Khóa có thể được sử dụng để [ký](/en-US/docs/Web/API/SubtleCrypto/sign) thông báo.
    - `verify`: Khóa có thể được sử dụng để [xác minh](/en-US/docs/Web/API/SubtleCrypto/verify) chữ ký.
    - `deriveKey`: Khóa có thể được sử dụng trong [phái sinh khóa mới](/en-US/docs/Web/API/SubtleCrypto/deriveKey).
    - `deriveBits`: Khóa có thể được sử dụng trong [phái sinh bit](/en-US/docs/Web/API/SubtleCrypto/deriveBits).
    - `wrapKey`: Khóa có thể được sử dụng để [bọc khóa](/en-US/docs/Web/API/SubtleCrypto/wrapKey).
    - `unwrapKey`: Khóa có thể được sử dụng để [mở bọc khóa](/en-US/docs/Web/API/SubtleCrypto/unwrapKey).

### Giá trị trả về

Một [`Promise`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) được fulfill với khóa đã nhập dưới dạng đối tượng {{domxref("CryptoKey")}}.

### Ngoại lệ

Promise bị reject khi gặp một trong các ngoại lệ sau:

- `SyntaxError` {{domxref("DOMException")}}
  - : Ném lên khi `keyUsages` trống nhưng khóa đã mở bọc có loại `secret` hoặc `private`.
- {{jsxref("TypeError")}}
  - : Ném lên khi cố sử dụng một định dạng không hợp lệ hoặc nếu `keyData` không phù hợp với định dạng đó.

## Các định dạng được hỗ trợ

API này hỗ trợ bốn định dạng nhập/xuất khóa khác nhau: Raw, PKCS #8, SubjectPublicKeyInfo và JSON Web Key.

### Raw

Bạn có thể sử dụng định dạng này để nhập hoặc xuất các khóa bí mật AES hoặc HMAC, hoặc các khóa công khai Elliptic Curve (ECDSA hoặc ECDH).

Trong định dạng này, khóa được cung cấp dưới dạng một [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) chứa các byte thô cho khóa.

Lưu ý khi nhập các khóa công khai Elliptic Curve, dữ liệu có thể chứa các điểm đường cong elliptic _nén_.

### PKCS #8

Bạn có thể sử dụng định dạng này để nhập hoặc xuất các khóa riêng tư RSA hoặc Elliptic Curve.

Định dạng PKCS #8 được định nghĩa trong [RFC 5208](https://datatracker.ietf.org/doc/html/rfc5208), sử dụng [ký hiệu ASN.1](https://en.wikipedia.org/wiki/ASN.1):

```plain
PrivateKeyInfo ::= SEQUENCE {
    version                   Version,
    privateKeyAlgorithm       PrivateKeyAlgorithmIdentifier,
    privateKey                PrivateKey,
    attributes           [0]  IMPLICIT Attributes OPTIONAL }
```

Phương thức `importKey()` mong đợi nhận đối tượng này dưới dạng một [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) chứa dạng [mã hóa DER](https://luca.ntop.org/Teaching/Appunti/asn1.html) của `PrivateKeyInfo`.
DER là một tập hợp các quy tắc để mã hóa các cấu trúc ASN.1 thành dạng nhị phân.

Bạn có khả năng bắt gặp đối tượng này ở [định dạng PEM](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail) nhiều nhất.
Định dạng PEM là một cách mã hóa dữ liệu nhị phân thành ASCII. Nó bao gồm một header và một footer, và ở giữa là dữ liệu nhị phân [mã hóa base64](/en-US/docs/Glossary/Base64).
Một `PrivateKeyInfo` được mã hóa PEM trông như thế này:

```plain
-----BEGIN PRIVATE KEY-----
MIG2AgEAMBAGByqGSM49AgEGBSuBBAAiBIGeMIGbAgEBBDAU9BD0jxDfF5OV380z
9VIEUN2W5kJDZ3hbuaDenCxLiAMsoquKTfFaou71eLdN0TShZANiAARMUhCee/cp
xmjGc1roj0D0k6VlUqtA+JVCWigXcIAukOeTHCngZDKCrD4PkXDBvbciJdZKvO+l
ml2FIkoovZh/8yeTKmjUMb804g6OmjUc9vVojCRV0YdaSmYkkJMJbLg=
-----END PRIVATE KEY-----
```

Để đưa nó vào định dạng bạn có thể truyền cho `importKey()`, bạn cần thực hiện hai việc:

- Giải mã base64 phần giữa header và footer, sử dụng {{domxref("Window.atob()")}}.
- Chuyển đổi chuỗi kết quả thành một {{jsxref("ArrayBuffer")}}.

Xem mục [Ví dụ](#vi-du) để biết hướng dẫn cụ thể hơn.

### SubjectPublicKeyInfo

Bạn có thể sử dụng định dạng này để nhập hoặc xuất các khóa công khai RSA hoặc Elliptic Curve.

`SubjectPublicKey` được định nghĩa trong [RFC 5280, Section 4.1](https://datatracker.ietf.org/doc/html/rfc5280#section-4.1) sử dụng [ký hiệu ASN.1](https://en.wikipedia.org/wiki/ASN.1):

```plain
SubjectPublicKeyInfo  ::=  SEQUENCE  {
    algorithm            AlgorithmIdentifier,
    subjectPublicKey     BIT STRING  }
```

Giống như [PKCS #8](#pkcs-8), phương thức `importKey()` mong đợi nhận đối tượng này dưới dạng một [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) chứa dạng [mã hóa DER](https://luca.ntop.org/Teaching/Appunti/asn1.html) của `SubjectPublicKeyInfo`.

Một lần nữa, bạn có khả năng bắt gặp đối tượng này ở [định dạng PEM](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail) nhiều nhất.
Một `SubjectPublicKeyInfo` được mã hóa PEM trông như thế này:

```plain
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3j+HgSHUnc7F6XzvEbD0
r3M5JNy+/kabiJVu8IU1ERAl3Osi38VgiMzjDBDOrFxVzNNzl+SXAHwXIV5BHiXL
CQ6qhwYsDgH6OqgKIwiALra/wNH4UHxj1Or/iyAkjHRR/kGhUtjyVCjzvaQaDpJW
2G+syd1ui0B6kJov2CRUWiPwpff8hBfVWv8q9Yc2yD5hCnykVL0iAiyn+SDAk/rv
8dC5eIlzCI4efUCbyG4c9O88Qz7bS14DxSfaPTy8P/TWoihVVjLaDF743LgM/JLq
CDPUBUA3HLsZUhKm3BbSkd7Q9Ngkjv3+yByo4/fL+fkYRa8j9Ypa2N0Iw53LFb3B
gQIDAQAB
-----END PUBLIC KEY-----
```

Giống như với [PKCS #8](#pkcs-8), để đưa nó vào định dạng bạn có thể truyền cho `importKey()`, bạn cần thực hiện hai việc:

- Giải mã base64 phần giữa header và footer, sử dụng {{domxref("Window.atob()")}}.
- Chuyển đổi chuỗi kết quả thành một {{jsxref("ArrayBuffer")}}.

Xem mục [Ví dụ](#vi-du) để biết hướng dẫn cụ thể hơn.

### JSON Web Key

Bạn có thể sử dụng định dạng JSON Web Key để nhập hoặc xuất các khóa công khai hoặc riêng tư RSA hoặc Elliptic Curve, cũng như các khóa bí mật AES và HMAC.

Định dạng JSON Web Key được định nghĩa trong [RFC 7517](https://datatracker.ietf.org/doc/html/rfc7517).
Nó mô tả một cách biểu diễn các khóa công khai, riêng tư và bí mật dưới dạng các đối tượng JSON.

Một JSON Web Key trông giống như thế này (đây là một khóa riêng tư EC):

```json
{
  "crv": "P-384",
  "d": "wouCtU7Nw4E8_7n5C1-xBjB4xqSb_liZhYMsy8MGgxUny6Q8NCoH9xSiviwLFfK_",
  "ext": true,
  "key_ops": ["sign"],
  "kty": "EC",
  "x": "SzrRXmyI8VWFJg1dPUNbFcc9jZvjZEfH7ulKI1UkXAltd7RGWrcfFxqyGPcwu6AQ",
  "y": "hHUag3OvDzEr0uUQND4PXHQTXP5IDGdYhJhL-WLKjnGjQAw0rNGy5V29-aV-yseW"
}
```

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/import-key/index.html) trên GitHub.

### Nhập Raw

Ví dụ này nhập một khóa AES từ một `ArrayBuffer` chứa các byte thô sẽ sử dụng.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/import-key/raw.js)

```js
const rawKey = window.crypto.getRandomValues(new Uint8Array(16));

/*
Nhập một khóa bí mật AES từ một ArrayBuffer chứa các byte thô.
Nhận một chuỗi ArrayBuffer chứa các byte, và trả về một Promise
sẽ giải quyết thành một CryptoKey đại diện cho khóa bí mật.
*/
function importSecretKey(rawKey) {
  return window.crypto.subtle.importKey("raw", rawKey, "AES-GCM", true, [
    "encrypt",
    "decrypt",
  ]);
}
```

### Nhập PKCS #8

Ví dụ này nhập một khóa riêng tư ký RSA từ một đối tượng PKCS #8 được mã hóa PEM.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/import-key/pkcs8.js)

```js
/*
Chuyển đổi một chuỗi thành một ArrayBuffer
từ https://developers.google.com/web/updates/2012/06/How-to-convert-ArrayBuffer-to-and-from-String
*/
function str2ab(str) {
  const buf = new ArrayBuffer(str.length);
  const bufView = new Uint8Array(buf);
  for (let i = 0, strLen = str.length; i < strLen; i++) {
    bufView[i] = str.charCodeAt(i);
  }
  return buf;
}

const pemEncodedKey = `-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDD0tPV/du2vftjvXj1t/gXTK39sNBVrOAEb/jKzXae+Xa0H+3LhZaQIQNMfACiBSgIfZUvEGb+7TqXWQpoLoFR/R7MvGWcSk98JyrVtveD8ZmZYyItSY7m2hcasqAFiKyOouV5vzyRe87/lEyzzBpF3bQQ4IDaQu+K9Hj5fKuU6rrOeOhsdnJc+VdDQLScHxvMoLZ9Vtt+oK9J4/tOLwr4CG8khDlBURcBY6gPcLo3dPU09SW+6ctX2cX4mkXx6O/0mmdTmacr/vu50KdRMleZeZYOWPAEhhMfywybTuzBiPVIZVP8WFCSKNMbfi1S9A9PdBqnebwwHhX3/hsEBt2BAgMBAAECggEABEI1P6nf6Zs7mJlyBDv+Pfl5rjL2cOqLy6TovvZVblMkCPpJyFuNIPDK2tK2i897ZaXfhPDBIKmllM2Hq6jZQKB110OAnTPDg0JxzMiIHPs32S1d/KilHjGff4Hjd4NXp1l1Dp8BUPOllorR2TYm2x6dcCGFw9lhTr8O03Qp4hjn84VjGIWADYCk83mgS4nRsnHkdiqYnWx1AjKlY51yEK6RcrDMi0Th2RXrrINoC35sVv+APt2rkoMGi52RwTEseA1KZGFrxjq61ReJif6p2VXEcvHeX6CWLx014LGk43z6Q28P6HgeEVEfIjyqCUea5Du/mYb/QsRSCosXLxBqwQKBgQD1+fdC9ZiMrVI+km7Nx2CKBn8rJrDmUh5SbXn2MYJdrUd8bYNnZkCgKMgxVXsvJrbmVOrby2txOiqudZkk5mD3E5O/QZWPWQLgRu8ueYNpobAX9NRgNfZ7rZD+81vh5MfZiXfuZOuzv29iZhU0oqyZ9y75eHkLdrerNkwYOe5aUQKBgQDLzapDi1NxkBgsj9iiO4KUa7jvD4JjRqFy4Zhj/jbQvlvM0F/uFp7sxVcHGx4r11C+6iCbhX4u+Zuu0HGjT4d+hNXmgGyxR8fIUVxOlOtDkVJa5sOBZK73/9/MBeKusdmJPRhalZQfMUJRWIoEVDMhfg3tW/rBj5RYAtP2dTVUMQKBgDs8yr52dRmT+BWXoFWwaWB0NhYHSFz/c8v4D4Ip5DJ5M5kUqquxJWksySGQa40sbqnD05fBQovPLU48hfgr/zghn9hUjBcsoZOvoZR4sRw0UztBvA+7jzOz1hKAOyWIulR6Vca0yUrNlJ6G5R56+sRNkiOETupi2dLCzcqb0PoxAoGAZyNHvTLvIZN4iGSrjz5qkM4LIwBIThFadxbv1fq6pt0O/BGf2o+cEdq0diYlGK64cEVwBwSBnSg4vzlBqRIAUejLjwEDAJyA4EE8Y5A9l04dzV7nJb5cRak6CrgXxay/mBJRFtaHxVlaZGxYPGSYE6UFS0+3EOmmevvDZQBf4qECgYEA0ZF6Vavz28+8wLO6SP3w8NmpHk7K9tGEvUfQ30SgDx4G7qPIgfPrbB4OP/E0qCfsIImi3sCPpjvUMQdVVZyPOIMuB+rV3ZOxkrzxEUOrpOpR48FZbL7RN90yRQsAsrp9e4iv8QwB3VxLe7X0TDqqnRyqrc/osGzuS2ZcHOKmCU8=
-----END PRIVATE KEY-----`;

/*
Nhập một khóa riêng tư RSA được mã hóa PEM, để sử dụng cho việc ký RSA-PSS.
Nhận một chuỗi chứa khóa được mã hóa PEM, và trả về một Promise
sẽ giải quyết thành một CryptoKey đại diện cho khóa riêng tư.
*/
function importPrivateKey(pem) {
  // fetch the part of the PEM string between header and footer
  const pemHeader = "-----BEGIN PRIVATE KEY-----";
  const pemFooter = "-----END PRIVATE KEY-----";
  const pemContents = pem.substring(
    pemHeader.length,
    pem.length - pemFooter.length - 1,
  );
  // base64 decode the string to get the binary data
  const binaryDerString = window.atob(pemContents);
  // convert from a binary string to an ArrayBuffer
  const binaryDer = str2ab(binaryDerString);

  return window.crypto.subtle.importKey(
    "pkcs8",
    binaryDer,
    {
      name: "RSA-PSS",
      hash: "SHA-256",
    },
    true,
    ["sign"],
  );
}
```

### Nhập SubjectPublicKeyInfo

Ví dụ này nhập một khóa công khai mã hóa RSA từ một đối tượng `SubjectPublicKeyInfo` được mã hóa PEM. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/import-key/spki.js)

```js
// từ https://developers.google.com/web/updates/2012/06/How-to-convert-ArrayBuffer-to-and-from-String
function str2ab(str) {
  const buf = new ArrayBuffer(str.length);
  const bufView = new Uint8Array(buf);
  for (let i = 0, strLen = str.length; i < strLen; i++) {
    bufView[i] = str.charCodeAt(i);
  }
  return buf;
}

const pemEncodedKey = `-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy3Xo3U13dc+xojwQYWoJLCbOQ5fOVY8LlnqcJm1W1BFtxIhOAJWohiHuIRMctv7dzx47TLlmARSKvTRjd0dF92jx/xY20Lz+DXp8YL5yUWAFgA3XkO3LSJgEOex10NB8jfkmgSb7QIudTVvbbUDfd5fwIBmCtaCwWx7NyeWWDb7A9cFxj7EjRdrDaK3ux/ToMLHFXVLqSL341TkCf4ZQoz96RFPUGPPLOfvN0x66CM1PQCkdhzjE6U5XGE964ZkkYUPPsy6Dcie4obhW4vDjgUmLzv0z7UD010RLIneUgDE2FqBfY/C+uWigNPBPkkQ+Bv/UigS6dHqTCVeD5wgyBQIDAQAB
-----END PUBLIC KEY-----`;

function importRsaKey(pem) {
  // fetch the part of the PEM string between header and footer
  const pemHeader = "-----BEGIN PUBLIC KEY-----";
  const pemFooter = "-----END PUBLIC KEY-----";
  const pemContents = pem.substring(
    pemHeader.length,
    pem.length - pemFooter.length - 1,
  );
  // base64 decode the string to get the binary data
  const binaryDerString = window.atob(pemContents);
  // convert from a binary string to an ArrayBuffer
  const binaryDer = str2ab(binaryDerString);

  return window.crypto.subtle.importKey(
    "spki",
    binaryDer,
    {
      name: "RSA-OAEP",
      hash: "SHA-256",
    },
    true,
    ["encrypt"],
  );
}
```

### Nhập JSON Web Key

Đoạn mã này nhập một khóa riêng tư ký ECDSA, với một đối tượng JSON Web Key đại diện cho nó.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/import-key/jwk.js)

```js
const jwkEcKey = {
  crv: "P-384",
  d: "wouCtU7Nw4E8_7n5C1-xBjB4xqSb_liZhYMsy8MGgxUny6Q8NCoH9xSiviwLFfK_",
  ext: true,
  key_ops: ["sign"],
  kty: "EC",
  x: "SzrRXmyI8VWFJg1dPUNbFcc9jZvjZEfH7ulKI1UkXAltd7RGWrcfFxqyGPcwu6AQ",
  y: "hHUag3OvDzEr0uUQND4PXHQTXP5IDGdYhJhL-WLKjnGjQAw0rNGy5V29-aV-yseW",
};

/*
Nhập một khóa riêng tư EC ở định dạng JSON Web Key, để sử dụng cho việc ký ECDSA.
Nhận một đối tượng đại diện cho JSON Web Key, và trả về một Promise
sẽ giải quyết thành một CryptoKey đại diện cho khóa riêng tư.
*/
function importPrivateKey(jwk) {
  return window.crypto.subtle.importKey(
    "jwk",
    jwk,
    {
      name: "ECDSA",
      namedCurve: "P-384",
    },
    true,
    ["sign"],
  );
}
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
