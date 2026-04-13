---
title: "SubtleCrypto: phương thức deriveBits()"
short-title: deriveBits()
slug: Web/API/SubtleCrypto/deriveBits
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.deriveBits
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`deriveBits()`** của giao diện {{domxref("SubtleCrypto")}} có thể được sử dụng để phái sinh một mảng bit từ một khóa cơ sở.

Nó nhận làm đối số khóa cơ sở, thuật toán phái sinh sẽ sử dụng, và độ dài của các bit cần phái sinh. Nó trả về một [`Promise`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) sẽ được fulfill với một [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) chứa các bit đã phái sinh.

Phương thức này rất giống với [`SubtleCrypto.deriveKey()`](/en-US/docs/Web/API/SubtleCrypto/deriveKey), ngoại trừ `deriveKey()` trả về đối tượng [`CryptoKey`](/en-US/docs/Web/API/CryptoKey) thay vì `ArrayBuffer`. Về cơ bản `deriveKey()` được cấu thành từ `deriveBits()` theo sau bởi [`importKey()`](/en-US/docs/Web/API/SubtleCrypto/importKey).

Hàm này hỗ trợ các thuật toán phái sinh tương tự như `deriveKey()`: ECDH, HKDF, PBKDF2 và X25519.
Xem [Các thuật toán được hỗ trợ](/en-US/docs/Web/API/SubtleCrypto/deriveKey#supported_algorithms) để biết thêm chi tiết về các thuật toán này.

## Cú pháp

```js-nolint
deriveBits(algorithm, baseKey, length)
```

### Tham số

- `algorithm`
  - : Một đối tượng xác định [thuật toán phái sinh](/en-US/docs/Web/API/SubtleCrypto/deriveKey#supported_algorithms) sẽ sử dụng.
    - Để sử dụng [ECDH](/en-US/docs/Web/API/SubtleCrypto/deriveKey#ecdh), truyền một đối tượng [`EcdhKeyDeriveParams`](/en-US/docs/Web/API/EcdhKeyDeriveParams), chỉ định chuỗi `ECDH` làm thuộc tính `name`.
    - Để sử dụng [HKDF](/en-US/docs/Web/API/SubtleCrypto/deriveKey#hkdf), truyền một đối tượng [`HkdfParams`](/en-US/docs/Web/API/HkdfParams).
    - Để sử dụng [PBKDF2](/en-US/docs/Web/API/SubtleCrypto/deriveKey#pbkdf2), truyền một đối tượng [`Pbkdf2Params`](/en-US/docs/Web/API/Pbkdf2Params).
    - Để sử dụng [X25519](/en-US/docs/Web/API/SubtleCrypto/deriveKey#x25519), truyền một đối tượng [`EcdhKeyDeriveParams`](/en-US/docs/Web/API/EcdhKeyDeriveParams), chỉ định chuỗi `X25519` làm thuộc tính `name`.
- `baseKey`
  - : Một {{domxref("CryptoKey")}} đại diện cho đầu vào của thuật toán phái sinh. Nếu `algorithm` là ECDH, đây sẽ là khóa riêng tư ECDH. Nếu không, nó sẽ là tài liệu khóa ban đầu cho hàm phái sinh: ví dụ, đối với PBKDF2 nó có thể là mật khẩu, được nhập dưới dạng `CryptoKey` bằng [`SubtleCrypto.importKey()`](/en-US/docs/Web/API/SubtleCrypto/importKey).
- `length`
  - : Một số đại diện cho số bit cần phái sinh. Để tương thích với tất cả trình duyệt, số này nên là bội số của 8.

### Giá trị trả về

Một [`Promise`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) được fulfill với một [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) chứa các bit đã phái sinh.

### Ngoại lệ

Promise bị reject khi gặp một trong các ngoại lệ sau:

- `OperationError` {{domxref("DOMException")}}
  - : Ném lên nếu tham số _length_ của lệnh gọi `deriveBits()` là null, và trong một số trường hợp nếu tham số _length_ không phải là bội số của 8.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném lên khi khóa cơ sở không phải là khóa cho thuật toán phái sinh được yêu cầu hoặc nếu giá trị [`CryptoKey.usages`](/en-US/docs/Web/API/CryptoKey) của khóa đó không chứa `deriveBits`.
- `NotSupported` {{domxref("DOMException")}}
  - : Ném lên khi cố sử dụng một thuật toán không xác định hoặc không phù hợp để phái sinh.

## Các thuật toán được hỗ trợ

Xem [mục Các thuật toán được hỗ trợ trong tài liệu `deriveKey()`](/en-US/docs/Web/API/SubtleCrypto/deriveKey#supported_algorithms).

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/derive-bits/index.html) trên GitHub.

### ECDH

Trong ví dụ này, Alice và Bob mỗi người tạo một cặp khóa ECDH.

Sau đó chúng ta sử dụng khóa riêng tư của Alice và khóa công khai của Bob để phái sinh một bí mật chia sẻ. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/derive-bits/ecdh.js)

```js
async function deriveSharedSecret(privateKey, publicKey) {
  const sharedSecret = await window.crypto.subtle.deriveBits(
    {
      name: "ECDH",
      namedCurve: "P-384",
      public: publicKey,
    },
    privateKey,
    128,
  );

  const buffer = new Uint8Array(sharedSecret, 0, 5);
  const sharedSecretValue = document.querySelector(".ecdh .derived-bits-value");
  sharedSecretValue.classList.add("fade-in");
  sharedSecretValue.addEventListener("animationend", () => {
    sharedSecretValue.classList.remove("fade-in");
  });
  sharedSecretValue.textContent = `${buffer}…[${sharedSecret.byteLength} bytes total]`;
}

// Tạo 2 cặp khóa ECDH: một cho Alice và một cho Bob
// Trong sử dụng bình thường hơn, họ sẽ tạo cặp khóa
// riêng biệt và trao đổi khóa công khai một cách an toàn
const generateAliceKeyPair = window.crypto.subtle.generateKey(
  {
    name: "ECDH",
    namedCurve: "P-384",
  },
  false,
  ["deriveBits"],
);

const generateBobKeyPair = window.crypto.subtle.generateKey(
  {
    name: "ECDH",
    namedCurve: "P-384",
  },
  false,
  ["deriveBits"],
);

Promise.all([generateAliceKeyPair, generateBobKeyPair]).then((values) => {
  const aliceKeyPair = values[0];
  const bobKeyPair = values[1];

  const deriveBitsButton = document.querySelector(".ecdh .derive-bits-button");
  deriveBitsButton.addEventListener("click", () => {
    // Alice sau đó tạo bí mật bằng khóa riêng tư của cô ấy và khóa công khai của Bob.
    // Bob có thể tạo cùng bí mật bằng khóa riêng tư của anh ấy và khóa công khai của Alice.
    deriveSharedSecret(aliceKeyPair.privateKey, bobKeyPair.publicKey);
  });
});
```

### X25519

Trong ví dụ này, Alice và Bob mỗi người tạo một cặp khóa X25519.
Sau đó chúng ta sử dụng khóa riêng tư của Alice và khóa công khai của Bob để phái sinh một bí mật, và so sánh bí mật đó với bí mật được tạo bằng khóa riêng tư của Bob và khóa công khai của Alice để cho thấy chúng là chia sẻ/giống nhau.

#### HTML

HTML định nghĩa hai nút.
Nút "Change keys" được nhấn để tạo các cặp khóa mới cho Alice và Bob.
Nút "Derive bits" được nhấn để phái sinh một bí mật chia sẻ với tập hợp cặp khóa hiện tại.

```html
<input id="buttonDeriveKeys" type="button" value="Derive bits" />
<input id="buttonChangeKeys" type="button" value="Change keys" />
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 150px;
  width: 90%;
  white-space: pre-wrap; /* wrap pre blocks */
  overflow-wrap: break-word; /* break on words */
  overflow-y: auto;
  padding: 0.5rem;
  border: 1px solid black;
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

Hàm tạo một bí mật chia sẻ bằng thuật toán X25519 được hiển thị bên dưới.
Hàm này nhận khóa riêng tư từ một bên và khóa công khai từ bên kia.

```js
async function deriveSharedSecret(privateKey, publicKey) {
  return await window.crypto.subtle.deriveBits(
    {
      name: "X25519",
      public: publicKey,
    },
    privateKey,
    128,
  );
}
```

Mã bên dưới thêm một hàm để tạo khóa mới cho Alice và Bob.
Điều này được thực hiện lần đầu tiên khi JavaScript được tải, và lặp lại bất cứ khi nào nút "Change keys" được nhấn (điều này cho phép chúng ta xem hiệu quả của việc thay đổi khóa đối với bí mật chia sẻ).

```js
let aliceKeyPair;
let bobKeyPair;

async function changeKeys() {
  try {
    aliceKeyPair = await window.crypto.subtle.generateKey(
      {
        name: "X25519",
      },
      false,
      ["deriveBits"],
    );

    bobKeyPair = await window.crypto.subtle.generateKey(
      {
        name: "X25519",
      },
      false,
      ["deriveBits"],
    );

    log("Keys changed");
  } catch (e) {
    log(e);
  }
}

changeKeys();

const changeKeysButton = document.querySelector("#buttonChangeKeys");

// Tạo 2 cặp khóa X25519: một cho Alice và một cho Bob
// Trong sử dụng bình thường hơn, họ sẽ tạo cặp khóa
// riêng biệt và trao đổi khóa công khai một cách an toàn
changeKeysButton.addEventListener("click", changeKeys);
```

Mã bên dưới thêm một hàm xử lý được gọi mỗi khi nút "Derive bits" được nhấn.
Trình xử lý tạo các bí mật chia sẻ cho Alice và Bob bằng phương thức `deriveSharedSecret()` định nghĩa ở trên, và ghi log chúng để dễ dàng so sánh.

```js
const deriveBitsButton = document.querySelector("#buttonDeriveKeys");

deriveBitsButton.addEventListener("click", async () => {
  // Tạo 2 cặp khóa X25519: một cho Alice và một cho Bob
  // Trong sử dụng bình thường hơn, họ sẽ tạo cặp khóa
  // riêng biệt và trao đổi khóa công khai một cách an toàn

  // Alice sau đó tạo bí mật bằng khóa riêng tư của cô ấy và khóa công khai của Bob.
  // Bob có thể tạo cùng bí mật bằng khóa riêng tư của anh ấy và khóa công khai của Alice.

  const sharedSecretAlice = await deriveSharedSecret(
    aliceKeyPair.privateKey,
    bobKeyPair.publicKey,
  );

  let buffer = new Uint8Array(sharedSecretAlice, 0, 10);
  log(`${buffer}…[${sharedSecretAlice.byteLength} bytes total] (Alice secret)`);

  const sharedSecretBob = await deriveSharedSecret(
    bobKeyPair.privateKey,
    aliceKeyPair.publicKey,
  );

  buffer = new Uint8Array(sharedSecretBob, 0, 10);
  log(`${buffer}…[${sharedSecretAlice.byteLength} bytes total] (Bob secret)`);
});
```

#### Kết quả

Nhấn nút "Derive bits" để tạo và ghi log một bí mật chia sẻ từ khóa của Bob và Alice.
Nhấn nút "Change keys" để thay đổi các khóa X25519 được sử dụng bởi cả hai bên.

{{EmbedLiveSample("X25519", "100%", "340px")}}

### PBKDF2

Trong ví dụ này, chúng ta yêu cầu người dùng nhập mật khẩu, sau đó sử dụng nó để phái sinh một số bit bằng PBKDF2. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/derive-bits/pbkdf2.js)

```js
let salt;

/*
Lấy một số tài liệu khóa để sử dụng làm đầu vào cho phương thức deriveBits.
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
Phái sinh một số bit từ mật khẩu do người dùng cung cấp.
*/
async function getDerivedBits() {
  const keyMaterial = await getKeyMaterial();
  salt = window.crypto.getRandomValues(new Uint8Array(16));
  const derivedBits = await window.crypto.subtle.deriveBits(
    {
      name: "PBKDF2",
      salt,
      iterations: 100000,
      hash: "SHA-256",
    },
    keyMaterial,
    256,
  );

  const buffer = new Uint8Array(derivedBits, 0, 5);
  const derivedBitsValue = document.querySelector(
    ".pbkdf2 .derived-bits-value",
  );
  derivedBitsValue.classList.add("fade-in");
  derivedBitsValue.addEventListener("animationend", () => {
    derivedBitsValue.classList.remove("fade-in");
  });
  derivedBitsValue.textContent = `${buffer}…[${derivedBits.byteLength} bytes total]`;
}

const deriveBitsButton = document.querySelector(".pbkdf2 .derive-bits-button");
deriveBitsButton.addEventListener("click", () => {
  getDerivedBits();
});
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
