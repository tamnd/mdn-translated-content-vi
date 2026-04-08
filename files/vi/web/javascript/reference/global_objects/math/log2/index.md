---
title: Math.log2()
short-title: log2()
slug: Web/JavaScript/Reference/Global_Objects/Math/log2
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.log2
sidebar: jsref
---

Phương thức tĩnh **`Math.log2()`** trả về logarithm cơ số 2 của một số. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>∀</mo><mi>x</mi><mo>&gt;</mo><mn>0</mn><mo>,</mo><mspace width="0.2777777777777778em"></mspace><mrow><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚕𝚘𝚐𝟸</mo><mo stretchy="false">(</mo><mi>𝚡</mi><mo stretchy="false">)</mo></mrow><mo>=</mo><msub><mo lspace="0em" rspace="0em">log</mo><mn>2</mn></msub><mo stretchy="false">(</mo><mi>x</mi><mo stretchy="false">)</mo><mo>=</mo><mtext>the unique&nbsp;</mtext><mi>y</mi><mtext>&nbsp;such that&nbsp;</mtext><msup><mn>2</mn><mi>y</mi></msup><mo>=</mo><mi>x</mi></mrow><annotation encoding="TeX">\forall x > 0,\;\mathtt{\operatorname{Math.log2}(x)} = \log_2(x) = \text{the unique } y \text{ such that } 2^y = x</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.log2()")}}

```js interactive-example
console.log(Math.log2(3));
// Expected output: 1.584962500721156

console.log(Math.log2(2));
// Expected output: 1

console.log(Math.log2(1));
// Expected output: 0

console.log(Math.log2(0));
// Expected output: -Infinity
```

## Cú pháp

```js-nolint
Math.log2(x)
```

### Tham số

- `x`
  - : Một số lớn hơn hoặc bằng 0.

### Giá trị trả về

Logarithm cơ số 2 của `x`. Nếu `x < 0`, trả về {{jsxref("NaN")}}.

## Mô tả

Vì `log2()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.log2()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

Hàm này tương đương với `Math.log(x) / Math.log(2)`. Để tính `log2(e)`, hãy dùng hằng số {{jsxref("Math.LOG2E")}}, bằng 1 / {{jsxref("Math.LN2")}}.

## Ví dụ

### Sử dụng Math.log2()

```js
Math.log2(-2); // NaN
Math.log2(-0); // -Infinity
Math.log2(0); // -Infinity
Math.log2(1); // 0
Math.log2(2); // 1
Math.log2(3); // 1.584962500721156
Math.log2(1024); // 10
Math.log2(Infinity); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.log2` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.log10()")}}
- {{jsxref("Math.log1p()")}}
- {{jsxref("Math.pow()")}}
