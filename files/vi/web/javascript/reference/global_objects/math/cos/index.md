---
title: Math.cos()
short-title: cos()
slug: Web/JavaScript/Reference/Global_Objects/Math/cos
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.cos
sidebar: jsref
---

Phương thức tĩnh **`Math.cos()`** trả về cosine của một số tính bằng radian.

{{InteractiveExample("JavaScript Demo: Math.cos()")}}

```js interactive-example
function getCircleX(radians, radius) {
  return Math.cos(radians) * radius;
}

console.log(getCircleX(1, 10));
// Expected output: 5.403023058681398

console.log(getCircleX(2, 10));
// Expected output: -4.161468365471424

console.log(getCircleX(Math.PI, 10));
// Expected output: -10
```

## Cú pháp

```js-nolint
Math.cos(x)
```

### Tham số

- `x`
  - : Một số biểu thị góc tính bằng radian.

### Giá trị trả về

Cosine của `x`, trong khoảng từ -1 đến 1 (bao gồm hai đầu mút). Nếu `x` là {{jsxref("Infinity")}}, `-Infinity`, hoặc {{jsxref("NaN")}}, trả về {{jsxref("NaN")}}.

## Mô tả

Vì `cos()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.cos()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.cos()

```js
Math.cos(-Infinity); // NaN
Math.cos(-0); // 1
Math.cos(0); // 1
Math.cos(1); // 0.5403023058681398
Math.cos(Math.PI); // -1
Math.cos(2 * Math.PI); // 1
Math.cos(Infinity); // NaN
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
- {{jsxref("Math.sin()")}}
- {{jsxref("Math.tan()")}}
- CSS {{cssxref("cos()")}} function
