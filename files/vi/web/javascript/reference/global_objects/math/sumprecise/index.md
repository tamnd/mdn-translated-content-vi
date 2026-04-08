---
title: Math.sumPrecise()
short-title: sumPrecise()
slug: Web/JavaScript/Reference/Global_Objects/Math/sumPrecise
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.sumPrecise
sidebar: jsref
---

Phương thức tĩnh **`Math.sumPrecise()`** nhận một iterable gồm các số và trả về tổng của chúng. Nó chính xác hơn so với việc cộng dồn trong một vòng lặp, vì nó tránh mất độ chính xác dấu phẩy động trong các kết quả trung gian.

{{InteractiveExample("JavaScript Demo: Math.sumPrecise()")}}

```js interactive-example
console.log(Math.sumPrecise([1, 2]));
// Expected output: 3

console.log(Math.sumPrecise([1e20, 0.1, -1e20]));
// Expected output: 0.1
```

## Cú pháp

```js-nolint
Math.sumPrecise(numbers)
```

### Tham số

- `numbers`
  - : Một [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) (chẳng hạn như {{jsxref("Array")}}) gồm các số.

### Giá trị trả về

Một số là tổng của các số trong iterable `numbers`. Nếu iterable rỗng, giá trị trả về là `-0` (_không phải_ `0`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Nếu `numbers` không phải là một iterable, hoặc nếu bất kỳ phần tử nào trong iterable không có kiểu number.

## Mô tả

Vì `sumPrecise()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó là `Math.sumPrecise()`, thay vì gọi nó là phương thức của một đối tượng `Math` mà bạn đã tạo (`Math` không phải là constructor).

Phương thức được gọi là `Math.sumPrecise()` vì nó chính xác hơn so với việc cộng dồn các số trong một vòng lặp theo cách thông thường. Hãy xem ví dụ sau:

```js
let sum = 0;
const numbers = [1e20, 0.1, -1e20];
for (const number of numbers) {
  sum += number;
}
console.log(sum); // 0
```

Kết quả là 0. Điều này xảy ra vì `1e20 + 0.1` không thể được biểu diễn chính xác trong số dấu phẩy động 64-bit, nên kết quả trung gian được làm tròn thành `1e20`. Sau đó, tổng của `1e20` và `-1e20` là `0`, nên kết quả cuối cùng là `0`.

`Math.sumPrecise()` tránh vấn đề này bằng cách sử dụng một thuật toán tính tổng chuyên biệt. Nó hoạt động như thể các số dấu phẩy động được cộng dồn bằng các giá trị toán học chính xác của chúng, và kết quả cuối cùng sau đó được chuyển đổi sang số dấu phẩy động 64-bit gần nhất có thể biểu diễn được. Điều này vẫn không thể tránh khỏi vấn đề độ chính xác `0.1 + 0.2`:

```js
console.log(Math.sumPrecise([0.1, 0.2])); // 0.30000000000000004
```

Bởi vì các literal dấu phẩy động `0.1` và `0.2` đã đại diện cho các giá trị toán học lớn hơn `0.1` và `0.2`, và biểu diễn dấu phẩy động 64-bit gần nhất của tổng của chúng thực sự là `0.30000000000000004`.

## Ví dụ

### Sử dụng Math.sumPrecise()

```js
console.log(Math.sumPrecise([1, 2, 3])); // 6
console.log(Math.sumPrecise([1e20, 0.1, -1e20])); // 0.1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Math.sumPrecise` trong `core-js`](https://github.com/zloirock/core-js#mathsumprecise)
- [Polyfill của `Math.sumPrecise` bởi es-shims](https://www.npmjs.com/package/math.sumprecise)
- {{jsxref("Array.prototype.reduce()")}}
