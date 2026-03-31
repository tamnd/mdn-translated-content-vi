---
title: Array.prototype.keys()
short-title: keys()
slug: Web/JavaScript/Reference/Global_Objects/Array/keys
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.keys
sidebar: jsref
---

Phương thức **`keys()`** của các đối tượng {{jsxref("Array")}} trả về một đối tượng _[array iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới chứa các khóa (key) cho mỗi chỉ mục trong mảng.

{{InteractiveExample("JavaScript Demo: Array.prototype.keys()")}}

```js interactive-example
const array = ["a", "b", "c"];
const iterator = array.keys();

for (const key of iterator) {
  console.log(key);
}

// Expected output: 0
// Expected output: 1
// Expected output: 2
```

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Mô tả

Khi dùng trên [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), phương thức `keys()` lặp qua các ô trống như thể chúng có giá trị `undefined`.

Phương thức `keys()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Sử dụng keys() trên mảng thưa

Không giống {{jsxref("Object.keys()")}}, chỉ bao gồm các khóa thực sự tồn tại trong mảng, iterator `keys()` không bỏ qua các lỗ hổng đại diện cho các thuộc tính bị thiếu.

```js
const arr = ["a", , "c"];
const sparseKeys = Object.keys(arr);
const denseKeys = [...arr.keys()];
console.log(sparseKeys); // ['0', '2']
console.log(denseKeys); // [0, 1, 2]
```

### Gọi keys() trên đối tượng không phải mảng

Phương thức `keys()` đọc thuộc tính `length` của `this` và sau đó sinh ra tất cả các chỉ mục nguyên nằm trong khoảng từ 0 đến `length - 1`. Không có truy cập chỉ mục thực sự nào xảy ra.

```js
const arrayLike = {
  length: 3,
};
for (const entry of Array.prototype.keys.call(arrayLike)) {
  console.log(entry);
}
// 0
// 1
// 2
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.keys` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.keys`](https://www.npmjs.com/package/array.prototype.keys)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.entries()")}}
- {{jsxref("Array.prototype.values()")}}
- [`Array.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator)
- {{jsxref("TypedArray.prototype.keys()")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
