---
title: Array.prototype.unshift()
short-title: unshift()
slug: Web/JavaScript/Reference/Global_Objects/Array/unshift
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.unshift
sidebar: jsref
---

Phương thức **`unshift()`** của các đối tượng {{jsxref("Array")}} thêm các phần tử được chỉ định vào đầu mảng và trả về độ dài mới của mảng.

{{InteractiveExample("JavaScript Demo: Array.prototype.unshift()")}}

```js interactive-example
const array = [1, 2, 3];

console.log(array.unshift(4, 5));
// Expected output: 5

console.log(array);
// Expected output: Array [4, 5, 1, 2, 3]
```

## Cú pháp

```js-nolint
unshift()
unshift(element1)
unshift(element1, element2)
unshift(element1, element2, /* …, */ elementN)
```

### Tham số

- `element1`, …, `elementN`
  - : Các phần tử cần thêm vào đầu `arr`.

### Giá trị trả về

Thuộc tính {{jsxref("Array/length", "length")}} mới của đối tượng mà phương thức được gọi.

## Mô tả

Phương thức `unshift()` chèn các giá trị nhất định vào đầu đối tượng giống mảng.

{{jsxref("Array.prototype.push()")}} có hành vi tương tự với `unshift()`, nhưng áp dụng cho cuối mảng.

Lưu ý rằng nếu nhiều phần tử được truyền làm tham số, chúng được chèn vào đầu đối tượng theo cùng thứ tự chúng được truyền làm tham số. Do đó, việc gọi `unshift()` với `n` đối số **một lần**, hoặc gọi nó `n` lần với **1** đối số (với vòng lặp chẳng hạn), không cho cùng kết quả.

Xem ví dụ:

```js
let arr = [4, 5, 6];

arr.unshift(1, 2, 3);
console.log(arr);
// [1, 2, 3, 4, 5, 6]

arr = [4, 5, 6]; // resetting the array

arr.unshift(1);
arr.unshift(2);
arr.unshift(3);

console.log(arr);
// [3, 2, 1, 4, 5, 6]
```

Phương thức `unshift()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên. Mặc dù chuỗi cũng là dạng giống mảng, phương thức này không phù hợp để áp dụng cho chúng vì chuỗi là bất biến.

## Ví dụ

### Sử dụng unshift()

```js
const arr = [1, 2];

arr.unshift(0); // result of the call is 3, which is the new array length
// arr is [0, 1, 2]

arr.unshift(-2, -1); // the new array length is 5
// arr is [-2, -1, 0, 1, 2]

arr.unshift([-4, -3]); // the new array length is 6
// arr is [[-4, -3], -2, -1, 0, 1, 2]

arr.unshift([-7, -6], [-5]); // the new array length is 8
// arr is [ [-7, -6], [-5], [-4, -3], -2, -1, 0, 1, 2 ]
```

### Gọi unshift() trên đối tượng không phải mảng

Phương thức `unshift()` đọc thuộc tính `length` của `this`. Nó dịch chuyển tất cả các chỉ mục trong phạm vi `0` đến `length - 1` sang phải theo số lượng đối số (tăng giá trị của chúng theo con số này). Sau đó, nó đặt mỗi chỉ mục bắt đầu từ `0` với các đối số được truyền vào `unshift()`. Cuối cùng, nó đặt `length` bằng độ dài trước đó cộng với số phần tử được thêm vào đầu.

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  2: 4,
};
Array.prototype.unshift.call(arrayLike, 1, 2);
console.log(arrayLike);
// { '0': 1, '1': 2, '4': 4, length: 5, unrelated: 'foo' }

const plainObj = {};
// There's no length property, so the length is 0
Array.prototype.unshift.call(plainObj, 1, 2);
console.log(plainObj);
// { '0': 1, '1': 2, length: 2 }
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.unshift` trong `core-js` với các bản sửa lỗi của phương thức này](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.unshift`](https://www.npmjs.com/package/array.prototype.unshift)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.push()")}}
- {{jsxref("Array.prototype.pop()")}}
- {{jsxref("Array.prototype.shift()")}}
- {{jsxref("Array.prototype.concat()")}}
- {{jsxref("Array.prototype.splice()")}}
