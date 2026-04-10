---
title: "SubtleCrypto: phương thức digest()"
short-title: digest()
slug: Web/API/SubtleCrypto/digest
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.digest
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`digest()`** của giao diện {{domxref("SubtleCrypto")}} tạo một _digest_ từ dữ liệu đã cho, sử dụng {{glossary("hash function")}} được chỉ định.
Digest là một giá trị có độ dài cố định ngắn được dẫn xuất từ một đầu vào có độ dài thay đổi.
Digest mật mã nên thể hiện khả năng chống va chạm, có nghĩa là khó có thể tìm ra hai đầu vào khác nhau có cùng giá trị digest.

Nó nhận làm đối số một định danh cho thuật toán digest sẽ sử dụng và dữ liệu cần digest.
Nó trả về một {{jsxref("Promise")}} sẽ được fulfill với digest.

Lưu ý rằng API này không hỗ trợ đầu vào dạng streaming: bạn phải đọc toàn bộ đầu vào vào bộ nhớ trước khi truyền nó vào hàm digest.

## Cú pháp

```js-nolint
digest(algorithm, data)
```

### Tham số

- `algorithm`
  - : Đây có thể là một chuỗi hoặc một đối tượng với một thuộc tính duy nhất `name` là một chuỗi. Chuỗi đặt tên hàm hash sẽ sử dụng. Các giá trị được hỗ trợ là:
    - `"SHA-1"` (nhưng đừng sử dụng trong các ứng dụng mật mã)
    - `"SHA-256"`
    - `"SHA-384"`
    - `"SHA-512"`.
- `data`
  - : Một đối tượng {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} chứa dữ liệu cần digest.

### Giá trị trả về

Một {{jsxref("Promise")}} được fulfill với một {{jsxref("ArrayBuffer")}} chứa digest.

## Các thuật toán được hỗ trợ

Các thuật toán digest, còn được gọi là {{glossary("Hash function", "hàm hash")}}, biến đổi một khối dữ liệu có kích thước tùy ý thành đầu ra có kích thước cố định, thường ngắn hơn nhiều so với đầu vào.
Chúng có nhiều ứng dụng trong mật mã.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="col">Thuật toán</th>
      <th scope="col">Độ dài đầu ra (bit)</th>
      <th scope="col">Kích thước khối (bit)</th>
      <th scope="col">Đặc tả kỹ thuật</th>
    </tr>
    <tr>
      <th scope="row">SHA-1</th>
      <td>160</td>
      <td>512</td>
      <td>
        <a href="https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf"
          >FIPS 180-4</a
        >, mục 6.1
      </td>
    </tr>
    <tr>
      <th scope="row">SHA-256</th>
      <td>256</td>
      <td>512</td>
      <td>
        <a href="https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf"
          >FIPS 180-4</a
        >, mục 6.2
      </td>
    </tr>
    <tr>
      <th scope="row">SHA-384</th>
      <td>384</td>
      <td>1024</td>
      <td>
        <a href="https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf"
          >FIPS 180-4</a
        >, mục 6.5
      </td>
    </tr>
    <tr>
      <th scope="row">SHA-512</th>
      <td>512</td>
      <td>1024</td>
      <td>
        <a href="https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf"
          >FIPS 180-4</a
        >, mục 6.4
      </td>
    </tr>
  </tbody>
</table>

> [!WARNING]
> SHA-1 hiện được coi là dễ bị tấn công và không nên sử dụng cho các ứng dụng mật mã.

> [!NOTE]
> Nếu bạn đang tìm cách tạo mã xác thực thông báo dựa trên hash ([HMAC](/en-US/docs/Glossary/HMAC)), bạn cần sử dụng [SubtleCrypto.sign()](/en-US/docs/Web/API/SubtleCrypto/sign#hmac) thay thế.

## Ví dụ

Để biết thêm ví dụ về cách sử dụng API `digest()`, xem [Các công dụng phi mật mã của SubtleCrypto](/en-US/docs/Web/API/Web_Crypto_API/Non-cryptographic_uses_of_subtle_crypto).

### Ví dụ cơ bản

Ví dụ này mã hóa một thông báo, sau đó tính digest SHA-256 của nó và ghi log độ dài digest:

```js
const text =
  "An obscure body in the S-K System, your majesty. The inhabitants refer to it as the planet Earth.";

async function digestMessage(message) {
  const encoder = new TextEncoder();
  const data = encoder.encode(message);
  const hash = await window.crypto.subtle.digest("SHA-256", data);
  return hash;
}

digestMessage(text).then((digestBuffer) =>
  console.log(digestBuffer.byteLength),
);
```

### Chuyển đổi digest thành chuỗi hex

Digest được trả về dưới dạng `ArrayBuffer`, nhưng để so sánh và hiển thị, digest thường được biểu diễn dưới dạng chuỗi hex.
Ví dụ này tính một digest, sau đó chuyển `ArrayBuffer` thành chuỗi hex:

```js
const text =
  "An obscure body in the S-K System, your majesty. The inhabitants refer to it as the planet Earth.";

async function digestMessage(message) {
  const msgUint8 = new TextEncoder().encode(message); // encode as (utf-8) Uint8Array
  const hashBuffer = await window.crypto.subtle.digest("SHA-256", msgUint8); // hash the message
  const hashHex = new Uint8Array(hashBuffer).toHex(); // Convert ArrayBuffer to hex string.
  return hashHex;
}

digestMessage(text).then((digestHex) => console.log(digestHex));
```

Ví dụ trên sử dụng {{jsxref("Uint8Array.toHex()")}}, đã có sẵn từ năm 2025.
Để hỗ trợ các trình duyệt cũ hơn, có thể sử dụng phương án thay thế sau:

```js
const text =
  "An obscure body in the S-K System, your majesty. The inhabitants refer to it as the planet Earth.";

async function digestMessage(message) {
  const msgUint8 = new TextEncoder().encode(message); // encode as (utf-8) Uint8Array
  const hashBuffer = await window.crypto.subtle.digest("SHA-256", msgUint8); // hash the message
  if (Uint8Array.prototype.toHex) {
    // Use toHex if supported.
    return new Uint8Array(hashBuffer).toHex(); // Convert ArrayBuffer to hex string.
  }
  // If toHex() is not supported, fall back to an alternative implementation.
  const hashArray = Array.from(new Uint8Array(hashBuffer)); // convert buffer to byte array
  const hashHex = hashArray
    .map((b) => b.toString(16).padStart(2, "0"))
    .join(""); // convert bytes to hex string
  return hashHex;
}

digestMessage(text).then((digestHex) => console.log(digestHex));
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các công dụng phi mật mã của SubtleCrypto](/en-US/docs/Web/API/Web_Crypto_API/Non-cryptographic_uses_of_subtle_crypto)
- [Đặc tả kỹ thuật secure origins của Chromium](https://www.chromium.org/Home/chromium-security/prefer-secure-origins-for-powerful-new-features/)
- [FIPS 180-4](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf) chỉ định họ thuật toán digest SHA.
- {{jsxref("Uint8Array.toHex()")}}
