---
title: Reflect.setPrototypeOf()
short-title: setPrototypeOf()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/setPrototypeOf
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.setPrototypeOf
sidebar: jsref
---

Phương thức tĩnh **`Reflect.setPrototypeOf()`** giống như {{jsxref("Object.setPrototypeOf()")}} nhưng trả về một {{jsxref("Boolean")}}. Nó thiết lập prototype (tức là thuộc tính nội tại `[[Prototype]]`) của một đối tượng được chỉ định.

{{InteractiveExample("JavaScript Demo: Reflect.setPrototypeOf()")}}

```js interactive-example
const object1 = {};

console.log(Reflect.setPrototypeOf(object1, Object.prototype));
// Expected output: true

console.log(Reflect.setPrototypeOf(object1, null));
// Expected output: true

const object2 = {};

console.log(Reflect.setPrototypeOf(Object.freeze(object2), null));
// Expected output: false
```

## Cú pháp

```js-nolint
Reflect.setPrototypeOf(target, prototype)
```

### Tham số

- `target`
  - : Đối tượng target cần thiết lập prototype.
- `prototype`
  - : Prototype mới của đối tượng (một đối tượng hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null)).

### Giá trị trả về

Một {{jsxref("Boolean")}} cho biết prototype có được thiết lập thành công hay không.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng hoặc nếu `prototype` không phải là đối tượng cũng không phải [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

## Mô tả

`Reflect.setPrototypeOf()` cung cấp ngữ nghĩa phản chiếu của việc thiết lập prototype của một đối tượng. Ở mức độ rất thấp, việc thiết lập prototype trả về một boolean (như trường hợp của [proxy handler](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/setPrototypeOf)). {{jsxref("Object.setPrototypeOf()")}} cung cấp ngữ nghĩa gần như giống nhau, nhưng nó ném ra {{jsxref("TypeError")}} nếu trạng thái là `false` (thao tác không thành công), trong khi `Reflect.setPrototypeOf()` trả về trực tiếp trạng thái đó.

`Reflect.setPrototypeOf()` gọi phương thức nội tại `[[SetPrototypeOf]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.setPrototypeOf()

```js
Reflect.setPrototypeOf({}, Object.prototype); // true

// It can change an object's [[Prototype]] to null.
Reflect.setPrototypeOf({}, null); // true

// Returns false if target is not extensible.
Reflect.setPrototypeOf(Object.freeze({}), null); // false

// Returns false if it cause a prototype chain cycle.
const target = {};
const proto = Object.create(target);
Reflect.setPrototypeOf(target, proto); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.setPrototypeOf` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- {{jsxref("Reflect")}}
- {{jsxref("Object.setPrototypeOf()")}}
- [`handler.setPrototypeOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/setPrototypeOf)
