---
title: Map.prototype.delete()
short-title: delete()
slug: Web/JavaScript/Reference/Global_Objects/Map/delete
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.delete
sidebar: jsref
---

Phương thức **`delete()`** của các instance {{jsxref("Map")}} xóa mục được chỉ định bởi key khỏi `Map` này.

{{InteractiveExample("JavaScript Demo: Map.prototype.delete()")}}

```js interactive-example
const map = new Map();
map.set("bar", "foo");

console.log(map.delete("bar"));
// Expected result: true
// True indicates successful removal

console.log(map.has("bar"));
// Expected result: false
```

## Cú pháp

```js-nolint
mapInstance.delete(key)
```

### Tham số

- `key`
  - : Key của mục cần xóa khỏi đối tượng `Map`. Các key là đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

`true` nếu một mục trong đối tượng `Map` đã được xóa thành công. `false` nếu key không tìm thấy trong `Map`.

## Ví dụ

### Sử dụng delete()

```js
const myMap = new Map();
myMap.set("bar", "foo");

console.log(myMap.delete("bar")); // Returns true. Successfully removed.
console.log(myMap.has("bar")); // Returns false. The "bar" element is no longer present.
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map")}}
- {{jsxref("Map.prototype.clear()")}}
- {{jsxref("Map.prototype.get()")}}
- {{jsxref("Map.prototype.set()")}}
- {{jsxref("Map.prototype.has()")}}
