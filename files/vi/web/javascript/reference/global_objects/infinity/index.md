---
title: Infinity
slug: Web/JavaScript/Reference/Global_Objects/Infinity
page-type: javascript-global-property
browser-compat: javascript.builtins.Infinity
sidebar: jssidebar
---

Thuộc tính toàn cục **`Infinity`** là một giá trị số đại diện cho vô cực.

{{InteractiveExample("JavaScript Demo: Infinity")}}

```js interactive-example
const maxNumber = 10 ** 1000; // Max positive number

if (maxNumber === Infinity) {
  console.log("Let's call it Infinity!");
  // Expected output: "Let's call it Infinity!"
}

console.log(1 / maxNumber);
// Expected output: 0
```

## Giá trị

Cùng giá trị số với {{jsxref("Number.POSITIVE_INFINITY")}}.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

`Infinity` là một thuộc tính của _đối tượng toàn cục_. Nói cách khác, nó là một biến trong phạm vi toàn cục.

Giá trị `Infinity` (vô cực dương) lớn hơn bất kỳ số nào khác.

Giá trị này hoạt động hơi khác so với vô cực trong toán học; xem {{jsxref("Number.POSITIVE_INFINITY")}} để biết thêm chi tiết.

## Ví dụ

### Sử dụng Infinity

```js
console.log(Infinity); /* Infinity */
console.log(Infinity + 1); /* Infinity */
console.log(10 ** 1000); /* Infinity */
console.log(Math.log(0)); /* -Infinity */
console.log(1 / Infinity); /* 0 */
console.log(1 / 0); /* Infinity */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.NEGATIVE_INFINITY")}}
- {{jsxref("Number.POSITIVE_INFINITY")}}
- {{jsxref("Number.isFinite")}}
