---
title: "SubtleCrypto: phương thức sign()"
short-title: sign()
slug: Web/API/SubtleCrypto/sign
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.sign
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`sign()`** của giao diện {{domxref("SubtleCrypto")}} tạo một {{glossary("signature")}} số.

Nó nhận làm đối số một {{glossary("key")}} để ký, một số tham số cụ thể cho thuật toán, và dữ liệu cần ký. Nó trả về một {{jsxref("Promise")}} sẽ được fulfill với chữ ký.

Bạn có thể sử dụng phương thức {{domxref("SubtleCrypto.verify()")}} tương ứng để xác minh chữ ký.

## Cú pháp

```js-nolint
sign(algorithm, key, data)
```

### Tham số

- `algorithm`
  - : Một chuỗi hoặc đối tượng chỉ định thuật toán chữ ký sẽ sử dụng và các tham số của nó:
    - Để sử dụng [RSASSA-PKCS1-v1_5](#rsassa-pkcs1-v1_5), truyền chuỗi `RSASSA-PKCS1-v1_5` hoặc một đối tượng có dạng `{ name: "RSASSA-PKCS1-v1_5" }`.
    - Để sử dụng [RSA-PSS](#rsa-pss), truyền một đối tượng {{domxref("RsaPssParams")}}.
    - Để sử dụng [ECDSA](#ecdsa), truyền một đối tượng {{domxref("EcdsaParams")}}.
    - Để sử dụng [HMAC](#hmac), truyền chuỗi `HMAC` hoặc một đối tượng có dạng `{ name: "HMAC" }`.
    - Để sử dụng [Ed25519](#ed25519), truyền chuỗi `Ed25519` hoặc một đối tượng có dạng `{ name: "Ed25519" }`.
- `key`
  - : Một đối tượng {{domxref("CryptoKey")}} chứa khóa sẽ dùng để ký.
    Nếu `algorithm` xác định một hệ mật mã khóa công khai, đây là khóa riêng tư.
- `data`
  - : Một đối tượng {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} chứa dữ liệu cần ký.

### Giá trị trả về

Một {{jsxref("Promise")}} được fulfill với một {{jsxref("ArrayBuffer")}} chứa chữ ký.

### Ngoại lệ

Promise bị reject khi gặp ngoại lệ sau:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném lên khi khóa ký không phải là khóa cho thuật toán ký được yêu cầu hoặc khi cố sử dụng một thuật toán không xác định hoặc không phù hợp để ký.

## Các thuật toán được hỗ trợ

Web Crypto API cung cấp các thuật toán sau có thể được sử dụng để ký và xác minh chữ ký.

RSASSA-PKCS1-v1_5, RSA-PSS, ECDSA và Ed25519 là {{Glossary("public-key cryptography", "các hệ mật mã khóa công khai")}} sử dụng khóa riêng tư để ký và khóa công khai để xác minh.
Tất cả các hệ thống này đều sử dụng [thuật toán digest](/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms) để hash thông báo thành một giá trị cố định ngắn trước khi ký.

- Đối với RSASSA-PKCS1-v1_5 và RSA-PSS, lựa chọn thuật toán digest được truyền vào các hàm {{domxref("SubtleCrypto.generateKey()", "generateKey()")}} hoặc {{domxref("SubtleCrypto.importKey()", "importKey()")}}.
- Đối với ECDSA, lựa chọn thuật toán digest được bao gồm trong tham số `algorithm` truyền vào hàm `sign()`.
- Đối với Ed25519, thuật toán digest luôn là SHA-512.

Thuật toán HMAC khác với các thuật toán còn lại ở chỗ nó không phải là hệ mật mã khóa công khai: nó sử dụng cùng thuật toán và khóa để ký và xác minh.
Điều này có nghĩa là khóa xác minh phải được giữ bí mật, do đó thuật toán này không phù hợp cho nhiều trường hợp sử dụng chữ ký.
Tuy nhiên, nó có thể là lựa chọn tốt khi người ký và người xác minh là cùng một thực thể.

### RSASSA-PKCS1-v1_5

Thuật toán RSASSA-PKCS1-v1_5 được chỉ định trong [RFC 3447](https://datatracker.ietf.org/doc/html/rfc3447).

### RSA-PSS

Thuật toán RSA-PSS được chỉ định trong [RFC 3447](https://datatracker.ietf.org/doc/html/rfc3447).

Nó khác với RSASSA-PKCS1-v1_5 ở chỗ nó kết hợp một salt ngẫu nhiên trong thao tác ký, vì vậy cùng một thông báo được ký với cùng một khóa sẽ không cho ra cùng chữ ký mỗi lần. Một thuộc tính bổ sung, xác định độ dài salt, được truyền vào các hàm `sign()` và {{domxref("SubtleCrypto.verify()", "verify()")}} khi chúng được gọi.

### ECDSA

ECDSA (Elliptic Curve Digital Signature Algorithm - Thuật toán chữ ký số đường cong elliptic) là một biến thể của Thuật toán chữ ký số, được chỉ định trong [FIPS-186](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-4.pdf), sử dụng Mật mã đường cong Elliptic ([RFC 6090](https://datatracker.ietf.org/doc/html/rfc6090)).

Chữ ký được mã hóa dưới dạng các giá trị `s1` và `s2` được chỉ định trong RFC 6090 (tương ứng được gọi là `r` và `s` trong [RFC 4754](https://datatracker.ietf.org/doc/html/rfc4754#section-3)), mỗi giá trị trong mảng byte big-endian, với độ dài là kích thước bit của đường cong được làm tròn lên thành số nguyên byte.
Các giá trị này được nối liền nhau theo thứ tự này.

Cách mã hóa này cũng đã được đề xuất bởi tiêu chuẩn [IEEE 1363-2000](https://standards.ieee.org/ieee/1363/2049/), và đôi khi được gọi là định dạng IEEE P1363. Nó khác với cấu trúc chữ ký [X.509](https://www.itu.int/rec/T-REC-X.509), vốn là định dạng mặc định được tạo ra bởi một số công cụ và thư viện như [OpenSSL](https://www.openssl.org/).

### Ed25519

Ed25519 là một thuật toán chữ ký số được xây dựng trên đường cong elliptic [Curve25519](https://en.wikipedia.org/wiki/Curve25519), là một phần của họ thuật toán EdDSA (Edwards-Curve Digital Signature Algorithm) được định nghĩa trong {{rfc("8032")}}.

### HMAC

Thuật toán HMAC tính toán và xác minh các mã xác thực thông báo dựa trên hash theo [tiêu chuẩn FIPS 198-1 (PDF)](https://csrc.nist.gov/files/pubs/fips/198-1/final/docs/fips-198-1_final.pdf).

Thuật toán digest sẽ sử dụng được chỉ định trong đối tượng [`HmacKeyGenParams`](/en-US/docs/Web/API/HmacKeyGenParams) mà bạn truyền vào {{domxref("SubtleCrypto.generateKey()", "generateKey()")}}, hoặc trong đối tượng [`HmacImportParams`](/en-US/docs/Web/API/HmacImportParams) mà bạn truyền vào {{domxref("SubtleCrypto.importKey()", "importKey()")}}.

Thuật toán HMAC sử dụng cùng thuật toán và khóa để ký và xác minh: điều này có nghĩa là khóa xác minh phải được giữ bí mật, do đó thuật toán này không phù hợp cho nhiều trường hợp sử dụng chữ ký.
Tuy nhiên, nó có thể là lựa chọn tốt khi người ký và người xác minh là cùng một thực thể.

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/sign-verify/index.html) trên GitHub.

### RSASSA-PKCS1-v1_5

Đoạn mã này lấy nội dung của một hộp văn bản, mã hóa nó để ký, và ký nó bằng khóa riêng tư.
[Xem mã nguồn đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/rsassa-pkcs1.js)

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

let encoded = getMessageEncoding();
let signature = await window.crypto.subtle.sign(
  "RSASSA-PKCS1-v1_5",
  privateKey,
  encoded,
);
```

### RSA-PSS

Đoạn mã này lấy nội dung của một hộp văn bản, mã hóa nó để ký, và ký nó bằng khóa riêng tư.
[Xem mã nguồn đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/rsa-pss.js)

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

let encoded = getMessageEncoding();
let signature = await window.crypto.subtle.sign(
  {
    name: "RSA-PSS",
    saltLength: 32,
  },
  privateKey,
  encoded,
);
```

### ECDSA

Đoạn mã này lấy nội dung của một hộp văn bản, mã hóa nó để ký, và ký nó bằng khóa riêng tư.
[Xem mã nguồn đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/ecdsa.js)

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

let encoded = getMessageEncoding();
let signature = await window.crypto.subtle.sign(
  {
    name: "ECDSA",
    hash: { name: "SHA-384" },
  },
  privateKey,
  encoded,
);
```

### HMAC

Đoạn mã này lấy nội dung của một hộp văn bản, mã hóa nó để ký, và ký nó bằng khóa bí mật.
[Xem mã nguồn đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/hmac.js)

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

let encoded = getMessageEncoding();
let signature = await window.crypto.subtle.sign("HMAC", key, encoded);
```

### Ed25519 (tạo cặp khóa, ký và xác minh)

Đoạn mã này tạo cặp khóa ký Ed25519, sử dụng khóa riêng tư để ký nội dung (đã mã hóa) của một [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input/text) văn bản, sau đó xác minh chữ ký bằng khóa công khai.
Nó được dẫn xuất từ [mã nguồn này trên GitHub](https://github.com/mdn/dom-examples/blob/main/web-crypto/sign-verify/ed25519.js), mà bạn có thể [chạy trực tiếp tại đây](https://mdn.github.io/dom-examples/web-crypto/sign-verify/).

#### HTML

HTML định nghĩa một phần tử `<input>` chứa văn bản cần ký, và một nút bắt đầu thao tác tạo khóa, ký văn bản rồi xác minh chữ ký.

```html
<label for="message">Nhập thông báo cần ký:</label>
<input
  type="text"
  id="message"
  name="message"
  size="25"
  value="The lion roars near dawn" />

<input id="sign-button" type="button" value="Run" />
```

```html hidden
<pre id="log">Click "Run" button</pre>
```

```css hidden
#log {
  height: 120px;
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

JavaScript đầu tiên lấy các phần tử {{HTMLElement("input")}} `#sign-button` và `#message`, sau đó thêm trình lắng nghe cho sự kiện `click` trên nút.
Trình xử lý sự kiện xóa log và chạy các thao tác khác truyền nội dung của phần tử `<input>`.

```js
const button = document.querySelector("#sign-button");
const input = document.querySelector("#message");

button.addEventListener("click", () => {
  // Clear log
  logElement.innerText = "";
  logElement.scrollTop = logElement.scrollHeight;
  // Run test
  test(input.value);
});
```

Đầu tiên nó tạo khóa bằng thuật toán Ed25519, sau đó mã hóa văn bản và ký văn bản đó bằng khóa riêng tư.
Cuối cùng nó gọi {{domxref("SubtleCrypto.verify()")}} với khóa công khai để xác minh chữ ký.

```js
async function test(data) {
  log(`Message: ${data}`);
  try {
    // Generate keys
    const { publicKey, privateKey } = await crypto.subtle.generateKey(
      {
        name: "Ed25519",
      },
      true,
      ["sign", "verify"],
    );

    log(`publicKey: ${publicKey}, type: ${publicKey.type}`);
    log(`privateKey: ${privateKey},  type: ${privateKey.type}`);

    // Encode data prior to signing
    const encoder = new TextEncoder();
    encodedData = encoder.encode(data);

    // Log the first part of the encoded data
    const shorterEncodedBuffer = new Uint8Array(encodedData.buffer, 0, 14);
    log(
      `encodedData: ${shorterEncodedBuffer}...[${encodedData.byteLength} bytes total]`,
    );
    // log(`encodedData: ${encodedData}`);

    // Sign the data using the private key.
    const signature = await crypto.subtle.sign(
      {
        name: "Ed25519",
      },
      privateKey,
      encodedData,
    );

    // Log the first part of the signature data
    const signatureBuffer = new Uint8Array(signature, 0, 14);
    log(
      `signature: ${signatureBuffer}...[${signature.byteLength} bytes total]`,
    );

    // Verify the signature using the public key
    const verifyResult = await crypto.subtle.verify(
      {
        name: "Ed25519",
      },
      publicKey,
      signature,
      encodedData,
    );

    // Log result - true if the text was signed with the corresponding public key.
    log(`signature verified?: ${verifyResult}`);
  } catch (error) {
    log(error);
  }
}
```

#### Kết quả

{{EmbedLiveSample("Ed25519_key_generation_signing_and_verification", "100", "200px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SubtleCrypto.verify()")}}.
- [RFC 3447](https://datatracker.ietf.org/doc/html/rfc3447) chỉ định RSASSA-PKCS1-v1_5.
- [RFC 3447](https://datatracker.ietf.org/doc/html/rfc3447) chỉ định RSA-PSS.
- [FIPS-186](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-4.pdf) chỉ định ECDSA.
- [FIPS 198-1](https://csrc.nist.gov/files/pubs/fips/198-1/final/docs/fips-198-1_final.pdf) chỉ định HMAC.
