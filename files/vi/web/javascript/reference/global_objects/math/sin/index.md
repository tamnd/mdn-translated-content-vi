---
title: Math.sin()
short-title: sin()
slug: Web/JavaScript/Reference/Global_Objects/Math/sin
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.sin
sidebar: jsref
---

Phương thức tĩnh **`Math.sin()`** trả về sine của một số tính bằng radian.

{{InteractiveExample("JavaScript Demo: Math.sin()")}}

```js interactive-example
function getCircleY(radians, radius) {
  return Math.sin(radians) * radius;
}

console.log(getCircleY(1, 10));
// Expected output: 8.414709848078965

console.log(getCircleY(2, 10));
// Expected output: 9.092974268256818

console.log(getCircleY(Math.PI, 10));
// Expected output: 1.2246467991473533e-15
```

## Cú pháp

```js-nolint
Math.sin(x)
```

### Tham số

- `x`
  - : Một số biểu thị góc tính bằng radian.

### Giá trị trả về

Sine của `x`, trong khoảng từ -1 đến 1 (bao gồm hai đầu mút). Nếu `x` là {{jsxref("Infinity")}}, `-Infinity`, hoặc {{jsxref("NaN")}}, trả về {{jsxref("NaN")}}.

## Mô tả

Vì `sin()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.sin()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.sin()

```js
Math.sin(-Infinity); // NaN
Math.sin(-0); // -0
Math.sin(0); // 0
Math.sin(1); // 0.8414709848078965
Math.sin(Math.PI / 2); // 1
Math.sin(Infinity); // NaN
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.acos()")}}
- {{jsxref("Math.asin()")}}
- {{jsxref("Math.atan()")}}
- {{jsxref("Math.atan2()")}}
- {{jsxref("Math.cos()")}}
- {{jsxref("Math.tan()")}}
- CSS {{cssxref("sin()")}} function
