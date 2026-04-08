---
title: WeakSet.prototype.has()
short-title: has()
slug: Web/JavaScript/Reference/Global_Objects/WeakSet/has
page-type: javascript-instance-method
browser-compat: javascript.builtins.WeakSet.has
sidebar: jsref
---

Phương thức **`has()`** của các instance {{jsxref("WeakSet")}} trả về một boolean cho biết liệu value được chỉ định có tồn tại trong `WeakSet` này hay không.

{{InteractiveExample("JavaScript Demo: WeakSet.prototype.has()")}}

```js interactive-example
const weakset = new WeakSet();
const object1 = {};
const object2 = {};

weakset.add(object1);

console.log(weakset.has(object1));
// Expected output: true

console.log(weakset.has(object2));
// Expected output: false
```

## Cú pháp

```js-nolint
has(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra sự tồn tại trong đối tượng `WeakSet`. Các đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

Trả về `true` nếu value được chỉ định tồn tại trong đối tượng `WeakSet`; ngược lại trả về `false`. Luôn trả về `false` nếu `value` không phải là một đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

## Ví dụ

### Sử dụng has()

```js
const ws = new WeakSet();
const obj = {};
ws.add(window);

ws.has(window); // returns true
ws.has(obj); // returns false

// Storing a non-registered symbol
const sym = Symbol("foo");
ws.add(sym);
ws.add(Symbol.iterator);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("WeakSet")}}
- {{jsxref("WeakSet.prototype.add()")}}
- {{jsxref("WeakSet.prototype.delete()")}}
