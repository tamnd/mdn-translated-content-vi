---
title: Set() constructor
short-title: Set()
slug: Web/JavaScript/Reference/Global_Objects/Set/Set
page-type: javascript-constructor
browser-compat: javascript.builtins.Set.Set
sidebar: jsref
---

Hàm tạo **`Set()`** tạo ra các đối tượng {{jsxref("Set")}}.

{{InteractiveExample("JavaScript Demo: Set() constructor")}}

```js interactive-example
const set = new Set([1, 2, 3, 4, 5]);

console.log(set.has(1));
// Expected output: true

console.log(set.has(5));
// Expected output: true

console.log(set.has(6));
// Expected output: false
```

## Cú pháp

```js-nolint
new Set()
new Set(iterable)
```

> [!NOTE]
> `Set()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra lỗi {{jsxref("TypeError")}}.

### Tham số

- `iterable` {{optional_inline}}
  - : Nếu một [đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) (chẳng hạn như một mảng) được truyền vào, tất cả các phần tử của nó sẽ được thêm vào `Set` mới. Nếu bạn không chỉ định tham số này, hoặc giá trị của nó là `null` hoặc `undefined`, thì `Set` mới sẽ rỗng.

### Giá trị trả về

Một đối tượng `Set` mới.

## Ví dụ

### Sử dụng đối tượng `Set`

```js
const mySet = new Set();

mySet.add(1); // Set [ 1 ]
mySet.add(5); // Set [ 1, 5 ]
mySet.add(5); // Set [ 1, 5 ]
mySet.add("some text"); // Set [ 1, 5, 'some text' ]
const o = { a: 1, b: 2 };
mySet.add(o);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Set` in `core-js`](https://github.com/zloirock/core-js#set)
- [es-shims polyfill of `Set`](https://www.npmjs.com/package/es-set)
- {{jsxref("Set")}}
