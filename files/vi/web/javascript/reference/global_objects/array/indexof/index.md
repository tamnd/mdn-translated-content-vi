---
title: Array.prototype.indexOf()
short-title: indexOf()
slug: Web/JavaScript/Reference/Global_Objects/Array/indexOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.indexOf
sidebar: jsref
---

Phương thức **`indexOf()`** của các đối tượng {{jsxref("Array")}} trả về chỉ mục đầu tiên mà tại đó một phần tử nhất định có thể được tìm thấy trong mảng, hoặc -1 nếu không có mặt.

{{InteractiveExample("JavaScript Demo: Array.prototype.indexOf()")}}

```js interactive-example
const beasts = ["ant", "bison", "camel", "duck", "bison"];

console.log(beasts.indexOf("bison"));
// Expected output: 1

// Start from index 2
console.log(beasts.indexOf("bison", 2));
// Expected output: 4

console.log(beasts.indexOf("giraffe"));
// Expected output: -1
```

## Cú pháp

```js-nolint
indexOf(searchElement)
indexOf(searchElement, fromIndex)
```

### Tham số

- `searchElement`
  - : Phần tử cần tìm trong mảng.
- `fromIndex` {{optional_inline}}
  - : Chỉ mục (dựa trên 0) để bắt đầu tìm kiếm, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
    - Chỉ mục âm đếm ngược từ cuối mảng — nếu `-array.length <= fromIndex < 0`, sẽ dùng `fromIndex + array.length`. Lưu ý, mảng vẫn được tìm kiếm từ đầu đến cuối trong trường hợp này.
    - Nếu `fromIndex < -array.length` hoặc `fromIndex` bị bỏ qua, sẽ dùng `0`, khiến toàn bộ mảng được tìm kiếm.
    - Nếu `fromIndex >= array.length`, mảng sẽ không được tìm kiếm và trả về `-1`.

### Giá trị trả về

Chỉ mục đầu tiên của `searchElement` trong mảng; `-1` nếu không tìm thấy.

## Mô tả

Phương thức `indexOf()` so sánh `searchElement` với các phần tử của mảng bằng [đẳng thức nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) (cùng thuật toán với toán tử `===`). Các giá trị [`NaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) không bao giờ được so sánh bằng nhau, nên `indexOf()` luôn trả về `-1` khi `searchElement` là `NaN`.

Phương thức `indexOf()` bỏ qua các ô trống trong [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

Phương thức `indexOf()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Sử dụng indexOf()

Ví dụ sau sử dụng `indexOf()` để tìm vị trí các giá trị trong mảng.

```js
const array = [2, 9, 9];
array.indexOf(2); // 0
array.indexOf(7); // -1
array.indexOf(9, 2); // 2
array.indexOf(2, -1); // -1
array.indexOf(2, -3); // 0
```

Bạn không thể dùng `indexOf()` để tìm kiếm `NaN`.

```js
const array = [NaN];
array.indexOf(NaN); // -1
```

### Tìm tất cả các lần xuất hiện của một phần tử

```js
const indices = [];
const array = ["a", "b", "a", "c", "a", "d"];
const element = "a";
let idx = array.indexOf(element);
while (idx !== -1) {
  indices.push(idx);
  idx = array.indexOf(element, idx + 1);
}
console.log(indices);
// [0, 2, 4]
```

### Kiểm tra xem phần tử có tồn tại trong mảng không và cập nhật mảng

```js
function updateVegetablesCollection(veggies, veggie) {
  if (veggies.indexOf(veggie) === -1) {
    veggies.push(veggie);
    console.log(`New veggies collection is: ${veggies}`);
  } else {
    console.log(`${veggie} already exists in the veggies collection.`);
  }
}

const veggies = ["potato", "tomato", "chillies", "green-pepper"];

updateVegetablesCollection(veggies, "spinach");
// New veggies collection is: potato,tomato,chillies,green-pepper,spinach
updateVegetablesCollection(veggies, "spinach");
// spinach already exists in the veggies collection.
```

### Sử dụng indexOf() trên mảng thưa

Bạn không thể dùng `indexOf()` để tìm kiếm các ô trống trong mảng thưa.

```js
console.log([1, , 3].indexOf(undefined)); // -1
```

### Gọi indexOf() trên đối tượng không phải mảng

Phương thức `indexOf()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 3,
  2: 4,
  3: 5, // ignored by indexOf() since length is 3
};
console.log(Array.prototype.indexOf.call(arrayLike, 2));
// 0
console.log(Array.prototype.indexOf.call(arrayLike, 5));
// -1
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.indexOf` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.indexOf`](https://www.npmjs.com/package/array.prototype.indexof)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.findIndex()")}}
- {{jsxref("Array.prototype.findLastIndex()")}}
- {{jsxref("Array.prototype.lastIndexOf()")}}
- {{jsxref("TypedArray.prototype.indexOf()")}}
- {{jsxref("String.prototype.indexOf()")}}
