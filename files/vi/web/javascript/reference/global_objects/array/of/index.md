---
title: Array.of()
short-title: of()
slug: Web/JavaScript/Reference/Global_Objects/Array/of
page-type: javascript-static-method
browser-compat: javascript.builtins.Array.of
sidebar: jsref
---

Phương thức tĩnh **`Array.of()`** tạo một đối tượng `Array` mới từ một số lượng đối số biến đổi, bất kể số lượng hay kiểu của các đối số.

{{InteractiveExample("JavaScript Demo: Array.of()", "shorter")}}

```js interactive-example
console.log(Array.of("foo", 2, "bar", true));
// Expected output: Array ["foo", 2, "bar", true]

console.log(Array.of());
// Expected output: Array []
```

## Cú pháp

```js-nolint
Array.of()
Array.of(element1)
Array.of(element1, element2)
Array.of(element1, element2, /* …, */ elementN)
```

### Tham số

- `element1`, …, `elementN`
  - : Các phần tử được dùng để tạo mảng.

### Giá trị trả về

Một đối tượng {{jsxref("Array")}} mới.

## Mô tả

Sự khác biệt giữa `Array.of()` và hàm tạo [`Array()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Array) là ở cách xử lý đối số đơn lẻ: `Array.of(7)` tạo mảng với một phần tử duy nhất `7`, trong khi `Array(7)` tạo mảng rỗng với thuộc tính `length` là `7`. (Điều đó ngụ ý một mảng với 7 ô trống, không phải các ô có giá trị {{jsxref("undefined")}} thực sự.)

```js
Array.of(7); // [7]
Array(7); // array of 7 empty slots

Array.of(1, 2, 3); // [1, 2, 3]
Array(1, 2, 3); // [1, 2, 3]
```

Phương thức `Array.of()` là một phương thức factory tổng quát. Ví dụ nếu lớp con của `Array` kế thừa phương thức `of()`, phương thức `of()` được kế thừa sẽ trả về các đối tượng mới của lớp con thay vì các đối tượng `Array`. Thực ra, giá trị `this` có thể là bất kỳ hàm tạo nào nhận một đối số duy nhất đại diện cho độ dài của mảng mới, và hàm tạo sẽ được gọi với số lượng đối số được truyền vào `of()`. `length` cuối cùng sẽ được đặt lại khi tất cả các phần tử được gán. Nếu giá trị `this` không phải là hàm tạo, hàm tạo `Array` đơn giản sẽ được dùng thay thế.

## Ví dụ

### Sử dụng Array.of()

```js
Array.of(1); // [1]
Array.of(1, 2, 3); // [1, 2, 3]
Array.of(undefined); // [undefined]
```

### Gọi of() trên các hàm tạo không phải mảng

Phương thức `of()` có thể được gọi trên bất kỳ hàm tạo nào nhận một đối số duy nhất đại diện cho độ dài của mảng mới.

```js
function NotArray(len) {
  console.log("NotArray called with length", len);
}

console.log(Array.of.call(NotArray, 1, 2, 3));
// NotArray called with length 3
// NotArray { '0': 1, '1': 2, '2': 3, length: 3 }

console.log(Array.of.call(Object)); // [Number: 0] { length: 0 }
```

Khi giá trị `this` không phải là hàm tạo, một đối tượng `Array` đơn giản được trả về.

```js
console.log(Array.of.call({}, 1)); // [ 1 ]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.of` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.of`](https://www.npmjs.com/package/array.of)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array/Array", "Array()")}}
- {{jsxref("Array.from()")}}
- {{jsxref("TypedArray.of()")}}
