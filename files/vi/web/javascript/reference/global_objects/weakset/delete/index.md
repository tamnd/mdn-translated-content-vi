---
title: WeakSet.prototype.delete()
short-title: delete()
slug: Web/JavaScript/Reference/Global_Objects/WeakSet/delete
page-type: javascript-instance-method
browser-compat: javascript.builtins.WeakSet.delete
sidebar: jsref
---

Phương thức **`delete()`** của các instance {{jsxref("WeakSet")}} xóa giá trị được chỉ định khỏi set này, nếu giá trị đó có trong set.

{{InteractiveExample("JavaScript Demo: WeakSet.prototype.delete()")}}

```js interactive-example
const weakset = new WeakSet();
const object = {};

weakset.add(object);

console.log(weakset.has(object));
// Expected output: true

weakset.delete(object);

console.log(weakset.has(object));
// Expected output: false
```

## Cú pháp

```js-nolint
weakSetInstance.delete(value)
```

### Tham số

- `value`
  - : Giá trị cần xóa khỏi đối tượng `WeakSet`. Các đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

`true` nếu một value trong đối tượng `WeakSet` đã được xóa thành công. `false` nếu value không tìm thấy trong `WeakSet`. Luôn trả về `false` nếu `value` không phải là một đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

## Ví dụ

### Sử dụng delete()

```js
const ws = new WeakSet();
const obj = {};

ws.add(window);

ws.delete(obj); // Returns false. No obj found to be deleted.
ws.delete(window); // Returns true. Successfully removed.

ws.has(window); // Returns false. The window is no longer present in the WeakSet.
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("WeakSet")}}
- {{jsxref("WeakSet.prototype.add()")}}
- {{jsxref("WeakSet.prototype.has()")}}
