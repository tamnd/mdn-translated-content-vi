---
title: Object.isExtensible()
short-title: isExtensible()
slug: Web/JavaScript/Reference/Global_Objects/Object/isExtensible
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.isExtensible
sidebar: jsref
---

Phương thức tĩnh **`Object.isExtensible()`** xác định xem một đối tượng có thể mở rộng hay không (liệu có thể thêm thuộc tính mới vào nó không).

{{InteractiveExample("JavaScript Demo: Object.isExtensible()")}}

```js interactive-example
const object = {};

console.log(Object.isExtensible(object));
// Expected output: true

Object.preventExtensions(object);

console.log(Object.isExtensible(object));
// Expected output: false
```

## Cú pháp

```js-nolint
Object.isExtensible(obj)
```

### Tham số

- `obj`
  - : Đối tượng cần kiểm tra.

### Giá trị trả về

Một {{jsxref("Boolean")}} cho biết đối tượng đã cho có thể mở rộng hay không.

## Mô tả

Các đối tượng có thể mở rộng theo mặc định: chúng có thể có các thuộc tính mới được thêm vào, và `[[Prototype]]` của chúng có thể được gán lại. Một đối tượng có thể được đánh dấu là không thể mở rộng bằng cách sử dụng một trong các phương thức {{jsxref("Object.preventExtensions()")}}, {{jsxref("Object.seal()")}}, {{jsxref("Object.freeze()")}} hoặc {{jsxref("Reflect.preventExtensions()")}}.

## Ví dụ

### Sử dụng Object.isExtensible

```js
// Các đối tượng mới có thể mở rộng.
const empty = {};
Object.isExtensible(empty); // true

// Chúng có thể được làm không thể mở rộng
Object.preventExtensions(empty);
Object.isExtensible(empty); // false

// Các đối tượng sealed theo định nghĩa là không thể mở rộng.
const sealed = Object.seal({});
Object.isExtensible(sealed); // false

// Các đối tượng frozen theo định nghĩa cũng là không thể mở rộng.
const frozen = Object.freeze({});
Object.isExtensible(frozen); // false
```

### Đối số không phải đối tượng

Trong ES5, nếu đối số của phương thức này không phải là đối tượng (một giá trị nguyên thủy), nó sẽ gây ra {{jsxref("TypeError")}}. Trong ES2015, nó sẽ trả về `false` mà không có bất kỳ lỗi nào nếu đối số không phải đối tượng được truyền vào, vì các giá trị nguyên thủy theo định nghĩa là bất biến.

```js
Object.isExtensible(1);
// TypeError: 1 is not an object (ES5 code)

Object.isExtensible(1);
// false                         (ES2015 code)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.preventExtensions()")}}
- {{jsxref("Object.seal()")}}
- {{jsxref("Object.isSealed()")}}
- {{jsxref("Object.freeze()")}}
- {{jsxref("Object.isFrozen()")}}
- {{jsxref("Reflect.isExtensible()")}}
