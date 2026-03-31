---
title: Array.prototype.fill()
short-title: fill()
slug: Web/JavaScript/Reference/Global_Objects/Array/fill
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.fill
sidebar: jsref
---

Phương thức **`fill()`** của các instance {{jsxref("Array")}} thay đổi tất cả các phần tử trong một phạm vi chỉ số của mảng thành một giá trị tĩnh. Nó trả về mảng đã được sửa đổi.

{{InteractiveExample("JavaScript Demo: Array.prototype.fill()")}}

```js interactive-example
const array = [1, 2, 3, 4];

// Fill with 0 from position 2 until position 4
console.log(array.fill(0, 2, 4));
// Expected output: Array [1, 2, 0, 0]

// Fill with 5 from position 1
console.log(array.fill(5, 1));
// Expected output: Array [1, 5, 5, 5]

console.log(array.fill(6));
// Expected output: Array [6, 6, 6, 6]
```

## Syntax

```js-nolint
fill(value)
fill(value, start)
fill(value, start, end)
```

### Parameters

- `value`
  - : Giá trị để điền vào mảng. Lưu ý rằng tất cả các phần tử trong mảng sẽ có chính xác giá trị này: nếu `value` là một object, mỗi slot trong mảng sẽ tham chiếu đến object đó.
- `start` {{optional_inline}}
  - : Chỉ số dựa trên 0 để bắt đầu điền, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
    - Chỉ số âm đếm ngược từ cuối mảng — nếu `-array.length <= start < 0`, thì `start + array.length` được dùng.
    - Nếu `start < -array.length` hoặc `start` bị bỏ qua, thì `0` được dùng.
    - Nếu `start >= array.length`, thì không có chỉ số nào được điền.
- `end` {{optional_inline}}
  - : Chỉ số dựa trên 0 để kết thúc việc điền, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). `fill()` điền đến nhưng không bao gồm `end`.
    - Chỉ số âm đếm ngược từ cuối mảng — nếu `-array.length <= end < 0`, thì `end + array.length` được dùng.
    - Nếu `end < -array.length`, thì `0` được dùng.
    - Nếu `end >= array.length` hoặc `end` bị bỏ qua hoặc là `undefined`, thì `array.length` được dùng, khiến tất cả các chỉ số đến cuối được điền.
    - Nếu `end` ngụ ý một vị trí trước hoặc tại vị trí mà `start` ngụ ý, thì không có gì được điền.

### Return value

Mảng đã được sửa đổi, được điền với `value`.

## Description

Phương thức `fill()` là một [mutating method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods). Nó không thay đổi độ dài của `this`, nhưng sẽ thay đổi nội dung của `this`.

Phương thức `fill()` cũng điền các slot rỗng trong [mảng thưa (sparse)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays) với `value`.

Phương thức `fill()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length`. Mặc dù chuỗi cũng giống mảng, phương thức này không phù hợp để áp dụng lên chúng vì chuỗi là bất biến.

> [!NOTE]
> Dùng `Array.prototype.fill()` trên một mảng rỗng (`length = 0`) sẽ không thay đổi nó vì mảng không có gì để sửa đổi.
> Để dùng `Array.prototype.fill()` khi khai báo một mảng, hãy đảm bảo mảng có `length` khác không.
> [Xem ví dụ](#using_fill_to_populate_an_empty_array).

## Examples

### Dùng fill()

```js
console.log([1, 2, 3].fill(4)); // [4, 4, 4]
console.log([1, 2, 3].fill(4, 1)); // [1, 4, 4]
console.log([1, 2, 3].fill(4, 1, 2)); // [1, 4, 3]
console.log([1, 2, 3].fill(4, 1, 1)); // [1, 2, 3]
console.log([1, 2, 3].fill(4, 3, 3)); // [1, 2, 3]
console.log([1, 2, 3].fill(4, -3, -2)); // [4, 2, 3]
console.log([1, 2, 3].fill(4, NaN, NaN)); // [1, 2, 3]
console.log([1, 2, 3].fill(4, 3, 5)); // [1, 2, 3]
console.log(Array(3).fill(4)); // [4, 4, 4]

// A single object, referenced by each slot of the array:
const arr = Array(3).fill({}); // [{}, {}, {}]
arr[0].hi = "hi"; // [{ hi: "hi" }, { hi: "hi" }, { hi: "hi" }]
```

### Dùng fill() để tạo ma trận toàn số 1

Ví dụ này cho thấy cách tạo một ma trận toàn số 1, giống như hàm `ones()` của Octave hoặc MATLAB.

```js
const arr = new Array(3);
for (let i = 0; i < arr.length; i++) {
  arr[i] = new Array(4).fill(1); // Creating an array of size 4 and filled of 1
}
arr[0][0] = 10;
console.log(arr[0][0]); // 10
console.log(arr[1][0]); // 1
console.log(arr[2][0]); // 1
```

### Dùng fill() để điền vào một mảng rỗng

Ví dụ này cho thấy cách điền vào một mảng, đặt tất cả các phần tử thành một giá trị cụ thể.
Tham số `end` không cần được chỉ định.

```js
const tempGirls = Array(5).fill("girl", 0);
```

Lưu ý rằng mảng ban đầu là [mảng thưa (sparse array)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays) không có chỉ số nào được gán. `fill()` vẫn có thể điền vào mảng này.

### Gọi fill() trên các đối tượng không phải mảng

Phương thức `fill()` đọc thuộc tính `length` của `this` và đặt giá trị của mỗi thuộc tính có khóa là số nguyên từ `start` đến `end`.

```js
const arrayLike = { length: 2 };
console.log(Array.prototype.fill.call(arrayLike, 1));
// { '0': 1, '1': 1, length: 2 }
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.fill` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("TypedArray.prototype.fill()")}}
