---
title: Boolean.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Boolean/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Boolean.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các giá trị {{jsxref("Boolean")}} trả về giá trị nguyên thủy của một đối tượng {{jsxref("Boolean")}}.

{{InteractiveExample("JavaScript Demo: Boolean.prototype.valueOf()")}}

```js interactive-example
const x = new Boolean();

console.log(x.valueOf());
// Expected output: false

const y = new Boolean("Mozilla");

console.log(y.valueOf());
// Expected output: true
```

## Cú pháp

```js-nolint
valueOf()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị nguyên thủy của đối tượng {{jsxref("Boolean")}} đã cho.

## Mô tả

Phương thức `valueOf()` của {{jsxref("Boolean")}} trả về giá trị nguyên thủy của một đối tượng `Boolean` hoặc `Boolean` literal dưới dạng kiểu dữ liệu Boolean.

Phương thức này thường được JavaScript gọi nội bộ và không được gọi rõ ràng trong mã.

## Ví dụ

### Sử dụng `valueOf()`

```js
const x = new Boolean();
const myVar = x.valueOf(); // assigns false to myVar
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.valueOf()")}}
