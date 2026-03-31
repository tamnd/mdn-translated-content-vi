---
title: Math.log10()
short-title: log10()
slug: Web/JavaScript/Reference/Global_Objects/Math/log10
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.log10
sidebar: jsref
---

Phương thức tĩnh **`Math.log10()`** trả về logarithm cơ số 10 của một số. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>∀</mo><mi>x</mi><mo>&gt;</mo><mn>0</mn><mo>,</mo><mspace width="0.2777777777777778em"></mspace><mrow><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚕𝚘𝚐𝟷𝟶</mo><mo stretchy="false">(</mo><mi>𝚡</mi><mo stretchy="false">)</mo></mrow><mo>=</mo><msub><mo lspace="0em" rspace="0em">log</mo><mn>10</mn></msub><mo stretchy="false">(</mo><mi>x</mi><mo stretchy="false">)</mo><mo>=</mo><mtext>the unique&nbsp;</mtext><mi>y</mi><mtext>&nbsp;such that&nbsp;</mtext><msup><mn>10</mn><mi>y</mi></msup><mo>=</mo><mi>x</mi></mrow><annotation encoding="TeX">\forall x > 0,\;\mathtt{\operatorname{Math.log10}(x)} = \log_{10}(x) = \text{the unique } y \text{ such that } 10^y = x</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.log10()")}}

```js interactive-example
console.log(Math.log10(100000));
// Expected output: 5

console.log(Math.log10(2));
// Expected output: 0.3010299956639812

console.log(Math.log10(1));
// Expected output: 0

console.log(Math.log10(0));
// Expected output: -Infinity
```

## Cú pháp

```js-nolint
Math.log10(x)
```

### Tham số

- `x`
  - : Một số lớn hơn hoặc bằng 0.

### Giá trị trả về

Logarithm cơ số 10 của `x`. Nếu `x < 0`, trả về {{jsxref("NaN")}}.

## Mô tả

Vì `log10()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.log10()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

Hàm này tương đương với `Math.log(x) / Math.log(10)`. Để tính `log10(e)`, hãy dùng hằng số {{jsxref("Math.LOG10E")}}, bằng 1 / {{jsxref("Math.LN10")}}.

## Ví dụ

### Sử dụng Math.log10()

```js
Math.log10(-2); // NaN
Math.log10(-0); // -Infinity
Math.log10(0); // -Infinity
Math.log10(1); // 0
Math.log10(2); // 0.3010299956639812
Math.log10(100000); // 5
Math.log10(Infinity); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.log10` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- [es-shims polyfill of `Math.log10`](https://www.npmjs.com/package/math.log10)
- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.log1p()")}}
- {{jsxref("Math.log2()")}}
- {{jsxref("Math.pow()")}}
