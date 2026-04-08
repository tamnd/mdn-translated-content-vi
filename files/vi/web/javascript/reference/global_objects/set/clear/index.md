---
title: Set.prototype.clear()
short-title: clear()
slug: Web/JavaScript/Reference/Global_Objects/Set/clear
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.clear
sidebar: jsref
---

Phương thức **`clear()`** của các instance {{jsxref("Set")}} xóa tất cả các phần tử khỏi set này.

{{InteractiveExample("JavaScript Demo: Set.prototype.clear()")}}

```js interactive-example
const set = new Set();
set.add(1);
set.add("foo");

console.log(set.size);
// Expected output: 2

set.clear();

console.log(set.size);
// Expected output: 0
```

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng phương thức clear()

```js
const mySet = new Set();
mySet.add(1);
mySet.add("foo");

console.log(mySet.size); // 2
console.log(mySet.has("foo")); // true

mySet.clear();

console.log(mySet.size); // 0
console.log(mySet.has("foo")); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Set")}}
- {{jsxref("Set.prototype.delete()")}}
