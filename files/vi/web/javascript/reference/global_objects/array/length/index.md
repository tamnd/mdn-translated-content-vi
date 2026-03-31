---
title: "Array: length"
short-title: length
slug: Web/JavaScript/Reference/Global_Objects/Array/length
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.Array.length
sidebar: jsref
---

Thuộc tính dữ liệu **`length`** của một đối tượng {{jsxref("Array")}} biểu thị số lượng phần tử trong mảng đó. Giá trị là một số nguyên không dấu 32-bit luôn lớn hơn chỉ mục cao nhất trong mảng về mặt số học.

{{InteractiveExample("JavaScript Demo: Array: length", "shorter")}}

```js interactive-example
const clothing = ["shoes", "shirts", "socks", "sweaters"];

console.log(clothing.length);
// Expected output: 4
```

## Giá trị

Một số nguyên không âm nhỏ hơn 2<sup>32</sup>.

{{js_property_attributes(1, 0, 0)}}

## Mô tả

Giá trị của thuộc tính `length` là một số nguyên không âm có giá trị nhỏ hơn 2<sup>32</sup>.

```js
const listA = [1, 2, 3];
const listB = new Array(6);

console.log(listA.length);
// 3

console.log(listB.length);
// 6

listB.length = 2 ** 32; // 4294967296
// RangeError: Invalid array length

const listC = new Array(-100); // Negative numbers are not allowed
// RangeError: Invalid array length
```

Đối tượng mảng theo dõi thuộc tính `length`, và tự động đồng bộ giá trị `length` với nội dung của mảng. Điều này có nghĩa là:

- Đặt `length` thành một giá trị nhỏ hơn độ dài hiện tại sẽ cắt bớt mảng — các phần tử vượt quá `length` mới sẽ bị xóa.
- Đặt bất kỳ chỉ mục mảng nào (số nguyên không âm nhỏ hơn 2<sup>32</sup>) vượt quá `length` hiện tại sẽ mở rộng mảng — thuộc tính `length` được tăng lên để phản ánh chỉ mục cao nhất mới.
- Đặt `length` thành giá trị không hợp lệ (ví dụ như số âm hoặc số không phải nguyên) sẽ ném ra ngoại lệ `RangeError`.

Khi `length` được đặt thành giá trị lớn hơn độ dài hiện tại, mảng được mở rộng bằng cách thêm các [ô trống](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), không phải các giá trị `undefined` thực sự. Các ô trống có một số tương tác đặc biệt với các phương thức mảng; xem [array methods and empty slots](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#array_methods_and_empty_slots).

```js
const arr = [1, 2];
console.log(arr);
// [ 1, 2 ]

arr.length = 5; // set array length to 5 while currently 2.
console.log(arr);
// [ 1, 2, <3 empty items> ]

arr.forEach((element) => console.log(element));
// 1
// 2
```

Xem thêm [Relationship between `length` and numerical properties](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#relationship_between_length_and_numerical_properties).

## Ví dụ

### Lặp qua một mảng

Trong ví dụ sau, mảng `numbers` được lặp qua bằng cách nhìn vào thuộc tính `length`. Giá trị trong mỗi phần tử sau đó được nhân đôi.

```js
const numbers = [1, 2, 3, 4, 5];
const length = numbers.length;
for (let i = 0; i < length; i++) {
  numbers[i] *= 2;
}
// numbers is now [2, 4, 6, 8, 10]
```

### Rút ngắn một mảng

Ví dụ sau rút ngắn mảng `numbers` xuống độ dài 3 nếu độ dài hiện tại lớn hơn 3.

```js
const numbers = [1, 2, 3, 4, 5];

if (numbers.length > 3) {
  numbers.length = 3;
}

console.log(numbers); // [1, 2, 3]
console.log(numbers.length); // 3
console.log(numbers[3]); // undefined; the extra elements are deleted
```

### Tạo mảng rỗng có độ dài cố định

Đặt `length` thành giá trị lớn hơn độ dài hiện tại sẽ tạo ra [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

```js
const numbers = [];
numbers.length = 3;
console.log(numbers); // [empty x 3]
```

### Mảng với thuộc tính length không thể ghi

Thuộc tính `length` được mảng tự động cập nhật khi phần tử được thêm vượt quá độ dài hiện tại. Nếu thuộc tính `length` được đặt thành không thể ghi, mảng sẽ không thể cập nhật nó. Điều này gây ra lỗi trong [chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

```js
"use strict";

const numbers = [1, 2, 3, 4, 5];
Object.defineProperty(numbers, "length", { writable: false });
numbers[5] = 6; // TypeError: Cannot assign to read only property 'length' of object '[object Array]'
numbers.push(5); // // TypeError: Cannot assign to read only property 'length' of object '[object Array]'
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- [`TypedArray.prototype.length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/length)
- [`String`: `length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length)
- [RangeError: invalid array length](/en-US/docs/Web/JavaScript/Reference/Errors/Invalid_array_length)
