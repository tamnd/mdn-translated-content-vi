---
title: Math.log()
short-title: log()
slug: Web/JavaScript/Reference/Global_Objects/Math/log
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.log
sidebar: jsref
---

Phương thức tĩnh **`Math.log()`** trả về logarithm tự nhiên (cơ số [e](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E)) của một số. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>∀</mo><mi>x</mi><mo>&gt;</mo><mn>0</mn><mo>,</mo><mspace width="0.2777777777777778em"></mspace><mrow><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚕𝚘𝚐</mo><mo stretchy="false">(</mo><mi>𝚡</mi><mo stretchy="false">)</mo></mrow><mo>=</mo><mo lspace="0em" rspace="0em">ln</mo><mo stretchy="false">(</mo><mi>x</mi><mo stretchy="false">)</mo><mo>=</mo><mtext>the unique&nbsp;</mtext><mi>y</mi><mtext>&nbsp;such that&nbsp;</mtext><msup><mi>e</mi><mi>y</mi></msup><mo>=</mo><mi>x</mi></mrow><annotation encoding="TeX">\forall x > 0,\;\mathtt{\operatorname{Math.log}(x)} = \ln(x) = \text{the unique } y \text{ such that } e^y = x</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.log()")}}

```js interactive-example
function getBaseLog(x, y) {
  return Math.log(y) / Math.log(x);
}

// 2 x 2 x 2 = 8
console.log(getBaseLog(2, 8));
// Expected output: 3

// 5 x 5 x 5 x 5 = 625
console.log(getBaseLog(5, 625));
// Expected output: 4
```

## Cú pháp

```js-nolint
Math.log(x)
```

### Tham số

- `x`
  - : Một số lớn hơn hoặc bằng 0.

### Giá trị trả về

Logarithm tự nhiên (cơ số [e](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E)) của `x`. Nếu `x` là ±0, trả về [`-Infinity`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/NEGATIVE_INFINITY). Nếu `x < 0`, trả về {{jsxref("NaN")}}.

## Mô tả

Vì `log()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.log()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

Nếu bạn cần logarithm tự nhiên của 2 hoặc 10, hãy dùng hằng số {{jsxref("Math.LN2")}} hoặc {{jsxref("Math.LN10")}}. Nếu cần logarithm cơ số 2 hoặc 10, hãy dùng {{jsxref("Math.log2()")}} hoặc {{jsxref("Math.log10()")}}. Nếu cần logarithm cơ số khác, hãy dùng `Math.log(x) / Math.log(otherBase)` như ví dụ bên dưới; bạn có thể tính trước `1 / Math.log(otherBase)` vì phép nhân trong `Math.log(x) * constant` nhanh hơn nhiều.

Lưu ý rằng các số dương rất gần 1 có thể bị mất độ chính xác và làm logarithm tự nhiên kém chính xác hơn. Trong trường hợp này, bạn nên dùng {{jsxref("Math.log1p")}} thay thế.

## Ví dụ

### Sử dụng Math.log()

```js
Math.log(-1); // NaN
Math.log(-0); // -Infinity
Math.log(0); // -Infinity
Math.log(1); // 0
Math.log(10); // 2.302585092994046
Math.log(Infinity); // Infinity
```

### Sử dụng Math.log() với cơ số khác

Hàm sau trả về logarithm của `y` theo cơ số `x` (tức là <math><semantics><mrow><msub><mo>log</mo><mi>x</mi></msub><mi>y</mi></mrow><annotation encoding="TeX">\log_x y</annotation></semantics></math>):

```js
function getBaseLog(x, y) {
  return Math.log(y) / Math.log(x);
}
```

Nếu chạy `getBaseLog(10, 1000)`, kết quả là `2.9999999999999996` do làm tròn số thực dấu phẩy động, nhưng vẫn rất gần với đáp án đúng là 3.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log1p()")}}
- {{jsxref("Math.log10()")}}
- {{jsxref("Math.log2()")}}
- {{jsxref("Math.pow()")}}
