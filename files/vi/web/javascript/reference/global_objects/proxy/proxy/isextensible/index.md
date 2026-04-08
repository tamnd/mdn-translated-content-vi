---
title: handler.isExtensible()
short-title: isExtensible()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/isExtensible
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.isExtensible
sidebar: jsref
---

Phương thức **`handler.isExtensible()`** là một trap cho [phương thức nội bộ đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[IsExtensible]]`, được sử dụng bởi các thao tác như {{jsxref("Object.isExtensible()")}}.

{{InteractiveExample("JavaScript Demo: handler.isExtensible()", "taller")}}

```js interactive-example
const monster = {
  canEvolve: true,
};

const handler = {
  isExtensible(target) {
    return Reflect.isExtensible(target);
  },
  preventExtensions(target) {
    target.canEvolve = false;
    return Reflect.preventExtensions(target);
  },
};

const proxy = new Proxy(monster, handler);

console.log(Object.isExtensible(proxy));
// Expected output: true

console.log(monster.canEvolve);
// Expected output: true

Object.preventExtensions(proxy);

console.log(Object.isExtensible(proxy));
// Expected output: false

console.log(monster.canEvolve);
// Expected output: false
```

## Cú pháp

```js-nolint
new Proxy(target, {
  isExtensible(target) {
  }
})
```

### Tham số

Tham số sau được truyền vào phương thức `isExtensible()`. `this` được ràng buộc với handler.

- `target`
  - : Đối tượng đích.

### Giá trị trả về

Phương thức `isExtensible()` phải trả về một {{jsxref("Boolean")}} chỉ ra liệu đối tượng đích có thể mở rộng hay không. Các giá trị khác được [ép kiểu thành boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion).

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- {{jsxref("Object.isExtensible()")}}
- {{jsxref("Reflect.isExtensible()")}}

Hoặc bất kỳ thao tác nào khác gọi [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[IsExtensible]]`.

### Bất biến

Phương thức nội bộ `[[IsExtensible]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm bất biến sau:

- Kết quả phải giống với {{jsxref("Reflect.isExtensible()")}} trên đối tượng đích.

## Ví dụ

### Bẫy isExtensible

Đoạn mã sau bẫy {{jsxref("Object.isExtensible()")}}.

```js
const p = new Proxy(
  {},
  {
    isExtensible(target) {
      console.log("called");
      return true;
    },
  },
);

console.log(Object.isExtensible(p));
// "called"
// true
```

Đoạn mã sau vi phạm bất biến.

```js example-bad
const p = new Proxy(
  {},
  {
    isExtensible(target) {
      return false;
    },
  },
);

Object.isExtensible(p); // TypeError is thrown
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Hàm tạo `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Object.isExtensible()")}}
- {{jsxref("Reflect.isExtensible()")}}
- {{jsxref("Reflect.preventExtensions()")}}
