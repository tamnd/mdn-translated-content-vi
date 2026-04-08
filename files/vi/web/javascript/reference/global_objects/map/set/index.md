---
title: Map.prototype.set()
short-title: set()
slug: Web/JavaScript/Reference/Global_Objects/Map/set
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.set
sidebar: jsref
---

Phương thức **`set()`** của các instance {{jsxref("Map")}} thêm một mục mới với key và value được chỉ định vào `Map` này, hoặc cập nhật một mục hiện có nếu key đã tồn tại.

{{InteractiveExample("JavaScript Demo: Map.prototype.set()")}}

```js interactive-example
const map = new Map();
map.set("bar", "foo");

console.log(map.get("bar"));
// Expected output: "foo"

console.log(map.get("baz"));
// Expected output: undefined
```

## Cú pháp

```js-nolint
set(key, value)
```

### Tham số

- `key`
  - : Key của mục cần thêm vào hoặc sửa đổi trong đối tượng `Map`. Có thể là bất kỳ giá trị nào. Các key là đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.
- `value`
  - : Value của mục cần thêm vào hoặc sửa đổi trong đối tượng `Map`. Có thể là bất kỳ giá trị nào.

### Giá trị trả về

Đối tượng `Map`.

## Ví dụ

### Sử dụng set()

```js
const myMap = new Map();

// Add new elements to the map
myMap.set("bar", "foo");
myMap.set(1, "foobar");

// Update an element in the map
myMap.set("bar", "baz");
```

### Sử dụng set() với chaining

Vì phương thức `set()` trả về cùng đối tượng `Map`, bạn có thể chain lời gọi phương thức như sau:

```js
// Add new elements to the map with chaining.
myMap.set("bar", "foo").set(1, "foobar").set(2, "baz");
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map")}}
- {{jsxref("Map.prototype.delete()")}}
- {{jsxref("Map.prototype.get()")}}
- {{jsxref("Map.prototype.has()")}}
