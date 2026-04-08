---
title: handler.setPrototypeOf()
short-title: setPrototypeOf()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/setPrototypeOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.setPrototypeOf
sidebar: jsref
---

Phương thức **`handler.setPrototypeOf()`** là một trap cho [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[SetPrototypeOf]]` của đối tượng, được sử dụng bởi các thao tác như {{jsxref("Object.setPrototypeOf()")}}.

{{InteractiveExample("JavaScript Demo: handler.setPrototypeOf()", "taller")}}

```js interactive-example
const handler = {
  setPrototypeOf(monster, monsterProto) {
    monster.geneticallyModified = true;
    return false;
  },
};

const monsterProto = {};
const monster = {
  geneticallyModified: false,
};

const proxy = new Proxy(monster, handler);
// Object.setPrototypeOf(proxy, monsterProto); // Throws a TypeError

console.log(Reflect.setPrototypeOf(proxy, monsterProto));
// Expected output: false

console.log(monster.geneticallyModified);
// Expected output: true
```

## Cú pháp

```js-nolint
new Proxy(target, {
  setPrototypeOf(target, prototype) {
  }
})
```

### Tham số

Các tham số sau được truyền vào phương thức `setPrototypeOf()`. `this` được gắn với handler.

- `target`
  - : Đối tượng đích.
- `prototype`
  - : Prototype mới của đối tượng hoặc `null`.

### Giá trị trả về

Phương thức `setPrototypeOf()` phải trả về một {{jsxref("Boolean")}} cho biết prototype có được thay đổi thành công hay không. Các giá trị khác sẽ được [ép kiểu thành boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion).

Nhiều thao tác, bao gồm {{jsxref("Object.setPrototypeOf()")}}, sẽ ném ra {{jsxref("TypeError")}} nếu phương thức nội bộ `[[SetPrototypeOf]]` trả về `false`.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- {{jsxref("Object.setPrototypeOf()")}}
- {{jsxref("Reflect.setPrototypeOf()")}}

Hoặc bất kỳ thao tác nào khác gọi đến [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[SetPrototypeOf]]`.

### Các bất biến

Phương thức nội bộ `[[SetPrototypeOf]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- Nếu đối tượng đích không thể mở rộng (not extensible), prototype không thể thay đổi. Tức là, nếu {{jsxref("Reflect.isExtensible()")}} trả về `false` trên `target`, và `prototype` không giống với kết quả của `Reflect.getPrototypeOf(target)`, thì trap phải trả về giá trị falsy.

## Ví dụ

Nếu bạn muốn không cho phép đặt prototype mới cho đối tượng, phương thức `setPrototypeOf()` của handler có thể trả về `false`, hoặc ném ra một ngoại lệ.

### Cách 1: Trả về false

Cách này có nghĩa là bất kỳ thao tác thay đổi nào ném ra ngoại lệ khi thất bại phải tự tạo ngoại lệ.

Ví dụ, {{jsxref("Object.setPrototypeOf()")}} sẽ tự tạo và ném ra {{jsxref("TypeError")}}. Nếu thao tác thay đổi được thực hiện bởi một hàm _không_ thường ném ra ngoại lệ khi thất bại, chẳng hạn {{jsxref("Reflect.setPrototypeOf()")}}, thì sẽ không có ngoại lệ nào được ném ra.

```js
const handlerReturnsFalse = {
  setPrototypeOf(target, newProto) {
    return false;
  },
};

const newProto = {},
  target = {};

const p1 = new Proxy(target, handlerReturnsFalse);
Object.setPrototypeOf(p1, newProto); // throws a TypeError
Reflect.setPrototypeOf(p1, newProto); // returns false
```

### Cách 2: Ném ra ngoại lệ

Cách sau sẽ khiến _mọi_ thao tác cố gắng thay đổi đều ném ra ngoại lệ. Cách này phù hợp nếu bạn muốn ngay cả các thao tác không ném ra ngoại lệ cũng phải ném ra khi thất bại, hoặc bạn muốn ném ra giá trị ngoại lệ tùy chỉnh.

```js
const handlerThrows = {
  setPrototypeOf(target, newProto) {
    throw new Error("custom error");
  },
};

const newProto = {},
  target = {};

const p2 = new Proxy(target, handlerThrows);
Object.setPrototypeOf(p2, newProto); // throws new Error("custom error")
Reflect.setPrototypeOf(p2, newProto); // throws new Error("custom error")
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Constructor `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Object.setPrototypeOf()")}}
- {{jsxref("Reflect.setPrototypeOf()")}}
