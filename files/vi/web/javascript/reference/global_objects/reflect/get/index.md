---
title: Reflect.get()
short-title: get()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/get
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.get
sidebar: jsref
---

Phương thức tĩnh **`Reflect.get()`** giống như cú pháp [truy cập thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors), nhưng dưới dạng hàm.

{{InteractiveExample("JavaScript Demo: Reflect.get()")}}

```js interactive-example
const object = {
  x: 1,
  y: 2,
};

console.log(Reflect.get(object, "x"));
// Expected output: 1

const array = ["zero", "one"];

console.log(Reflect.get(array, 1));
// Expected output: "one"
```

## Cú pháp

```js-nolint
Reflect.get(target, propertyKey)
Reflect.get(target, propertyKey, receiver)
```

### Tham số

- `target`
  - : Đối tượng target trên đó lấy thuộc tính.
- `propertyKey`
  - : Tên của thuộc tính cần lấy.
- `receiver` {{optional_inline}}
  - : Giá trị của `this` được cung cấp cho lời gọi đến `target` nếu gặp một getter.

### Giá trị trả về

Giá trị của thuộc tính.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng.

## Mô tả

`Reflect.get()` cung cấp ngữ nghĩa phản chiếu của một [truy cập thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors). Tức là, `Reflect.get(target, propertyKey, receiver)` tương đương về mặt ngữ nghĩa với:

```js
target[propertyKey];
```

Lưu ý rằng trong một truy cập thuộc tính thông thường, `target` và `receiver` sẽ quan sát thấy là cùng một đối tượng.

`Reflect.get()` gọi phương thức nội tại `[[Get]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.get()

```js
// Object
const obj1 = { x: 1, y: 2 };
Reflect.get(obj1, "x"); // 1

// Array
Reflect.get(["zero", "one"], 1); // "one"

// Proxy with a get handler
const obj2 = new Proxy(
  { p: 1 },
  {
    get(t, k, r) {
      return `${k}bar`;
    },
  },
);
Reflect.get(obj2, "foo"); // "foobar"

// Proxy with get handler and receiver
const obj3 = new Proxy(
  { p: 1, foo: 2 },
  {
    get(t, prop, receiver) {
      return `${receiver[prop]}bar`;
    },
  },
);
Reflect.get(obj3, "foo", { foo: 3 }); // "3bar"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.get` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- {{jsxref("Reflect")}}
- [Property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors)
- [`handler.get()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/get)
