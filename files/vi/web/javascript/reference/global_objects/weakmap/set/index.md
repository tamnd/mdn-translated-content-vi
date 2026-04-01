---
title: WeakMap.prototype.set()
short-title: set()
slug: Web/JavaScript/Reference/Global_Objects/WeakMap/set
page-type: javascript-instance-method
browser-compat: javascript.builtins.WeakMap.set
sidebar: jsref
---

Phương thức **`set()`** của các instance {{jsxref("WeakMap")}} thêm một mục mới với key và value được chỉ định vào `WeakMap` này, hoặc cập nhật một mục hiện có nếu key đã tồn tại.

{{InteractiveExample("JavaScript Demo: WeakMap.prototype.set()")}}

```js interactive-example
const weakmap = new WeakMap();
const object1 = {};
const object2 = {};

weakmap.set(object1, "foo");
weakmap.set(object2, "bar");

console.log(weakmap.get(object1));
// Expected output: "foo"

console.log(weakmap.get(object2));
// Expected output: "bar"
```

## Cú pháp

```js-nolint
set(key, value)
```

### Tham số

- `key`
  - : Key của mục cần thêm vào hoặc sửa đổi trong đối tượng `WeakMap`. Phải là đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry). Các key là đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.
- `value`
  - : Value của mục cần thêm vào hoặc sửa đổi trong đối tượng `WeakMap`. Có thể là bất kỳ giá trị nào.

### Giá trị trả về

Đối tượng `WeakMap`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `key` không phải là đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

## Ví dụ

### Sử dụng set()

```js
const wm = new WeakMap();
const obj = {};

// Add new elements to the WeakMap
wm.set(obj, "foo").set(window, "bar"); // chainable

// Update an element in the WeakMap
wm.set(obj, "baz");

// Using a non-registered symbol as key
const sym = Symbol("foo");
wm.set(sym, "baz");
wm.set(Symbol.iterator, "qux");
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("WeakMap")}}
- {{jsxref("WeakMap.prototype.delete()")}}
- {{jsxref("WeakMap.prototype.get()")}}
- {{jsxref("WeakMap.prototype.has()")}}
