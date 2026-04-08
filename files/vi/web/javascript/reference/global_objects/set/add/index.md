---
title: Set.prototype.add()
short-title: add()
slug: Web/JavaScript/Reference/Global_Objects/Set/add
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.add
sidebar: jsref
---

Phương thức **`add()`** của các instance {{jsxref("Set")}} chèn giá trị được chỉ định vào set này, nếu giá trị đó chưa có mặt.

{{InteractiveExample("JavaScript Demo: Set.prototype.add()")}}

```js interactive-example
const set = new Set();

set.add(42);
set.add(42);
set.add(13);

for (const item of set) {
  console.log(item);
  // Expected output: 42
  // Expected output: 13
}
```

## Cú pháp

```js-nolint
add(value)
```

### Tham số

- `value`
  - : Giá trị cần thêm vào đối tượng `Set`. Các đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

Đối tượng `Set`.

## Ví dụ

### Sử dụng add()

```js
const mySet = new Set();

mySet.add(1);
mySet.add(5).add("some text"); // chainable

console.log(mySet);
// Set [1, 5, "some text"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Set")}}
- {{jsxref("Set.prototype.delete()")}}
- {{jsxref("Set.prototype.has()")}}
