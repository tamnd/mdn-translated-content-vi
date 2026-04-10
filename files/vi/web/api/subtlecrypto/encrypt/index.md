---
title: "SubtleCrypto: phương thức encrypt()"
short-title: encrypt()
slug: Web/API/SubtleCrypto/encrypt
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.encrypt
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`encrypt()`** của giao diện {{domxref("SubtleCrypto")}} mã hóa dữ liệu.

Nó nhận làm đối số một {{glossary("key")}} để mã hóa, một số tham số cụ thể cho thuật toán, và dữ liệu cần mã hóa (còn được gọi là "plaintext" - văn bản gốc).
Nó trả về một {{jsxref("Promise")}} sẽ được fulfill với dữ liệu đã mã hóa (còn được gọi là "ciphertext" - văn bản mã hóa).

## Cú pháp

```js-nolint
encrypt(algorithm, key, data)
```

### Tham số

- `algorithm`
  - : Một đối tượng chỉ định [thuật toán](#cac-thuat-toan-duoc-ho-tro) sẽ sử dụng và bất kỳ tham số bổ sung nào nếu cần:
    - Để sử dụng [RSA-OAEP](#rsa-oaep), truyền một đối tượng {{domxref("RsaOaepParams")}}.
    - Để sử dụng [AES-CTR](#aes-ctr), truyền một đối tượng {{domxref("AesCtrParams")}}.
    - Để sử dụng [AES-CBC](#aes-cbc), truyền một đối tượng {{domxref("AesCbcParams")}}.
    - Để sử dụng [AES-GCM](#aes-gcm), truyền một đối tượng {{domxref("AesGcmParams")}}.

- `key`
  - : Một {{domxref("CryptoKey")}} chứa khóa sẽ dùng để mã hóa.
- `data`
  - : Một {{jsxref("ArrayBuffer")}}, một {{jsxref("TypedArray")}}, hoặc một {{jsxref("DataView")}}
    chứa dữ liệu cần mã hóa (còn được gọi là {{glossary("plaintext")}}).

### Giá trị trả về

Một {{jsxref("Promise")}} được fulfill với một {{jsxref("ArrayBuffer")}} chứa "ciphertext".

### Ngoại lệ

Promise bị reject khi gặp các ngoại lệ sau:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném lên khi thao tác được yêu cầu không hợp lệ đối với khóa đã cung cấp (ví dụ: thuật toán mã hóa không hợp lệ, hoặc khóa không hợp lệ cho thuật toán mã hóa đã chỉ định).
- `OperationError` {{domxref("DOMException")}}
  - : Ném lên khi thao tác thất bại vì lý do cụ thể của thao tác (ví dụ: tham số thuật toán có kích thước không hợp lệ, hoặc văn bản gốc AES-GCM dài hơn 2<sup>39</sup>−256 byte).

## Các thuật toán được hỗ trợ

Web Crypto API cung cấp bốn thuật toán hỗ trợ các thao tác `encrypt()` và `decrypt()`.

Một trong số các thuật toán này — RSA-OAEP — là một {{Glossary("public-key cryptography", "hệ mật mã khóa công khai")}}.

Ba thuật toán mã hóa còn lại ở đây đều là {{Glossary("Symmetric-key cryptography", "thuật toán đối xứng")}}, và chúng đều dựa trên cùng một bộ mã cơ bản, AES (Advanced Encryption Standard).
Sự khác biệt giữa chúng là {{Glossary("Block cipher mode of operation", "chế độ")}}.
Web Crypto API hỗ trợ ba chế độ AES khác nhau:

- CTR (Counter Mode - Chế độ bộ đếm)
- CBC (Cipher Block Chaining - Chuỗi khối mã)
- GCM (Galois/Counter Mode - Chế độ Galois/Bộ đếm)

Khuyến nghị sử dụng _mã hóa đã xác thực_, bao gồm các kiểm tra rằng ciphertext không bị thay đổi bởi kẻ tấn công.
Xác thực giúp bảo vệ chống lại các cuộc tấn công _chosen-ciphertext_, trong đó kẻ tấn công có thể yêu cầu hệ thống giải mã các thông báo tùy ý, và sử dụng kết quả để suy ra thông tin về khóa bí mật.
Mặc dù có thể thêm xác thực vào chế độ CTR và CBC, chúng không cung cấp điều này theo mặc định và khi triển khai thủ công, người ta dễ mắc phải những sai sót nhỏ nhưng nghiêm trọng.
GCM cung cấp xác thực tích hợp sẵn, và vì lý do này nó thường được khuyến nghị hơn hai chế độ AES còn lại.

### RSA-OAEP

Hệ thống mã hóa khóa công khai RSA-OAEP được chỉ định trong [RFC 3447](https://datatracker.ietf.org/doc/html/rfc3447).

### AES-CTR

Đây đại diện cho AES ở chế độ Counter, được chỉ định trong [NIST SP800-38A](https://csrc.nist.gov/pubs/sp/800/38/a/final).

AES là một bộ mã khối, có nghĩa là nó chia thông báo thành các khối và mã hóa từng khối một.
Ở chế độ CTR, mỗi lần một khối của thông báo được mã hóa, một khối dữ liệu bổ sung sẽ được trộn vào. Khối dữ liệu bổ sung này được gọi là "counter block" (khối bộ đếm).

Một giá trị counter block nhất định không bao giờ được sử dụng nhiều hơn một lần với cùng một khóa:

- Với một thông báo dài _n_ khối, một counter block khác nhau phải được sử dụng cho mỗi khối.
- Nếu cùng một khóa được sử dụng để mã hóa nhiều hơn một thông báo, một counter block khác nhau phải được sử dụng cho tất cả các khối trên tất cả thông báo.

Thông thường điều này đạt được bằng cách chia giá trị counter block ban đầu thành hai phần nối liền nhau:

- Một {{Glossary("Nonce", "nonce")}} (tức là, một số chỉ được sử dụng một lần). Phần nonce của khối giữ nguyên cho mọi khối trong thông báo. Mỗi khi một thông báo mới được mã hóa, một nonce mới được chọn. Nonce không cần phải bí mật, nhưng chúng không được tái sử dụng với cùng một khóa.
- Một bộ đếm. Phần này của khối được tăng lên mỗi lần một khối được mã hóa.

Về cơ bản: nonce sẽ đảm bảo rằng counter blocks không bị tái sử dụng từ thông báo này sang thông báo khác, trong khi bộ đếm đảm bảo rằng counter blocks không bị tái sử dụng trong cùng một thông báo.

> [!NOTE]
> Xem [Phụ lục B của tiêu chuẩn NIST SP800-38A](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38a.pdf#%5B%7B%22num%22%3A70%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22Fit%22%7D%5D) để biết thêm thông tin.

### AES-CBC

Đây đại diện cho AES ở chế độ Cipher Block Chaining, được chỉ định trong [NIST SP800-38A](https://csrc.nist.gov/pubs/sp/800/38/a/final).

### AES-GCM

Đây đại diện cho AES ở chế độ Galois/Counter, được chỉ định trong [NIST SP800-38D](https://csrc.nist.gov/pubs/sp/800/38/d/final).

Một khác biệt lớn giữa chế độ này và các chế độ khác là GCM là chế độ "đã xác thực", nghĩa là nó bao gồm các kiểm tra rằng ciphertext không bị thay đổi bởi kẻ tấn công.

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/encrypt-decrypt/index.html) trên GitHub.

### RSA-OAEP

Đoạn mã này lấy nội dung của một hộp văn bản, mã hóa nó để mã hóa, và mã hóa nó bằng RSA-OAEP. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/rsa-oaep.js)

```js
function getMessageEncoding() {
  const messageBox = document.querySelector(".rsa-oaep #message");
  let message = messageBox.value;
  let enc = new TextEncoder();
  return enc.encode(message);
}

function encryptMessage(publicKey) {
  let encoded = getMessageEncoding();
  return window.crypto.subtle.encrypt(
    {
      name: "RSA-OAEP",
    },
    publicKey,
    encoded,
  );
}
```

### AES-CTR

Đoạn mã này lấy nội dung của một hộp văn bản, mã hóa nó để mã hóa, và mã hóa nó bằng AES ở chế độ CTR.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/aes-ctr.js)

```js
function getMessageEncoding() {
  const messageBox = document.querySelector(".aes-ctr #message");
  let message = messageBox.value;
  let enc = new TextEncoder();
  return enc.encode(message);
}

function encryptMessage(key) {
  let encoded = getMessageEncoding();
  // counter sẽ cần cho giải mã
  counter = window.crypto.getRandomValues(new Uint8Array(16));
  return window.crypto.subtle.encrypt(
    {
      name: "AES-CTR",
      counter,
      length: 64,
    },
    key,
    encoded,
  );
}
```

### AES-CBC

Đoạn mã này lấy nội dung của một hộp văn bản, mã hóa nó để mã hóa, và mã hóa nó bằng AES ở chế độ CBC.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/aes-cbc.js)

```js
function getMessageEncoding() {
  const messageBox = document.querySelector(".aes-cbc #message");
  let message = messageBox.value;
  let enc = new TextEncoder();
  return enc.encode(message);
}

function encryptMessage(key) {
  let encoded = getMessageEncoding();
  // iv sẽ cần cho giải mã
  iv = window.crypto.getRandomValues(new Uint8Array(16));
  return window.crypto.subtle.encrypt({ name: "AES-CBC", iv }, key, encoded);
}
```

### AES-GCM

Đoạn mã này lấy nội dung của một hộp văn bản, mã hóa nó để mã hóa, và mã hóa nó bằng AES ở chế độ GCM.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/aes-gcm.js)

```js
function getMessageEncoding() {
  const messageBox = document.querySelector(".aes-gcm #message");
  const message = messageBox.value;
  const enc = new TextEncoder();
  return enc.encode(message);
}

function encryptMessage(key) {
  const encoded = getMessageEncoding();
  // iv sẽ cần cho giải mã
  const iv = window.crypto.getRandomValues(new Uint8Array(12));
  return window.crypto.subtle.encrypt({ name: "AES-GCM", iv }, key, encoded);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SubtleCrypto.decrypt()")}}.
- [RFC 3447](https://datatracker.ietf.org/doc/html/rfc3447) chỉ định RSAOAEP.
- [NIST SP800-38A](https://csrc.nist.gov/pubs/sp/800/38/a/final) chỉ định chế độ CTR.
- [NIST SP800-38A](https://csrc.nist.gov/pubs/sp/800/38/a/final) chỉ định chế độ CBC.
- [NIST SP800-38D](https://csrc.nist.gov/pubs/sp/800/38/d/final) chỉ định chế độ GCM.
