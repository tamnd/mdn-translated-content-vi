---
title: Math.SQRT1_2
short-title: SQRT1_2
slug: Web/JavaScript/Reference/Global_Objects/Math/SQRT1_2
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Math.SQRT1_2
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Math.SQRT1_2`** biểu thị căn bậc hai của 1/2, xấp xỉ 0.707.

{{InteractiveExample("JavaScript Demo: Math.SQRT1_2", "shorter")}}

```js interactive-example
function getRoot1Over2() {
  return Math.SQRT1_2;
}

console.log(getRoot1Over2());
// Expected output: 0.7071067811865476
```

## Giá trị

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>𝙼𝚊𝚝𝚑.𝚂𝚀𝚁𝚃𝟷_𝟸</mi><mo>=</mo><msqrt><mfrac><mn>1</mn><mn>2</mn></mfrac></msqrt><mo>≈</mo><mn>0.707</mn></mrow><annotation encoding="TeX">\mathtt{Math.SQRT1_2} = \sqrt{\frac{1}{2}} \approx 0.707</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{js_property_attributes(0, 0, 0)}}

## Mô tả

`Math.SQRT1_2` là hằng số và là tương đương hiệu năng cao hơn của [`Math.sqrt(0.5)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt).

Vì `SQRT1_2` là thuộc tính tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.SQRT1_2`, thay vì là thuộc tính của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.SQRT1_2

Hàm sau tính độ dài cạnh của hình vuông khi biết đường chéo:

```js
function getSquareSideLength(diagonalLength) {
  return diagonalLength * Math.SQRT1_2;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.pow()")}}
- {{jsxref("Math.sqrt()")}}
