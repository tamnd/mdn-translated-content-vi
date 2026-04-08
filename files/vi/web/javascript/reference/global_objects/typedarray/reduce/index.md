---
title: TypedArray.prototype.reduce()
short-title: reduce()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/reduce
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.reduce
sidebar: jsref
---

Phương thức **`reduce()`** của các thực thể {{jsxref("TypedArray")}} thực thi một hàm callback "reducer" do người dùng cung cấp trên mỗi phần tử của mảng được gõ kiểu, theo thứ tự, truyền vào giá trị trả về từ phép tính trên phần tử trước. Kết quả cuối cùng của việc chạy reducer trên tất cả các phần tử của mảng được gõ kiểu là một giá trị duy nhất. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.reduce()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.reduce()")}}

```js interactive-example
const uint8 = new Uint8Array([0, 1, 2, 3]);

function sum(accumulator, currentValue) {
  return accumulator + currentValue;
}

console.log(uint8.reduce(sum));
// Expected output: 6
```

## Cú pháp

```js-nolint
reduce(callbackFn)
reduce(callbackFn, initialValue)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng được gõ kiểu. Giá trị trả về của nó trở thành giá trị của tham số `accumulator` trong lần gọi tiếp theo của `callbackFn`. Đối với lần gọi cuối cùng, giá trị trả về trở thành giá trị trả về của `reduce()`. Hàm được gọi với các đối số sau:
    - `accumulator`
      - : Giá trị kết quả từ lần gọi trước của `callbackFn`. Trong lần gọi đầu tiên, giá trị của nó là `initialValue` nếu được chỉ định; nếu không giá trị của nó là `array[0]`.
    - `currentValue`
      - : Giá trị của phần tử hiện tại. Trong lần gọi đầu tiên, giá trị của nó là `array[0]` nếu `initialValue` được chỉ định; nếu không giá trị của nó là `array[1]`.
    - `currentIndex`
      - : Vị trí chỉ số của `currentValue` trong mảng được gõ kiểu. Trong lần gọi đầu tiên, giá trị của nó là `0` nếu `initialValue` được chỉ định, nếu không là `1`.
    - `array`
      - : Mảng được gõ kiểu mà `reduce()` đã được gọi trên.
- `initialValue` {{optional_inline}}
  - : Giá trị mà `accumulator` được khởi tạo lần đầu khi callback được gọi. Nếu `initialValue` được chỉ định, `callbackFn` bắt đầu thực thi với giá trị đầu tiên trong mảng được gõ kiểu là `currentValue`. Nếu `initialValue` _không_ được chỉ định, `accumulator` được khởi tạo thành giá trị đầu tiên trong mảng được gõ kiểu, và `callbackFn` bắt đầu thực thi với giá trị thứ hai trong mảng được gõ kiểu là `currentValue`. Trong trường hợp này, nếu mảng được gõ kiểu rỗng (không có giá trị đầu tiên để trả về như `accumulator`), một lỗi sẽ được ném.

### Giá trị trả về

Giá trị kết quả từ việc chạy hàm callback "reducer" đến hoàn thành trên toàn bộ mảng được gõ kiểu.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu mảng được gõ kiểu không chứa phần tử nào và `initialValue` không được cung cấp.

## Mô tả

Xem {{jsxref("Array.prototype.reduce()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Tính tổng tất cả các giá trị trong mảng

```js
const total = new Uint8Array([0, 1, 2, 3]).reduce((a, b) => a + b);
// total === 6
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.reduce` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.map()")}}
- {{jsxref("TypedArray.prototype.reduceRight()")}}
- {{jsxref("Array.prototype.reduce()")}}
- {{jsxref("Object.groupBy()")}}
- {{jsxref("Map.groupBy()")}}
