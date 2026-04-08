---
title: Array.prototype.toSpliced()
short-title: toSpliced()
slug: Web/JavaScript/Reference/Global_Objects/Array/toSpliced
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.toSpliced
sidebar: jsref
---

Phương thức **`toSpliced()`** của các đối tượng {{jsxref("Array")}} là phiên bản [sao chép](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods) của phương thức {{jsxref("Array/splice", "splice()")}}. Nó trả về một mảng mới với một số phần tử bị xóa và/hoặc thay thế tại một chỉ mục nhất định.

## Cú pháp

```js-nolint
toSpliced(start)
toSpliced(start, skipCount)
toSpliced(start, skipCount, item1)
toSpliced(start, skipCount, item1, item2)
toSpliced(start, skipCount, item1, item2, /* …, */ itemN)
```

### Tham số

- `start`
  - : Chỉ mục từ 0 để bắt đầu thay đổi mảng, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
    - Chỉ mục âm đếm ngược từ cuối mảng — nếu `-array.length <= start < 0`, sẽ dùng `start + array.length`.
    - Nếu `start < -array.length` hoặc `start` bị bỏ qua, sẽ dùng `0`.
    - Nếu `start >= array.length`, không phần tử nào bị xóa, nhưng phương thức sẽ hoạt động như một hàm thêm, thêm nhiều phần tử như được cung cấp.

- `skipCount` {{optional_inline}}
  - : Số nguyên chỉ ra số lượng phần tử trong mảng cần xóa (hay bỏ qua) từ `start`.

    Nếu `skipCount` bị bỏ qua, hoặc nếu giá trị của nó lớn hơn hoặc bằng số lượng phần tử sau vị trí được chỉ định bởi `start`, thì tất cả các phần tử từ `start` đến cuối mảng sẽ bị xóa. Tuy nhiên, nếu bạn muốn truyền tham số `itemN`, bạn nên truyền `Infinity` làm `skipCount` để xóa tất cả các phần tử sau `start`, vì `undefined` tường minh bị [chuyển đổi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion) thành `0`.

    Nếu `skipCount` là `0` hoặc âm, không có phần tử nào bị xóa. Trong trường hợp này, bạn nên chỉ định ít nhất một phần tử mới (xem bên dưới).

- `item1`, …, `itemN` {{optional_inline}}
  - : Các phần tử cần thêm vào mảng, bắt đầu từ `start`.

    Nếu bạn không chỉ định bất kỳ phần tử nào, `toSpliced()` sẽ chỉ xóa các phần tử khỏi mảng.

### Giá trị trả về

Một mảng mới bao gồm tất cả các phần tử trước `start`, `item1`, `item2`, …, `itemN`, và tất cả các phần tử sau `start + skipCount`.

## Mô tả

Phương thức `toSpliced()`, giống như `splice()`, thực hiện nhiều thao tác cùng lúc: nó xóa số lượng phần tử nhất định khỏi mảng, bắt đầu từ chỉ mục nhất định, sau đó chèn các phần tử nhất định tại cùng chỉ mục đó. Tuy nhiên, nó trả về một mảng mới thay vì sửa đổi mảng gốc. Do đó, các phần tử bị xóa không được trả về từ phương thức này, nhưng chúng vẫn có thể truy cập trong mảng gốc.

Phương thức `toSpliced()` không bao giờ tạo ra [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays). Nếu mảng nguồn thưa, các vị trí trống sẽ được thay thế bằng `undefined` trong mảng mới.

Phương thức `toSpliced()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Xóa, thêm và thay thế các phần tử

Bạn có thể dùng `toSpliced()` để xóa, thêm và thay thế các phần tử trong mảng và tạo mảng mới hiệu quả hơn so với dùng `slice()` và `concat()`.

```js
const months = ["Jan", "Mar", "Apr", "May"];

// Inserting an element at index 1
const months2 = months.toSpliced(1, 0, "Feb");
console.log(months2); // ["Jan", "Feb", "Mar", "Apr", "May"]

// Deleting two elements starting from index 2
const months3 = months2.toSpliced(2, 2);
console.log(months3); // ["Jan", "Feb", "May"]

// Replacing one element at index 1 with two new elements
const months4 = months3.toSpliced(1, 1, "Feb", "Mar");
console.log(months4); // ["Jan", "Feb", "Mar", "May"]

// Original array is not modified
console.log(months); // ["Jan", "Mar", "Apr", "May"]
```

### Sử dụng toSpliced() trên mảng thưa

Phương thức `toSpliced()` luôn tạo ra một mảng dày đặc.

```js
const arr = [1, , 3, 4, , 6];
console.log(arr.toSpliced(1, 2)); // [1, 4, undefined, 6]
```

### Gọi toSpliced() trên đối tượng không phải mảng

Phương thức `toSpliced()` đọc thuộc tính `length` của `this`. Sau đó nó đọc các thuộc tính có khóa nguyên cần thiết và ghi chúng vào mảng mới.

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  0: 5,
  2: 4,
};
console.log(Array.prototype.toSpliced.call(arrayLike, 0, 1, 2, 3));
// [2, 3, undefined, 4]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.toSpliced` trong `core-js`](https://github.com/zloirock/core-js#change-array-by-copy)
- [es-shims polyfill của `Array.prototype.toSpliced`](https://www.npmjs.com/package/array.prototype.tospliced)
- {{jsxref("Array.prototype.splice()")}}
- {{jsxref("Array.prototype.toReversed()")}}
- {{jsxref("Array.prototype.toSorted()")}}
- {{jsxref("Array.prototype.with()")}}
