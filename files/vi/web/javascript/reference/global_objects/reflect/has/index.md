---
title: Reflect.has()
short-title: has()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/has
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.has
sidebar: jsref
---

Phương thức tĩnh **`Reflect.has()`** giống như toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in), nhưng dưới dạng hàm.

{{InteractiveExample("JavaScript Demo: Reflect.has()")}}

```js interactive-example
const object = {
  property1: 42,
};

console.log(Reflect.has(object, "property1"));
// Expected output: true

console.log(Reflect.has(object, "property2"));
// Expected output: false

console.log(Reflect.has(object, "toString"));
// Expected output: true
```

## Cú pháp

```js-nolint
Reflect.has(target, propertyKey)
```

### Tham số

- `target`
  - : Đối tượng target trong đó tìm kiếm thuộc tính.
- `propertyKey`
  - : Tên của thuộc tính cần kiểm tra.

### Giá trị trả về

Một {{jsxref("Boolean")}} cho biết `target` có thuộc tính đó hay không.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng.

## Mô tả

`Reflect.has()` cung cấp ngữ nghĩa phản chiếu của việc kiểm tra xem một thuộc tính có trong một đối tượng hay không. Tức là, `Reflect.has(target, propertyKey)` tương đương về mặt ngữ nghĩa với:

```js
propertyKey in target;
```

`Reflect.has()` gọi phương thức nội tại `[[HasProperty]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.has()

```js
Reflect.has({ x: 0 }, "x"); // true
Reflect.has({ x: 0 }, "y"); // false

// returns true for properties in the prototype chain
Reflect.has({ x: 0 }, "toString");

// Proxy with .has() handler method
obj = new Proxy(
  {},
  {
    has(t, k) {
      return k.startsWith("door");
    },
  },
);
Reflect.has(obj, "doorbell"); // true
Reflect.has(obj, "dormitory"); // false
```

`Reflect.has` trả về `true` cho bất kỳ thuộc tính kế thừa nào, giống như toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in):

```js
const a = { foo: 123 };
const b = { __proto__: a };
const c = { __proto__: b };
// The prototype chain is: c -> b -> a
Reflect.has(c, "foo"); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.has` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- {{jsxref("Reflect")}}
- [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in)
- [`handler.has()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/has)
