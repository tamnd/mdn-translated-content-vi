---
title: "SubtleCrypto: phương thức unwrapKey()"
short-title: unwrapKey()
slug: Web/API/SubtleCrypto/unwrapKey
page-type: web-api-instance-method
browser-compat: api.SubtleCrypto.unwrapKey
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`unwrapKey()`** của giao diện {{domxref("SubtleCrypto")}} "mở bọc" một khóa.
Điều này có nghĩa là nó nhận làm đầu vào một khóa đã được xuất và sau đó mã hóa (còn gọi là "wrapped" - đã bọc).
Nó giải mã khóa rồi nhập nó, trả về một đối tượng {{domxref("CryptoKey")}} mà bạn có thể sử dụng trong [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API).

Như với [`SubtleCrypto.importKey()`](/en-US/docs/Web/API/SubtleCrypto/importKey), bạn chỉ định [định dạng nhập](/en-US/docs/Web/API/SubtleCrypto/importKey#supported_formats) của khóa và các thuộc tính khác của khóa cần nhập như liệu nó có thể trích xuất hay không, và những thao tác nào nó có thể thực hiện.

Nhưng vì `unwrapKey()` cũng giải mã khóa cần nhập, bạn cũng cần truyền khóa phải dùng để giải mã nó.
Đôi khi đây được gọi là "khóa mở bọc khóa".

Ngược lại với `unwrapKey()` là {{domxref("SubtleCrypto.wrapKey()")}}: trong khi `unwrapKey` được cấu thành từ decrypt + import, `wrapKey` được cấu thành từ encrypt + export.

## Cú pháp

```js-nolint
unwrapKey(format, wrappedKey, unwrappingKey, unwrapAlgo, unwrappedKeyAlgo, extractable, keyUsages)
```

### Tham số

- `format`
  - : Một chuỗi mô tả định dạng dữ liệu của khóa cần mở bọc. Nó có thể là một trong các giá trị sau:
    - `raw`: Định dạng [Raw](/en-US/docs/Web/API/SubtleCrypto/importKey#raw).
    - `pkcs8`: Định dạng [PKCS #8](/en-US/docs/Web/API/SubtleCrypto/importKey#pkcs_8).
    - `spki`: Định dạng [SubjectPublicKeyInfo](/en-US/docs/Web/API/SubtleCrypto/importKey#subjectpublickeyinfo).
    - `jwk`: Định dạng [JSON Web Key](/en-US/docs/Web/API/SubtleCrypto/importKey#json_web_key).
- `wrappedKey`
  - : Một {{jsxref("ArrayBuffer")}} chứa khóa đã bọc ở định dạng đã cho.
- `unwrappingKey`
  - : {{domxref("CryptoKey")}} sẽ dùng để giải mã khóa đã bọc. Khóa phải có cách sử dụng `unwrapKey`.
- `unwrapAlgo`
  - : Một đối tượng chỉ định [thuật toán](/en-US/docs/Web/API/SubtleCrypto/encrypt#supported_algorithms) sẽ sử dụng để giải mã khóa đã bọc, và bất kỳ tham số bổ sung nào khi cần:
    - Để sử dụng [RSA-OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep),
      truyền một đối tượng [`RsaOaepParams`](/en-US/docs/Web/API/RsaOaepParams).
    - Để sử dụng [AES-CTR](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr),
      truyền một đối tượng [`AesCtrParams`](/en-US/docs/Web/API/AesCtrParams).
    - Để sử dụng [AES-CBC](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc),
      truyền một đối tượng [`AesCbcParams`](/en-US/docs/Web/API/AesCbcParams).
    - Để sử dụng [AES-GCM](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm),
      truyền một đối tượng [`AesGcmParams`](/en-US/docs/Web/API/AesGcmParams).
    - Để sử dụng [AES-KW](/en-US/docs/Web/API/SubtleCrypto/wrapKey#aes-kw),
      truyền chuỗi `"AES-KW"` hoặc một đối tượng có dạng `{ "name": "AES-KW" }`.
- `unwrappedKeyAlgo`
  - : Một đối tượng xác định loại khóa cần mở bọc và cung cấp các tham số bổ sung cụ thể cho thuật toán khi cần.
    - Đối với [RSASSA-PKCS1-v1_5](/en-US/docs/Web/API/SubtleCrypto/sign#rsassa-pkcs1-v1_5), [RSA-PSS](/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss),
      hoặc [RSA-OAEP](/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep):
      Truyền một đối tượng [`RsaHashedImportParams`](/en-US/docs/Web/API/RsaHashedImportParams).
    - Đối với [ECDSA](/en-US/docs/Web/API/SubtleCrypto/sign#ecdsa) hoặc [ECDH](/en-US/docs/Web/API/SubtleCrypto/deriveKey#ecdh): Truyền
      một đối tượng [`EcKeyImportParams`](/en-US/docs/Web/API/EcKeyImportParams).
    - Đối với [HMAC](/en-US/docs/Web/API/SubtleCrypto/sign#hmac): Truyền một
      đối tượng [`HmacImportParams`](/en-US/docs/Web/API/HmacImportParams).
    - Đối với [AES-CTR](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr), [AES-CBC](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc),
      [AES-GCM](/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm), hoặc [AES-KW](/en-US/docs/Web/API/SubtleCrypto/wrapKey#aes-kw):
      Truyền chuỗi xác định thuật toán hoặc một đối tượng có dạng `{ "name": ALGORITHM }`, trong đó `ALGORITHM` là tên của thuật toán.
    - Đối với [Ed25519](/en-US/docs/Web/API/SubtleCrypto/sign#ed25519): Truyền một đối tượng có dạng `{ "name": "Ed25519" }`.
    - Đối với [X25519](/en-US/docs/Web/API/SubtleCrypto/deriveKey#x25519): Truyền một đối tượng có dạng: `{name: 'X25519'}`.
- `extractable`
  - : Một giá trị boolean cho biết liệu có thể xuất khóa bằng [`SubtleCrypto.exportKey()`](/en-US/docs/Web/API/SubtleCrypto/exportKey) hoặc [`SubtleCrypto.wrapKey()`](/en-US/docs/Web/API/SubtleCrypto/wrapKey) hay không.
- `keyUsages`
  - : Một [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) cho biết những gì có thể thực hiện với khóa. Các giá trị có thể của mảng là:
    - `encrypt`: Khóa có thể được sử dụng để [mã hóa](/en-US/docs/Web/API/SubtleCrypto/encrypt) thông báo.
    - `decrypt`: Khóa có thể được sử dụng để [giải mã](/en-US/docs/Web/API/SubtleCrypto/decrypt) thông báo.
    - `sign`: Khóa có thể được sử dụng để [ký](/en-US/docs/Web/API/SubtleCrypto/sign) thông báo.
    - `verify`: Khóa có thể được sử dụng để [xác minh](/en-US/docs/Web/API/SubtleCrypto/verify) chữ ký.
    - `deriveKey`: Khóa có thể được sử dụng trong [phái sinh khóa mới](/en-US/docs/Web/API/SubtleCrypto/deriveKey).
    - `deriveBits`: Khóa có thể được sử dụng trong [phái sinh bit](/en-US/docs/Web/API/SubtleCrypto/deriveBits).
    - `wrapKey`: Khóa có thể được sử dụng để [bọc khóa](/en-US/docs/Web/API/SubtleCrypto/wrapKey).
    - `unwrapKey`: Khóa có thể được sử dụng để mở bọc khóa.

### Giá trị trả về

Một [`Promise`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) được fulfill với khóa đã mở bọc dưới dạng đối tượng [`CryptoKey`](/en-US/docs/Web/API/CryptoKey).

### Ngoại lệ

Promise bị reject khi gặp một trong các ngoại lệ sau:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném lên khi khóa mở bọc không phải là khóa cho thuật toán mở bọc được yêu cầu hoặc nếu giá trị `keyUsages` của khóa đó không chứa `unwrap`.
- `NotSupported` {{domxref("DOMException")}}
  - : Ném lên khi cố sử dụng một thuật toán không xác định hoặc không phù hợp để mã hóa hoặc bọc.
- `SyntaxError` {{domxref("DOMException")}}
  - : Ném lên khi `keyUsages` trống nhưng khóa đã mở bọc có loại `secret` hoặc `private`.
- {{jsxref("TypeError")}}
  - : Ném lên khi cố sử dụng một định dạng không hợp lệ.

## Các thuật toán được hỗ trợ

Phương thức `unwrapKey()` hỗ trợ các thuật toán tương tự như phương thức [`wrapKey()`](/en-US/docs/Web/API/SubtleCrypto/wrapKey#supported_algorithms).

## Ví dụ

> [!NOTE]
> Bạn có thể [thử các ví dụ hoạt động](https://mdn.github.io/dom-examples/web-crypto/unwrap-key/index.html) trên GitHub.

### Mở bọc khóa "raw"

Trong ví dụ này, chúng ta mở bọc một khóa đối xứng AES-GCM. Khóa đã được xuất ở định dạng "raw" và mã hóa bằng thuật toán AES-KW, với một khóa phái sinh từ mật khẩu.

Để mở bọc, chúng ta yêu cầu người dùng nhập mật khẩu và sử dụng PBKDF2 cùng một số salt để phái sinh khóa mở bọc AES-KW. Salt cần giống với salt đã sử dụng để phái sinh khóa bọc khóa AES-KW ban đầu.

Khi có khóa mở bọc, chúng ta truyền nó vào `unwrapKey()` cùng với khóa đã bọc và các tham số khác. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/unwrap-key/raw.js)

```js
/*
Salt sẽ sử dụng trong phái sinh khóa bọc khóa,
cùng với mật khẩu người dùng cung cấp.
Giá trị này phải khớp với salt đã sử dụng ban đầu để phái sinh khóa.
*/
const saltBytes = [
  89, 113, 135, 234, 168, 204, 21, 36, 55, 93, 1, 132, 242, 242, 192, 156,
];

/*
Chính khóa đã bọc.
*/
const wrappedKeyBytes = [
  171, 223, 14, 36, 201, 233, 233, 120, 164, 68, 217, 192, 226, 80, 224, 39,
  199, 235, 239, 60, 212, 169, 100, 23, 61, 54, 244, 197, 160, 80, 109, 230,
  207, 225, 57, 197, 175, 71, 80, 209,
];

/*
Chuyển đổi một mảng giá trị byte thành một ArrayBuffer.
*/
function bytesToArrayBuffer(bytes) {
  const bytesAsArrayBuffer = new ArrayBuffer(bytes.length);
  const bytesUint8 = new Uint8Array(bytesAsArrayBuffer);
  bytesUint8.set(bytes);
  return bytesAsArrayBuffer;
}

/*
Lấy một số tài liệu khóa để sử dụng làm đầu vào cho phương thức deriveKey.
Tài liệu khóa là mật khẩu do người dùng cung cấp.
*/
function getKeyMaterial() {
  let password = window.prompt("Enter your password");
  let enc = new TextEncoder();
  return window.crypto.subtle.importKey(
    "raw",
    enc.encode(password),
    { name: "PBKDF2" },
    false,
    ["deriveBits", "deriveKey"],
  );
}

/*
Phái sinh một khóa AES-KW bằng PBKDF2.
*/
async function getUnwrappingKey() {
  // 1. lấy tài liệu khóa (mật khẩu người dùng cung cấp)
  const keyMaterial = await getKeyMaterial();
  // 2. khởi tạo tham số salt.
  // Salt phải khớp với salt đã sử dụng ban đầu để phái sinh khóa.
  // Trong ví dụ này nó được cung cấp dưới dạng hằng số "saltBytes".
  const saltBuffer = bytesToArrayBuffer(saltBytes);
  // 3. phái sinh khóa từ tài liệu khóa và salt
  return window.crypto.subtle.deriveKey(
    {
      name: "PBKDF2",
      salt: saltBuffer,
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
Mở bọc một khóa bí mật AES từ một ArrayBuffer chứa các byte thô.
Nhận một mảng chứa các byte, và trả về một Promise
sẽ giải quyết thành một CryptoKey đại diện cho khóa bí mật.
*/
async function unwrapSecretKey(wrappedKey) {
  // 1. lấy khóa mở bọc
  const unwrappingKey = await getUnwrappingKey();
  // 2. khởi tạo khóa đã bọc
  const wrappedKeyBuffer = bytesToArrayBuffer(wrappedKey);
  // 3. mở bọc khóa
  return window.crypto.subtle.unwrapKey(
    "raw", // import format
    wrappedKeyBuffer, // ArrayBuffer representing key to unwrap
    unwrappingKey, // CryptoKey representing key encryption key
    "AES-KW", // algorithm identifier for key encryption key
    "AES-GCM", // algorithm identifier for key to unwrap
    true, // extractability of key to unwrap
    ["encrypt", "decrypt"], // key usages for key to unwrap
  );
}
```

### Mở bọc khóa "pkcs8"

Trong ví dụ này, chúng ta mở bọc một khóa riêng tư ký RSA-PSS. Khóa đã được xuất ở định dạng "pkcs8" và mã hóa bằng thuật toán AES-GCM, với một khóa phái sinh từ mật khẩu.

Để mở bọc, chúng ta yêu cầu người dùng nhập mật khẩu và sử dụng PBKDF2 cùng một số salt để phái sinh khóa mở bọc AES-GCM. Salt cần giống với salt đã sử dụng để phái sinh khóa bọc khóa AES-GCM ban đầu.

Khi có khóa mở bọc, chúng ta truyền nó vào `unwrapKey()` cùng với khóa đã bọc và các tham số khác. Lưu ý khi sử dụng AES-GCM chúng ta phải truyền giá trị iv vào `unwrapKey()`, và giá trị này phải giống với iv đã sử dụng trong thao tác `wrapKey()` tương ứng. [Xem mã đầy đủ trên GitHub.](https://github.com/mdn/dom-examples/blob/main/web-crypto/unwrap-key/pkcs8.js)

```js
/*
Salt sẽ sử dụng trong phái sinh khóa bọc khóa,
cùng với mật khẩu người dùng cung cấp.
Giá trị này phải khớp với salt đã sử dụng ban đầu để phái sinh khóa.
*/
const saltBytes = [
  180, 253, 62, 216, 47, 35, 90, 55, 218, 233, 103, 10, 172, 143, 161, 177,
];

/*
IV sẽ sử dụng trong giải mã khóa cần mở bọc.
Đây phải là IV ban đầu đã sử dụng để mã hóa khóa.
*/
const ivBytes = [212, 187, 26, 247, 172, 51, 37, 151, 27, 177, 249, 142];

/*
Chính khóa đã bọc.
*/
const wrappedKeyBytes = [
  6, 155, 182, 208, 7, 141, 44, 18, 3, 151, 58, 126, 68, 100, 252, 225, 241, 11,
  25, 201, 153, 171, 102, 174, 150, 29, 62, 195, 110, 138, 106, 109, 14, 6, 108,
  148, 104, 221, 22, 93, 102, 221, 146, 25, 65, 112, 4, 140, 79, 194, 164, 163,
  156, 250, 108, 11, 14, 220, 78, 194, 161, 17, 14, 57, 121, 70, 13, 28, 220,
  210, 78, 32, 46, 217, 36, 165, 220, 170, 244, 152, 214, 150, 83, 2, 138, 128,
  11, 251, 227, 213, 72, 100, 158, 10, 162, 40, 195, 60, 248, 77, 37, 156, 34,
  10, 213, 171, 67, 147, 73, 231, 31, 63, 80, 176, 103, 206, 187, 164, 214, 250,
  49, 223, 185, 5, 48, 241, 17, 1, 253, 59, 185, 181, 209, 255, 42, 223, 175,
  90, 159, 174, 169, 205, 156, 120, 195, 1, 135, 165, 226, 46, 119, 27, 97, 183,
  23, 197, 227, 85, 138, 235, 79, 158, 167, 59, 62, 194, 34, 210, 214, 240, 215,
  101, 233, 63, 138, 53, 87, 253, 189, 27, 66, 150, 76, 242, 76, 102, 174, 179,
  163, 184, 205, 11, 161, 224, 19, 110, 34, 175, 192, 101, 117, 169, 86, 66, 56,
  241, 128, 13, 156, 165, 125, 139, 110, 138, 50, 108, 129, 251, 137, 26, 186,
  110, 117, 113, 207, 179, 59, 213, 18, 175, 14, 203, 192, 2, 97, 131, 125, 167,
  227, 182, 87, 72, 123, 54, 156, 60, 195, 88, 224, 96, 46, 126, 245, 251, 247,
  147, 110, 147, 173, 82, 106, 93, 210, 55, 71, 127, 133, 41, 37, 181, 17, 106,
  16, 158, 220, 136, 43, 75, 133, 96, 240, 151, 116, 40, 44, 254, 2, 32, 74,
  226, 193, 172, 48, 211, 71, 109, 163, 143, 30, 92, 28, 30, 183, 25, 16, 176,
  207, 77, 93, 139, 242, 114, 91, 218, 126, 123, 234, 18, 9, 245, 53, 46, 172,
  215, 62, 92, 249, 191, 17, 27, 0, 58, 151, 33, 23, 169, 93, 177, 253, 152,
  147, 198, 196, 226, 42, 202, 166, 99, 250, 127, 40, 221, 196, 121, 195, 198,
  235, 30, 159, 159, 95, 182, 107, 175, 137, 177, 49, 72, 63, 131, 162, 198,
  186, 22, 255, 230, 237, 195, 56, 147, 177, 101, 52, 227, 125, 32, 180, 242,
  47, 92, 212, 6, 148, 218, 107, 125, 137, 123, 15, 51, 107, 159, 228, 238, 212,
  60, 54, 184, 48, 110, 248, 252, 208, 46, 23, 149, 78, 169, 201, 68, 242, 193,
  251, 156, 227, 42, 90, 109, 102, 172, 61, 207, 124, 96, 98, 79, 37, 218, 16,
  212, 139, 162, 0, 183, 235, 171, 75, 18, 84, 160, 120, 173, 156, 187, 99, 24,
  58, 88, 213, 148, 24, 193, 111, 75, 169, 10, 158, 207, 148, 84, 249, 156, 248,
  19, 221, 2, 175, 1, 8, 74, 221, 212, 244, 123, 34, 223, 175, 54, 166, 101, 51,
  175, 141, 80, 87, 9, 146, 72, 223, 46, 251, 199, 192, 2, 22, 125, 16, 15, 99,
  26, 159, 165, 133, 172, 169, 26, 236, 44, 86, 182, 162, 81, 143, 249, 15, 207,
  12, 232, 15, 205, 199, 78, 133, 199, 19, 232, 183, 33, 183, 72, 117, 72, 27,
  43, 254, 13, 17, 252, 1, 143, 137, 154, 10, 4, 77, 85, 24, 85, 143, 200, 81,
  76, 171, 43, 124, 42, 191, 150, 70, 10, 90, 178, 198, 40, 233, 233, 225, 146,
  231, 209, 254, 2, 90, 216, 5, 97, 105, 204, 82, 88, 81, 99, 92, 159, 116, 192,
  223, 148, 252, 12, 24, 197, 211, 187, 212, 98, 252, 201, 154, 184, 65, 54, 47,
  13, 106, 151, 168, 208, 112, 212, 74, 204, 36, 233, 98, 104, 58, 103, 1, 194,
  13, 26, 109, 101, 60, 42, 3, 215, 20, 25, 99, 176, 63, 28, 112, 102, 121, 190,
  96, 198, 228, 196, 78, 38, 82, 37, 248, 42, 150, 115, 6, 10, 22, 101, 42, 237,
  175, 69, 232, 212, 231, 40, 193, 70, 211, 245, 106, 231, 175, 150, 88, 105,
  170, 139, 238, 196, 64, 218, 250, 47, 165, 22, 36, 196, 161, 30, 79, 175, 14,
  133, 88, 129, 182, 56, 140, 147, 168, 134, 91, 68, 172, 110, 195, 134, 156,
  68, 78, 249, 215, 68, 250, 11, 23, 70, 59, 156, 99, 75, 249, 159, 84, 16, 206,
  93, 16, 130, 34, 66, 210, 82, 252, 53, 251, 84, 59, 226, 212, 154, 15, 20,
  163, 58, 228, 109, 53, 214, 151, 237, 10, 169, 107, 180, 123, 174, 159, 182,
  8, 240, 115, 115, 220, 131, 128, 79, 80, 61, 133, 58, 24, 98, 193, 225, 56,
  36, 159, 254, 199, 49, 44, 160, 28, 81, 140, 163, 24, 143, 114, 31, 237, 235,
  250, 83, 72, 215, 44, 232, 182, 45, 39, 182, 193, 248, 65, 174, 186, 52, 219,
  30, 198, 48, 1, 134, 151, 81, 114, 38, 124, 7, 213, 205, 138, 28, 22, 216, 76,
  46, 224, 241, 88, 156, 7, 62, 23, 104, 34, 54, 25, 156, 93, 212, 133, 182, 61,
  93, 255, 195, 68, 244, 234, 53, 132, 151, 140, 72, 146, 127, 113, 227, 34,
  243, 218, 222, 47, 218, 113, 18, 173, 203, 158, 133, 90, 156, 214, 77, 20,
  113, 1, 231, 164, 52, 55, 69, 132, 24, 68, 131, 212, 7, 153, 34, 179, 113,
  156, 81, 127, 83, 57, 29, 195, 90, 64, 211, 115, 202, 188, 5, 42, 188, 142,
  203, 109, 231, 53, 206, 72, 220, 90, 23, 12, 1, 178, 122, 60, 221, 68, 6, 14,
  154, 108, 203, 171, 142, 159, 249, 13, 55, 52, 110, 214, 33, 147, 164, 181,
  50, 79, 164, 200, 83, 251, 40, 105, 223, 50, 0, 115, 240, 146, 23, 122, 80,
  204, 169, 38, 198, 154, 31, 29, 23, 236, 39, 35, 131, 147, 242, 163, 138, 158,
  236, 117, 7, 108, 33, 132, 98, 50, 111, 46, 146, 251, 82, 34, 85, 5, 130, 237,
  67, 40, 170, 235, 124, 92, 66, 71, 239, 12, 97, 136, 251, 1, 206, 13, 51, 232,
  92, 46, 35, 95, 5, 123, 24, 183, 99, 243, 124, 75, 155, 89, 66, 54, 72, 17,
  255, 99, 137, 199, 232, 204, 9, 248, 78, 35, 218, 136, 117, 239, 102, 240,
  187, 40, 89, 244, 140, 109, 229, 120, 116, 54, 207, 171, 11, 248, 190, 199,
  81, 53, 109, 8, 188, 51, 93, 165, 34, 255, 165, 191, 198, 130, 220, 41, 192,
  166, 194, 69, 104, 124, 158, 122, 236, 176, 24, 60, 87, 240, 42, 158, 143, 37,
  143, 208, 155, 249, 230, 21, 4, 230, 56, 194, 62, 235, 132, 14, 50, 180, 216,
  134, 28, 25, 159, 64, 199, 161, 236, 60, 233, 160, 172, 68, 169, 2, 5, 252,
  190, 20, 54, 115, 248, 63, 93, 107, 156, 8, 96, 85, 32, 189, 118, 66, 114,
  126, 64, 203, 97, 235, 13, 18, 102, 192, 51, 59, 5, 122, 171, 96, 129, 40, 32,
  154, 4, 191, 234, 75, 184, 112, 201, 244, 110, 50, 216, 44, 88, 139, 175, 58,
  112, 7, 52, 25, 64, 112, 40, 148, 187, 39, 234, 96, 151, 16, 158, 114, 113,
  109, 164, 47, 108, 94, 148, 35, 232, 221, 33, 110, 126, 170, 25, 234, 45, 165,
  180, 210, 193, 120, 247, 155, 127,
];

/*
Khóa ký đã mở bọc.
*/
let signingKey;

const signButton = document.querySelector(".pkcs8 .sign-button");

/*
Chuyển đổi một mảng giá trị byte thành một ArrayBuffer.
*/
function bytesToArrayBuffer(bytes) {
  const bytesAsArrayBuffer = new ArrayBuffer(bytes.length);
  const bytesUint8 = new Uint8Array(bytesAsArrayBuffer);
  bytesUint8.set(bytes);
  return bytesAsArrayBuffer;
}

/*
Lấy một số tài liệu khóa để sử dụng làm đầu vào cho phương thức deriveKey.
Tài liệu khóa là mật khẩu do người dùng cung cấp.
*/
function getKeyMaterial() {
  let password = window.prompt("Enter your password");
  let enc = new TextEncoder();
  return window.crypto.subtle.importKey(
    "raw",
    enc.encode(password),
    { name: "PBKDF2" },
    false,
    ["deriveBits", "deriveKey"],
  );
}

/*
Phái sinh một khóa AES-GCM bằng PBKDF2.
*/
async function getUnwrappingKey() {
  // 1. lấy tài liệu khóa (mật khẩu người dùng cung cấp)
  const keyMaterial = await getKeyMaterial();
  // 2. khởi tạo tham số salt.
  // Salt phải khớp với salt đã sử dụng ban đầu để phái sinh khóa.
  // Trong ví dụ này nó được cung cấp dưới dạng hằng số "saltBytes".
  const saltBuffer = bytesToArrayBuffer(saltBytes);
  // 3. phái sinh khóa từ tài liệu khóa và salt
  return window.crypto.subtle.deriveKey(
    {
      name: "PBKDF2",
      salt: saltBuffer,
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
Mở bọc một khóa riêng tư ký RSA-PSS từ một ArrayBuffer chứa các byte thô.
Nhận một mảng chứa các byte, và trả về một Promise
sẽ giải quyết thành một CryptoKey đại diện cho khóa riêng tư.
*/
async function unwrapPrivateKey(wrappedKey) {
  // 1. lấy khóa mở bọc
  const unwrappingKey = await getUnwrappingKey();
  // 2. khởi tạo khóa đã bọc
  const wrappedKeyBuffer = bytesToArrayBuffer(wrappedKey);
  // 3. khởi tạo iv
  const ivBuffer = bytesToArrayBuffer(ivBytes);
  // 4. mở bọc khóa
  return window.crypto.subtle.unwrapKey(
    "pkcs8", // import format
    wrappedKeyBuffer, // ArrayBuffer representing key to unwrap
    unwrappingKey, // CryptoKey representing key encryption key
    {
      // algorithm params for key encryption key
      name: "AES-GCM",
      iv: ivBuffer,
    },
    {
      // algorithm params for key to unwrap
      name: "RSA-PSS",
      hash: "SHA-256",
    },
    true, // extractability of key to unwrap
    ["sign"], // key usages for key to unwrap
  );
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`SubtleCrypto.importKey()`](/en-US/docs/Web/API/SubtleCrypto/importKey)
- [Định dạng PKCS #8](https://datatracker.ietf.org/doc/html/rfc5208).
- [Định dạng SubjectPublicKeyInfo](https://datatracker.ietf.org/doc/html/rfc5280#section-4.1).
- [Định dạng JSON Web Key](https://datatracker.ietf.org/doc/html/rfc7517).
- [Đặc tả kỹ thuật AES-KW](https://datatracker.ietf.org/doc/html/rfc3394).
