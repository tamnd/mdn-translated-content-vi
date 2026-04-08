---
title: handler.set()
short-title: set()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/set
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.set
sidebar: jsref
---

Phương thức **`handler.set()`** là một trap cho [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[Set]]` của đối tượng, được sử dụng bởi các thao tác như dùng [property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) để gán giá trị cho thuộc tính.

{{InteractiveExample("JavaScript Demo: handler.set()", "taller")}}

```js interactive-example
const monster = { eyeCount: 4 };

const handler = {
  set(obj, prop, value) {
    if (prop === "eyeCount" && value % 2 !== 0) {
      console.log("Monsters must have an even number of eyes");
    } else {
      return Reflect.set(...arguments);
    }
  },
};

const proxy = new Proxy(monster, handler);

proxy.eyeCount = 1;
// Expected output: "Monsters must have an even number of eyes"

console.log(proxy.eyeCount);
// Expected output: 4

proxy.eyeCount = 2;
console.log(proxy.eyeCount);
// Expected output: 2
```

## Cú pháp

```js-nolint
new Proxy(target, {
  set(target, property, value, receiver) {
  }
})
```

### Tham số

Các tham số sau được truyền vào phương thức `set()`. `this` được gắn với handler.

- `target`
  - : Đối tượng đích.
- `property`
  - : Một string hoặc {{jsxref("Symbol")}} đại diện cho tên thuộc tính.
- `value`
  - : Giá trị mới của thuộc tính cần gán.
- `receiver`
  - : Giá trị `this` dành cho setter; xem {{jsxref("Reflect.set()")}}. Thường là chính proxy hoặc một đối tượng kế thừa từ proxy.

### Giá trị trả về

Phương thức `set()` phải trả về một {{jsxref("Boolean")}} cho biết việc gán có thành công hay không. Các giá trị khác sẽ được [ép kiểu thành boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion).

Nhiều thao tác, bao gồm sử dụng property accessor trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), sẽ ném ra {{jsxref("TypeError")}} nếu phương thức nội bộ `[[Set]]` trả về `false`.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- Gán thuộc tính: `proxy[foo] = bar` và `proxy.foo = bar`
- {{jsxref("Reflect.set()")}}

Hoặc bất kỳ thao tác nào khác gọi đến [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[Set]]`.

### Các bất biến

Phương thức nội bộ `[[Set]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- Không thể thay đổi giá trị của một thuộc tính thành giá trị khác so với thuộc tính tương ứng của đối tượng đích, nếu thuộc tính đó là thuộc tính own data non-writable, non-configurable. Tức là, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `configurable: false, writable: false` cho thuộc tính trên `target`, và `value` khác với thuộc tính `value` trong property descriptor của `target`, thì trap phải trả về giá trị falsy.
- Không thể gán giá trị cho thuộc tính nếu thuộc tính tương ứng của đối tượng đích là thuộc tính own accessor non-configurable không có setter. Tức là, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `configurable: false, set: undefined` cho thuộc tính trên `target`, thì trap phải trả về giá trị falsy.

## Ví dụ

### Chặn việc gán giá trị thuộc tính

Đoạn code sau chặn việc gán giá trị cho thuộc tính.

```js
const p = new Proxy(
  {},
  {
    set(target, prop, value, receiver) {
      target[prop] = value;
      console.log(`property set: ${prop} = ${value}`);
      return true;
    },
  },
);

console.log("a" in p); // false

p.a = 10; // "property set: a = 10"
console.log("a" in p); // true
console.log(p.a); // 10
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Constructor `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Reflect.set()")}}
