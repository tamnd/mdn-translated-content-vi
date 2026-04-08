---
title: Number.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Number/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Number.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các giá trị {{jsxref("Number")}} trả về giá trị của số này.

{{InteractiveExample("JavaScript Demo: Number.prototype.valueOf()")}}

```js interactive-example
const numObj = new Number(42);
console.log(typeof numObj);
// Expected output: "object"

const num = numObj.valueOf();
console.log(num);
// Expected output: 42

console.log(typeof num);
// Expected output: "number"
```

## Cú pháp

```js-nolint
valueOf()
```

### Tham số

Không có.

### Giá trị trả về

Một số biểu diễn giá trị nguyên thủy của đối tượng {{jsxref("Number")}} được chỉ định.

## Mô tả

Phương thức này thường được JavaScript gọi nội bộ và không được gọi rõ ràng trong mã web.

## Ví dụ

### Sử dụng valueOf

```js
const numObj = new Number(10);
console.log(typeof numObj); // object

const num = numObj.valueOf();
console.log(num); // 10
console.log(typeof num); // number
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.valueOf()")}}
