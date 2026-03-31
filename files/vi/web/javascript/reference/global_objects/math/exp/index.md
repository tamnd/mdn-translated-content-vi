---
title: Math.exp()
short-title: exp()
slug: Web/JavaScript/Reference/Global_Objects/Math/exp
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.exp
sidebar: jsref
---

Phương thức tĩnh **`Math.exp()`** trả về [e](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E) lũy thừa của một số. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mrow><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚎𝚡𝚙</mo><mo stretchy="false">(</mo><mi>𝚡</mi><mo stretchy="false">)</mo></mrow><mo>=</mo><msup><mi mathvariant="normal">e</mi><mi>x</mi></msup></mrow><annotation encoding="TeX">\mathtt{\operatorname{Math.exp}(x)} = \mathrm{e}^x</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.exp()")}}

```js interactive-example
console.log(Math.exp(0));
// Expected output: 1

console.log(Math.exp(1));
// Expected output: 2.718281828459 (approximately)

console.log(Math.exp(-1));
// Expected output: 0.36787944117144233

console.log(Math.exp(2));
// Expected output: 7.38905609893065
```

## Cú pháp

```js-nolint
Math.exp(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Số không âm biểu thị e<sup>x</sup>, trong đó e là [cơ số của logarithm tự nhiên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E).

## Mô tả

Vì `exp()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.exp()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

Lưu ý rằng `e` lũy thừa của một số rất gần 0 sẽ rất gần 1 và có thể mất độ chính xác. Trong trường hợp này, bạn nên dùng {{jsxref("Math.expm1")}} thay thế để có phần thập phân chính xác hơn.

## Ví dụ

### Sử dụng Math.exp()

```js
Math.exp(-Infinity); // 0
Math.exp(-1); // 0.36787944117144233
Math.exp(0); // 1
Math.exp(1); // 2.718281828459045
Math.exp(Infinity); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.E")}}
- {{jsxref("Math.expm1()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.log10()")}}
- {{jsxref("Math.log1p()")}}
- {{jsxref("Math.log2()")}}
- {{jsxref("Math.pow()")}}
