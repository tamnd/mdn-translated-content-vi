---
title: TypedArray.prototype.reduceRight()
short-title: reduceRight()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/reduceRight
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.reduceRight
sidebar: jsref
---

Phương thức **`reduceRight()`** của các thực thể {{jsxref("TypedArray")}} áp dụng một hàm đối với một bộ tích lũy và mỗi giá trị của mảng được gõ kiểu (từ phải sang trái) để rút gọn thành một giá trị duy nhất. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.reduceRight()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.reduceRight()")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 30]);

const result = uint8.reduceRight(
  (accumulator, currentValue) => `${accumulator}, ${currentValue}`,
);

console.log(result);
// Expected output: "30, 20, 10"
```

## Cú pháp

```js-nolint
reduceRight(callbackFn)
reduceRight(callbackFn, initialValue)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng được gõ kiểu. Giá trị trả về của nó trở thành giá trị của tham số `accumulator` trong lần gọi tiếp theo của `callbackFn`. Đối với lần gọi cuối cùng, giá trị trả về trở thành giá trị trả về của `reduceRight()`. Hàm được gọi với các đối số sau:
    - `accumulator`
      - : Giá trị kết quả từ lần gọi trước của `callbackFn`. Trong lần gọi đầu tiên, giá trị của nó là `initialValue` nếu được chỉ định; nếu không giá trị của nó là phần tử cuối cùng của mảng được gõ kiểu.
    - `currentValue`
      - : Giá trị của phần tử hiện tại. Trong lần gọi đầu tiên, giá trị của nó là phần tử cuối cùng nếu `initialValue` được chỉ định; nếu không giá trị của nó là phần tử áp chót.
    - `currentIndex`
      - : Vị trí chỉ số của `currentValue` trong mảng được gõ kiểu. Trong lần gọi đầu tiên, giá trị của nó là `array.length - 1` nếu `initialValue` được chỉ định, nếu không là `array.length - 2`.
    - `array`
      - : Mảng được gõ kiểu mà `reduceRight()` đã được gọi trên.
- `initialValue` {{optional_inline}}
  - : Giá trị để sử dụng làm bộ tích lũy cho lần gọi đầu tiên của `callbackFn`. Nếu không có giá trị ban đầu nào được cung cấp, phần tử cuối cùng trong mảng được gõ kiểu sẽ được sử dụng và bỏ qua. Gọi `reduceRight()` trên mảng được gõ kiểu rỗng mà không có giá trị ban đầu sẽ tạo ra `TypeError`.

### Giá trị trả về

Giá trị kết quả từ quá trình rút gọn.

## Mô tả

Xem {{jsxref("Array.prototype.reduceRight()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Tính tổng tất cả các giá trị trong mảng

```js
const total = new Uint8Array([0, 1, 2, 3]).reduceRight((a, b) => a + b);
// total === 6
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.reduceRight` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.map()")}}
- {{jsxref("TypedArray.prototype.reduce()")}}
- {{jsxref("Array.prototype.reduceRight()")}}
- {{jsxref("Object.groupBy()")}}
- {{jsxref("Map.groupBy()")}}
