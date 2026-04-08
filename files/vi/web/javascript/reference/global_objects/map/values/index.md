---
title: Map.prototype.values()
short-title: values()
slug: Web/JavaScript/Reference/Global_Objects/Map/values
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.values
sidebar: jsref
---

Phương thức **`values()`** của các instance {{jsxref("Map")}} trả về một đối tượng _[map iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới chứa các value cho mỗi phần tử trong map này theo thứ tự chèn.

{{InteractiveExample("JavaScript Demo: Map.prototype.values()")}}

```js interactive-example
const map = new Map();

map.set("0", "foo");
map.set(1, "bar");

const iterator = map.values();

console.log(iterator.next().value);
// Expected output: "foo"

console.log(iterator.next().value);
// Expected output: "bar"
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
const myMap = new Map();
myMap.set("0", "foo");
myMap.set(1, "bar");
myMap.set({}, "baz");

const mapIter = myMap.values();

console.log(mapIter.next().value); // "foo"
console.log(mapIter.next().value); // "bar"
console.log(mapIter.next().value); // "baz"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.entries()")}}
- {{jsxref("Map.prototype.keys()")}}
