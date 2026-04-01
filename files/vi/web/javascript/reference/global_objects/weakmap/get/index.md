---
title: WeakMap.prototype.get()
short-title: get()
slug: Web/JavaScript/Reference/Global_Objects/WeakMap/get
page-type: javascript-instance-method
browser-compat: javascript.builtins.WeakMap.get
sidebar: jsref
---

Phương thức **`get()`** của các instance {{jsxref("WeakMap")}} trả về value tương ứng với key trong `WeakMap` này, hoặc `undefined` nếu không có. Các giá trị là đối tượng được trả về theo cùng một tham chiếu ban đầu được lưu trữ, không phải là bản sao, vì vậy các thay đổi đối với đối tượng được trả về sẽ được phản ánh ở bất kỳ đâu giữ tham chiếu đó, kể cả bên trong `WeakMap`.

{{InteractiveExample("JavaScript Demo: WeakMap.prototype.get()")}}

```js interactive-example
const weakmap = new WeakMap();
const object1 = {};
const object2 = {};

weakmap.set(object1, 42);

console.log(weakmap.get(object1));
// Expected output: 42

console.log(weakmap.get(object2));
// Expected output: undefined
```

## Cú pháp

```js-nolint
get(key)
```

### Tham số

- `key`
  - : Key của value cần trả về từ đối tượng `WeakMap`. Các key là đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

Value liên kết với key được chỉ định trong đối tượng `WeakMap`. Nếu không tìm thấy key, {{jsxref("undefined")}} được trả về. Luôn trả về `undefined` nếu `key` không phải là một đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

## Ví dụ

### Sử dụng get()

```js
const wm = new WeakMap();
wm.set(window, "foo");

wm.get(window); // Returns "foo".
wm.get("baz"); // Returns undefined.
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("WeakMap")}}
- {{jsxref("WeakMap.prototype.delete()")}}
- {{jsxref("WeakMap.prototype.set()")}}
- {{jsxref("WeakMap.prototype.has()")}}
