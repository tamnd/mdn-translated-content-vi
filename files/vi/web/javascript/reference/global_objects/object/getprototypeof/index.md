---
title: Object.getPrototypeOf()
short-title: getPrototypeOf()
slug: Web/JavaScript/Reference/Global_Objects/Object/getPrototypeOf
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.getPrototypeOf
sidebar: jsref
---

Phương thức tĩnh **`Object.getPrototypeOf()`** trả về prototype (tức là giá trị của thuộc tính nội bộ `[[Prototype]]`) của đối tượng được chỉ định.

{{InteractiveExample("JavaScript Demo: Object.getPrototypeOf()", "shorter")}}

```js interactive-example
const prototype = {};
const object = Object.create(prototype);

console.log(Object.getPrototypeOf(object) === prototype);
// Expected output: true
```

## Cú pháp

```js-nolint
Object.getPrototypeOf(obj)
```

### Tham số

- `obj`
  - : Đối tượng cần lấy prototype.

### Giá trị trả về

Prototype của đối tượng đã cho, có thể là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

## Ví dụ

### Sử dụng getPrototypeOf

```js
const proto = {};
const obj = Object.create(proto);
Object.getPrototypeOf(obj) === proto; // true
```

### Ép kiểu đối số không phải đối tượng

Trong ES5, nó sẽ ném ngoại lệ {{jsxref("TypeError")}} nếu tham số `obj` không phải là đối tượng. Trong ES2015, tham số sẽ được ép kiểu thành {{jsxref("Object")}}.

```js
Object.getPrototypeOf("foo");
// TypeError: "foo" is not an object (ES5 code)
Object.getPrototypeOf("foo");
// String.prototype                  (ES2015 code)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.getPrototypeOf` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [es-shims polyfill of `Object.getPrototypeOf`](https://www.npmjs.com/package/object.getprototypeof)
- {{jsxref("Object.prototype.isPrototypeOf()")}}
- {{jsxref("Object.setPrototypeOf()")}}
- [`Object.prototype.__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto)
- {{jsxref("Reflect.getPrototypeOf()")}}
- [Object.getPrototypeOf](https://johnresig.com/blog/objectgetprototypeof/) by John Resig (2008)
