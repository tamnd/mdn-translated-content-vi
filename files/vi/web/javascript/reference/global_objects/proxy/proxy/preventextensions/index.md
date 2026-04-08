---
title: handler.preventExtensions()
short-title: preventExtensions()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/preventExtensions
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.preventExtensions
sidebar: jsref
---

Phương thức **`handler.preventExtensions()`** là một trap cho [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[PreventExtensions]]` của đối tượng, được sử dụng bởi các thao tác như {{jsxref("Object.preventExtensions()")}}.

{{InteractiveExample("JavaScript Demo: handler.preventExtensions()", "taller")}}

```js interactive-example
const monster = {
  canEvolve: true,
};

const handler = {
  preventExtensions(target) {
    target.canEvolve = false;
    Object.preventExtensions(target);
    return true;
  },
};

const proxy = new Proxy(monster, handler);

console.log(monster.canEvolve);
// Expected output: true

Object.preventExtensions(proxy);

console.log(monster.canEvolve);
// Expected output: false
```

## Cú pháp

```js-nolint
new Proxy(target, {
  preventExtensions(target) {
  }
})
```

### Tham số

Tham số sau được truyền vào phương thức `preventExtensions()`. `this` được gắn với handler.

- `target`
  - : Đối tượng đích.

### Giá trị trả về

Phương thức `preventExtensions()` phải trả về một {{jsxref("Boolean")}} cho biết thao tác có thành công hay không. Các giá trị khác sẽ được [ép kiểu thành boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion).

Nhiều thao tác, bao gồm {{jsxref("Object.preventExtensions()")}}, sẽ ném ra {{jsxref("TypeError")}} nếu phương thức nội bộ `[[PreventExtensions]]` trả về `false`.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- {{jsxref("Object.preventExtensions()")}}
- {{jsxref("Reflect.preventExtensions()")}}
- {{jsxref("Object.seal()")}}
- {{jsxref("Object.freeze()")}}

Hoặc bất kỳ thao tác nào khác gọi đến [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[PreventExtensions]]`.

### Các bất biến

Phương thức nội bộ `[[PreventExtensions]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- Kết quả chỉ được là `true` nếu {{jsxref("Reflect.isExtensible()")}} trên đối tượng đích trả về `false` sau khi gọi `handler.preventExtensions()`.

## Ví dụ

### Chặn preventExtensions

Đoạn code sau chặn {{jsxref("Object.preventExtensions()")}}.

```js
const p = new Proxy(
  {},
  {
    preventExtensions(target) {
      console.log("called");
      Object.preventExtensions(target);
      return true;
    },
  },
);

console.log(Object.preventExtensions(p));
// "called"
// false
```

Đoạn code sau vi phạm bất biến.

```js example-bad
const p = new Proxy(
  {},
  {
    preventExtensions(target) {
      return true;
    },
  },
);

Object.preventExtensions(p); // TypeError is thrown
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Constructor `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Object.preventExtensions()")}}
- {{jsxref("Reflect.preventExtensions()")}}
