---
title: Array.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Array/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.toString
sidebar: jsref
---

Phương thức **`toString()`** của các đối tượng {{jsxref("Array")}} trả về một chuỗi đại diện cho mảng được chỉ định và các phần tử của nó.

{{InteractiveExample("JavaScript Demo: Array.prototype.toString()", "shorter")}}

```js interactive-example
const array = [1, 2, "a", "1a"];

console.log(array.toString());
// Expected output: "1,2,a,1a"
```

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho các phần tử của mảng.

## Mô tả

Đối tượng {{jsxref("Array")}} ghi đè phương thức `toString` của {{jsxref("Object")}}. Phương thức `toString` của mảng gọi nội bộ [`join()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join), nối mảng và trả về một chuỗi chứa mỗi phần tử mảng được phân tách bằng dấu phẩy. Nếu phương thức `join` không khả dụng hoặc không phải là hàm, [`Object.prototype.toString`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString) được dùng thay thế, trả về `[object Array]`.

```js
const arr = [];
arr.join = 1; // re-assign `join` with a non-function
console.log(arr.toString()); // [object Array]

console.log(Array.prototype.toString.call({ join: () => 1 })); // 1
```

JavaScript tự động gọi phương thức `toString` khi mảng cần được biểu diễn dưới dạng giá trị văn bản hoặc khi mảng được tham chiếu trong phép ghép chuỗi.

`Array.prototype.toString` đệ quy chuyển đổi từng phần tử, bao gồm cả các mảng khác, thành chuỗi. Vì chuỗi được trả về bởi `Array.prototype.toString` không có dấu phân cách, các mảng lồng nhau trông như thể chúng được làm phẳng.

```js
const matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
];

console.log(matrix.toString()); // 1,2,3,4,5,6,7,8,9
```

Khi mảng có chu kỳ (chứa phần tử là chính nó), các trình duyệt tránh đệ quy vô hạn bằng cách bỏ qua tham chiếu chu kỳ.

```js
const arr = [];
arr.push(1, [3, arr, 4], 2);
console.log(arr.toString()); // 1,3,,4,2
```

## Ví dụ

### Sử dụng toString()

```js
const array = [1, 2, "a", "1a"];

console.log(array.toString()); // "1,2,a,1a"
```

### Sử dụng toString() trên mảng thưa

Theo hành vi của `join()`, `toString()` xử lý các vị trí trống giống như `undefined` và tạo ra dấu phân cách thừa:

```js
console.log([1, , 3].toString()); // '1,,3'
```

### Gọi toString() trên đối tượng không phải mảng

`toString()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó yêu cầu `this` có phương thức `join()`; hoặc nếu không có, sẽ dùng `Object.prototype.toString()` thay thế.

```js
console.log(Array.prototype.toString.call({ join: () => 1 }));
// 1; a number
console.log(Array.prototype.toString.call({ join: () => undefined }));
// undefined
console.log(Array.prototype.toString.call({ join: "not function" }));
// "[object Object]"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.join()")}}
- {{jsxref("Array.prototype.toLocaleString()")}}
- {{jsxref("TypedArray.prototype.toString()")}}
- {{jsxref("String.prototype.toString()")}}
