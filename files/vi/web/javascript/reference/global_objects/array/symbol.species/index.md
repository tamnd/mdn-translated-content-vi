---
title: Array[Symbol.species]
short-title: "[Symbol.species]"
slug: Web/JavaScript/Reference/Global_Objects/Array/Symbol.species
page-type: javascript-static-accessor-property
browser-compat: javascript.builtins.Array.@@species
sidebar: jsref
---

Thuộc tính truy cập tĩnh **`Array[Symbol.species]`** trả về constructor được sử dụng để tạo các giá trị trả về từ các phương thức mảng.

> [!WARNING]
> Sự tồn tại của `[Symbol.species]` cho phép thực thi mã tùy ý và có thể tạo ra các lỗ hổng bảo mật. Nó cũng khiến một số tối ưu hóa trở nên khó khăn hơn nhiều. Các nhà phát triển engine đang [xem xét việc loại bỏ tính năng này](https://github.com/tc39/proposal-rm-builtin-subclassing). Hãy tránh phụ thuộc vào nó nếu có thể. Các phương thức mảng hiện đại, chẳng hạn như {{jsxref("Array/toReversed", "toReversed()")}}, không sử dụng `[Symbol.species]` và luôn trả về một instance của lớp cơ sở `Array`.

## Cú pháp

```js-nolint
Array[Symbol.species]
```

### Giá trị trả về

Giá trị của constructor (`this`) mà `get [Symbol.species]` được gọi trên đó. Giá trị trả về được sử dụng để tạo các giá trị trả về từ các phương thức mảng tạo mảng mới.

## Mô tả

Thuộc tính truy cập `[Symbol.species]` trả về constructor mặc định cho các đối tượng `Array`. Các constructor của lớp con có thể ghi đè nó để thay đổi việc gán constructor. Cài đặt mặc định về cơ bản là:

```js
// Cài đặt nền tảng giả định để minh họa
class Array {
  static get [Symbol.species]() {
    return this;
  }
}
```

Do cài đặt đa hình này, `[Symbol.species]` của các lớp con kế thừa cũng sẽ trả về chính constructor đó theo mặc định.

```js
class SubArray extends Array {}
SubArray[Symbol.species] === SubArray; // true
```

Khi gọi các phương thức mảng không thay đổi mảng hiện tại mà trả về một instance mảng mới (ví dụ, [`filter()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) và [`map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)), `constructor[Symbol.species]` của mảng sẽ được truy cập. Constructor được trả về sẽ được sử dụng để tạo giá trị trả về của phương thức mảng. Điều này cho phép về mặt kỹ thuật có thể khiến các phương thức mảng trả về các đối tượng không liên quan đến mảng.

```js
class NotAnArray {
  constructor(length) {
    this.length = length;
  }
}

const arr = [0, 1, 2];
arr.constructor = { [Symbol.species]: NotAnArray };
arr.map((i) => i); // NotAnArray { '0': 0, '1': 1, '2': 2, length: 3 }
arr.filter((i) => i); // NotAnArray { '0': 1, '1': 2, length: 0 }
arr.concat([1, 2]); // NotAnArray { '0': 0, '1': 1, '2': 2, '3': 1, '4': 2, length: 5 }
```

## Ví dụ

### Species trong các đối tượng thông thường

Thuộc tính `[Symbol.species]` trả về hàm constructor mặc định, đó là constructor `Array` cho `Array`.

```js
Array[Symbol.species]; // [Function: Array]
```

### Species trong các đối tượng kế thừa

Trong một instance của lớp con `Array` tùy chỉnh, chẳng hạn như `MyArray`, species của `MyArray` là constructor `MyArray`. Tuy nhiên, bạn có thể muốn ghi đè điều này, để trả về các đối tượng `Array` cha trong các phương thức của lớp con:

```js
class MyArray extends Array {
  // Ghi đè species của MyArray thành constructor Array cha
  static get [Symbol.species]() {
    return Array;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array[Symbol.species]` và hỗ trợ `[Symbol.species]` trong tất cả các phương thức `Array` bị ảnh hưởng trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- Hướng dẫn [Bộ sưu tập có chỉ mục](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Symbol.species")}}
