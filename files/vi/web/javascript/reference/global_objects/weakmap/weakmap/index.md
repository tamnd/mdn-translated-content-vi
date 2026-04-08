---
title: WeakMap() constructor
short-title: WeakMap()
slug: Web/JavaScript/Reference/Global_Objects/WeakMap/WeakMap
page-type: javascript-constructor
browser-compat: javascript.builtins.WeakMap.WeakMap
sidebar: jsref
---

Hàm tạo **`WeakMap()`** tạo ra các đối tượng {{jsxref("WeakMap")}}.

## Cú pháp

```js-nolint
new WeakMap()
new WeakMap(iterable)
```

> [!NOTE]
> `WeakMap()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra lỗi {{jsxref("TypeError")}}.

### Tham số

- `iterable`
  - : Một [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) hoặc [đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) khác tạo ra đối tượng giống mảng hai phần tử mà phần tử đầu tiên là một giá trị sẽ được dùng làm key của `WeakMap` và phần tử thứ hai là value để liên kết với key đó. Mỗi cặp key-value sẽ được thêm vào `WeakMap` mới. `null` được coi là `undefined`.

## Ví dụ

### Sử dụng WeakMap

```js
const wm1 = new WeakMap();
const wm2 = new WeakMap();
const wm3 = new WeakMap();
const o1 = {};
const o2 = () => {};
const o3 = window;

wm1.set(o1, 37);
wm1.set(o2, "azerty");
wm2.set(o1, o2); // a value can be anything, including an object or a function
wm2.set(o3, undefined);
wm2.set(wm1, wm2); // keys and values can be any objects. Even WeakMaps!

wm1.get(o2); // "azerty"
wm2.get(o2); // undefined, because there is no key for o2 on wm2
wm2.get(o3); // undefined, because that is the set value

wm1.has(o2); // true
wm2.has(o2); // false
wm2.has(o3); // true (even if the value itself is 'undefined')

wm3.set(o1, 37);
wm3.get(o1); // 37

wm1.has(o1); // true
wm1.delete(o1);
wm1.has(o1); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `WeakMap` in `core-js`](https://github.com/zloirock/core-js#weakmap)
- [`WeakMap` in the JavaScript guide](/en-US/docs/Web/JavaScript/Guide/Keyed_collections#weakmap_object)
- {{jsxref("Map")}}
- {{jsxref("Set")}}
- {{jsxref("WeakSet")}}
