---
title: Map() constructor
short-title: Map()
slug: Web/JavaScript/Reference/Global_Objects/Map/Map
page-type: javascript-constructor
browser-compat: javascript.builtins.Map.Map
sidebar: jsref
---

Hàm tạo **`Map()`** tạo ra các đối tượng {{jsxref("Map")}}.

## Cú pháp

```js-nolint
new Map()
new Map(iterable)
```

> [!NOTE]
> `Map()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra lỗi {{jsxref("TypeError")}}.

### Tham số

- `iterable` {{optional_inline}}
  - : Nếu một [đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) (chẳng hạn như một mảng) được truyền vào, tất cả các phần tử của nó sẽ được thêm vào `Map` mới. Mỗi phần tử phải là một đối tượng có hai thuộc tính: `0` và `1`, tương ứng với key và value (ví dụ, `[[1, "one"],[2, "two"]]`). Nếu bạn không chỉ định tham số này, hoặc giá trị của nó là `null` hoặc `undefined`, thì `Map` mới sẽ rỗng.

## Ví dụ

### Tạo một Map mới

```js
const myMap = new Map([
  [1, "one"],
  [2, "two"],
  [3, "three"],
]);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill for `Map` in `core-js`](https://github.com/zloirock/core-js#map)
- [es-shims polyfill of `Map`](https://www.npmjs.com/package/es-map)
- {{jsxref("Set")}}
- {{jsxref("WeakMap")}}
- {{jsxref("WeakSet")}}
