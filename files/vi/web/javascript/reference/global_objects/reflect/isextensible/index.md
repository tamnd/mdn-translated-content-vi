---
title: Reflect.isExtensible()
short-title: isExtensible()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/isExtensible
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.isExtensible
sidebar: jsref
---

Phương thức tĩnh **`Reflect.isExtensible()`** giống như {{jsxref("Object.isExtensible()")}}. Nó xác định xem một đối tượng có thể mở rộng (có thể thêm thuộc tính mới vào nó hay không).

{{InteractiveExample("JavaScript Demo: Reflect.isExtensible()", "taller")}}

```js interactive-example
const object1 = {};

console.log(Reflect.isExtensible(object1));
// Expected output: true

Reflect.preventExtensions(object1);

console.log(Reflect.isExtensible(object1));
// Expected output: false

const object2 = Object.seal({});

console.log(Reflect.isExtensible(object2));
// Expected output: false
```

## Cú pháp

```js-nolint
Reflect.isExtensible(target)
```

### Tham số

- `target`
  - : Đối tượng target cần kiểm tra xem có thể mở rộng không.

### Giá trị trả về

Một {{jsxref("Boolean")}} cho biết target có thể mở rộng hay không.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng.

## Mô tả

`Reflect.isExtensible()` cung cấp ngữ nghĩa phản chiếu của việc kiểm tra xem một đối tượng có thể mở rộng hay không. Sự khác biệt duy nhất với {{jsxref("Object.isExtensible()")}} là cách xử lý các target không phải đối tượng. `Reflect.isExtensible()` ném ra {{jsxref("TypeError")}} nếu target không phải là đối tượng, trong khi `Object.isExtensible()` luôn trả về `false` cho các target không phải đối tượng.

`Reflect.isExtensible()` gọi phương thức nội tại `[[IsExtensible]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.isExtensible()

Xem thêm {{jsxref("Object.isExtensible()")}}.

```js
// New objects are extensible.
const empty = {};
Reflect.isExtensible(empty); // true

// … but that can be changed.
Reflect.preventExtensions(empty);
Reflect.isExtensible(empty); // false

// Sealed objects are by definition non-extensible.
const sealed = Object.seal({});
Reflect.isExtensible(sealed); // false

// Frozen objects are also by definition non-extensible.
const frozen = Object.freeze({});
Reflect.isExtensible(frozen); // false
```

### Khác biệt với Object.isExtensible()

Nếu đối số `target` cho phương thức này không phải là đối tượng (một giá trị nguyên thủy), thì nó sẽ gây ra {{jsxref("TypeError")}}. Với {{jsxref("Object.isExtensible()")}}, `target` không phải đối tượng sẽ trả về false mà không có bất kỳ lỗi nào.

```js
Reflect.isExtensible(1);
// TypeError: 1 is not an object

Object.isExtensible(1);
// false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.isExtensible` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- {{jsxref("Reflect")}}
- {{jsxref("Object.isExtensible()")}}
- [`handler.isExtensible()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/isExtensible)
