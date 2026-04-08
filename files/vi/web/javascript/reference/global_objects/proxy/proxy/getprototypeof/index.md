---
title: handler.getPrototypeOf()
short-title: getPrototypeOf()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/getPrototypeOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.getPrototypeOf
sidebar: jsref
---

Phương thức **`handler.getPrototypeOf()`** là một trap cho [phương thức nội bộ đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[GetPrototypeOf]]`, được sử dụng bởi các thao tác như {{jsxref("Object.getPrototypeOf()")}}.

{{InteractiveExample("JavaScript Demo: handler.getPrototypeOf()", "taller")}}

```js interactive-example
const monster = {
  eyeCount: 4,
};

const monsterPrototype = {
  eyeCount: 2,
};

const handler = {
  getPrototypeOf(target) {
    return monsterPrototype;
  },
};

const proxy = new Proxy(monster, handler);

console.log(Object.getPrototypeOf(proxy) === monsterPrototype);
// Expected output: true

console.log(Object.getPrototypeOf(proxy).eyeCount);
// Expected output: 2
```

## Cú pháp

```js-nolint
new Proxy(target, {
  getPrototypeOf(target) {
  }
})
```

### Tham số

Tham số sau được truyền vào phương thức `getPrototypeOf()`. `this` được ràng buộc với handler.

- `target`
  - : Đối tượng đích.

### Giá trị trả về

Phương thức `getPrototypeOf()` phải trả về một đối tượng hoặc `null`, đại diện cho prototype của đối tượng đích.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- {{jsxref("Object.getPrototypeOf()")}}
- {{jsxref("Reflect.getPrototypeOf()")}}
- [`__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto)
- {{jsxref("Object.prototype.isPrototypeOf()")}}
- {{jsxref("Operators/instanceof", "instanceof")}}

Hoặc bất kỳ thao tác nào khác gọi [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[GetPrototypeOf]]`.

### Bất biến

Phương thức nội bộ `[[GetPrototypeOf]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- Kết quả phải là một {{jsxref("Object")}} hoặc `null`.
- Nếu đối tượng đích không thể mở rộng (tức là {{jsxref("Reflect.isExtensible()")}} trả về `false` trên `target`), kết quả phải giống với kết quả của `Reflect.getPrototypeOf(target)`.

## Ví dụ

### Sử dụng cơ bản

```js
const obj = {};
const proto = {};
const handler = {
  getPrototypeOf(target) {
    console.log(target === obj); // true
    console.log(this === handler); // true
    return proto;
  },
};

const p = new Proxy(obj, handler);
console.log(Object.getPrototypeOf(p) === proto); // true
```

### Năm cách kích hoạt trap getPrototypeOf

```js
const obj = {};
const p = new Proxy(obj, {
  getPrototypeOf(target) {
    return Array.prototype;
  },
});
console.log(
  Object.getPrototypeOf(p) === Array.prototype, // true
  Reflect.getPrototypeOf(p) === Array.prototype, // true
  p.__proto__ === Array.prototype, // true
  Array.prototype.isPrototypeOf(p), // true
  p instanceof Array, // true
);
```

### Hai loại ngoại lệ

```js example-bad
const obj = {};
const p = new Proxy(obj, {
  getPrototypeOf(target) {
    return "foo";
  },
});
Object.getPrototypeOf(p); // TypeError: "foo" is not an object or null

const obj2 = Object.preventExtensions({});
const p2 = new Proxy(obj2, {
  getPrototypeOf(target) {
    return {};
  },
});
Object.getPrototypeOf(p2); // TypeError: expected same prototype value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Hàm tạo `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Object.getPrototypeOf()")}}
- {{jsxref("Reflect.getPrototypeOf()")}}
