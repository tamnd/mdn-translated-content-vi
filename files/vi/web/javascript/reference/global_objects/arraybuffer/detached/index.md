---
title: ArrayBuffer.prototype.detached
short-title: detached
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/detached
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.ArrayBuffer.detached
sidebar: jsref
---

Thuộc tính accessor **`detached`** của các instance {{jsxref("ArrayBuffer")}} trả về một giá trị boolean cho biết liệu buffer này đã bị tách ra (transferred) hay chưa.

## Mô tả

Thuộc tính `detached` là một thuộc tính accessor mà hàm set accessor của nó là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị là `false` khi `ArrayBuffer` được tạo lần đầu. Giá trị trở thành `true` nếu `ArrayBuffer` được [transferred](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer#transferring_arraybuffers), điều này tách instance ra khỏi bộ nhớ cơ bản của nó. Khi một buffer bị tách ra, nó không còn có thể sử dụng được nữa.

## Ví dụ

### Sử dụng detached

```js
const buffer = new ArrayBuffer(8);
console.log(buffer.detached); // false
const newBuffer = buffer.transfer();
console.log(buffer.detached); // true
console.log(newBuffer.detached); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `ArrayBuffer.prototype.detached` in `core-js`](https://github.com/zloirock/core-js#arraybufferprototypetransfer-and-friends)
- [es-shims polyfill of `ArrayBuffer.prototype.detached`](https://www.npmjs.com/package/arraybuffer.prototype.detached)
- {{jsxref("ArrayBuffer")}}
- {{jsxref("ArrayBuffer.prototype.transfer()")}}
- {{jsxref("ArrayBuffer.prototype.transferToFixedLength()")}}
