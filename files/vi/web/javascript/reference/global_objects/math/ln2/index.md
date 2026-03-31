---
title: Math.LN2
short-title: LN2
slug: Web/JavaScript/Reference/Global_Objects/Math/LN2
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Math.LN2
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Math.LN2`** biểu thị logarithm tự nhiên của 2, xấp xỉ 0.693:

{{InteractiveExample("JavaScript Demo: Math.LN2", "shorter")}}

```js interactive-example
function getNatLog2() {
  return Math.LN2;
}

console.log(getNatLog2());
// Expected output: 0.6931471805599453
```

## Giá trị

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>𝙼𝚊𝚝𝚑.𝙻𝙽𝟸</mi><mo>=</mo><mo lspace="0em" rspace="0em">ln</mo><mo stretchy="false">(</mo><mn>2</mn><mo stretchy="false">)</mo><mo>≈</mo><mn>0.693</mn></mrow><annotation encoding="TeX">\mathtt{Math.LN2} = \ln(2) \approx 0.693</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Vì `LN2` là thuộc tính tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.LN2`, thay vì là thuộc tính của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.LN2

Hàm sau trả về logarithm tự nhiên của 2:

```js
function getNatLog2() {
  return Math.LN2;
}

getNatLog2(); // 0.6931471805599453
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.log2()")}}
