---
title: "SubtleCrypto: phương thức exportKey()"
short-title: exportKey()
slug: Web/API/SubtleCrypto/exportKey
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.exportKey
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`exportKey()`** của giao diện {{domxref("SubtleCrypto")}} xuất một khóa: nghĩa là, nó nhận làm đầu vào một đối tượng {{domxref("CryptoKey")}} và cung cấp cho bạn khóa ở định dạng bên ngoài, có thể di chuyển.

Để xuất một khóa, khóa phải có {{domxref("CryptoKey.extractable")}} được đặt thành `true`.

Khóa có thể được xuất ở nhiều định dạng: xem [Các định dạng được hỗ trợ](/en-US/docs/Web/API/SubtleCrypto/importKey#supported_formats) trong trang [`SubtleCrypto.importKey()`](/en-US/docs/Web/API/SubtleCrypto/importKey) để biết chi tiết.

Khóa không được xuất ở định dạng mã hóa: để mã hóa khóa khi xuất chúng, sử dụng API [`SubtleCrypto.wrapKey()`](/en-US/docs/Web/API/SubtleCrypto/wrapKey) thay thế.

## Cú pháp

```js-nolint
exportKey(format, key)
```

### Tham số

- `format`
  - : Một chuỗi mô tả định dạng dữ liệu mà khóa sẽ được xuất. Nó có thể là một trong các giá trị sau:
    - `raw`: Định dạng [Raw](/en-US/docs/Web/API/SubtleCrypto/importKey#raw).
    - `pkcs8`: Định dạng [PKCS #8](/en-US/docs/Web/API/SubtleCrypto/importKey#pkcs_8).
    - `spki`: Định dạng [SubjectPublicKeyInfo](/en-US/docs/Web/API/SubtleCrypto/importKey#subjectpublickeyinfo).
    - `jwk`: Định dạng [JSON Web Key](/en-US/docs/Web/API/SubtleCrypto/importKey#json_web_key).
- `key`
  - : {{domxref("CryptoKey")}} cần xuất.

### Giá trị trả về

Một [`Promise`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise).

- Nếu `format` là `jwk`, thì promise được fulfill với một đối tượng JSON chứa khóa.
- Nếu không, promise được fulfill với một [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) chứa khóa.

### Ngoại lệ

Promise bị reject khi gặp một trong các ngoại lệ sau:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném lên khi cố xuất một khóa không thể trích xuất.
- `NotSupported` {{domxref("DOMException")}}
  - : Ném lên khi cố xuất ở định dạng không xác định.
- {{jsxref("TypeError")}}
  - : Ném lên khi cố sử dụng một định dạng không hợp lệ.

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/export-key/index.html) trên GitHub.

### Xuất Raw

Ví dụ này xuất một khóa AES dưới dạng `ArrayBuffer` chứa các byte cho khóa. [Xem mã đầy đủ trên GitHub](https://github.com/mdn/dom-examples/blob/main/web-crypto/export-key/raw.js).

```js
/*
Xuất khóa đã cho và ghi vào không gian "exported-key".
*/
async function exportCryptoKey(key) {
  const exported = await window.crypto.subtle.exportKey("raw", key);
  const exportedKeyBuffer = new Uint8Array(exported);

  const exportKeyOutput = document.querySelector(".exported-key");
  exportKeyOutput.textContent = `[${exportedKeyBuffer}]`;
}

/*
Tạo một khóa bí mật mã hóa/giải mã,
sau đó thiết lập trình lắng nghe sự kiện trên nút "Export".
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
  .then((key) => {
    const exportButton = document.querySelector(".raw");
    exportButton.addEventListener("click", () => {
      exportCryptoKey(key);
    });
  });
```

### Xuất PKCS #8

Ví dụ này xuất một khóa riêng tư ký RSA dưới dạng đối tượng PKCS #8. Khóa đã xuất sau đó được mã hóa PEM. [Xem mã đầy đủ trên GitHub](https://github.com/mdn/dom-examples/blob/main/web-crypto/export-key/pkcs8.js).

```js
/*
Chuyển đổi một ArrayBuffer thành một chuỗi
từ https://developer.chrome.com/blog/how-to-convert-arraybuffer-to-and-from-string/
*/
function ab2str(buf) {
  return String.fromCharCode.apply(null, new Uint8Array(buf));
}

/*
Xuất khóa đã cho và ghi vào không gian "exported-key".
*/
async function exportCryptoKey(key) {
  const exported = await window.crypto.subtle.exportKey("pkcs8", key);
  const exportedAsString = ab2str(exported);
  const exportedAsBase64 = window.btoa(exportedAsString);
  const pemExported = `-----BEGIN PRIVATE KEY-----\n${exportedAsBase64}\n-----END PRIVATE KEY-----`;

  const exportKeyOutput = document.querySelector(".exported-key");
  exportKeyOutput.textContent = pemExported;
}

/*
Tạo một cặp khóa ký/xác minh,
sau đó thiết lập trình lắng nghe sự kiện trên nút "Export".
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
  .then((keyPair) => {
    const exportButton = document.querySelector(".pkcs8");
    exportButton.addEventListener("click", () => {
      exportCryptoKey(keyPair.privateKey);
    });
  });
```

### Xuất SubjectPublicKeyInfo

Ví dụ này xuất một khóa công khai mã hóa RSA dưới dạng đối tượng SubjectPublicKeyInfo được mã hóa PEM. [Xem mã đầy đủ trên GitHub](https://github.com/mdn/dom-examples/blob/main/web-crypto/export-key/spki.js).

```js
/*
Chuyển đổi một ArrayBuffer thành một chuỗi
từ https://developer.chrome.com/blog/how-to-convert-arraybuffer-to-and-from-string/
*/
function ab2str(buf) {
  return String.fromCharCode.apply(null, new Uint8Array(buf));
}

/*
Xuất khóa đã cho và ghi vào không gian "exported-key".
*/
async function exportCryptoKey(key) {
  const exported = await window.crypto.subtle.exportKey("spki", key);
  const exportedAsString = ab2str(exported);
  const exportedAsBase64 = window.btoa(exportedAsString);
  const pemExported = `-----BEGIN PUBLIC KEY-----\n${exportedAsBase64}\n-----END PUBLIC KEY-----`;

  const exportKeyOutput = document.querySelector(".exported-key");
  exportKeyOutput.textContent = pemExported;
}

/*
Tạo một cặp khóa mã hóa/giải mã,
sau đó thiết lập trình lắng nghe sự kiện trên nút "Export".
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
  .then((keyPair) => {
    const exportButton = document.querySelector(".spki");
    exportButton.addEventListener("click", () => {
      exportCryptoKey(keyPair.publicKey);
    });
  });
```

### Xuất JSON Web Key

Ví dụ này xuất một khóa riêng tư ký ECDSA dưới dạng đối tượng JSON Web Key. [Xem mã đầy đủ trên GitHub](https://github.com/mdn/dom-examples/blob/main/web-crypto/export-key/jwk.js).

```js
/*
Xuất khóa đã cho và ghi vào không gian "exported-key".
*/
async function exportCryptoKey(key) {
  const exported = await window.crypto.subtle.exportKey("jwk", key);
  const exportKeyOutput = document.querySelector(".exported-key");
  exportKeyOutput.textContent = JSON.stringify(exported, null, " ");
}

/*
Tạo một cặp khóa ký/xác minh,
sau đó thiết lập trình lắng nghe sự kiện trên nút "Export".
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
  .then((keyPair) => {
    const exportButton = document.querySelector(".jwk");
    exportButton.addEventListener("click", () => {
      exportCryptoKey(keyPair.privateKey);
    });
  });
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`SubtleCrypto.importKey()`](/en-US/docs/Web/API/SubtleCrypto/importKey)
- [`SubtleCrypto.wrapKey()`](/en-US/docs/Web/API/SubtleCrypto/wrapKey)
- [Định dạng PKCS #8](https://datatracker.ietf.org/doc/html/rfc5208).
- [Định dạng SubjectPublicKeyInfo](https://datatracker.ietf.org/doc/html/rfc5280#section-4.1).
- [Định dạng JSON Web Key](https://datatracker.ietf.org/doc/html/rfc7517).
