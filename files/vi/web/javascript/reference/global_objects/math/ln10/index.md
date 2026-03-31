---
title: Math.LN10
short-title: LN10
slug: Web/JavaScript/Reference/Global_Objects/Math/LN10
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Math.LN10
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Math.LN10`** biểu thị logarithm tự nhiên của 10, xấp xỉ 2.303.

{{InteractiveExample("JavaScript Demo: Math.LN10", "shorter")}}

```js interactive-example
function getNatLog10() {
  return Math.LN10;
}

console.log(getNatLog10());
// Expected output: 2.302585092994046
```

## Giá trị

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>𝙼𝚊𝚝𝚑.𝙻𝙽𝟷𝟶</mi><mo>=</mo><mo lspace="0em" rspace="0em">ln</mo><mo stretchy="false">(</mo><mn>10</mn><mo stretchy="false">)</mo><mo>≈</mo><mn>2.303</mn></mrow><annotation encoding="TeX">\mathtt{Math.LN10} = \ln(10) \approx 2.303</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Vì `LN10` là thuộc tính tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.LN10`, thay vì là thuộc tính của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.LN10

Hàm sau trả về logarithm tự nhiên của 10:

```js
function getNatLog10() {
  return Math.LN10;
}

getNatLog10(); // 2.302585092994046
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.log10()")}}
