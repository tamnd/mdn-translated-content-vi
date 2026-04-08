---
title: Math.SQRT2
short-title: SQRT2
slug: Web/JavaScript/Reference/Global_Objects/Math/SQRT2
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Math.SQRT2
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Math.SQRT2`** biểu thị căn bậc hai của 2, xấp xỉ 1.414.

{{InteractiveExample("JavaScript Demo: Math.SQRT2", "shorter")}}

```js interactive-example
function getRoot2() {
  return Math.SQRT2;
}

console.log(getRoot2());
// Expected output: 1.4142135623730951
```

## Giá trị

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>𝙼𝚊𝚝𝚑.𝚂𝚀𝚁𝚃𝟸</mi><mo>=</mo><msqrt><mn>2</mn></msqrt><mo>≈</mo><mn>1.414</mn></mrow><annotation encoding="TeX">\mathtt{Math.SQRT2} = \sqrt{2} \approx 1.414</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{js_property_attributes(0, 0, 0)}}

## Mô tả

`Math.SQRT2` là hằng số và là tương đương hiệu năng cao hơn của [`Math.sqrt(2)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt).

Vì `SQRT2` là thuộc tính tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.SQRT2`, thay vì là thuộc tính của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.SQRT2

Hàm sau trả về căn bậc hai của 2:

```js
function getRoot2() {
  return Math.SQRT2;
}

getRoot2(); // 1.4142135623730951
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.pow()")}}
- {{jsxref("Math.sqrt()")}}
