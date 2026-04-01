---
title: Map.prototype.keys()
short-title: keys()
slug: Web/JavaScript/Reference/Global_Objects/Map/keys
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.keys
sidebar: jsref
---

Phương thức **`keys()`** của các instance {{jsxref("Map")}} trả về một đối tượng _[map iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới chứa các key cho mỗi phần tử trong map này theo thứ tự chèn.

{{InteractiveExample("JavaScript Demo: Map.prototype.keys()")}}

```js interactive-example
const map = new Map();

map.set("0", "foo");
map.set(1, "bar");

const iterator = map.keys();

console.log(iterator.next().value);
// Expected output: "0"

console.log(iterator.next().value);
// Expected output: 1
```

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Ví dụ

### Sử dụng keys()

```js
const myMap = new Map();
myMap.set("0", "foo");
myMap.set(1, "bar");
myMap.set({}, "baz");

const mapIter = myMap.keys();

console.log(mapIter.next().value); // "0"
console.log(mapIter.next().value); // 1
console.log(mapIter.next().value); // {}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.entries()")}}
- {{jsxref("Map.prototype.values()")}}
