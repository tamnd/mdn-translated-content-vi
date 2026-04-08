---
title: WeakSet.prototype.add()
short-title: add()
slug: Web/JavaScript/Reference/Global_Objects/WeakSet/add
page-type: javascript-instance-method
browser-compat: javascript.builtins.WeakSet.add
sidebar: jsref
---

Phương thức **`add()`** của các instance {{jsxref("WeakSet")}} chèn giá trị được chỉ định vào set này, nếu giá trị đó chưa có mặt.

{{InteractiveExample("JavaScript Demo: WeakSet.prototype.add()", "taller")}}

```js interactive-example
const weakset = new WeakSet();
const object = {};

weakset.add(object);
console.log(weakset.has(object));
// Expected output: true

try {
  weakset.add(1);
} catch (error) {
  console.log(error);
  // Expected output (Chrome): TypeError: Invalid value used in weak set
  // Expected output (Firefox): TypeError: WeakSet value must be an object, got 1
  // Expected output (Safari): TypeError: Attempted to add a non-object key to a WeakSet
}
```

## Cú pháp

```js-nolint
add(value)
```

### Tham số

- `value`
  - : Giá trị cần thêm vào đối tượng `WeakSet`. Phải là đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry). Các đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

Đối tượng `WeakSet`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `value` không phải là đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

## Ví dụ

### Sử dụng add()

```js
const ws = new WeakSet();

ws.add(window); // add the window object to the WeakSet

ws.has(window); // true

// WeakSet only takes objects as arguments
ws.add(1);
// results in "TypeError: Invalid value used in weak set" in Chrome
// and "TypeError: 1 is not a non-null object" in Firefox
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("WeakSet")}}
- {{jsxref("WeakSet.prototype.delete()")}}
- {{jsxref("WeakSet.prototype.has()")}}
