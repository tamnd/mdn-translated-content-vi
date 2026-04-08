---
title: Array.isArray()
short-title: isArray()
slug: Web/JavaScript/Reference/Global_Objects/Array/isArray
page-type: javascript-static-method
browser-compat: javascript.builtins.Array.isArray
sidebar: jsref
---

Phương thức tĩnh **`Array.isArray()`** xác định xem giá trị được truyền vào có phải là {{jsxref("Array")}} hay không.

{{InteractiveExample("JavaScript Demo: Array.isArray()")}}

```js interactive-example
console.log(Array.isArray([1, 3, 5]));
// Expected output: true

console.log(Array.isArray("[]"));
// Expected output: false

console.log(Array.isArray(new Array(5)));
// Expected output: true

console.log(Array.isArray(new Int16Array([15, 33])));
// Expected output: false
```

## Cú pháp

```js-nolint
Array.isArray(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra.

### Giá trị trả về

`true` nếu `value` là {{jsxref("Array")}}; ngược lại là `false`. `false` luôn được trả về nếu `value` là một đối tượng {{jsxref("TypedArray")}}.

## Mô tả

`Array.isArray()` kiểm tra xem giá trị được truyền vào có phải là {{jsxref("Array")}} hay không. Nó thực hiện _kiểm tra có nhãn hiệu_, tương tự toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in), cho một trường riêng tư được khởi tạo bởi hàm tạo {{jsxref("Array/Array", "Array()")}}.

Đây là một lựa chọn thay thế vững chắc hơn so với [`instanceof Array`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) vì nó tránh được các kết quả dương tính giả và âm tính giả:

- `Array.isArray()` từ chối các giá trị không phải là đối tượng `Array` thực sự, ngay cả khi chúng có `Array.prototype` trong chuỗi prototype — `instanceof Array` sẽ chấp nhận chúng vì nó kiểm tra chuỗi prototype.
- `Array.isArray()` chấp nhận các đối tượng `Array` được tạo trong một realm khác — `instanceof Array` trả về `false` cho những đối tượng này vì định danh của hàm tạo `Array` khác nhau giữa các realm.

Xem bài viết ["Determining with absolute accuracy whether or not a JavaScript object is an array"](https://web.mit.edu/jwalden/www/isArray.html) để biết thêm chi tiết.

## Ví dụ

### Sử dụng Array.isArray()

```js
// all following calls return true
Array.isArray([]);
Array.isArray([1]);
Array.isArray(new Array());
Array.isArray(new Array("a", "b", "c", "d"));
Array.isArray(new Array(3));
// Little known fact: Array.prototype itself is an array:
Array.isArray(Array.prototype);

// all following calls return false
Array.isArray();
Array.isArray({});
Array.isArray(null);
Array.isArray(undefined);
Array.isArray(17);
Array.isArray("Array");
Array.isArray(true);
Array.isArray(false);
Array.isArray(new Uint8Array(32));
// This is not an array, because it was not created using the
// array literal syntax or the Array constructor
Array.isArray({ __proto__: Array.prototype });
```

### instanceof và Array.isArray()

Khi kiểm tra đối tượng `Array`, `Array.isArray()` được ưu tiên hơn `instanceof` vì nó hoạt động xuyên suốt các realm.

```js
const iframe = document.createElement("iframe");
document.body.appendChild(iframe);
const xArray = window.frames[window.frames.length - 1].Array;
const arr = new xArray(1, 2, 3); // [1, 2, 3]

// Correctly checking for Array
Array.isArray(arr); // true
// The prototype of arr is xArray.prototype, which is a
// different object from Array.prototype
arr instanceof Array; // false
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.isArray` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.isArray`](https://www.npmjs.com/package/array.isarray)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
