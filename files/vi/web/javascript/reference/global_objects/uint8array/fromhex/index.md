---
title: Uint8Array.fromHex()
short-title: fromHex()
slug: Web/JavaScript/Reference/Global_Objects/Uint8Array/fromHex
page-type: javascript-static-method
browser-compat: javascript.builtins.Uint8Array.fromHex
sidebar: jsref
---

Phương thức tĩnh **`Uint8Array.fromHex()`** tạo một đối tượng {{jsxref("Uint8Array")}} mới từ một chuỗi thập lục phân.

Phương thức này phân tích chuỗi thành một mảng byte. Để chuyển đổi chuỗi thành một số duy nhất, hãy dùng hàm {{jsxref("Global_Objects/parseInt", "parseInt()")}} với `radix` là `16` thay thế.

## Cú pháp

```js-nolint
Uint8Array.fromHex(string)
```

### Tham số

- `string`
  - : Một chuỗi thập lục phân mã hóa các byte cần chuyển đổi thành `Uint8Array`. Chuỗi phải:
    - Có số ký tự chẵn vì hai ký tự mã hóa một byte.
    - Chỉ chứa các ký tự trong bảng chữ cái thập lục phân, bao gồm 0–9 và A–F (không phân biệt hoa thường).
    - Không chứa khoảng trắng (khác với {{jsxref("Uint8Array.prototype.setFromBase64()")}}).

### Giá trị trả về

Một đối tượng `Uint8Array` mới chứa các byte đã được giải mã từ chuỗi thập lục phân.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Ném ra nếu chuỗi đầu vào chứa các ký tự ngoài bảng chữ cái hex, hoặc độ dài của nó là số lẻ.
- {{jsxref("TypeError")}}
  - : Ném ra nếu chuỗi đầu vào không phải là chuỗi.

## Ví dụ

### Giải mã một chuỗi thập lục phân

Ví dụ này giải mã một chuỗi thập lục phân thành `Uint8Array`.

```js
const hexString = "cafed00d";
const bytes = Uint8Array.fromHex(hexString);
console.log(bytes); // Uint8Array [ 202, 254, 208, 13 ]
```

Các ký tự viết hoa cũng được hỗ trợ:

```js
const hexString = "CAFEd00d";
const bytes = Uint8Array.fromHex(hexString);
console.log(bytes); // Uint8Array [ 202, 254, 208, 13 ]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint8Array.fromHex` trong `core-js`](https://github.com/zloirock/core-js#uint8array-to--from-base64-and-hex)
- [es-shims polyfill của `Uint8Array.fromHex`](https://www.npmjs.com/package/es-arraybuffer-base64)
- {{jsxref("Uint8Array")}}
- {{jsxref("Uint8Array.prototype.setFromHex()")}}
- {{jsxref("Uint8Array.prototype.toHex()")}}
- {{jsxref("Global_Objects/parseInt", "parseInt()")}}
