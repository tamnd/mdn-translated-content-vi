---
title: Array.prototype.toReversed()
short-title: toReversed()
slug: Web/JavaScript/Reference/Global_Objects/Array/toReversed
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.toReversed
sidebar: jsref
---

Phương thức **`toReversed()`** của các đối tượng {{jsxref("Array")}} là phiên bản [sao chép](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods) của phương thức {{jsxref("Array/reverse", "reverse()")}}. Nó trả về một mảng mới với các phần tử theo thứ tự ngược lại.

## Cú pháp

```js-nolint
toReversed()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng mới chứa các phần tử theo thứ tự ngược lại.

## Mô tả

Phương thức `toReversed()` đảo ngược các phần tử của đối tượng mảng đang gọi và trả về một mảng mới.

Khi được dùng trên [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), phương thức `toReversed()` lặp qua các vị trí trống như thể chúng có giá trị `undefined`.

Phương thức `toReversed()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Đảo ngược các phần tử trong một mảng

Ví dụ sau tạo mảng `items` chứa ba phần tử, sau đó tạo một mảng mới là mảng ngược của `items`. Mảng `items` vẫn không thay đổi.

```js
const items = [1, 2, 3];
console.log(items); // [1, 2, 3]

const reversedItems = items.toReversed();
console.log(reversedItems); // [3, 2, 1]
console.log(items); // [1, 2, 3]
```

### Sử dụng toReversed() trên mảng thưa

Giá trị trả về của `toReversed()` không bao giờ thưa. Các vị trí trống trở thành `undefined` trong mảng được trả về.

```js
console.log([1, , 3].toReversed()); // [3, undefined, 1]
console.log([1, , 3, 4].toReversed()); // [4, 3, undefined, 1]
```

### Gọi toReversed() trên đối tượng không phải mảng

Phương thức `toReversed()` đọc thuộc tính `length` của `this`. Sau đó nó ghé thăm từng thuộc tính có khóa nguyên từ `length - 1` đến `0` theo thứ tự giảm dần, thêm giá trị của thuộc tính hiện tại vào cuối mảng sẽ được trả về.

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  2: 4,
};
console.log(Array.prototype.toReversed.call(arrayLike));
// [4, undefined, undefined]
// The '0' and '1' indices are not present so they become undefined
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.toReversed` trong `core-js`](https://github.com/zloirock/core-js#change-array-by-copy)
- [es-shims polyfill của `Array.prototype.toReversed`](https://www.npmjs.com/package/array.prototype.toreversed)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array.prototype.reverse()")}}
- {{jsxref("Array.prototype.toSorted()")}}
- {{jsxref("Array.prototype.toSpliced()")}}
- {{jsxref("Array.prototype.with()")}}
- {{jsxref("TypedArray.prototype.toReversed()")}}
