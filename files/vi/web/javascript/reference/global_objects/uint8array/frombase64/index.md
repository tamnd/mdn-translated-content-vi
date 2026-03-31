---
title: Uint8Array.fromBase64()
short-title: fromBase64()
slug: Web/JavaScript/Reference/Global_Objects/Uint8Array/fromBase64
page-type: javascript-static-method
browser-compat: javascript.builtins.Uint8Array.fromBase64
sidebar: jsref
---

Phương thức tĩnh **`Uint8Array.fromBase64()`** tạo một đối tượng {{jsxref("Uint8Array")}} mới từ một chuỗi được mã hóa [base64](/en-US/docs/Glossary/Base64).

Nên ưu tiên dùng phương thức này thay vì {{domxref("Window.atob()")}} vì nó trả về một mảng byte, dễ làm việc hơn so với chuỗi chứa các byte thô, trừ khi dữ liệu nhị phân đã giải mã thực sự là văn bản ASCII. Nếu bạn đã có một array buffer được cấp phát và muốn điền vào đó, hãy dùng phương thức instance {{jsxref("Uint8Array.prototype.setFromBase64()")}} thay thế.

## Cú pháp

```js-nolint
Uint8Array.fromBase64(string)
Uint8Array.fromBase64(string, options)
```

### Tham số

