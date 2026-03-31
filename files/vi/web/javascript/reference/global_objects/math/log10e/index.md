---
title: Math.LOG10E
short-title: LOG10E
slug: Web/JavaScript/Reference/Global_Objects/Math/LOG10E
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Math.LOG10E
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Math.LOG10E`** biểu thị logarithm cơ số 10 của [e](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E), xấp xỉ 0.434.

{{InteractiveExample("JavaScript Demo: Math.LOG10E", "shorter")}}

```js interactive-example
function getLog10e() {
  return Math.LOG10E;
}

console.log(getLog10e());
// Expected output: 0.4342944819032518
```

## Giá trị

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>𝙼𝚊𝚝𝚑.𝙻𝙾𝙶𝟷𝟶𝙴</mi><mo>=</mo><msub><mo lspace="0em" rspace="0em">log</mo><mn>10</mn></msub><mo stretchy="false">(</mo><mi mathvariant="normal">e</mi><mo stretchy="false">)</mo><mo>≈</mo><mn>0.434</mn></mrow><annotation encoding="TeX">\mathtt{Math.LOG10E} = \log_{10}(\mathrm{e}) \approx 0.434</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Vì `LOG10E` là thuộc tính tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.LOG10E`, thay vì là thuộc tính của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.LOG10E

Hàm sau trả về logarithm cơ số 10 của e:

```js
function getLog10e() {
  return Math.LOG10E;
}

getLog10e(); // 0.4342944819032518
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.log10()")}}
