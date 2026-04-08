---
title: Math.LOG2E
short-title: LOG2E
slug: Web/JavaScript/Reference/Global_Objects/Math/LOG2E
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Math.LOG2E
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Math.LOG2E`** biểu thị logarithm cơ số 2 của [e](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E), xấp xỉ 1.443.

{{InteractiveExample("JavaScript Demo: Math.LOG2E", "shorter")}}

```js interactive-example
function getLog2e() {
  return Math.LOG2E;
}

console.log(getLog2e());
// Expected output: 1.4426950408889634
```

## Giá trị

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>𝙼𝚊𝚝𝚑.𝙻𝙾𝙶𝟸𝙴</mi><mo>=</mo><msub><mo lspace="0em" rspace="0em">log</mo><mn>2</mn></msub><mo stretchy="false">(</mo><mi mathvariant="normal">e</mi><mo stretchy="false">)</mo><mo>≈</mo><mn>1.443</mn></mrow><annotation encoding="TeX">\mathtt{Math.LOG2E} = \log_2(\mathrm{e}) \approx 1.443</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Vì `LOG2E` là thuộc tính tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.LOG2E`, thay vì là thuộc tính của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.LOG2E

Hàm sau trả về logarithm cơ số 2 của e:

```js
function getLog2e() {
  return Math.LOG2E;
}

getLog2e(); // 1.4426950408889634
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.log2()")}}
