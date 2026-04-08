---
title: Math.tan()
short-title: tan()
slug: Web/JavaScript/Reference/Global_Objects/Math/tan
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.tan
sidebar: jsref
---

Phương thức tĩnh **`Math.tan()`** trả về tangent của một số tính bằng radian.

{{InteractiveExample("JavaScript Demo: Math.tan()")}}

```js interactive-example
function getTanFromDegrees(degrees) {
  return Math.tan((degrees * Math.PI) / 180);
}

console.log(getTanFromDegrees(0));
// Expected output: 0

console.log(getTanFromDegrees(45));
// Expected output: 0.9999999999999999

console.log(getTanFromDegrees(90));
// Expected output: 16331239353195370
```

## Cú pháp

```js-nolint
Math.tan(x)
```

### Tham số

- `x`
  - : Một số biểu thị góc tính bằng radian.

### Giá trị trả về

Tangent của `x`. Nếu `x` là {{jsxref("Infinity")}}, `-Infinity`, hoặc {{jsxref("NaN")}}, trả về {{jsxref("NaN")}}.

> [!NOTE]
> Do độ chính xác của số thực dấu phẩy động, không thể lấy giá trị chính xác của π/2, vì vậy kết quả luôn hữu hạn nếu không phải `NaN`.

## Mô tả

Vì `tan()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.tan()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.tan()

```js
Math.tan(-Infinity); // NaN
Math.tan(-0); // -0
Math.tan(0); // 0
Math.tan(1); // 1.5574077246549023
Math.tan(Math.PI / 4); // 0.9999999999999999 (Floating point error)
Math.tan(Infinity); // NaN
```

### Math.tan() và π/2

Không thể tính chính xác `tan(π/2)`.

```js
Math.tan(Math.PI / 2); // 16331239353195370
Math.tan(Math.PI / 2 + Number.EPSILON); // -6218431163823738
```

### Sử dụng Math.tan() với giá trị độ

Vì hàm `Math.tan()` nhận radian, nhưng thường dễ hơn khi làm việc với độ, hàm sau nhận giá trị theo độ, chuyển thành radian và trả về tangent.

```js
function getTanDeg(deg) {
  const rad = (deg * Math.PI) / 180;
  return Math.tan(rad);
}
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
- {{jsxref("Math.sin()")}}
- CSS {{cssxref("tan()")}} function
