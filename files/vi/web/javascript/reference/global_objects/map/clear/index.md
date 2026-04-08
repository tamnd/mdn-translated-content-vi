---
title: Map.prototype.clear()
short-title: clear()
slug: Web/JavaScript/Reference/Global_Objects/Map/clear
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.clear
sidebar: jsref
---

Phương thức **`clear()`** của các instance {{jsxref("Map")}} xóa tất cả các phần tử khỏi map này.

{{InteractiveExample("JavaScript Demo: Map.prototype.clear()")}}

```js interactive-example
const map = new Map();

map.set("bar", "baz");
map.set(1, "foo");

console.log(map.size);
// Expected output: 2

map.clear();

console.log(map.size);
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

### Sử dụng clear()

```js
const myMap = new Map();
myMap.set("bar", "baz");
myMap.set(1, "foo");

console.log(myMap.size); // 2
console.log(myMap.has("bar")); // true

myMap.clear();

console.log(myMap.size); // 0
console.log(myMap.has("bar")); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map")}}
