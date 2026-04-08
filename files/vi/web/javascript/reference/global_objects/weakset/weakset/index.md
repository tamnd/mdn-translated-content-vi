---
title: WeakSet() constructor
short-title: WeakSet()
slug: Web/JavaScript/Reference/Global_Objects/WeakSet/WeakSet
page-type: javascript-constructor
browser-compat: javascript.builtins.WeakSet.WeakSet
sidebar: jsref
---

Hàm tạo **`WeakSet()`** tạo ra các đối tượng {{jsxref("WeakSet")}}.

## Cú pháp

```js-nolint
new WeakSet()
new WeakSet(iterable)
```

> [!NOTE]
> `WeakSet()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra lỗi {{jsxref("TypeError")}}.

### Tham số

- `iterable` {{optional_inline}}
  - : Nếu một [đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) được truyền vào, tất cả các phần tử của nó sẽ được thêm vào `WeakSet` mới. `null` được coi là `undefined`.

## Ví dụ

### Sử dụng đối tượng WeakSet

```js
const ws = new WeakSet();
const foo = {};
const bar = {};

ws.add(foo);
ws.add(bar);

ws.has(foo); // true
ws.has(bar); // true

ws.delete(foo); // removes foo from the set
ws.has(foo); // false, foo has been removed
ws.has(bar); // true, bar is retained
```

Lưu ý rằng `foo !== bar`. Trong khi chúng là các đối tượng tương tự, _chúng không phải là **cùng một đối tượng**_. Và vì vậy cả hai đều được thêm vào set.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `WeakSet` in `core-js`](https://github.com/zloirock/core-js#weakset)
- {{jsxref("WeakSet")}}
