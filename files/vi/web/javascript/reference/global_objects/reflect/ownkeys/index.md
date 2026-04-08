---
title: Reflect.ownKeys()
short-title: ownKeys()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/ownKeys
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.ownKeys
sidebar: jsref
---

Phương thức tĩnh **`Reflect.ownKeys()`** trả về một mảng các key thuộc tính riêng của đối tượng `target`.

{{InteractiveExample("JavaScript Demo: Reflect.ownKeys()")}}

```js interactive-example
const object = {
  property1: 42,
  property2: 13,
};

const array = [];

console.log(Reflect.ownKeys(object));
// Expected output: Array ["property1", "property2"]

console.log(Reflect.ownKeys(array));
// Expected output: Array ["length"]
```

## Cú pháp

```js-nolint
Reflect.ownKeys(target)
```

### Tham số

- `target`
  - : Đối tượng target cần lấy các key riêng.

### Giá trị trả về

Một {{jsxref("Array")}} các key thuộc tính riêng của đối tượng `target`, bao gồm chuỗi và symbol. Đối với hầu hết các đối tượng, mảng sẽ theo thứ tự:

1. Các chỉ số nguyên không âm theo thứ tự số tăng dần (nhưng dưới dạng chuỗi)
2. Các key chuỗi khác theo thứ tự tạo thuộc tính
3. Các key symbol theo thứ tự tạo thuộc tính.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng.

## Mô tả

`Reflect.ownKeys()` cung cấp ngữ nghĩa phản chiếu của việc lấy tất cả các key thuộc tính của một đối tượng. Đây là cách duy nhất để lấy tất cả các thuộc tính riêng — có thể liệt kê và không thể liệt kê, chuỗi và symbol — trong một lần gọi, mà không cần logic lọc thêm. Ví dụ, {{jsxref("Object.getOwnPropertyNames()")}} lấy giá trị trả về của `Reflect.ownKeys()` và lọc để chỉ lấy các giá trị chuỗi, trong khi {{jsxref("Object.getOwnPropertySymbols()")}} lọc để chỉ lấy các giá trị symbol. Vì các đối tượng thông thường triển khai `[[OwnPropertyKeys]]` để trả về tất cả các key chuỗi trước các key symbol, `Reflect.ownKeys(target)` thường tương đương với `Object.getOwnPropertyNames(target).concat(Object.getOwnPropertySymbols(target))`. Tuy nhiên, nếu đối tượng có phương thức `[[OwnPropertyKeys]]` tùy chỉnh (chẳng hạn qua handler [`ownKeys`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/ownKeys) của proxy), thứ tự các key có thể khác.

`Reflect.ownKeys()` gọi phương thức nội tại `[[OwnPropertyKeys]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.ownKeys()

```js
Reflect.ownKeys({ z: 3, y: 2, x: 1 }); // [ "z", "y", "x" ]
Reflect.ownKeys([]); // ["length"]

const sym = Symbol.for("comet");
const sym2 = Symbol.for("meteor");
const obj = {
  [sym]: 0,
  str: 0,
  773: 0,
  0: 0,
  [sym2]: 0,
  "-1": 0,
  8: 0,
  "second str": 0,
};
Reflect.ownKeys(obj);
// [ "0", "8", "773", "str", "-1", "second str", Symbol(comet), Symbol(meteor) ]
// Indexes in numeric order,
// strings in insertion order,
// symbols in insertion order
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.ownKeys` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- [Polyfill es-shims của `Reflect.ownKeys`](https://www.npmjs.com/package/reflect.ownkeys)
- {{jsxref("Reflect")}}
- {{jsxref("Object.getOwnPropertyNames()")}}
- {{jsxref("Object.getOwnPropertySymbols()")}}
- [`handler.ownKeys()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/ownKeys)
