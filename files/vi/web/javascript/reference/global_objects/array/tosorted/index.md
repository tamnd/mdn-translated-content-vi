---
title: Array.prototype.toSorted()
short-title: toSorted()
slug: Web/JavaScript/Reference/Global_Objects/Array/toSorted
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.toSorted
sidebar: jsref
---

Phương thức **`toSorted()`** của các đối tượng {{jsxref("Array")}} là phiên bản [sao chép](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods) của phương thức {{jsxref("Array/sort", "sort()")}}. Nó trả về một mảng mới với các phần tử được sắp xếp theo thứ tự tăng dần.

## Cú pháp

```js-nolint
toSorted()
toSorted(compareFn)
```

### Tham số

- `compareFn` {{optional_inline}}
  - : Hàm xác định thứ tự của các phần tử. Nếu bị bỏ qua, các phần tử mảng được chuyển đổi thành chuỗi, sau đó được sắp xếp theo giá trị điểm mã Unicode của từng ký tự. Xem {{jsxref("Array/sort", "sort()")}} để biết thêm thông tin.

### Giá trị trả về

Một mảng mới với các phần tử được sắp xếp theo thứ tự tăng dần.

## Mô tả

Xem {{jsxref("Array/sort", "sort()")}} để biết thêm thông tin về tham số `compareFn`.

Khi được dùng trên [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), phương thức `toSorted()` lặp qua các vị trí trống như thể chúng có giá trị `undefined`.

Phương thức `toSorted()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Sắp xếp một mảng

```js
const months = ["Mar", "Jan", "Feb", "Dec"];
const sortedMonths = months.toSorted();
console.log(sortedMonths); // ['Dec', 'Feb', 'Jan', 'Mar']
console.log(months); // ['Mar', 'Jan', 'Feb', 'Dec']

const values = [1, 10, 21, 2];
const sortedValues = values.toSorted((a, b) => a - b);
console.log(sortedValues); // [1, 2, 10, 21]
console.log(values); // [1, 10, 21, 2]
```

Để biết thêm ví dụ sử dụng, xem {{jsxref("Array/sort", "sort()")}}.

### Sử dụng toSorted() trên mảng thưa

Các vị trí trống được sắp xếp như thể chúng có giá trị `undefined`. Chúng luôn được sắp xếp vào cuối mảng và `compareFn` không được gọi cho chúng.

```js
console.log(["a", "c", , "b"].toSorted()); // ['a', 'b', 'c', undefined]
console.log([, undefined, "a", "b"].toSorted()); // ["a", "b", undefined, undefined]
```

### Gọi toSorted() trên đối tượng không phải mảng

Phương thức `toSorted()` đọc thuộc tính `length` của `this`. Sau đó nó thu thập tất cả các thuộc tính có khóa nguyên trong phạm vi `0` đến `length - 1`, sắp xếp chúng, và ghi vào một mảng mới.

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  0: 5,
  2: 4,
  3: 3, // ignored by toSorted() since length is 3
};
console.log(Array.prototype.toSorted.call(arrayLike));
// [4, 5, undefined]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.toSorted` trong `core-js`](https://github.com/zloirock/core-js#change-array-by-copy)
- [es-shims polyfill của `Array.prototype.toSorted`](https://www.npmjs.com/package/array.prototype.tosorted)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array.prototype.sort()")}}
- {{jsxref("Array.prototype.toReversed()")}}
- {{jsxref("Array.prototype.toSpliced()")}}
- {{jsxref("Array.prototype.with()")}}
- {{jsxref("TypedArray.prototype.toSorted()")}}
