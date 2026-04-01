---
title: Map.prototype.get()
short-title: get()
slug: Web/JavaScript/Reference/Global_Objects/Map/get
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.get
sidebar: jsref
---

Phương thức **`get()`** của các instance {{jsxref("Map")}} trả về value tương ứng với key trong `Map` này, hoặc `undefined` nếu không có. Các giá trị là đối tượng được trả về theo cùng một tham chiếu ban đầu được lưu trữ, không phải là bản sao, vì vậy các thay đổi đối với đối tượng được trả về sẽ được phản ánh ở bất kỳ đâu giữ tham chiếu đó, kể cả bên trong `Map`.

{{InteractiveExample("JavaScript Demo: Map.prototype.get()")}}

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
get(key)
```

### Tham số

- `key`
  - : Key của value cần trả về từ đối tượng `Map`. Các key là đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

Value liên kết với key được chỉ định trong đối tượng `Map`. Nếu không tìm thấy key, {{jsxref("undefined")}} được trả về.

## Ví dụ

### Sử dụng get()

```js
const myMap = new Map();
myMap.set("bar", "foo");

console.log(myMap.get("bar")); // Returns "foo"
console.log(myMap.get("baz")); // Returns undefined
```

### Sử dụng get() để lấy tham chiếu đến một đối tượng

```js
const arr = [];
const myMap = new Map();
myMap.set("bar", arr);

myMap.get("bar").push("foo");

console.log(arr); // ["foo"]
console.log(myMap.get("bar")); // ["foo"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map")}}
- {{jsxref("Map.prototype.delete()")}}
- {{jsxref("Map.prototype.set()")}}
- {{jsxref("Map.prototype.has()")}}
