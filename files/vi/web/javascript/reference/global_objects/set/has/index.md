---
title: Set.prototype.has()
short-title: has()
slug: Web/JavaScript/Reference/Global_Objects/Set/has
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.has
sidebar: jsref
---

Phương thức **`has()`** của các instance {{jsxref("Set")}} trả về một boolean cho biết liệu value được chỉ định có tồn tại trong `Set` này hay không.

{{InteractiveExample("JavaScript Demo: Set.prototype.has()")}}

```js interactive-example
const set = new Set([1, 2, 3, 4, 5]);

console.log(set.has(1));
// Expected output: true

console.log(set.has(5));
// Expected output: true

console.log(set.has(6));
// Expected output: false
```

## Cú pháp

```js-nolint
has(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra sự tồn tại trong đối tượng `Set`.

### Giá trị trả về

Trả về `true` nếu value được chỉ định tồn tại trong đối tượng `Set`; ngược lại trả về `false`.

## Ví dụ

### Sử dụng has()

```js
const mySet = new Set();
mySet.add("foo");

console.log(mySet.has("foo")); // true
console.log(mySet.has("bar")); // false

const set = new Set();
const obj = { key1: 1 };
set.add(obj);

console.log(set.has(obj)); // true
console.log(set.has({ key1: 1 })); // false, because they are different object references
console.log(set.add({ key1: 1 })); // now set contains 2 entries
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Set")}}
- {{jsxref("Set.prototype.add()")}}
- {{jsxref("Set.prototype.delete()")}}
