---
title: Set.prototype.values()
short-title: values()
slug: Web/JavaScript/Reference/Global_Objects/Set/values
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.values
sidebar: jsref
---

Phương thức **`values()`** của các instance {{jsxref("Set")}} trả về một đối tượng _[set iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới chứa các value cho mỗi phần tử trong set này theo thứ tự chèn.

{{InteractiveExample("JavaScript Demo: Set.prototype.values()")}}

```js interactive-example
const set = new Set();
set.add(42);
set.add("forty two");

const iterator = set.values();

console.log(iterator.next().value);
// Expected output: 42

console.log(iterator.next().value);
// Expected output: "forty two"
```

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Ví dụ

### Sử dụng values()

```js
const mySet = new Set();
mySet.add("foo");
mySet.add("bar");
mySet.add("baz");

const setIter = mySet.values();

console.log(setIter.next().value); // "foo"
console.log(setIter.next().value); // "bar"
console.log(setIter.next().value); // "baz"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Set.prototype.entries()")}}
- {{jsxref("Set.prototype.keys()")}}
