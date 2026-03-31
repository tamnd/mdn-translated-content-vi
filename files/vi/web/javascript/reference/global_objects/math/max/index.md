---
title: Math.max()
short-title: max()
slug: Web/JavaScript/Reference/Global_Objects/Math/max
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.max
sidebar: jsref
---

Phương thức tĩnh **`Math.max()`** trả về số lớn nhất trong các tham số đầu vào, hoặc -{{jsxref("Infinity")}} nếu không có tham số nào.

{{InteractiveExample("JavaScript Demo: Math.max()")}}

```js interactive-example
console.log(Math.max(1, 3, 2));
// Expected output: 3

console.log(Math.max(-1, -3, -2));
// Expected output: -1

const array = [1, 3, 2];

console.log(Math.max(...array));
// Expected output: 3
```

## Cú pháp

```js-nolint
Math.max()
Math.max(value1)
Math.max(value1, value2)
Math.max(value1, value2, /* …, */ valueN)
```

### Tham số

- `value1`, …, `valueN`
  - : Không hoặc nhiều số để chọn và trả về giá trị lớn nhất.

### Giá trị trả về

Số lớn nhất trong các số đã cho. Trả về {{jsxref("NaN")}} nếu bất kỳ tham số nào là hoặc được chuyển đổi thành `NaN`. Trả về -{{jsxref("Infinity")}} nếu không có tham số nào.

## Mô tả

Vì `max()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.max()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

[`Math.max.length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length) là 2, cho thấy hàm được thiết kế để xử lý ít nhất hai tham số.

## Ví dụ

### Sử dụng Math.max()

```js
Math.max(10, 20); // 20
Math.max(-10, -20); // -10
Math.max(-10, 20); // 20
```

### Lấy phần tử lớn nhất trong mảng

{{jsxref("Array.prototype.reduce()")}} có thể dùng để tìm phần tử lớn nhất trong mảng số, bằng cách so sánh từng giá trị:

```js
const arr = [1, 2, 3];
const max = arr.reduce((a, b) => Math.max(a, b), -Infinity);
```

Hàm sau dùng {{jsxref("Function.prototype.apply()")}} để lấy giá trị lớn nhất của mảng. `getMaxOfArray([1, 2, 3])` tương đương với `Math.max(1, 2, 3)`, nhưng bạn có thể dùng `getMaxOfArray()` với mảng được xây dựng theo chương trình. Chỉ nên dùng với mảng có tương đối ít phần tử.

```js
function getMaxOfArray(numArray) {
  return Math.max.apply(null, numArray);
}
```

[Cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) là cách ngắn hơn để viết giải pháp `apply` nhằm lấy giá trị lớn nhất của mảng:

```js
const arr = [1, 2, 3];
const max = Math.max(...arr);
```

Tuy nhiên, cả spread (`...`) lẫn `apply` đều sẽ thất bại hoặc trả về kết quả sai nếu mảng có quá nhiều phần tử, vì chúng cố truyền các phần tử mảng làm tham số hàm. Xem [Using apply and built-in functions](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply#using_apply_and_built-in_functions) để biết thêm chi tiết. Giải pháp `reduce` không gặp vấn đề này.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.min()")}}
