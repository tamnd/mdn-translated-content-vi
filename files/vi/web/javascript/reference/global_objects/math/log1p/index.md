---
title: Math.log1p()
short-title: log1p()
slug: Web/JavaScript/Reference/Global_Objects/Math/log1p
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.log1p
sidebar: jsref
---

Phương thức tĩnh **`Math.log1p()`** trả về logarithm tự nhiên (cơ số [e](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E)) của `1 + x`, trong đó `x` là đối số. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>∀</mo><mi>x</mi><mo>&gt;</mo><mo>−</mo><mn>1</mn><mo>,</mo><mspace width="0.2777777777777778em"></mspace><mrow><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚕𝚘𝚐𝟷𝚙</mo><mo stretchy="false">(</mo><mi>𝚡</mi><mo stretchy="false">)</mo></mrow><mo>=</mo><mo lspace="0em" rspace="0em">ln</mo><mo stretchy="false">(</mo><mn>1</mn><mo>+</mo><mi>x</mi><mo stretchy="false">)</mo></mrow><annotation encoding="TeX">\forall x > -1,\;\mathtt{\operatorname{Math.log1p}(x)} = \ln(1 + x)</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.log1p()")}}

```js interactive-example
console.log(Math.log1p(1));
// Expected output: 0.6931471805599453

console.log(Math.log1p(0));
// Expected output: 0

console.log(Math.log1p(-1));
// Expected output: -Infinity

console.log(Math.log1p(-2));
// Expected output: NaN
```

## Cú pháp

```js-nolint
Math.log1p(x)
```

### Tham số

- `x`
  - : Một số lớn hơn hoặc bằng -1.

### Giá trị trả về

Logarithm tự nhiên (cơ số [e](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E)) của `x + 1`. Nếu `x` bằng -1, trả về [`-Infinity`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/NEGATIVE_INFINITY). Nếu `x < -1`, trả về {{jsxref("NaN")}}.

## Mô tả

Đối với các giá trị _x_ rất nhỏ, việc cộng thêm 1 có thể làm giảm hoặc mất độ chính xác. Số thực dấu phẩy động 64-bit dùng trong JS cho bạn khoảng 15 chữ số có nghĩa. 1 + 1e-15 \= 1.000000000000001, nhưng 1 + 1e-16 = 1.000000000000000 và chính xác là 1.0 trong phép tính đó, vì các chữ số sau 15 bị làm tròn.

<!-- prettier-ignore-start -->
Khi tính log(1 + _x_), trong đó _x_ là số dương nhỏ, bạn sẽ nhận được kết quả rất gần _x_ vì: <math><semantics><mrow><munder><mo movablelimits="true" form="prefix">lim</mo><mrow ><mi>x</mi><mo stretchy="false">→</mo><mn>0</mn></mrow></munder><mfrac><mrow><mi>log</mi><mo>⁡</mo><mo stretchy="false">(</mo><mn>1</mn><mo>+</mo><mi>x</mi><mo stretchy="false">)</mo></mrow><mi>x</mi></mfrac><mo>=</mo><mn>1</mn></mrow><annotation encoding="TeX">\lim_{x \to 0} \frac{\log(1+x)}{x} = 1</annotation></semantics></math>. Nếu tính `Math.log(1 + 1.1111111111e-15)`, bạn sẽ nhận được kết quả gần `1.1111111111e-15`. Thay vào đó, bạn sẽ tính logarithm của `1.00000000000000111022` (làm tròn ở hệ nhị phân), và nhận được `1.11022…e-15`, chỉ có 3 chữ số đúng. Nếu tính `Math.log1p(1.1111111111e-15)`, bạn sẽ nhận được kết quả chính xác hơn nhiều: `1.1111111110999995e-15`, với 15 chữ số đúng (thực ra là 16 trong trường hợp này).
<!-- prettier-ignore-end -->

Nếu giá trị của `x` nhỏ hơn -1, giá trị trả về luôn là {{jsxref("NaN")}}.

Vì `log1p()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.log1p()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.log1p()

```js
Math.log1p(-2); // NaN
Math.log1p(-1); // -Infinity
Math.log1p(-0); // -0
Math.log1p(0); // 0
Math.log1p(1); // 0.6931471805599453
Math.log1p(Infinity); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.log1p` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- [es-shims polyfill of `Math.log1p`](https://www.npmjs.com/package/math.log1p)
- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.expm1()")}}
- {{jsxref("Math.log10()")}}
- {{jsxref("Math.log2()")}}
- {{jsxref("Math.pow()")}}
