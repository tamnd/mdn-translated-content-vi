---
title: BigInt.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/BigInt/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.BigInt.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các giá trị {{jsxref("BigInt")}} trả về giá trị nguyên thủy được bao bọc của một đối tượng {{jsxref("BigInt")}}.

{{InteractiveExample("JavaScript Demo: BigInt.prototype.valueOf()", "shorter")}}

```js interactive-example
console.log(typeof Object(1n));
// Expected output: "object"

console.log(typeof Object(1n).valueOf());
// Expected output: "bigint"
```

## Cú pháp

```js-nolint
valueOf()
```

### Tham số

Không có.

### Giá trị trả về

Một BigInt đại diện cho giá trị nguyên thủy của đối tượng {{jsxref("BigInt")}} đã chỉ định.

## Ví dụ

### Sử dụng `valueOf`

```js
typeof Object(1n); // object
typeof Object(1n).valueOf(); // bigint
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("BigInt.prototype.toString()")}}
