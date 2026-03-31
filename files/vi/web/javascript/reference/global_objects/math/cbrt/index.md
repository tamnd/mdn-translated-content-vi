---
title: Math.cbrt()
short-title: cbrt()
slug: Web/JavaScript/Reference/Global_Objects/Math/cbrt
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.cbrt
sidebar: jsref
---

Phương thức tĩnh **`Math.cbrt()`** trả về căn bậc ba của một số. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mrow><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚌𝚋𝚛𝚝</mo><mo stretchy="false">(</mo><mi>𝚡</mi><mo stretchy="false">)</mo></mrow><mo>=</mo><mroot><mi>x</mi><mn>3</mn></mroot><mo>=</mo><mtext>the unique&nbsp;</mtext><mi>y</mi><mtext>&nbsp;such that&nbsp;</mtext><msup><mi>y</mi><mn>3</mn></msup><mo>=</mo><mi>x</mi></mrow><annotation encoding="TeX">\mathtt{\operatorname{Math.cbrt}(x)} = \sqrt[3]{x} = \text{the unique } y \text{ such that } y^3 = x</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.cbrt()")}}

```js interactive-example
console.log(Math.cbrt(-1));
// Expected output: -1

console.log(Math.cbrt(1));
// Expected output: 1

console.log(Math.cbrt(Infinity));
// Expected output: Infinity

console.log(Math.cbrt(64));
// Expected output: 4
```

## Cú pháp

```js-nolint
Math.cbrt(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Căn bậc ba của `x`.

## Mô tả

Vì `cbrt()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.cbrt()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.cbrt()

```js
Math.cbrt(-Infinity); // -Infinity
Math.cbrt(-1); // -1
Math.cbrt(-0); // -0
Math.cbrt(0); // 0
Math.cbrt(1); // 1
Math.cbrt(2); // 1.2599210498948732
Math.cbrt(Infinity); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.cbrt` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- [es-shims polyfill of `Math.cbrt`](https://www.npmjs.com/package/math.cbrt)
- {{jsxref("Math.pow()")}}
- {{jsxref("Math.sqrt()")}}