- `string`
  - : Một chuỗi base64 mã hóa các byte cần chuyển đổi thành `Uint8Array`. Chuỗi chỉ được chứa các ký tự trong bảng chữ cái base64, bao gồm A–Z, a–z, 0–9 và hai ký tự đặc biệt là `+` và `/` (nếu dùng `alphabet: "base64"` trong `options`) hoặc `-` và `_` (nếu dùng `alphabet: "base64url"` trong `options`). Chuỗi có thể có ký tự đệm `=` ở cuối. Mọi ký tự khoảng trắng ASCII trong chuỗi đều bị bỏ qua.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chỉnh quá trình giải mã chuỗi base64. Có thể chứa các thuộc tính sau:
    - `alphabet` {{optional_inline}}
      - : Một chuỗi chỉ định bảng chữ cái base64 sử dụng. Có thể là một trong các giá trị sau:
        - `"base64"` (mặc định)
          - : Chấp nhận đầu vào được mã hóa bằng bảng chữ cái base64 tiêu chuẩn, sử dụng `+` và `/`.
        - `"base64url"`
          - : Chấp nhận đầu vào được mã hóa bằng bảng chữ cái base64 an toàn cho URL, sử dụng `-` và `_`.
    - `lastChunkHandling` {{optional_inline}}
      - : Một chuỗi chỉ định cách xử lý đoạn cuối của chuỗi base64. Do mỗi 4 ký tự trong base64 mã hóa 3 byte, chuỗi được chia thành các đoạn 4 ký tự. Nếu đoạn cuối có ít hơn 4 ký tự, cần xử lý khác. Có thể là một trong các giá trị sau:
        - `"loose"` (mặc định)
          - : Đoạn cuối có thể là 2 hoặc 3 ký tự base64, hoặc đúng 4 ký tự với ký tự đệm `=`. Đoạn cuối được giải mã và thêm vào kết quả.
        - `"strict"`
          - : Đoạn cuối phải đúng 4 ký tự với ký tự đệm `=`. Ngoài ra, [bit tràn](/en-US/docs/Glossary/Base64#last_chunk) (các bit thừa từ ký tự base64 cuối không đại diện cho dữ liệu nào) phải là 0. Đoạn cuối được giải mã và thêm vào kết quả.
        - `"stop-before-partial"`
          - : Nếu đoạn cuối đúng 4 ký tự với ký tự đệm `=`, nó được giải mã và thêm vào kết quả. Ngược lại, đoạn cuối không đầy đủ bị bỏ qua (nhưng nếu nó chứa một ký tự base64 theo sau bởi `=`, thì vẫn ném ra lỗi cú pháp). Điều này hữu ích khi chuỗi đến từ một luồng và đoạn cuối chưa hoàn chỉnh. Để biết có bao nhiêu ký tự đầu vào đã được đọc, hãy dùng {{jsxref("Uint8Array.prototype.setFromBase64()")}} thay thế (trang liên kết cũng có ví dụ về giải mã luồng sử dụng `"stop-before-partial"`).

### Giá trị trả về

Một đối tượng `Uint8Array` mới chứa các byte đã được giải mã từ chuỗi mã hóa base64.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Ném ra nếu chuỗi đầu vào chứa các ký tự ngoài bảng chữ cái được chỉ định, hoặc nếu đoạn cuối không thỏa mãn tùy chọn `lastChunkHandling`.
- {{jsxref("TypeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - Chuỗi đầu vào không phải là chuỗi.
    - Đối tượng `options` không phải là object hoặc `undefined`.
    - Các tùy chọn không có giá trị mong đợi hoặc `undefined`.

## Ví dụ

### Giải mã một chuỗi base64

Ví dụ này sử dụng các tùy chọn `alphabet` và `lastChunkHandling` mặc định để giải mã một chuỗi base64. Lưu ý rằng:

- Khoảng trắng trong chuỗi bị bỏ qua.
- Chuỗi có 14 ký tự base64, không phải bội số của 4. Điều này chỉ hợp lệ và có thể giải mã với `lastChunkHandling: "loose"`.
- Đoạn cuối, `Ph`, kết thúc bằng ký tự `h` là `0b100001` trong base64, nên 4 bit cuối `0001` là "bit tràn" và bị bỏ qua. Điều này chỉ hợp lệ và có thể giải mã với `lastChunkHandling: "loose"`.

```js
const uint8Array = Uint8Array.fromBase64("PGI+ TURO PC9i Ph");
console.log(uint8Array); // Uint8Array(10) [60, 98, 62, 77, 68, 78, 60, 47, 98, 62]
```

### Giải mã một chuỗi base64 an toàn cho URL

Ví dụ này sử dụng tùy chọn `alphabet` để giải mã một chuỗi base64 an toàn cho URL.

```js
const uint8Array = Uint8Array.fromBase64("PGI-TUROPC9iPg", {
  alphabet: "base64url",
});
console.log(uint8Array); // Uint8Array(10) [60, 98, 62, 77, 68, 78, 60, 47, 98, 62]
```

### Giải mã chuỗi base64 với xử lý đoạn cuối nghiêm ngặt

Ví dụ này sử dụng tùy chọn `lastChunkHandling` để giải mã một chuỗi base64, trong đó đoạn cuối phải đúng 4 ký tự với ký tự đệm `=` và các bit tràn phải là 0.

```js
const array1 = Uint8Array.fromBase64("PGI+ TURO PC9i Pg==", {
  lastChunkHandling: "strict",
});
console.log(array1); // Uint8Array(10) [60, 98, 62, 77, 68, 78, 60, 47, 98, 62]

const array2 = Uint8Array.fromBase64("PGI+ TURO PC9i Ph==", {
  lastChunkHandling: "strict",
});
// Ném ra SyntaxError vì h là 0b100001, trong đó 4 bit cuối không phải là 0

const array3 = Uint8Array.fromBase64("PGI+ TURO PC9i Pg", {
  lastChunkHandling: "strict",
});
// Ném ra SyntaxError vì đoạn cuối không đúng 4 ký tự
```

### Giải mã chuỗi base64 với xử lý đoạn cuối không đầy đủ

Ví dụ này sử dụng tùy chọn `lastChunkHandling` để giải mã một chuỗi base64, bỏ qua bất kỳ đoạn cuối không đầy đủ nào.

```js
// Đoạn cuối hoàn chỉnh
const array1 = Uint8Array.fromBase64("PGI+ TURO PC9i", {
  lastChunkHandling: "stop-before-partial",
});
console.log(array1); // Uint8Array(9) [60, 98, 62, 77, 68, 78, 60, 47, 98]

// Đoạn cuối cũng hoàn chỉnh với phần đệm
const array2 = Uint8Array.fromBase64("PGI+ TURO PC9i Pg==", {
  lastChunkHandling: "stop-before-partial",
});
console.log(array2); // Uint8Array(10) [60, 98, 62, 77, 68, 78, 60, 47, 98, 62]

// Đoạn cuối không đầy đủ; bị bỏ qua
const array3 = Uint8Array.fromBase64("PGI+ TURO PC9i Pg", {
  lastChunkHandling: "stop-before-partial",
});
console.log(array3); // Uint8Array(9) [60, 98, 62, 77, 68, 78, 60, 47, 98]

// Đoạn cuối không đầy đủ với phần đệm; vẫn bị bỏ qua
const array4 = Uint8Array.fromBase64("PGI+ TURO PC9i Pg=", {
  lastChunkHandling: "stop-before-partial",
});
console.log(array4); // Uint8Array(9) [60, 98, 62, 77, 68, 78, 60, 47, 98]

// Đoạn cuối không đầy đủ, nhưng chứa một ký tự base64 theo sau bởi `=`
const array5 = Uint8Array.fromBase64("PGI+ TURO PC9i P=", {
  lastChunkHandling: "stop-before-partial",
});
// Ném ra SyntaxError vì đây không thể là phần của chuỗi base64 hợp lệ
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint8Array.fromBase64` trong `core-js`](https://github.com/zloirock/core-js#uint8array-to--from-base64-and-hex)
- [es-shims polyfill của `Uint8Array.fromBase64`](https://www.npmjs.com/package/es-arraybuffer-base64)
- {{jsxref("Uint8Array")}}
- {{jsxref("Uint8Array.prototype.setFromBase64()")}}
- {{jsxref("Uint8Array.prototype.toBase64()")}}
- {{domxref("Window.atob()")}}
