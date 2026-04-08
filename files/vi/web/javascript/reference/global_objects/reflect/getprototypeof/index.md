---
title: Reflect.getPrototypeOf()
short-title: getPrototypeOf()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/getPrototypeOf
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.getPrototypeOf
sidebar: jsref
---

Phương thức tĩnh **`Reflect.getPrototypeOf()`** giống như {{jsxref("Object.getPrototypeOf()")}}. Nó trả về prototype của đối tượng được chỉ định.

{{InteractiveExample("JavaScript Demo: Reflect.getPrototypeOf()")}}

```js interactive-example
const object = {
  foo: 42,
};

const proto = Reflect.getPrototypeOf(object);

console.log(proto);
// Expected output: Object {  }

console.log(Reflect.getPrototypeOf(proto));
// Expected output: null
```

## Cú pháp

```js-nolint
Reflect.getPrototypeOf(target)
```

### Tham số

- `target`
  - : Đối tượng target cần lấy prototype.

### Giá trị trả về

Prototype của đối tượng đã cho, có thể là một đối tượng hoặc `null`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng.

## Mô tả

`Reflect.getPrototypeOf()` cung cấp ngữ nghĩa phản chiếu của việc lấy prototype của một đối tượng. Sự khác biệt duy nhất với {{jsxref("Object.getPrototypeOf()")}} là cách xử lý các target không phải đối tượng. `Reflect.getPrototypeOf()` ném ra {{jsxref("TypeError")}} nếu target không phải là đối tượng, trong khi `Object.getPrototypeOf()` ép kiểu nó về đối tượng.

`Reflect.getPrototypeOf()` gọi phương thức nội tại `[[GetPrototypeOf]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.getPrototypeOf()

```js
Reflect.getPrototypeOf({}); // Object.prototype
Reflect.getPrototypeOf(Object.prototype); // null
Reflect.getPrototypeOf(Object.create(null)); // null
```

### Khác biệt với Object.getPrototypeOf()

```js
// Same result for Objects
Object.getPrototypeOf({}); // Object.prototype
Reflect.getPrototypeOf({}); // Object.prototype

// Both throw in ES5 for non-Objects
Object.getPrototypeOf("foo"); // Throws TypeError
Reflect.getPrototypeOf("foo"); // Throws TypeError

// In ES2015 only Reflect throws, Object coerces non-Objects
Object.getPrototypeOf("foo"); // String.prototype
Reflect.getPrototypeOf("foo"); // Throws TypeError

// To mimic the Object ES2015 behavior you need to coerce
Reflect.getPrototypeOf(Object("foo")); // String.prototype
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.getPrototypeOf` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- [Polyfill es-shims của `Reflect.getPrototypeOf`](https://www.npmjs.com/package/reflect.getprototypeof)
- {{jsxref("Reflect")}}
- {{jsxref("Object.getPrototypeOf()")}}
- [`handler.getPrototypeOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/getPrototypeOf)
