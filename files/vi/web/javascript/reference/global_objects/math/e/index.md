---
title: Math.E
short-title: E
slug: Web/JavaScript/Reference/Global_Objects/Math/E
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Math.E
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Math.E`** biểu thị số Euler, cơ số của logarithm tự nhiên, e, xấp xỉ 2.718.

{{InteractiveExample("JavaScript Demo: Math.E")}}

```js interactive-example
function compoundOneYear(interestRate, currentVal) {
  return currentVal * Math.E ** interestRate;
}

console.log(Math.E);
// Expected output: 2.718281828459045

console.log((1 + 1 / 1000000) ** 1000000);
// Expected output: 2.718280469 (approximately)

console.log(compoundOneYear(0.05, 100));
// Expected output: 105.12710963760242
```

## Giá trị

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>𝙼𝚊𝚝𝚑.𝙴</mi><mo>=</mo><mi>e</mi><mo>≈</mo><mn>2.718</mn></mrow><annotation encoding="TeX">\mathtt{Math.E} = e \approx 2.718</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Vì `E` là thuộc tính tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.E`, thay vì là thuộc tính của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.E

Hàm sau trả về giá trị e:

```js
function getNapier() {
  return Math.E;
}

getNapier(); // 2.718281828459045
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.log1p()")}}
