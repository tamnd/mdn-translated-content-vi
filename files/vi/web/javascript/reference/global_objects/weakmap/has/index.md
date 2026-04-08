---
title: WeakMap.prototype.has()
short-title: has()
slug: Web/JavaScript/Reference/Global_Objects/WeakMap/has
page-type: javascript-instance-method
browser-compat: javascript.builtins.WeakMap.has
sidebar: jsref
---

Phương thức **`has()`** của các instance {{jsxref("WeakMap")}} trả về một boolean cho biết liệu có một mục với key được chỉ định tồn tại trong `WeakMap` này hay không.

{{InteractiveExample("JavaScript Demo: WeakMap.prototype.has()")}}

```js interactive-example
const weakmap = new WeakMap();
const object1 = {};
const object2 = {};

weakmap.set(object1, "foo");

console.log(weakmap.has(object1));
// Expected output: true

console.log(weakmap.has(object2));
// Expected output: false
```

## Cú pháp

```js-nolint
has(key)
```

### Tham số

- `key`
  - : Key của mục cần kiểm tra sự tồn tại trong đối tượng `WeakMap`. Các key là đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

Trả về `true` nếu có một mục với key được chỉ định tồn tại trong đối tượng `WeakMap`; ngược lại trả về `false`. Luôn trả về `false` nếu `key` không phải là một đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

## Ví dụ

### Sử dụng has()

```js
const wm = new WeakMap();
wm.set(window, "foo");

wm.has(window); // returns true
wm.has("baz"); // returns false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("WeakMap")}}
- {{jsxref("WeakMap.prototype.delete()")}}
- {{jsxref("WeakMap.prototype.get()")}}
- {{jsxref("WeakMap.prototype.set()")}}
