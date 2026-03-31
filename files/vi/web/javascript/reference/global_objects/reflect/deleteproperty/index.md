---
title: Reflect.deleteProperty()
short-title: deleteProperty()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/deleteProperty
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.deleteProperty
sidebar: jsref
---

Phương thức tĩnh **`Reflect.deleteProperty()`** giống như toán tử {{jsxref("Operators/delete", "delete")}}, nhưng dưới dạng hàm. Nó xóa một thuộc tính khỏi một đối tượng.

{{InteractiveExample("JavaScript Demo: Reflect.deleteProperty()", "taller")}}

```js interactive-example
const object = {
  foo: 42,
};

Reflect.deleteProperty(object, "foo");

console.log(object.foo);
// Expected output: undefined

const array = [1, 2, 3, 4, 5];
Reflect.deleteProperty(array, "3");

console.log(array);
// Expected output: Array [1, 2, 3, <1 empty slot>, 5]
```

## Cú pháp

```js-nolint
Reflect.deleteProperty(target, propertyKey)
```

### Tham số

- `target`
  - : Đối tượng target trên đó xóa thuộc tính.
- `propertyKey`
  - : Tên của thuộc tính cần xóa.

### Giá trị trả về

Một boolean cho biết thuộc tính có được xóa thành công hay không.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng.

## Mô tả

`Reflect.deleteProperty()` cung cấp ngữ nghĩa phản chiếu của toán tử [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete). Tức là, `Reflect.deleteProperty(target, propertyKey)` tương đương về mặt ngữ nghĩa với:

```js
delete target.propertyKey;
```

Ở mức độ rất thấp, việc xóa thuộc tính trả về một boolean (như trường hợp của [proxy handler](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/deleteProperty)). `Reflect.deleteProperty()` trả về trực tiếp trạng thái đó, trong khi `delete` sẽ ném ra {{jsxref("TypeError")}} trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) nếu trạng thái là `false`. Trong non-strict mode, `delete` và `Reflect.deleteProperty()` có cùng hành vi.

`Reflect.deleteProperty()` gọi phương thức nội tại `[[Delete]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.deleteProperty()

```js
const obj = { x: 1, y: 2 };
Reflect.deleteProperty(obj, "x"); // true
console.log(obj); // { y: 2 }

const arr = [1, 2, 3, 4, 5];
Reflect.deleteProperty(arr, "3"); // true
console.log(arr); // [1, 2, 3, <1 empty slot>, 5]

// Returns true if no such property exists
Reflect.deleteProperty({}, "foo"); // true

// Returns false if a property is unconfigurable
Reflect.deleteProperty(Object.freeze({ foo: 1 }), "foo"); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.deleteProperty` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- {{jsxref("Reflect")}}
- [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete)
- [`handler.deleteProperty()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/deleteProperty)
