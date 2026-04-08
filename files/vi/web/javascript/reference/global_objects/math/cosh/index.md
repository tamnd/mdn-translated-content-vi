---
title: Math.cosh()
short-title: cosh()
slug: Web/JavaScript/Reference/Global_Objects/Math/cosh
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.cosh
sidebar: jsref
---

Phương thức tĩnh **`Math.cosh()`** trả về cosine hyperbolic của một số. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mrow><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚌𝚘𝚜𝚑</mo><mo stretchy="false">(</mo><mi>𝚡</mi><mo stretchy="false">)</mo></mrow><mo>=</mo><mo lspace="0em" rspace="0em">cosh</mo><mo stretchy="false">(</mo><mi>x</mi><mo stretchy="false">)</mo><mo>=</mo><mfrac><mrow><msup><mi mathvariant="normal">e</mi><mi>x</mi></msup><mo>+</mo><msup><mi mathvariant="normal">e</mi><mrow><mo>−</mo><mi>x</mi></mrow></msup></mrow><mn>2</mn></mfrac></mrow><annotation encoding="TeX">\mathtt{\operatorname{Math.cosh}(x)} = \cosh(x) = \frac{\mathrm{e}^x + \mathrm{e}^{-x}}{2}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.cosh()")}}

```js interactive-example
console.log(Math.cosh(0));
// Expected output: 1

console.log(Math.cosh(1));
// Expected output: 1.543080634815244 (approximately)

console.log(Math.cosh(-1));
// Expected output: 1.543080634815244 (approximately)

console.log(Math.cosh(2));
// Expected output: 3.7621956910836314
```

## Cú pháp

```js-nolint
Math.cosh(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Cosine hyperbolic của `x`.

## Mô tả

Vì `cosh()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.cosh()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.cosh()

```js
Math.cosh(-Infinity); // Infinity
Math.cosh(-1); // 1.5430806348152437
Math.cosh(-0); // 1
Math.cosh(0); // 1
Math.cosh(1); // 1.5430806348152437
Math.cosh(Infinity); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.cosh` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- [es-shims polyfill of `Math.cosh`](https://www.npmjs.com/package/math.cosh)
- {{jsxref("Math.acosh()")}}
- {{jsxref("Math.asinh()")}}
- {{jsxref("Math.atanh()")}}
- {{jsxref("Math.sinh()")}}
- {{jsxref("Math.tanh()")}}
