---
title: Number.isFinite()
short-title: isFinite()
slug: Web/JavaScript/Reference/Global_Objects/Number/isFinite
page-type: javascript-static-method
browser-compat: javascript.builtins.Number.isFinite
sidebar: jsref
---

Phương thức tĩnh **`Number.isFinite()`** xác định xem giá trị được truyền vào có phải là một số hữu hạn hay không — tức là, nó kiểm tra xem một giá trị nhất định có phải là số, và số đó không phải là {{jsxref("Infinity")}} dương, `Infinity` âm, hoặc {{jsxref("NaN")}}.

{{InteractiveExample("JavaScript Demo: Number.isFinite()")}}

```js interactive-example
console.log(Number.isFinite(1 / 0));
// Expected output: false

console.log(Number.isFinite(10 / 5));
// Expected output: true

console.log(Number.isFinite(0 / 0));
// Expected output: false
```

## Cú pháp

```js-nolint
Number.isFinite(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra tính hữu hạn.

### Giá trị trả về

Giá trị boolean `true` nếu giá trị đã cho là một số hữu hạn. Ngược lại là `false`.

## Ví dụ

### Sử dụng isFinite()

```js
Number.isFinite(Infinity); // false
Number.isFinite(NaN); // false
Number.isFinite(-Infinity); // false

Number.isFinite(0); // true
Number.isFinite(2e64); // true
```

### Sự khác biệt giữa Number.isFinite() và isFinite() toàn cục

So với hàm {{jsxref("isFinite()")}} toàn cục, phương thức này không chuyển đổi tham số sang số trước. Điều này có nghĩa là chỉ các giá trị kiểu number _và_ là hữu hạn mới trả về `true`, còn các giá trị không phải number luôn trả về `false`.

```js
isFinite("0"); // true; coerced to number 0
Number.isFinite("0"); // false
isFinite(null); // true; coerced to number 0
Number.isFinite(null); // false
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Number.isFinite` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- [es-shims polyfill của `Number.isFinite`](https://www.npmjs.com/package/number.isfinite)
- {{jsxref("Number")}}
- {{jsxref("isFinite()")}}
