---
title: Array.prototype.join()
short-title: join()
slug: Web/JavaScript/Reference/Global_Objects/Array/join
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.join
sidebar: jsref
---

Phương thức **`join()`** của các đối tượng {{jsxref("Array")}} tạo và trả về một chuỗi mới bằng cách nối tất cả các phần tử trong mảng này, được phân tách bởi dấu phẩy hoặc một chuỗi ngăn cách được chỉ định. Nếu mảng chỉ có một phần tử, phần tử đó sẽ được trả về mà không dùng dấu ngăn cách.

{{InteractiveExample("JavaScript Demo: Array.prototype.join()")}}

```js interactive-example
const elements = ["Fire", "Air", "Water"];

console.log(elements.join());
// Expected output: "Fire,Air,Water"

console.log(elements.join(""));
// Expected output: "FireAirWater"

console.log(elements.join("-"));
// Expected output: "Fire-Air-Water"
```

## Cú pháp

```js-nolint
join()
join(separator)
```

### Tham số

- `separator` {{optional_inline}}
  - : Một chuỗi để phân tách từng cặp phần tử liền kề trong mảng. Nếu bị bỏ qua, các phần tử mảng được phân tách bằng dấu phẩy (",").

### Giá trị trả về

Một chuỗi với tất cả các phần tử mảng được nối lại. Nếu `array.length` là `0`, chuỗi rỗng được trả về.

## Mô tả

Các biểu diễn chuỗi của tất cả các phần tử mảng được nối thành một chuỗi. Nếu một phần tử là `undefined` hoặc `null`, nó được chuyển đổi thành chuỗi rỗng thay vì chuỗi `"null"` hay `"undefined"`.

Phương thức `join` được truy cập nội bộ bởi [`Array.prototype.toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toString) mà không có đối số. Việc ghi đè `join` của một đối tượng mảng sẽ ghi đè cả hành vi `toString` của nó.

`Array.prototype.join` đệ quy chuyển đổi từng phần tử, bao gồm cả các mảng khác, thành chuỗi. Vì chuỗi trả về bởi `Array.prototype.toString` (tương đương gọi `join()`) không có dấu phân cách, các mảng lồng nhau trông như thể được làm phẳng. Bạn chỉ có thể kiểm soát dấu ngăn cách của cấp đầu tiên, trong khi các cấp sâu hơn luôn dùng dấu phẩy mặc định.

```js
const matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
];

console.log(matrix.join()); // 1,2,3,4,5,6,7,8,9
console.log(matrix.join(";")); // 1,2,3;4,5,6;7,8,9
```

Khi một mảng có chu trình (nó chứa một phần tử là chính nó), các trình duyệt tránh đệ quy vô hạn bằng cách bỏ qua tham chiếu chu trình.

```js
const arr = [];
arr.push(1, [3, arr, 4], 2);
console.log(arr.join(";")); // 1;3,,4;2
```

Khi dùng trên [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), phương thức `join()` lặp qua các ô trống như thể chúng có giá trị `undefined`.

Phương thức `join()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Nối mảng bốn cách khác nhau

Ví dụ sau tạo một mảng `a` với ba phần tử, sau đó nối mảng bốn lần: dùng dấu ngăn cách mặc định, rồi dấu phẩy và khoảng trắng, rồi dấu cộng và chuỗi rỗng.

```js
const a = ["Wind", "Water", "Fire"];
a.join(); // 'Wind,Water,Fire'
a.join(", "); // 'Wind, Water, Fire'
a.join(" + "); // 'Wind + Water + Fire'
a.join(""); // 'WindWaterFire'
```

### Sử dụng join() trên mảng thưa

`join()` xử lý các ô trống giống như `undefined` và tạo ra dấu ngăn cách thêm:

```js
console.log([1, , 3].join()); // '1,,3'
console.log([1, undefined, 3].join()); // '1,,3'
```

### Gọi join() trên đối tượng không phải mảng

Phương thức `join()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 3,
  2: 4,
  3: 5, // ignored by join() since length is 3
};
console.log(Array.prototype.join.call(arrayLike));
// 2,3,4
console.log(Array.prototype.join.call(arrayLike, "."));
// 2.3.4
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.join` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.join`](https://www.npmjs.com/package/array.prototype.join)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.toString()")}}
- {{jsxref("TypedArray.prototype.join()")}}
- {{jsxref("String.prototype.split()")}}
