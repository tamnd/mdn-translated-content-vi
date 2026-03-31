---
title: Uint8Array.prototype.setFromHex()
short-title: setFromHex()
slug: Web/JavaScript/Reference/Global_Objects/Uint8Array/setFromHex
page-type: javascript-instance-method
browser-compat: javascript.builtins.Uint8Array.setFromHex
sidebar: jsref
---

Phương thức **`setFromHex()`** của các instance {{jsxref("Uint8Array")}} điền vào đối tượng `Uint8Array` này các byte từ một chuỗi được mã hóa hex, trả về một đối tượng cho biết có bao nhiêu byte đã được đọc và ghi.

Phương thức này phân tích chuỗi thành một mảng byte. Để chuyển đổi chuỗi thành một số duy nhất, hãy dùng hàm {{jsxref("Global_Objects/parseInt", "parseInt()")}} với `radix` là `16` thay thế.

## Cú pháp

```js-nolint
setFromHex(string)
```

### Tham số

- `string`
  - : Một chuỗi thập lục phân mã hóa các byte cần ghi vào `Uint8Array`. Chuỗi phải:
    - Có số ký tự chẵn vì hai ký tự mã hóa một byte.
    - Chỉ chứa các ký tự trong bảng chữ cái thập lục phân, bao gồm 0–9 và A–F (không phân biệt hoa thường).
    - Không chứa khoảng trắng (khác với {{jsxref("Uint8Array.prototype.setFromBase64()")}}).

    Lưu ý rằng chuỗi chỉ được đọc đến điểm mà mảng đã đầy, vì vậy bất kỳ cú pháp hex không hợp lệ nào sau điểm đó đều bị bỏ qua.

### Giá trị trả về

Một đối tượng chứa các thuộc tính sau:

- `read`
  - : Số ký tự hex đã đọc từ chuỗi đầu vào. Nếu dữ liệu đã giải mã vừa với mảng, đây là độ dài của chuỗi đầu vào: ngược lại, đây là số ký tự hex hoàn chỉnh vừa với mảng.
- `written`
  - : Số byte đã ghi vào `Uint8Array`. Sẽ không bao giờ lớn hơn {{jsxref("TypedArray/byteLength", "byteLength")}} của `Uint8Array` này.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Ném ra nếu chuỗi đầu vào chứa các ký tự ngoài bảng chữ cái hex, hoặc độ dài của nó là số lẻ.
- {{jsxref("TypeError")}}
  - : Ném ra nếu chuỗi đầu vào không phải là chuỗi.

## Ví dụ

### Giải mã một chuỗi thập lục phân

Ví dụ này giải mã một chuỗi thập lục phân vào một `Uint8Array` đã có.

```js
const uint8Array = new Uint8Array(8);
const result = uint8Array.setFromHex("cafed00d");
console.log(result); // { read: 8, written: 4 }
console.log(uint8Array); // Uint8Array(8) [202, 254, 208, 13, 0, 0, 0, 0]
```

### Giải mã một chuỗi lớn vào một mảng nhỏ

Nếu chuỗi chứa nhiều dữ liệu hơn mảng có thể chứa, phương thức sẽ chỉ ghi số byte mà mảng có thể chứa.

```js
const uint8Array = new Uint8Array(4);
const result = uint8Array.setFromHex("cafed00d-some random stuff");
console.log(result); // { read: 8, written: 4 }
console.log(uint8Array); // Uint8Array(4) [202, 254, 208, 13]
```

Các ký tự thừa bị bỏ qua, ngay cả khi chúng không hợp lệ. Tuy nhiên tổng độ dài của chuỗi đầu vào phải là số chẵn.

### Đặt dữ liệu tại một offset cụ thể

Phương thức `setFromHex()` luôn bắt đầu ghi từ đầu `Uint8Array`. Nếu bạn muốn ghi vào giữa mảng, bạn có thể ghi vào một {{jsxref("TypedArray.prototype.subarray()")}} thay thế.

```js
const uint8Array = new Uint8Array(8);
// Bắt đầu ghi tại offset 2
const result = uint8Array.subarray(2).setFromHex("cafed00d");
console.log(result); // { read: 8, written: 4 }
console.log(uint8Array);
// Uint8Array(8) [0, 0, 202, 254, 208, 13, 0, 0]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint8Array.prototype.setFromHex` trong `core-js`](https://github.com/zloirock/core-js#uint8array-to--from-base64-and-hex)
- [es-shims polyfill của `Uint8Array.prototype.setFromHex`](https://www.npmjs.com/package/es-arraybuffer-base64)
- {{jsxref("Uint8Array")}}
- {{jsxref("Uint8Array.fromHex()")}}
- {{jsxref("Uint8Array.prototype.toHex()")}}
- {{jsxref("Global_Objects/parseInt", "parseInt()")}}
