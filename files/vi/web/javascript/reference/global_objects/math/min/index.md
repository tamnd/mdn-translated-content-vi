---
title: Math.min()
short-title: min()
slug: Web/JavaScript/Reference/Global_Objects/Math/min
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.min
sidebar: jsref
---

Phương thức tĩnh **`Math.min()`** trả về số nhỏ nhất trong các tham số đầu vào, hoặc {{jsxref("Infinity")}} nếu không có tham số nào.

{{InteractiveExample("JavaScript Demo: Math.min()")}}

```js interactive-example
console.log(Math.min(2, 3, 1));
// Expected output: 1

console.log(Math.min(-2, -3, -1));
// Expected output: -3

const array = [2, 3, 1];

console.log(Math.min(...array));
// Expected output: 1
```

## Cú pháp

```js-nolint
Math.min()
Math.min(value1)
Math.min(value1, value2)
Math.min(value1, value2, /* …, */ valueN)
```

### Tham số

- `value1`, …, `valueN`
  - : Không hoặc nhiều số để chọn và trả về giá trị nhỏ nhất.

### Giá trị trả về

Số nhỏ nhất trong các số đã cho. Trả về {{jsxref("NaN")}} nếu bất kỳ tham số nào là hoặc được chuyển đổi thành `NaN`. Trả về {{jsxref("Infinity")}} nếu không có tham số nào.

## Mô tả

Vì `min()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.min()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

[`Math.min.length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length) là 2, cho thấy hàm được thiết kế để xử lý ít nhất hai tham số.

## Ví dụ

### Sử dụng Math.min()

Đoạn code sau tìm giá trị nhỏ nhất của `x` và `y` rồi gán cho `z`:

```js
const x = 10;
const y = -20;
const z = Math.min(x, y); // -20
```

### Giới hạn một giá trị bằng Math.min()

`Math.min()` thường được dùng để giới hạn một giá trị sao cho nó luôn nhỏ hơn hoặc bằng một ngưỡng. Ví dụ, đoạn code này:

```js
let x = f(foo);

if (x > boundary) {
  x = boundary;
}
```

có thể viết lại như sau:

```js
const x = Math.min(f(foo), boundary);
```

{{jsxref("Math.max()")}} có thể dùng theo cách tương tự để giới hạn một giá trị ở đầu kia.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.max()")}}
