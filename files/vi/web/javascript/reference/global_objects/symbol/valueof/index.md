---
title: Symbol.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Symbol/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Symbol.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các giá trị {{jsxref("Symbol")}} trả về giá trị symbol này.

{{InteractiveExample("JavaScript Demo: Symbol.prototype.valueOf()")}}

```js interactive-example
const symbol = Symbol("foo");

console.log(typeof Object(symbol));
// Expected output: "object"

console.log(typeof Object(symbol).valueOf());
// Expected output: "symbol"
```

## Cú pháp

```js-nolint
valueOf()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị nguyên thủy của đối tượng {{jsxref("Symbol")}} đã chỉ định.

## Mô tả

Phương thức `valueOf()` của {{jsxref("Symbol")}} trả về giá trị nguyên thủy của một đối tượng Symbol dưới dạng kiểu dữ liệu Symbol.

JavaScript gọi phương thức `valueOf()` để chuyển đổi một đối tượng thành giá trị nguyên thủy. Bạn hiếm khi cần tự gọi phương thức `valueOf()`; JavaScript tự động gọi nó khi gặp một đối tượng mà một giá trị nguyên thủy được mong đợi.

## Ví dụ

### Sử dụng valueOf()

```js
const sym = Symbol("example");
sym === sym.valueOf(); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.valueOf()")}}
