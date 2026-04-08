---
title: Array.prototype.reverse()
short-title: reverse()
slug: Web/JavaScript/Reference/Global_Objects/Array/reverse
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.reverse
sidebar: jsref
---

Phương thức **`reverse()`** của các đối tượng {{jsxref("Array")}} đảo ngược mảng _[tại chỗ](https://en.wikipedia.org/wiki/In-place_algorithm)_ và trả về tham chiếu đến cùng mảng đó, phần tử đầu tiên của mảng trở thành phần tử cuối cùng, và phần tử cuối cùng trở thành phần tử đầu tiên. Nói cách khác, thứ tự các phần tử trong mảng sẽ được đảo lại so với trước đây.

Để đảo ngược các phần tử trong mảng mà không thay đổi mảng gốc, dùng {{jsxref("Array/toReversed", "toReversed()")}}.

{{InteractiveExample("JavaScript Demo: Array.prototype.reverse()")}}

```js interactive-example
const array = ["one", "two", "three"];
console.log("array:", array);
// Expected output: "array:" Array ["one", "two", "three"]

const reversed = array.reverse();
console.log("reversed:", reversed);
// Expected output: "reversed:" Array ["three", "two", "one"]

// Careful: reverse is destructive -- it changes the original array.
console.log("array:", array);
// Expected output: "array:" Array ["three", "two", "one"]
```

## Cú pháp

```js-nolint
reverse()
```

### Tham số

Không có.

### Giá trị trả về

Tham chiếu đến mảng gốc, giờ đã được đảo ngược. Lưu ý rằng mảng được đảo ngược _[tại chỗ](https://en.wikipedia.org/wiki/In-place_algorithm)_, và không có bản sao nào được tạo.

## Mô tả

Phương thức `reverse()` hoán vị các phần tử của đối tượng mảng gọi tại chỗ, thay đổi mảng và trả về tham chiếu đến mảng.

Phương thức `reverse()` bảo tồn các ô trống. Nếu mảng nguồn là [thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), các chỉ mục tương ứng mới của các ô trống sẽ bị [xóa](/en-US/docs/Web/JavaScript/Reference/Operators/delete) và cũng trở thành các ô trống.

Phương thức `reverse()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên. Mặc dù chuỗi cũng là dạng giống mảng, phương thức này không phù hợp để áp dụng cho chúng vì chuỗi là bất biến.

## Ví dụ

### Đảo ngược các phần tử trong mảng

Ví dụ sau tạo một mảng `items` chứa ba phần tử, sau đó đảo ngược mảng. Lời gọi đến `reverse()` trả về tham chiếu đến mảng `items` đã được đảo ngược.

```js
const items = [1, 2, 3];
console.log(items); // [1, 2, 3]

items.reverse();
console.log(items); // [3, 2, 1]
```

### Phương thức reverse() trả về tham chiếu đến cùng mảng

Phương thức `reverse()` trả về tham chiếu đến mảng gốc, vì vậy thay đổi mảng trả về cũng sẽ thay đổi mảng gốc.

```js
const numbers = [3, 2, 4, 1, 5];
const reversed = numbers.reverse();
// numbers and reversed are both in reversed order [5, 1, 4, 2, 3]
reversed[0] = 5;
console.log(numbers[0]); // 5
```

Trong trường hợp bạn muốn `reverse()` không thay đổi mảng gốc, nhưng trả về một mảng [shallow-copied](/en-US/docs/Glossary/Shallow_copy) như các phương thức mảng khác (ví dụ: [`map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)), dùng phương thức {{jsxref("Array/toReversed", "toReversed()")}}. Ngoài ra, bạn có thể sao chép nông trước khi gọi `reverse()`, bằng cách dùng [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) hoặc [`Array.from()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from).

```js
const numbers = [3, 2, 4, 1, 5];
// [...numbers] creates a shallow copy, so reverse() does not mutate the original
const reverted = [...numbers].reverse();
reverted[0] = 5;
console.log(numbers[0]); // 3
```

### Sử dụng reverse() trên mảng thưa

Mảng thưa vẫn thưa sau khi gọi `reverse()`. Các ô trống được sao chép sang các chỉ mục mới tương ứng của chúng như là các ô trống.

```js
console.log([1, , 3].reverse()); // [3, empty, 1]
console.log([1, , 3, 4].reverse()); // [4, 3, empty, 1]
```

### Gọi reverse() trên đối tượng không phải mảng

Phương thức `reverse()` đọc thuộc tính `length` của `this`. Sau đó nó truy cập từng thuộc tính có khóa số nguyên từ `0` đến `length / 2`, và hoán đổi hai chỉ mục tương ứng ở cả hai đầu, [xóa](/en-US/docs/Web/JavaScript/Reference/Operators/delete) bất kỳ thuộc tính đích nào mà thuộc tính nguồn không tồn tại.

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  2: 4,
  3: 33, // ignored by reverse() since length is 3
};
console.log(Array.prototype.reverse.call(arrayLike));
// { 0: 4, 3: 33, length: 3, unrelated: 'foo' }
// The index 2 is deleted because there was no index 0 present originally
// The index 3 is unchanged since the length is 3
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.reverse` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.reverse`](https://www.npmjs.com/package/array.prototype.reverse)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.join()")}}
- {{jsxref("Array.prototype.sort()")}}
- {{jsxref("Array.prototype.toReversed()")}}
- {{jsxref("TypedArray.prototype.reverse()")}}
