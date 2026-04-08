---
title: Array.prototype.with()
short-title: with()
slug: Web/JavaScript/Reference/Global_Objects/Array/with
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.with
sidebar: jsref
---

Phương thức **`with()`** của các đối tượng {{jsxref("Array")}} là phiên bản [sao chép](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods) của việc dùng [ký hiệu ngoặc vuông](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#bracket_notation) để thay đổi giá trị của chỉ mục nhất định. Nó trả về một mảng mới với phần tử tại chỉ mục nhất định được thay thế bằng giá trị nhất định.

## Cú pháp

```js-nolint
arrayInstance.with(index, value)
```

### Tham số

- `index`
  - : Chỉ mục từ 0 để thay đổi mảng, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
    - Chỉ mục âm đếm ngược từ cuối mảng — nếu `-array.length <= index < 0`, sẽ dùng `index + array.length`.
    - Nếu chỉ mục sau khi chuẩn hóa nằm ngoài giới hạn, một {{jsxref("RangeError")}} sẽ được ném ra.
- `value`
  - : Bất kỳ giá trị nào được gán cho chỉ mục nhất định.

### Giá trị trả về

Một mảng mới với phần tử tại `index` được thay thế bằng `value`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `index >= array.length` hoặc `index < -array.length`.

## Mô tả

Phương thức `with()` thay đổi giá trị của chỉ mục nhất định trong mảng, trả về một mảng mới với phần tử tại chỉ mục nhất định được thay thế bằng giá trị nhất định. Mảng gốc không bị thay đổi. Điều này cho phép bạn xâu chuỗi các phương thức mảng trong khi thực hiện các thao tác.

Bằng cách kết hợp `with()` với {{jsxref("Array/at", "at()")}}, bạn có thể vừa ghi vừa đọc (tương ứng) một mảng bằng cách dùng chỉ mục âm.

Phương thức `with()` không bao giờ tạo ra [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays). Nếu mảng nguồn thưa, các vị trí trống sẽ được thay thế bằng `undefined` trong mảng mới.

Phương thức `with()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Tạo mảng mới với một phần tử được thay đổi

```js
const arr = [1, 2, 3, 4, 5];
console.log(arr.with(2, 6)); // [1, 2, 6, 4, 5]
console.log(arr); // [1, 2, 3, 4, 5]
```

### Xâu chuỗi các phương thức mảng

Với phương thức `with()`, bạn có thể cập nhật một phần tử trong mảng và sau đó áp dụng các phương thức mảng khác.

```js
const arr = [1, 2, 3, 4, 5];
console.log(arr.with(2, 6).map((x) => x ** 2)); // [1, 4, 36, 16, 25]
```

### Sử dụng with() trên mảng thưa

Phương thức `with()` luôn tạo ra một mảng dày đặc.

```js
const arr = [1, , 3, 4, , 6];
console.log(arr.with(0, 2)); // [2, undefined, 3, 4, undefined, 6]
```

### Gọi with() trên đối tượng không phải mảng

Phương thức `with()` tạo và trả về một mảng mới. Nó đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`. Khi mỗi thuộc tính của `this` được truy cập, phần tử mảng có chỉ mục bằng với khóa của thuộc tính được đặt bằng giá trị của thuộc tính. Cuối cùng, giá trị mảng tại `index` được đặt thành `value`.

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  0: 5,
  2: 4,
  3: 3, // ignored by with() since length is 3
};
console.log(Array.prototype.with.call(arrayLike, 0, 1));
// [ 1, undefined, 4 ]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.with` trong `core-js`](https://github.com/zloirock/core-js#change-array-by-copy)
- [es-shims polyfill của `Array.prototype.with`](https://www.npmjs.com/package/array.prototype.with)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array.prototype.toReversed()")}}
- {{jsxref("Array.prototype.toSorted()")}}
- {{jsxref("Array.prototype.toSpliced()")}}
- {{jsxref("Array.prototype.at()")}}
- {{jsxref("TypedArray.prototype.with()")}}
