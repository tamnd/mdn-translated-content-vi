---
title: Set.prototype.size
short-title: size
slug: Web/JavaScript/Reference/Global_Objects/Set/size
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Set.size
sidebar: jsref
---

Thuộc tính accessor **`size`** của các instance {{jsxref("Set")}} trả về số lượng (duy nhất) các phần tử trong set này.

{{InteractiveExample("JavaScript Demo: Set.prototype.size")}}

```js interactive-example
const set = new Set();
const object = {};

set.add(42);
set.add("forty two");
set.add("forty two");
set.add(object);

console.log(set.size);
// Expected output: 3
```

## Mô tả

Giá trị của `size` là một số nguyên biểu diễn số mục mà đối tượng `Set` có. Hàm setter accessor cho `size` là `undefined`; bạn không thể thay đổi thuộc tính này.

## Ví dụ

### Sử dụng size

```js
const mySet = new Set();
mySet.add(1);
mySet.add(5);
mySet.add("some text");

console.log(mySet.size); // 3
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Set")}}
