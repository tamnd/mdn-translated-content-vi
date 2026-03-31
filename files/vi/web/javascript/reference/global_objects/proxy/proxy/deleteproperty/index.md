---
title: handler.deleteProperty()
short-title: deleteProperty()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/deleteProperty
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.deleteProperty
sidebar: jsref
---

Phương thức **`handler.deleteProperty()`** là một trap cho [phương thức nội bộ đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[Delete]]`, được sử dụng bởi các thao tác như toán tử {{jsxref("Operators/delete", "delete")}}.

{{InteractiveExample("JavaScript Demo: handler.deleteProperty()", "taller")}}

```js interactive-example
const monster = {
  texture: "scaly",
};

const handler = {
  deleteProperty(target, prop) {
    if (prop in target) {
      delete target[prop];
      console.log(`property removed: ${prop}`);
      // Expected output: "property removed: texture"
    }
  },
};

console.log(monster.texture);
// Expected output: "scaly"

const proxy = new Proxy(monster, handler);
delete proxy.texture;

console.log(monster.texture);
// Expected output: undefined
```

## Cú pháp

```js-nolint
new Proxy(target, {
  deleteProperty(target, property) {
  }
})
```

### Tham số

Các tham số sau được truyền vào phương thức `deleteProperty()`. `this` được ràng buộc với handler.

- `target`
  - : Đối tượng đích.
- `property`
  - : Một chuỗi hoặc {{jsxref("Symbol")}} đại diện cho tên thuộc tính.

### Giá trị trả về

Phương thức `deleteProperty()` phải trả về một {{jsxref("Boolean")}} cho biết thuộc tính có được xóa thành công hay không. Các giá trị khác được [ép kiểu thành boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion).

Nhiều thao tác, bao gồm toán tử {{jsxref("Operators/delete", "delete")}} trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), ném ra {{jsxref("TypeError")}} nếu phương thức nội bộ `[[Delete]]` trả về `false`.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- Toán tử [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete): `delete proxy[foo]` và `delete proxy.foo`
- {{jsxref("Reflect.deleteProperty()")}}

Hoặc bất kỳ thao tác nào khác gọi [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[Delete]]`.

### Bất biến

Phương thức nội bộ `[[Delete]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- Thuộc tính không thể được báo cáo là đã xóa nếu nó tồn tại như thuộc tính riêng không cấu hình của đối tượng đích. Tức là, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `configurable: false` cho thuộc tính trên `target`, thì trap phải trả về giá trị falsy.
- Thuộc tính không thể được báo cáo là đã xóa nếu nó tồn tại như thuộc tính riêng của đối tượng đích và đối tượng đích không thể mở rộng. Tức là, nếu {{jsxref("Reflect.isExtensible()")}} trả về `false` trên `target`, và {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về bộ mô tả thuộc tính cho thuộc tính trên `target`, thì trap phải trả về giá trị falsy.

## Ví dụ

### Bẫy toán tử delete

Đoạn mã sau bẫy toán tử {{jsxref("Operators/delete", "delete")}}.

```js
const p = new Proxy(
  {},
  {
    deleteProperty(target, prop) {
      if (!(prop in target)) {
        console.log(`property not found: ${prop}`);
        return false;
      }
      delete target[prop];
      console.log(`property removed: ${prop}`);
      return true;
    },
  },
);

p.a = 10;
console.log("a" in p); // true

const result1 = delete p.a; // "property removed: a"
console.log(result1); // true
console.log("a" in p); // false

const result2 = delete p.a; // "property not found: a"
console.log(result2); // false
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Hàm tạo `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Operators/delete", "delete")}}
- {{jsxref("Reflect.deleteProperty()")}}
