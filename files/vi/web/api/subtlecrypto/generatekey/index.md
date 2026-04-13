---
title: "SubtleCrypto: phương thức generateKey()"
short-title: generateKey()
slug: Web/API/SubtleCrypto/generateKey
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.generateKey
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`generateKey()`** của giao diện {{domxref("SubtleCrypto")}} được sử dụng để tạo một khóa mới (cho thuật toán đối xứng) hoặc cặp khóa (cho thuật toán khóa công khai).

## Cú pháp

```js-nolint
generateKey(algorithm, extractable, keyUsages)
```

### Tham số

- `algorithm`
  - : Một đối tượng xác định loại khóa cần tạo và cung cấp các tham số bổ sung cụ thể cho thuật toán.
    - Đối với [RSASSA-PKCS1-v1_5](/en-US/docs/Web/API/SubtleCrypto/sign#rsassa-pkcs1-v1_5), [RSA-PSS](/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss),
      hoặc [RSA-OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep):
      truyền một đối tượng [`RsaHashedKeyGenParams`](/en-US/docs/Web/API/RsaHashedKeyGenParams).
    - Đối với [ECDSA](/en-US/docs/Web/API/SubtleCrypto/sign#ecdsa) hoặc [ECDH](/en-US/docs/Web/API/SubtleCrypto/deriveKey#ecdh):
      truyền một đối tượng [`EcKeyGenParams`](/en-US/docs/Web/API/EcKeyGenParams).
    - Đối với [HMAC](/en-US/docs/Web/API/SubtleCrypto/sign#hmac): truyền một đối tượng [`HmacKeyGenParams`](/en-US/docs/Web/API/HmacKeyGenParams).
    - Đối với [AES-CTR](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr), [AES-CBC](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc),
      [AES-GCM](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm), hoặc [AES-KW](/en-US/docs/Web/API/SubtleCrypto/wrapKey#aes-kw):
      truyền một đối tượng [`AesKeyGenParams`](/en-US/docs/Web/API/AesKeyGenParams).
    - Đối với [Ed25519](/en-US/docs/Web/API/SubtleCrypto/sign#ed25519): truyền chuỗi `Ed25519` hoặc một đối tượng có dạng `{ name: "Ed25519" }`.
    - Đối với [X25519](/en-US/docs/Web/API/SubtleCrypto/deriveKey#x25519): truyền chuỗi `X25519` hoặc một đối tượng có dạng `{ name: "X25519" }`.

- `extractable`
  - : Một giá trị boolean cho biết liệu có thể xuất khóa bằng {{domxref("SubtleCrypto.exportKey()")}} hoặc {{domxref("SubtleCrypto.wrapKey()")}} hay không.
    Lưu ý khi tạo cặp khóa bất đối xứng (chẳng hạn như RSA hoặc ECDSA), tham số `extractable` xác định liệu khóa riêng tư có thể xuất được hay không; khóa công khai luôn có thể xuất được.
- `keyUsages`
  - : Một {{jsxref("Array")}} các chuỗi cho biết những gì có thể thực hiện với khóa mới được tạo.
    Các giá trị có thể cho các phần tử mảng là:
    - `encrypt`
      - : Khóa có thể được sử dụng để {{domxref("SubtleCrypto.encrypt()", "mã hóa", "", "nocode")}} thông báo.
    - `decrypt`
      - : Khóa có thể được sử dụng để {{domxref("SubtleCrypto.decrypt()", "giải mã", "", "nocode")}} thông báo.
    - `sign`
      - : Khóa có thể được sử dụng để {{domxref("SubtleCrypto.sign()", "ký", "", "nocode")}} thông báo.
    - `verify`
      - : Khóa có thể được sử dụng để {{domxref("SubtleCrypto.verify()", "xác minh", "", "nocode")}} chữ ký.
    - `deriveKey`
      - : Khóa có thể được sử dụng trong {{domxref("SubtleCrypto.deriveKey()", "phái sinh khóa mới", "", "nocode")}}.
    - `deriveBits`
      - : Khóa có thể được sử dụng trong {{domxref("SubtleCrypto.deriveBits()", "phái sinh bit", "", "nocode")}}.
    - `wrapKey`
      - : Khóa có thể được sử dụng để {{domxref("SubtleCrypto.wrapKey()", "bọc khóa", "", "nocode")}}.
    - `unwrapKey`
      - : Khóa có thể được sử dụng để {{domxref("SubtleCrypto.unwrapKey()", "mở bọc khóa", "", "nocode")}}.

### Giá trị trả về

Một {{jsxref("Promise")}} được fulfill với một {{domxref("CryptoKey")}} (cho thuật toán đối xứng) hoặc một {{domxref("CryptoKeyPair")}} (cho thuật toán khóa công khai).

### Ngoại lệ

Promise bị reject khi gặp ngoại lệ sau:

- `SyntaxError` {{domxref("DOMException")}}
  - : Ném lên khi kết quả là một {{domxref("CryptoKey")}} loại `secret` hoặc `private` nhưng `keyUsages` trống, hoặc không hợp lệ cho loại thuật toán.
- `SyntaxError` {{domxref("DOMException")}}
  - : Ném lên khi kết quả là một {{domxref("CryptoKeyPair")}} và thuộc tính `privateKey.usages` của nó trống, hoặc không hợp lệ cho loại thuật toán.

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/encrypt-decrypt/index.html) trên GitHub.

### Tạo cặp khóa RSA

Đoạn mã này tạo một cặp khóa mã hóa RSA-OAEP.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/rsa-oaep.js)

```js
let keyPair = await window.crypto.subtle.generateKey(
  {
    name: "RSA-OAEP",
    modulusLength: 4096,
    publicExponent: new Uint8Array([1, 0, 1]),
    hash: "SHA-256",
  },
  true,
  ["encrypt", "decrypt"],
);
```

### Tạo cặp khóa đường cong elliptic

Đoạn mã này tạo một cặp khóa ký ECDSA.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/ecdsa.js)

```js
let keyPair = await window.crypto.subtle.generateKey(
  {
    name: "ECDSA",
    namedCurve: "P-384",
  },
  true,
  ["sign", "verify"],
);
```

### Tạo khóa HMAC

Đoạn mã này tạo một khóa ký HMAC.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/hmac.js)

```js
let key = await window.crypto.subtle.generateKey(
  {
    name: "HMAC",
    hash: { name: "SHA-512" },
  },
  true,
  ["sign", "verify"],
);
```

### Tạo khóa AES

Đoạn mã này tạo một khóa mã hóa AES-GCM.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/aes-gcm.js)

```js
let key = await window.crypto.subtle.generateKey(
  {
    name: "AES-GCM",
    length: 256,
  },
  true,
  ["encrypt", "decrypt"],
);
```

### Tạo khóa Ed25519

Đoạn mã này tạo một cặp khóa ký Ed25519.
Nó được dẫn xuất từ [mã nguồn này trên GitHub](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/ed25519.js), mà bạn có thể [chạy trực tiếp tại đây](https://mdn.github.io/dom-examples/web-crypto/sign-verify/).

```html hidden
<input id="run-button" type="button" value="Run" />
<pre id="log">Click "Run" button</pre>
```

```css hidden
#log {
  height: 170px;
  white-space: pre-wrap; /* wrap pre blocks */
  overflow-wrap: break-word; /* break on words */
  overflow-y: auto;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

Mã tạo cặp khóa bằng thuật toán `Ed25519` và ghi log thông tin trong mỗi khóa được hiển thị bên dưới.
Lưu ý rằng mã được chạy trong khối `try..catch` vì không phải tất cả trình duyệt đều hỗ trợ thuật toán này.

JavaScript đầu tiên lấy các phần tử {{HTMLElement("input")}} `#sign-button` và `#message`, sau đó thêm trình lắng nghe cho sự kiện `click` trên nút.
Trình xử lý sự kiện xóa log và chạy các thao tác khác truyền nội dung của phần tử `<input>`.

```js
const button = document.querySelector("#run-button");
const input = document.querySelector("#log");

button.addEventListener("click", () => {
  // Clear log
  logElement.innerText = "";
  logElement.scrollTop = logElement.scrollHeight;
  // Run test
  test();
});

async function test() {
  try {
    // Create a key pair and use destructuring assignment to assign to variables
    const { publicKey, privateKey } = await crypto.subtle.generateKey(
      {
        name: "Ed25519",
      },
      true,
      ["sign", "verify"],
    );

    // Log the properties of the keys
    log(`publicKey: ${publicKey}`);
    log(` type: ${publicKey.type}`);
    log(` extractable: ${publicKey.extractable}`);
    log(` algorithm: ${JSON.stringify(publicKey.algorithm)}`);
    log(` usages: ${publicKey.usages}`);
    log(`privateKey: ${privateKey}`);
    log(` type: ${privateKey.type}`);
    log(` extractable: ${privateKey.extractable}`);
    log(` algorithm: ${JSON.stringify(privateKey.algorithm)}`);
    log(` usages: ${privateKey.usages}`);
  } catch (error) {
    log(error);
  }
}
```

#### Kết quả

Thông tin về các khóa được tạo được ghi log bên dưới (hoặc một chuỗi lỗi nếu trình duyệt không cho phép tạo khóa).

{{EmbedLiveSample("Ed25519", "100%", "240px")}}

### Tạo khóa X25519

Đoạn mã này tạo một cặp khóa công khai và khóa riêng tư X25519 có thể sử dụng trong {{domxref("SubtleCrypto.deriveKey()")}} để tạo khóa chia sẻ, hoặc trong {{domxref("SubtleCrypto.deriveBits()")}} để tạo bí mật chia sẻ.

```html hidden
<input id="run-button" type="button" value="Run" />
<pre id="log">Click "Run" button</pre>
```

```css hidden
#log {
  height: 170px;
  white-space: pre-wrap; /* wrap pre blocks */
  overflow-wrap: break-word; /* break on words */
  overflow-y: auto;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

Mã tạo cặp khóa bằng thuật toán `X25519` và ghi log thông tin trong mỗi khóa được hiển thị bên dưới.
Lưu ý rằng mã được chạy trong khối `try..catch` vì không phải tất cả trình duyệt đều hỗ trợ thuật toán này.

JavaScript đầu tiên lấy các phần tử {{HTMLElement("input")}} `#run-button` và `#log`, sau đó thêm trình lắng nghe cho sự kiện `click` trên nút.
Trình xử lý sự kiện xóa log, tạo cặp khóa X25519, và ghi log một số thuộc tính của nó.

```js
const button = document.querySelector("#run-button");
const input = document.querySelector("#log");

button.addEventListener("click", () => {
  // Clear log
  logElement.innerText = "";
  logElement.scrollTop = logElement.scrollHeight;
  // Run test
  test();
});

async function test() {
  try {
    // Create a key pair and use destructuring assignment to assign to variables
    const { publicKey, privateKey } = await crypto.subtle.generateKey(
      {
        name: "X25519",
      },
      true,
      ["deriveKey", "deriveBits"],
    );

    // Log the properties of the keys
    log(`publicKey: ${publicKey}`);
    log(` type: ${publicKey.type}`);
    log(` extractable: ${publicKey.extractable}`);
    log(` algorithm: ${JSON.stringify(publicKey.algorithm)}`);
    log(` usages: ${publicKey.usages}`);
    log(`privateKey: ${privateKey}`);
    log(` type: ${privateKey.type}`);
    log(` extractable: ${privateKey.extractable}`);
    log(` algorithm: ${JSON.stringify(privateKey.algorithm)}`);
    log(` usages: ${privateKey.usages}`);
  } catch (error) {
    log(error);
  }
}
```

#### Kết quả

Thông tin về các khóa được tạo được ghi log bên dưới (hoặc một chuỗi lỗi nếu trình duyệt không cho phép tạo khóa).

{{EmbedLiveSample("X25519", "100%", "240px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Khuyến nghị độ dài khóa mật mã](https://www.keylength.com/).
- [Hướng dẫn chuyển đổi sử dụng thuật toán và độ dài khóa mật mã của NIST](https://csrc.nist.gov/pubs/sp/800/131/a/r2/final).
