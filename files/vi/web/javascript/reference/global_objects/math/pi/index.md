---
title: Math.PI
short-title: PI
slug: Web/JavaScript/Reference/Global_Objects/Math/PI
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Math.PI
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Math.PI`** biểu thị tỷ lệ giữa chu vi và đường kính của một hình tròn, xấp xỉ 3.14159.

{{InteractiveExample("JavaScript Demo: Math.PI")}}

```js interactive-example
function calculateCircumference(radius) {
  return 2 * Math.PI * radius;
}

console.log(Math.PI);
// Expected output: 3.141592653589793

console.log(calculateCircumference(10));
// Expected output: 62.83185307179586
```

## Giá trị

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>𝙼𝚊𝚝𝚑.𝙿𝙸</mi><mo>=</mo><mi>π</mi><mo>≈</mo><mn>3.14159</mn></mrow><annotation encoding="TeX">\mathtt{Math.PI} = \pi \approx 3.14159</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Vì `PI` là thuộc tính tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.PI`, thay vì là thuộc tính của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.PI

Hàm sau dùng `Math.PI` để tính chu vi của hình tròn với bán kính truyền vào.

```js
function calculateCircumference(radius) {
  return Math.PI * (radius + radius);
}

calculateCircumference(1); // 6.283185307179586
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math")}}
