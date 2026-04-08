---
title: Reflect.getOwnPropertyDescriptor()
short-title: getOwnPropertyDescriptor()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/getOwnPropertyDescriptor
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.getOwnPropertyDescriptor
sidebar: jsref
---

Phương thức tĩnh **`Reflect.getOwnPropertyDescriptor()`** giống như {{jsxref("Object.getOwnPropertyDescriptor()")}}. Nó trả về property descriptor của thuộc tính đã cho nếu nó tồn tại trên đối tượng, {{jsxref("undefined")}} nếu không.

{{InteractiveExample("JavaScript Demo: Reflect.getOwnPropertyDescriptor()")}}

```js interactive-example
const object = {
  property1: 42,
};

console.log(Reflect.getOwnPropertyDescriptor(object, "property1").value);
// Expected output: 42

console.log(Reflect.getOwnPropertyDescriptor(object, "property2"));
// Expected output: undefined

console.log(Reflect.getOwnPropertyDescriptor(object, "property1").writable);
// Expected output: true
```

## Cú pháp

```js-nolint
Reflect.getOwnPropertyDescriptor(target, propertyKey)
```

### Tham số

- `target`
  - : Đối tượng target trong đó tìm kiếm thuộc tính.
- `propertyKey`
  - : Tên của thuộc tính cần lấy property descriptor riêng.

### Giá trị trả về

Một đối tượng property descriptor nếu thuộc tính tồn tại như thuộc tính riêng của `target`; nếu không, {{jsxref("undefined")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng.

## Mô tả

`Reflect.getOwnPropertyDescriptor()` cung cấp ngữ nghĩa phản chiếu của việc lấy property descriptor của một đối tượng. Sự khác biệt duy nhất với {{jsxref("Object.getOwnPropertyDescriptor()")}} là cách xử lý các target không phải đối tượng. `Reflect.getOwnPropertyDescriptor()` ném ra {{jsxref("TypeError")}} nếu target không phải là đối tượng, trong khi `Object.getOwnPropertyDescriptor()` ép kiểu nó về đối tượng.

`Reflect.getOwnPropertyDescriptor()` gọi phương thức nội tại `[[GetOwnProperty]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.getOwnPropertyDescriptor()

```js
Reflect.getOwnPropertyDescriptor({ x: "hello" }, "x");
// {value: "hello", writable: true, enumerable: true, configurable: true}

Reflect.getOwnPropertyDescriptor({ x: "hello" }, "y");
// undefined

Reflect.getOwnPropertyDescriptor([], "length");
// {value: 0, writable: true, enumerable: false, configurable: false}
```

### Khác biệt với Object.getOwnPropertyDescriptor()

Nếu đối số `target` cho phương thức này không phải là đối tượng (một giá trị nguyên thủy), thì nó sẽ gây ra {{jsxref("TypeError")}}. Với {{jsxref("Object.getOwnPropertyDescriptor")}}, đối số đầu tiên không phải đối tượng sẽ được ép kiểu về đối tượng trước.

```js
Reflect.getOwnPropertyDescriptor("foo", 0);
// TypeError: "foo" is not non-null object

Object.getOwnPropertyDescriptor("foo", 0);
// { value: "f", writable: false, enumerable: true, configurable: false }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.getOwnPropertyDescriptor` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- {{jsxref("Reflect")}}
- {{jsxref("Object.getOwnPropertyDescriptor()")}}
- [`handler.getOwnPropertyDescriptor()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/getOwnPropertyDescriptor)
