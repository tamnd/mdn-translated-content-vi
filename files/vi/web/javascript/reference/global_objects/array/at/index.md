---
title: Array.prototype.at()
short-title: at()
slug: Web/JavaScript/Reference/Global_Objects/Array/at
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.at
sidebar: jsref
---

Phương thức **`at()`** của các instance {{jsxref("Array")}} nhận một giá trị số nguyên và trả về phần tử tại chỉ số đó, cho phép dùng cả số nguyên dương lẫn âm. Số nguyên âm đếm ngược từ phần tử cuối cùng trong mảng.

{{InteractiveExample("JavaScript Demo: Array.prototype.at()")}}

```js interactive-example
const array = [5, 12, 8, 130, 44];

let index = 2;

console.log(`An index of ${index} returns ${array.at(index)}`);
// Expected output: "An index of 2 returns 8"

index = -2;

console.log(`An index of ${index} returns ${array.at(index)}`);
// Expected output: "An index of -2 returns 130"
```

## Syntax

```js-nolint
at(index)
```

### Parameters

- `index`
  - : Chỉ số dựa trên 0 của phần tử mảng cần trả về, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). Chỉ số âm đếm ngược từ cuối mảng — nếu `index < 0`, thì `index + array.length` được truy cập.

### Return value

Phần tử trong mảng khớp với chỉ số đã cho. Luôn trả về {{jsxref("undefined")}} nếu `index < -array.length` hoặc `index >= array.length` mà không cố gắng truy cập thuộc tính tương ứng.

## Description

Phương thức `at()` tương đương với ký hiệu ngoặc vuông khi `index` là số nguyên không âm. Ví dụ, `array[0]` và `array.at(0)` đều trả về phần tử đầu tiên. Tuy nhiên, khi đếm phần tử từ cuối mảng, bạn không thể dùng `array[-1]` như trong Python hay R, vì tất cả các giá trị bên trong dấu ngoặc vuông đều được xử lý theo nghĩa đen như thuộc tính chuỗi, nên bạn sẽ đọc `array["-1"]`, là một thuộc tính chuỗi thông thường thay vì chỉ số mảng.

Cách thông thường là truy cập {{jsxref("Array/length", "length")}} và tính chỉ số từ đó — ví dụ: `array[array.length - 1]`. Phương thức `at()` cho phép lập chỉ số tương đối, vì vậy có thể rút gọn thành `array.at(-1)`.

Bằng cách kết hợp `at()` với {{jsxref("Array/with", "with()")}}, bạn có thể vừa đọc vừa ghi (tương ứng) một mảng sử dụng chỉ số âm.

Phương thức `at()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Examples

### Trả về giá trị cuối cùng của mảng

Ví dụ sau cung cấp một hàm trả về phần tử cuối cùng được tìm thấy trong mảng được chỉ định.

```js
// Our array with items
const cart = ["apple", "banana", "pear"];

// A function which returns the last item of a given array
function returnLast(arr) {
  return arr.at(-1);
}

// Get the last item of our array 'cart'
const item1 = returnLast(cart);
console.log(item1); // 'pear'

// Add an item to our 'cart' array
cart.push("orange");
const item2 = returnLast(cart);
console.log(item2); // 'orange'
```

### So sánh các phương pháp

Ví dụ này so sánh các cách khác nhau để chọn phần tử áp chót (phần tử cuối nhưng một) của {{jsxref("Array")}}. Trong khi tất cả các phương pháp được trình bày dưới đây đều hợp lệ, ví dụ này làm nổi bật sự ngắn gọn và dễ đọc của phương thức `at()`.

```js
// Our array with items
const colors = ["red", "green", "blue"];

// Using length property
const lengthWay = colors[colors.length - 2];
console.log(lengthWay); // 'green'

// Using slice() method. Note an array is returned
const sliceWay = colors.slice(-2, -1);
console.log(sliceWay[0]); // 'green'

// Using at() method
const atWay = colors.at(-2);
console.log(atWay); // 'green'
```

### Gọi at() trên các đối tượng không phải mảng

Phương thức `at()` đọc thuộc tính `length` của `this` và tính chỉ số cần truy cập.

```js
const arrayLike = {
  length: 2,
  0: "a",
  1: "b",
  2: "c", // ignored by at() since length is 2
};
console.log(Array.prototype.at.call(arrayLike, 0)); // "a"
console.log(Array.prototype.at.call(arrayLike, 2)); // undefined
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.at` in `core-js`](https://github.com/zloirock/core-js#relative-indexing-method)
- [es-shims polyfill of `Array.prototype.at`](https://www.npmjs.com/package/array.prototype.at)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.findIndex()")}}
- {{jsxref("Array.prototype.indexOf()")}}
- {{jsxref("Array.prototype.with()")}}
- {{jsxref("TypedArray.prototype.at()")}}
- {{jsxref("String.prototype.at()")}}
