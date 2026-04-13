---
title: "SubtleCrypto: phương thức deriveKey()"
short-title: deriveKey()
slug: Web/API/SubtleCrypto/deriveKey
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.deriveKey
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`deriveKey()`** của giao diện {{domxref("SubtleCrypto")}} có thể được sử dụng để phái sinh một khóa bí mật từ một khóa chính.

Nó nhận làm đối số một số tài liệu khóa ban đầu, thuật toán phái sinh sẽ sử dụng, và các thuộc tính mong muốn cho khóa cần phái sinh.
Nó trả về một [`Promise`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) sẽ được fulfill với đối tượng {{domxref("CryptoKey")}} đại diện cho khóa mới.

Đáng lưu ý là các thuật toán phái sinh khóa được hỗ trợ có các đặc điểm khá khác nhau và phù hợp trong các tình huống khá khác nhau.
Xem [Các thuật toán được hỗ trợ](#cac-thuat-toan-duoc-ho-tro) để biết thêm chi tiết về vấn đề này.

## Cú pháp

```js-nolint
deriveKey(algorithm, baseKey, derivedKeyType, extractable, keyUsages)
```

### Tham số

- `algorithm`
  - : Một đối tượng xác định [thuật toán phái sinh](#cac-thuat-toan-duoc-ho-tro) sẽ sử dụng.
    - Để sử dụng [ECDH](#ecdh), truyền một đối tượng [`EcdhKeyDeriveParams`](/en-US/docs/Web/API/EcdhKeyDeriveParams), chỉ định chuỗi `ECDH` làm thuộc tính `name`.
    - Để sử dụng [HKDF](#hkdf), truyền một đối tượng [`HkdfParams`](/en-US/docs/Web/API/HkdfParams).
    - Để sử dụng [PBKDF2](#pbkdf2), truyền một đối tượng [`Pbkdf2Params`](/en-US/docs/Web/API/Pbkdf2Params).
    - Để sử dụng [X25519](#x25519), truyền một đối tượng [`EcdhKeyDeriveParams`](/en-US/docs/Web/API/EcdhKeyDeriveParams), chỉ định chuỗi `X25519` làm thuộc tính `name`.
- `baseKey`
  - : Một {{domxref("CryptoKey")}} đại diện cho đầu vào của thuật toán phái sinh.
    Nếu `algorithm` là ECDH hoặc X25519, thì đây sẽ là khóa riêng tư ECDH hoặc X25519.
    Nếu không, nó sẽ là tài liệu khóa ban đầu cho hàm phái sinh: ví dụ, đối với PBKDF2 nó có thể là mật khẩu, được nhập dưới dạng `CryptoKey` bằng [`SubtleCrypto.importKey()`](/en-US/docs/Web/API/SubtleCrypto/importKey).
- `derivedKeyType`
  - : Một đối tượng xác định thuật toán mà khóa phái sinh sẽ được sử dụng:
    - Đối với [HMAC](/en-US/docs/Web/API/SubtleCrypto/sign#hmac) truyền một đối tượng [`HmacImportParams`](/en-US/docs/Web/API/HmacImportParams).
    - Đối với [AES-CTR](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr), [AES-CBC](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc), [AES-GCM](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm), hoặc [AES-KW](/en-US/docs/Web/API/SubtleCrypto/wrapKey#aes-kw), truyền một đối tượng [`AesDerivedKeyParams`](/en-US/docs/Web/API/AesDerivedKeyParams).
- `extractable`
  - : Một giá trị boolean cho biết liệu có thể xuất khóa bằng {{domxref("SubtleCrypto.exportKey()")}} hoặc {{domxref("SubtleCrypto.wrapKey()")}} hay không.
- `keyUsages`
  - : Một {{jsxref("Array")}} cho biết những gì có thể thực hiện với khóa phái sinh.
    Lưu ý rằng các cách sử dụng khóa phải được cho phép bởi thuật toán được đặt trong `derivedKeyAlgorithm`.
    Các giá trị có thể của mảng là:
    - `encrypt`: Khóa có thể được sử dụng để [mã hóa](/en-US/docs/Web/API/SubtleCrypto/encrypt) thông báo.
    - `decrypt`: Khóa có thể được sử dụng để [giải mã](/en-US/docs/Web/API/SubtleCrypto/decrypt) thông báo.
    - `sign`: Khóa có thể được sử dụng để [ký](/en-US/docs/Web/API/SubtleCrypto/sign) thông báo.
    - `verify`: Khóa có thể được sử dụng để [xác minh](/en-US/docs/Web/API/SubtleCrypto/verify) chữ ký.
    - `deriveKey`: Khóa có thể được sử dụng trong phái sinh khóa mới.
    - `deriveBits`: Khóa có thể được sử dụng trong [phái sinh bit](/en-US/docs/Web/API/SubtleCrypto/deriveBits).
    - `wrapKey`: Khóa có thể được sử dụng để [bọc khóa](/en-US/docs/Web/API/SubtleCrypto/wrapKey).
    - `unwrapKey`: Khóa có thể được sử dụng để [mở bọc khóa](/en-US/docs/Web/API/SubtleCrypto/unwrapKey).

### Giá trị trả về

Một {{jsxref("Promise")}} được fulfill với một {{domxref("CryptoKey")}}.

### Ngoại lệ

Promise bị reject khi gặp một trong các ngoại lệ sau:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném lên khi khóa chính không phải là khóa cho thuật toán phái sinh được yêu cầu hoặc nếu giá trị `keyUsages` của khóa đó không chứa `deriveKey`.
- `NotSupported` {{domxref("DOMException")}}
  - : Ném lên khi cố sử dụng một thuật toán không xác định hoặc không phù hợp để phái sinh, hoặc nếu thuật toán được yêu cầu cho khóa phái sinh không xác định độ dài khóa.
- `SyntaxError` {{domxref("DOMException")}}
  - : Ném lên khi `keyUsages` trống nhưng khóa đã mở bọc có loại `secret` hoặc `private`.

## Các thuật toán được hỗ trợ

Các thuật toán được hỗ trợ bởi `deriveKey()` có các đặc điểm khá khác nhau và phù hợp trong các tình huống khác nhau.

### Các thuật toán phái sinh khóa

#### HKDF

HKDF là một _hàm phái sinh khóa_.
Nó được thiết kế để phái sinh tài liệu khóa từ một đầu vào có entropy cao, chẳng hạn như đầu ra của thao tác thỏa thuận khóa ECDH.

Nó _không_ được thiết kế để phái sinh khóa từ các đầu vào có entropy tương đối thấp như mật khẩu.
Cho mục đích đó, sử dụng PBKDF2.

HKDF được chỉ định trong [RFC 5869](https://datatracker.ietf.org/doc/html/rfc5869).

#### PBKDF2

PBKDF2 cũng là một _hàm phái sinh khóa_.
Nó được thiết kế để phái sinh tài liệu khóa từ một đầu vào có entropy tương đối thấp, chẳng hạn như mật khẩu.
Nó phái sinh tài liệu khóa bằng cách áp dụng một hàm như HMAC cho mật khẩu đầu vào cùng với một số salt, và lặp lại quá trình này nhiều lần.
Quá trình được lặp lại càng nhiều lần, việc phái sinh khóa càng tốn kém về mặt tính toán: điều này khiến kẻ tấn công khó sử dụng brute-force để khám phá khóa bằng tấn từ điển hơn.

PBKDF2 được chỉ định trong [RFC 2898](https://datatracker.ietf.org/doc/html/rfc2898).

### Các thuật toán thỏa thuận khóa

#### ECDH

ECDH (Elliptic Curve Diffie-Hellman) là một _thuật toán thỏa thuận khóa_.
Nó cho phép hai người mỗi người có một cặp khóa công khai/riêng tư ECDH tạo một bí mật chia sẻ: tức là, một bí mật mà họ — và không ai khác — chia sẻ.
Sau đó, họ có thể sử dụng bí mật chia sẻ này như một khóa đối xứng để bảo mật thông tin liên lạc, hoặc có thể sử dụng bí mật làm đầu vào để phái sinh một khóa như vậy (ví dụ, bằng thuật toán HKDF).

ECDH được chỉ định trong [RFC 6090](https://datatracker.ietf.org/doc/html/rfc6090).

#### X25519

X25519 là một thuật toán thỏa thuận khóa giống như ECDH, nhưng được xây dựng trên đường cong elliptic [Curve25519](https://en.wikipedia.org/wiki/Curve25519), là một phần của họ thuật toán EdDSA (Edwards-Curve Digital Signature Algorithm) được định nghĩa trong {{rfc("8032")}}.

Các thuật toán Curve25519 được sử dụng rộng rãi trong mật mã, và được coi là một trong những thuật toán hiệu quả/nhanh nhất hiện có.
So với các thuật toán trao đổi khóa đường cong NIST (Viện Tiêu chuẩn và Công nghệ Quốc gia) được sử dụng với ECDH, Curve25519 đơn giản hơn để triển khai, và nguồn gốc phi chính phủ của nó có nghĩa là các quyết định đằng sau lựa chọn thiết kế của nó minh bạch và cởi mở.

X25519 được chỉ định trong {{rfc("7748")}}.

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/derive-key/index.html) trên GitHub.

### ECDH: phái sinh khóa bí mật chia sẻ

Trong ví dụ này, Alice và Bob mỗi người tạo một cặp khóa ECDH, sau đó trao đổi khóa công khai.
Sau đó họ sử dụng `deriveKey()` để phái sinh một khóa AES chia sẻ, mà họ có thể sử dụng để mã hóa thông báo.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/derive-key/ecdh.js)

```js
/*
Phái sinh một khóa AES, với:
- khóa riêng tư ECDH của chúng ta
- khóa công khai ECDH của họ
*/
function deriveSecretKey(privateKey, publicKey) {
  return window.crypto.subtle.deriveKey(
    {
      name: "ECDH",
      public: publicKey,
    },
    privateKey,
    {
      name: "AES-GCM",
      length: 256,
    },
    false,
    ["encrypt", "decrypt"],
  );
}

async function agreeSharedSecretKey() {
  // Tạo 2 cặp khóa ECDH: một cho Alice và một cho Bob
  // Trong sử dụng bình thường hơn, họ sẽ tạo cặp khóa
  // riêng biệt và trao đổi khóa công khai một cách an toàn
  let aliceKeyPair = await window.crypto.subtle.generateKey(
    {
      name: "ECDH",
      namedCurve: "P-384",
    },
    false,
    ["deriveKey"],
  );

  let bobKeyPair = await window.crypto.subtle.generateKey(
    {
      name: "ECDH",
      namedCurve: "P-384",
    },
    false,
    ["deriveKey"],
  );

  // Alice sau đó tạo khóa bí mật bằng khóa riêng tư của cô ấy và khóa công khai của Bob.
  let aliceSecretKey = await deriveSecretKey(
    aliceKeyPair.privateKey,
    bobKeyPair.publicKey,
  );

  // Bob tạo cùng khóa bí mật bằng khóa riêng tư của anh ấy và khóa công khai của Alice.
  let bobSecretKey = await deriveSecretKey(
    bobKeyPair.privateKey,
    aliceKeyPair.publicKey,
  );

  // Alice sau đó có thể sử dụng bản sao khóa bí mật của cô ấy để mã hóa thông báo cho Bob.
  let encryptButton = document.querySelector(".ecdh .encrypt-button");
  encryptButton.addEventListener("click", () => {
    encrypt(aliceSecretKey);
  });

  // Bob có thể sử dụng bản sao của anh ấy để giải mã thông báo.
  let decryptButton = document.querySelector(".ecdh .decrypt-button");
  decryptButton.addEventListener("click", () => {
    decrypt(bobSecretKey);
  });
}
```

### X25519: phái sinh khóa bí mật chia sẻ

Trong ví dụ này, Alice và Bob mỗi người tạo một cặp khóa X25519, sau đó trao đổi khóa công khai.
Sau đó mỗi người sử dụng `deriveKey()` để phái sinh một khóa AES chia sẻ từ khóa riêng tư của họ và khóa công khai của người kia.
Họ có thể sử dụng khóa chia sẻ này để mã hóa và giải mã các thông báo trao đổi.

#### HTML

Đầu tiên chúng ta định nghĩa một {{HTMLElement("input")}} HTML mà bạn sẽ sử dụng để nhập thông báo văn bản gốc mà "Alice" sẽ gửi, và một nút bạn có thể nhấn để bắt đầu quá trình mã hóa.

```html
<label for="message">Thông báo văn bản gốc từ Alice (Nhập):</label>
<input
  type="text"
  id="message"
  name="message"
  size="50"
  value="The lion roars near dawn" />
<input id="encrypt-button" type="button" value="Encrypt" />
```

Tiếp theo là hai phần tử khác để hiển thị ciphertext sau khi Alice mã hóa văn bản gốc bằng bản sao khóa bí mật của cô ấy, và để hiển thị văn bản sau khi Bob giải mã bằng bản sao khóa bí mật của anh ấy.

```html
<div id="results">
  <label for="encrypted">Encrypted (Alice)</label>
  <input
    type="text"
    id="encrypted"
    name="encrypted"
    size="30"
    value=""
    readonly />

  <label for="results">Decrypted (Bob)</label>
  <input
    type="text"
    id="decrypted"
    name="decrypted"
    size="50"
    value=""
    readonly />
</div>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
input {
  display: block;
  margin: 5px 0px;
}
#results {
  margin-top: 20px;
}

#log {
  height: 150px;
  width: 90%;
  white-space: pre-wrap; /* wrap pre blocks */
  overflow-wrap: break-word; /* break on words */
  overflow-y: auto;
  padding: 0.5rem;
  border: 1px solid black;
  margin-top: 20px;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

Mã bên dưới cho thấy cách chúng ta sử dụng `deriveKey()`.
Chúng ta truyền khóa công khai X25519 của bên từ xa, khóa riêng tư X25519 của bên cục bộ, và chỉ định rằng khóa phái sinh nên là khóa AES-GCM.
Chúng ta cũng đặt khóa phái sinh không thể trích xuất, và phù hợp để mã hóa và giải mã.

Chúng ta sử dụng hàm này xa hơn trong mã để tạo khóa chia sẻ cho Bob và Alice.

```js
/*
Phái sinh một khóa AES-GCM, với:
- khóa riêng tư X25519 của chúng ta
- khóa công khai X25519 của họ
*/
function deriveSecretKey(privateKey, publicKey) {
  return window.crypto.subtle.deriveKey(
    {
      name: "X25519",
      public: publicKey,
    },
    privateKey,
    {
      name: "AES-GCM",
      length: 256,
    },
    false,
    ["encrypt", "decrypt"],
  );
}
```

Tiếp theo chúng ta định nghĩa các hàm mà Alice sẽ sử dụng để mã hóa {{glossary("UTF-8")}} và sau đó mã hóa thông báo văn bản gốc của cô ấy, và mà Bob sẽ sử dụng để giải mã và sau đó giải mã thông báo.
Cả hai đều nhận làm đối số khóa AES chia sẻ, một [vector khởi tạo](/en-US/docs/Web/API/AesGcmParams#iv), và văn bản cần mã hóa hoặc giải mã.

Cùng một vector khởi tạo phải được sử dụng để mã hóa và giải mã, nhưng nó không cần phải bí mật, vì vậy thường nó được gửi cùng với thông báo đã mã hóa.
Tuy nhiên, trong trường hợp này, vì chúng ta không thực sự gửi thông báo, chúng ta chỉ làm cho nó có sẵn trực tiếp.

```js
async function encryptMessage(key, initializationVector, message) {
  try {
    const encoder = new TextEncoder();
    encodedMessage = encoder.encode(message);
    // iv will be needed for decryption
    return await window.crypto.subtle.encrypt(
      { name: "AES-GCM", iv: initializationVector },
      key,
      encodedMessage,
    );
  } catch (e) {
    console.log(e);
    return `Encoding error`;
  }
}

async function decryptMessage(key, initializationVector, ciphertext) {
  try {
    const decryptedText = await window.crypto.subtle.decrypt(
      // The iv value must be the same as that used for encryption
      { name: "AES-GCM", iv: initializationVector },
      key,
      ciphertext,
    );

    const utf8Decoder = new TextDecoder();
    return utf8Decoder.decode(decryptedText);
  } catch (e) {
    console.log(e);
    return "Decryption error";
  }
}
```

Hàm `agreeSharedSecretKey()` bên dưới được gọi khi tải để tạo các cặp khóa và khóa chia sẻ cho Alice và Bob.
Nó cũng thêm trình xử lý nhấn cho nút "Encrypt" sẽ kích hoạt mã hóa và sau đó giải mã văn bản được định nghĩa trong `<input>` đầu tiên.
Lưu ý rằng tất cả mã đều nằm trong trình xử lý `try...catch`, để đảm bảo rằng chúng ta có thể ghi log trường hợp tạo khóa thất bại vì thuật toán X25519 không được hỗ trợ.

```js
async function agreeSharedSecretKey() {
  try {
    // Generate 2 X25519 key pairs: one for Alice and one for Bob
    // In more normal usage, they would generate their key pairs
    // separately and exchange public keys securely
    const aliceKeyPair = await window.crypto.subtle.generateKey(
      {
        name: "X25519",
      },
      false,
      ["deriveKey"],
    );

    log(
      `Created Alice's key pair: (algorithm: ${JSON.stringify(
        aliceKeyPair.privateKey.algorithm,
      )}, usages: ${aliceKeyPair.privateKey.usages})`,
    );

    const bobKeyPair = await window.crypto.subtle.generateKey(
      {
        name: "X25519",
      },
      false,
      ["deriveKey"],
    );

    log(
      `Created Bob's key pair: (algorithm: ${JSON.stringify(
        bobKeyPair.privateKey.algorithm,
      )}, usages: ${bobKeyPair.privateKey.usages})`,
    );

    // Alice sau đó tạo khóa bí mật bằng khóa riêng tư của cô ấy và khóa công khai của Bob.
    const aliceSecretKey = await deriveSecretKey(
      aliceKeyPair.privateKey,
      bobKeyPair.publicKey,
    );

    log(
      `aliceSecretKey: ${aliceSecretKey.type} (algorithm: ${JSON.stringify(
        aliceSecretKey.algorithm,
      )}, usages: ${aliceSecretKey.usages}), `,
    );

    // Bob tạo cùng khóa bí mật bằng khóa riêng tư của anh ấy và khóa công khai của Alice.
    const bobSecretKey = await deriveSecretKey(
      bobKeyPair.privateKey,
      aliceKeyPair.publicKey,
    );

    log(
      `bobSecretKey: ${bobSecretKey.type} (algorithm: ${JSON.stringify(
        bobSecretKey.algorithm,
      )}, usages: ${bobSecretKey.usages}), \n`,
    );

    // Get access for the encrypt button and the three inputs
    const encryptButton = document.querySelector("#encrypt-button");
    const messageInput = document.querySelector("#message");
    const encryptedInput = document.querySelector("#encrypted");
    const decryptedInput = document.querySelector("#decrypted");

    encryptButton.addEventListener("click", async () => {
      log(`Plaintext: ${messageInput.value}`);

      // Define the initialization vector used when encrypting and decrypting.
      // This must be regenerated for every message!
      const initializationVector = window.crypto.getRandomValues(
        new Uint8Array(8),
      );

      // Alice có thể sử dụng bản sao khóa chia sẻ của cô ấy để mã hóa thông báo.
      const encryptedMessage = await encryptMessage(
        aliceSecretKey,
        initializationVector,
        messageInput.value,
      );

      // Chúng ta sau đó hiển thị một phần bộ đệm đã mã hóa và ghi log thông báo đã mã hóa
      let buffer = new Uint8Array(encryptedMessage, 0, 5);
      encryptedInput.value = `${buffer}...[${encryptedMessage.byteLength} bytes total]`;

      log(
        `encryptedMessage: ${buffer}...[${encryptedMessage.byteLength} bytes total]`,
      );

      // Bob sử dụng khóa bí mật chia sẻ của anh ấy để giải mã thông báo.
      const decryptedCiphertext = await decryptMessage(
        bobSecretKey,
        initializationVector,
        encryptedMessage,
      );

      decryptedInput.value = decryptedCiphertext;
      log(`decryptedCiphertext: ${decryptedCiphertext}\n`);
    });
  } catch (e) {
    log(e);
  }
}

// Finally we call the method to set the example running.
agreeSharedSecretKey();
```

#### Kết quả

Nhấn nút Encrypt để mã hóa văn bản trong phần tử `<input>` trên cùng, hiển thị ciphertext đã mã hóa và ciphertext đã giải mã trong hai phần tử tiếp theo.
Khu vực log ở cuối cung cấp thông tin về các khóa được tạo bởi mã.

{{EmbedLiveSample("X25519_derived_shared_key", "100%", "400px")}}

### PBKDF2: phái sinh khóa AES từ mật khẩu

Trong ví dụ này, chúng ta yêu cầu người dùng nhập mật khẩu, sau đó sử dụng nó để phái sinh một khóa AES bằng PBKDF2, rồi sử dụng khóa AES để mã hóa thông báo.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/derive-key/pbkdf2.js)

```js
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
    "PBKDF2",
    false,
    ["deriveBits", "deriveKey"],
  );
}

async function encrypt(plaintext, salt, iv) {
  const keyMaterial = await getKeyMaterial();
  const key = await window.crypto.subtle.deriveKey(
    {
      name: "PBKDF2",
      salt,
      iterations: 100000,
      hash: "SHA-256",
    },
    keyMaterial,
    { name: "AES-GCM", length: 256 },
    true,
    ["encrypt", "decrypt"],
  );

  return window.crypto.subtle.encrypt({ name: "AES-GCM", iv }, key, plaintext);
}
```

### HKDF: phái sinh khóa AES từ bí mật chia sẻ

Trong ví dụ này, chúng ta mã hóa một thông báo `plainText` với một bí mật chia sẻ `secret`, bản thân nó có thể đã được phái sinh bằng một thuật toán như ECDH.
Thay vì sử dụng bí mật chia sẻ trực tiếp, chúng ta sử dụng nó làm tài liệu khóa cho hàm HKDF, để phái sinh một khóa mã hóa AES-GCM, sau đó chúng ta sử dụng để mã hóa thông báo.
[Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/derive-key/hkdf.js)

```js
/*
  Với một số tài liệu khóa và một số salt ngẫu nhiên,
  phái sinh một khóa AES-GCM bằng HKDF.
  */
function getKey(keyMaterial, salt) {
  return window.crypto.subtle.deriveKey(
    {
      name: "HKDF",
      salt,
      info: new TextEncoder().encode("Encryption example"),
      hash: "SHA-256",
    },
    keyMaterial,
    { name: "AES-GCM", length: 256 },
    true,
    ["encrypt", "decrypt"],
  );
}

async function encrypt(secret, plainText) {
  const message = {
    salt: window.crypto.getRandomValues(new Uint8Array(16)),
    iv: window.crypto.getRandomValues(new Uint8Array(12)),
  };

  const key = await getKey(secret, message.salt);

  message.ciphertext = await window.crypto.subtle.encrypt(
    {
      name: "AES-GCM",
      iv: message.iv,
    },
    key,
    plainText,
  );

  return message;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Đặc tả kỹ thuật HKDF](https://datatracker.ietf.org/doc/html/rfc5869).
- [Hướng dẫn của NIST về phái sinh khóa dựa trên mật khẩu](https://csrc.nist.gov/pubs/sp/800/132/final).
- [Bảng gian lận lưu trữ mật khẩu](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html).
- [Lời khuyên về việc chọn số lần lặp cho PBKDF2](https://security.stackexchange.com/questions/3959/recommended-of-iterations-when-using-pbkdf2-sha256/3993#3993).
