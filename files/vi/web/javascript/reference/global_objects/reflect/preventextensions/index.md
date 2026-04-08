---
title: Reflect.preventExtensions()
short-title: preventExtensions()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/preventExtensions
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.preventExtensions
sidebar: jsref
---

Phương thức tĩnh **`Reflect.preventExtensions()`** giống như {{jsxref("Object.preventExtensions()")}}. Nó ngăn việc thêm thuộc tính mới vào một đối tượng (tức là ngăn các mở rộng trong tương lai cho đối tượng).

{{InteractiveExample("JavaScript Demo: Reflect.preventExtensions()")}}

```js interactive-example
const object = {};

console.log(Reflect.isExtensible(object));
// Expected output: true

Reflect.preventExtensions(object);

console.log(Reflect.isExtensible(object));
// Expected output: false
```

## Cú pháp

```js-nolint
Reflect.preventExtensions(target)
```

### Tham số

- `target`
  - : Đối tượng target cần ngăn mở rộng.

### Giá trị trả về

Một {{jsxref("Boolean")}} cho biết target có được đặt thành ngăn mở rộng thành công hay không.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng.

## Mô tả

`Reflect.preventExtensions()` cung cấp ngữ nghĩa phản chiếu của việc ngăn mở rộng một đối tượng. Sự khác biệt với {{jsxref("Object.preventExtensions()")}} là:

- `Reflect.preventExtensions()` ném ra {{jsxref("TypeError")}} nếu target không phải là đối tượng, trong khi `Object.preventExtensions()` luôn trả về các target không phải đối tượng như vốn có.
- `Reflect.preventExtensions()` trả về một {{jsxref("Boolean")}} cho biết target có được đặt thành ngăn mở rộng thành công hay không, trong khi `Object.preventExtensions()` trả về đối tượng target.

`Reflect.preventExtensions()` gọi phương thức nội tại `[[PreventExtensions]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.preventExtensions()

Xem thêm {{jsxref("Object.preventExtensions()")}}.

```js
// Objects are extensible by default.
const empty = {};
Reflect.isExtensible(empty); // true

// … but that can be changed.
Reflect.preventExtensions(empty);
Reflect.isExtensible(empty); // false
```

### Khác biệt với Object.preventExtensions()

Nếu đối số `target` cho phương thức này không phải là đối tượng (một giá trị nguyên thủy), thì nó sẽ gây ra {{jsxref("TypeError")}}. Với {{jsxref("Object.preventExtensions()")}}, `target` không phải đối tượng sẽ được trả về như vốn có mà không có bất kỳ lỗi nào.

```js
Reflect.preventExtensions(1);
// TypeError: 1 is not an object

Object.preventExtensions(1);
// 1
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.preventExtensions` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- {{jsxref("Reflect")}}
- {{jsxref("Object.preventExtensions()")}}
- [`handler.preventExtensions()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/preventExtensions)
