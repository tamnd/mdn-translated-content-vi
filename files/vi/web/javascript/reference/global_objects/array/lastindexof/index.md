---
title: Array.prototype.lastIndexOf()
short-title: lastIndexOf()
slug: Web/JavaScript/Reference/Global_Objects/Array/lastIndexOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.lastIndexOf
sidebar: jsref
---

Phương thức **`lastIndexOf()`** của các đối tượng {{jsxref("Array")}} trả về chỉ mục cuối cùng mà tại đó một phần tử nhất định có thể được tìm thấy trong mảng, hoặc -1 nếu không có mặt. Mảng được tìm kiếm ngược, bắt đầu từ `fromIndex`.

{{InteractiveExample("JavaScript Demo: Array.prototype.lastIndexOf()")}}

```js interactive-example
const animals = ["Dodo", "Tiger", "Penguin", "Dodo"];

console.log(animals.lastIndexOf("Dodo"));
// Expected output: 3

console.log(animals.lastIndexOf("Tiger"));
// Expected output: 1
```

## Cú pháp

```js-nolint
lastIndexOf(searchElement)
lastIndexOf(searchElement, fromIndex)
```

### Tham số

- `searchElement`
  - : Phần tử cần tìm trong mảng.
- `fromIndex` {{optional_inline}}
  - : Chỉ mục (dựa trên 0) để bắt đầu tìm kiếm ngược, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
    - Chỉ mục âm đếm ngược từ cuối mảng — nếu `-array.length <= fromIndex < 0`, sẽ dùng `fromIndex + array.length`.
    - Nếu `fromIndex < -array.length`, mảng sẽ không được tìm kiếm và trả về `-1`. Bạn có thể hiểu về mặt khái niệm là bắt đầu ở một vị trí không tồn tại trước đầu mảng và đi ngược từ đó. Không có phần tử mảng nào trên đường đi, nên `searchElement` không bao giờ được tìm thấy.
    - Nếu `fromIndex >= array.length` hoặc `fromIndex` bị bỏ qua hay là `undefined`, sẽ dùng `array.length - 1`, khiến toàn bộ mảng được tìm kiếm. Bạn có thể hiểu về mặt khái niệm là bắt đầu ở một vị trí không tồn tại vượt ra ngoài cuối mảng và đi ngược từ đó. Cuối cùng nó đến vị trí cuối thực sự của mảng, lúc đó nó bắt đầu tìm kiếm ngược qua các phần tử mảng thực sự.

### Giá trị trả về

Chỉ mục cuối cùng của `searchElement` trong mảng; `-1` nếu không tìm thấy.

## Mô tả

Phương thức `lastIndexOf()` so sánh `searchElement` với các phần tử của mảng bằng [đẳng thức nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) (cùng thuật toán với toán tử `===`). Các giá trị [`NaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) không bao giờ được so sánh bằng nhau, nên `lastIndexOf()` luôn trả về `-1` khi `searchElement` là `NaN`.

Phương thức `lastIndexOf()` bỏ qua các ô trống trong [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

Phương thức `lastIndexOf()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Sử dụng lastIndexOf()

Ví dụ sau sử dụng `lastIndexOf()` để tìm vị trí các giá trị trong mảng.

```js
const numbers = [2, 5, 9, 2];
numbers.lastIndexOf(2); // 3
numbers.lastIndexOf(7); // -1
numbers.lastIndexOf(2, 3); // 3
numbers.lastIndexOf(2, 2); // 0
numbers.lastIndexOf(2, -2); // 0
numbers.lastIndexOf(2, -1); // 3
```

Bạn không thể dùng `lastIndexOf()` để tìm kiếm `NaN`.

```js
const array = [NaN];
array.lastIndexOf(NaN); // -1
```

### Tìm tất cả các lần xuất hiện của một phần tử

Ví dụ sau sử dụng `lastIndexOf` để tìm tất cả các chỉ mục của một phần tử trong mảng đã cho, dùng {{jsxref("Array/push", "push()")}} để thêm chúng vào mảng khác khi tìm thấy.

```js
const indices = [];
const array = ["a", "b", "a", "c", "a", "d"];
const element = "a";
let idx = array.lastIndexOf(element);
while (idx !== -1) {
  indices.push(idx);
  idx = idx > 0 ? array.lastIndexOf(element, idx - 1) : -1;
}

console.log(indices);
// [4, 2, 0]
```

Lưu ý rằng chúng ta phải xử lý trường hợp `idx === 0` riêng ở đây vì phần tử sẽ luôn được tìm thấy bất kể tham số `fromIndex` nếu nó là phần tử đầu tiên của mảng. Điều này khác với phương thức {{jsxref("Array/indexOf", "indexOf()")}}.

### Sử dụng lastIndexOf() trên mảng thưa

Bạn không thể dùng `lastIndexOf()` để tìm kiếm các ô trống trong mảng thưa.

```js
console.log([1, , 3].lastIndexOf(undefined)); // -1
```

### Gọi lastIndexOf() trên đối tượng không phải mảng

Phương thức `lastIndexOf()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 3,
  2: 2,
  3: 5, // ignored by lastIndexOf() since length is 3
};
console.log(Array.prototype.lastIndexOf.call(arrayLike, 2));
// 2
console.log(Array.prototype.lastIndexOf.call(arrayLike, 5));
// -1
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.lastIndexOf` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.lastIndexOf`](https://www.npmjs.com/package/array.prototype.lastindexof)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.findIndex()")}}
- {{jsxref("Array.prototype.findLastIndex()")}}
- {{jsxref("Array.prototype.indexOf()")}}
- {{jsxref("TypedArray.prototype.lastIndexOf()")}}
- {{jsxref("String.prototype.lastIndexOf()")}}
