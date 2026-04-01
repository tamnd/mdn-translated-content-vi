---
title: WeakMap.prototype.delete()
short-title: delete()
slug: Web/JavaScript/Reference/Global_Objects/WeakMap/delete
page-type: javascript-instance-method
browser-compat: javascript.builtins.WeakMap.delete
sidebar: jsref
---

Phương thức **`delete()`** của các instance {{jsxref("WeakMap")}} xóa mục được chỉ định bởi key khỏi `WeakMap` này.

{{InteractiveExample("JavaScript Demo: WeakMap.prototype.delete()")}}

```js interactive-example
const weakmap = new WeakMap();
const object = {};

weakmap.set(object, 42);

console.log(weakmap.delete(object));
// Expected output: true

console.log(weakmap.has(object));
// Expected output: false
```

## Cú pháp

```js-nolint
weakMapInstance.delete(key)
```

### Tham số

- `key`
  - : Key của mục cần xóa khỏi đối tượng `WeakMap`. Các key là đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

`true` nếu một mục trong đối tượng `WeakMap` đã được xóa thành công. `false` nếu key không tìm thấy trong `WeakMap`. Luôn trả về `false` nếu `key` không phải là một đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

## Ví dụ

### Sử dụng delete()

```js
const wm = new WeakMap();
wm.set(window, "foo");

wm.delete(window); // Returns true. Successfully removed.

wm.has(window); // Returns false. The window object is no longer in the WeakMap.
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("WeakMap")}}
- {{jsxref("WeakMap.prototype.get()")}}
- {{jsxref("WeakMap.prototype.set()")}}
- {{jsxref("WeakMap.prototype.has()")}}
