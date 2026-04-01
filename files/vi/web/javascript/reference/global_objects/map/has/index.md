---
title: Map.prototype.has()
short-title: has()
slug: Web/JavaScript/Reference/Global_Objects/Map/has
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.has
sidebar: jsref
---

Phương thức **`has()`** của các instance {{jsxref("Map")}} trả về một boolean cho biết liệu có một mục với key được chỉ định tồn tại trong `Map` này hay không.

{{InteractiveExample("JavaScript Demo: Map.prototype.has()")}}

```js interactive-example
const map = new Map();
map.set("bar", "foo");

console.log(map.has("bar"));
// Expected output: true

console.log(map.has("baz"));
// Expected output: false
```

## Cú pháp

```js-nolint
has(key)
```

### Tham số

- `key`
  - : Key của mục cần kiểm tra sự tồn tại trong đối tượng `Map`. Các key là đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

Trả về `true` nếu có một mục với key được chỉ định tồn tại trong đối tượng `Map`; ngược lại trả về `false`.

## Ví dụ

### Sử dụng has()

```js
const myMap = new Map();
myMap.set("bar", "foo");

console.log(myMap.has("bar")); // true
console.log(myMap.has("baz")); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map")}}
- {{jsxref("Map.prototype.delete()")}}
- {{jsxref("Map.prototype.get()")}}
- {{jsxref("Map.prototype.set()")}}
