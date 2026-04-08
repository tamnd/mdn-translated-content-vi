---
title: Uint8Array.prototype.toHex()
short-title: toHex()
slug: Web/JavaScript/Reference/Global_Objects/Uint8Array/toHex
page-type: javascript-instance-method
browser-compat: javascript.builtins.Uint8Array.toHex
sidebar: jsref
---

Phương thức **`toHex()`** của các instance {{jsxref("Uint8Array")}} trả về một chuỗi được mã hóa hex dựa trên dữ liệu trong đối tượng `Uint8Array` này.

Phương thức này tạo chuỗi từ một mảng byte. Để chuyển đổi từng số thành hex, hãy dùng phương thức {{jsxref("Number.prototype.toString()")}} với `radix` là `16` thay thế.

## Cú pháp

```js-nolint
toHex()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi mã hóa hex đại diện cho dữ liệu trong `Uint8Array`.

## Ví dụ

### Mã hóa dữ liệu nhị phân

Ví dụ này mã hóa dữ liệu từ `Uint8Array` thành chuỗi hex.

```js
const uint8Array = new Uint8Array([202, 254, 208, 13]);
console.log(uint8Array.toHex()); // "cafed00d"

const data = new Uint8Array([255, 0, 0, 0, 255, 0, 0, 0, 255]);
for (let i = 0; i < data.length; i += 3) {
  console.log(data.slice(i, i + 3).toHex());
}
// "ff0000"
// "00ff00"
// "0000ff"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint8Array.prototype.toHex` trong `core-js`](https://github.com/zloirock/core-js#uint8array-to--from-base64-and-hex)
- [es-shims polyfill của `Uint8Array.prototype.toHex`](https://www.npmjs.com/package/es-arraybuffer-base64)
- {{jsxref("Uint8Array")}}
- {{jsxref("Uint8Array.fromHex()")}}
- {{jsxref("Uint8Array.prototype.setFromHex()")}}
- {{jsxref("Number.prototype.toString()")}}
