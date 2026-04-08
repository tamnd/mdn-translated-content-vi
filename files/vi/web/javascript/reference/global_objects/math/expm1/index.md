---
title: Math.expm1()
short-title: expm1()
slug: Web/JavaScript/Reference/Global_Objects/Math/expm1
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.expm1
sidebar: jsref
---

Phương thức tĩnh **`Math.expm1()`** trả về [e](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E) lũy thừa của một số, trừ đi 1. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mrow><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚎𝚡𝚙𝚖𝟷</mo><mo stretchy="false">(</mo><mi>𝚡</mi><mo stretchy="false">)</mo></mrow><mo>=</mo><msup><mi mathvariant="normal">e</mi><mi>x</mi></msup><mo>−</mo><mn>1</mn></mrow><annotation encoding="TeX">\mathtt{\operatorname{Math.expm1}(x)} = \mathrm{e}^x - 1</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.expm1()")}}

```js interactive-example
console.log(Math.expm1(0));
// Expected output: 0

console.log(Math.expm1(1));
// Expected output: 1.718281828459045

console.log(Math.expm1(-1));
// Expected output: -0.6321205588285577

console.log(Math.expm1(2));
// Expected output: 6.38905609893065
```

## Cú pháp

```js-nolint
Math.expm1(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Một số biểu thị e<sup>x</sup> - 1, trong đó e là [cơ số của logarithm tự nhiên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E).

## Mô tả

Đối với các giá trị _x_ rất nhỏ, việc cộng thêm 1 có thể làm giảm hoặc mất độ chính xác. Số thực dấu phẩy động 64-bit dùng trong JS cho bạn khoảng 15 chữ số có nghĩa. 1 + 1e-15 \= 1.000000000000001, nhưng 1 + 1e-16 = 1.000000000000000 và chính xác là 1.0 trong phép tính đó, vì các chữ số sau 15 bị làm tròn.

<!-- prettier-ignore-start -->
Khi bạn tính <math><semantics><msup><mi mathvariant="normal">e</mi><mi>x</mi></msup><annotation encoding="TeX">\mathrm{e}^x</annotation></semantics></math>, trong đó x là số rất gần 0, bạn sẽ nhận được kết quả rất gần với 1 + x vì: <math><semantics><mrow><munder><mo lspace="0em" rspace="0em">lim</mo><mrow><mi>x</mi><mo stretchy="false">→</mo><mn>0</mn></mrow></munder><mfrac><mrow><msup><mi mathvariant="normal">e</mi><mi>x</mi></msup><mo>−</mo><mn>1</mn></mrow><mi>x</mi></mfrac><mo>=</mo><mn>1</mn></mrow><annotation encoding="TeX">\lim_{x \to 0} \frac{\mathrm{e}^x - 1}{x} = 1</annotation></semantics></math>. Nếu tính `Math.exp(1.1111111111e-15) - 1`, bạn sẽ nhận được kết quả gần `1.1111111111e-15`. Thay vào đó, do chữ số có nghĩa cao nhất trong kết quả của `Math.exp` là chữ số đơn vị `1`, giá trị cuối cùng là `1.1102230246251565e-15`, chỉ có 3 chữ số đúng. Nếu tính `Math.expm1(1.1111111111e-15)`, bạn sẽ nhận được kết quả chính xác hơn nhiều: `1.1111111111000007e-15`, với 11 chữ số đúng.
<!-- prettier-ignore-end -->

Vì `expm1()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.expm1()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.expm1()

```js
Math.expm1(-Infinity); // -1
Math.expm1(-1); // -0.6321205588285577
Math.expm1(-0); // -0
Math.expm1(0); // 0
Math.expm1(1); // 1.718281828459045
Math.expm1(Infinity); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.expm1` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- {{jsxref("Math.E")}}
- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.log10()")}}
- {{jsxref("Math.log1p()")}}
- {{jsxref("Math.log2()")}}
- {{jsxref("Math.pow()")}}
