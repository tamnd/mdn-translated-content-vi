---
title: handler.defineProperty()
short-title: defineProperty()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/defineProperty
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.defineProperty
sidebar: jsref
---

Phương thức **`handler.defineProperty()`** là một trap cho [phương thức nội bộ đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[DefineOwnProperty]]`, được sử dụng bởi các thao tác như {{jsxref("Object.defineProperty()")}}.

{{InteractiveExample("JavaScript Demo: handler.defineProperty()", "taller")}}

```js interactive-example
const handler = {
  defineProperty(target, key, descriptor) {
    invariant(key, "define");
    return true;
  },
};

function invariant(key, action) {
  if (key[0] === "_") {
    throw new Error(`Invalid attempt to ${action} private "${key}" property`);
  }
}

const monster = {};
const proxy = new Proxy(monster, handler);

console.log((proxy._secret = "easily scared"));
// Expected output: Error: Invalid attempt to define private "_secret" property
```

## Cú pháp

```js-nolint
new Proxy(target, {
  defineProperty(target, property, descriptor) {
  }
})
```

### Tham số

Các tham số sau được truyền vào phương thức `defineProperty()`. `this` được ràng buộc với handler.

- `target`
  - : Đối tượng đích.
- `property`
  - : Một chuỗi hoặc {{jsxref("Symbol")}} đại diện cho tên thuộc tính.
- `descriptor`
  - : Bộ mô tả cho thuộc tính đang được định nghĩa hoặc sửa đổi.

### Giá trị trả về

Phương thức `defineProperty()` phải trả về một {{jsxref("Boolean")}} cho biết thuộc tính có được định nghĩa thành công hay không. Các giá trị khác được [ép kiểu thành boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion).

Nhiều thao tác, bao gồm {{jsxref("Object.defineProperty()")}} và {{jsxref("Object.defineProperties()")}}, ném ra {{jsxref("TypeError")}} nếu phương thức nội bộ `[[DefineOwnProperty]]` trả về `false`.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- {{jsxref("Object.defineProperty()")}}, {{jsxref("Object.defineProperties()")}}
- {{jsxref("Reflect.defineProperty()")}}

Hoặc bất kỳ thao tác nào khác gọi [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[DefineOwnProperty]]`.

### Bất biến

Phương thức nội bộ `[[DefineOwnProperty]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- Không thể thêm thuộc tính nếu đối tượng đích không thể mở rộng. Tức là, nếu {{jsxref("Reflect.isExtensible()")}} trả về `false` trên `target`, và {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `undefined` cho thuộc tính trên `target`, thì trap phải trả về giá trị falsy.
- Thuộc tính không thể không cấu hình được, trừ khi tồn tại thuộc tính riêng không cấu hình tương ứng trên đối tượng đích. Tức là, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `undefined` hoặc `configurable: true` cho thuộc tính trên `target`, và `descriptor.configurable` là `false`, thì trap phải trả về giá trị falsy.
- Thuộc tính không cấu hình không thể không ghi được, trừ khi tồn tại thuộc tính riêng không cấu hình, không ghi tương ứng trên đối tượng đích. Tức là, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `configurable: false, writable: true` cho thuộc tính trên `target`, và `descriptor.writable` là `false`, thì trap phải trả về giá trị falsy.
- Nếu thuộc tính có thuộc tính tương ứng trên đối tượng đích, thì bộ mô tả thuộc tính của đối tượng đích phải tương thích với `descriptor`. Tức là, giả sử `target` là đối tượng thông thường, và {{jsxref("Object/defineProperty", "Object.defineProperty(target, property, descriptor)")}} sẽ ném ra lỗi, thì trap phải trả về giá trị falsy. Tham chiếu `Object.defineProperty()` có thêm thông tin, nhưng tóm lại, khi thuộc tính đích không cấu hình, những điều sau phải đúng:
  - `configurable`, `enumerable`, `get`, và `set` không thể thay đổi
  - Thuộc tính không thể chuyển đổi giữa data và accessor
  - Thuộc tính `writable` chỉ có thể thay đổi từ `true` sang `false`
  - Thuộc tính `value` chỉ có thể thay đổi nếu `writable` là `true`

## Ví dụ

### Bẫy defineProperty

Đoạn mã sau bẫy {{jsxref("Object.defineProperty()")}}.

```js
const p = new Proxy(
  {},
  {
    defineProperty(target, prop, descriptor) {
      console.log(`called: ${prop}`);
      return true;
    },
  },
);

const desc = { configurable: true, enumerable: true, value: 10 };
Object.defineProperty(p, "a", desc); // "called: a"
```

Khi gọi {{jsxref("Object.defineProperty()")}} hoặc {{jsxref("Reflect.defineProperty()")}}, `descriptor` được truyền vào trap `defineProperty()` có một hạn chế—chỉ các thuộc tính sau có thể sử dụng được (các thuộc tính không chuẩn sẽ bị bỏ qua):

- `enumerable`
- `configurable`
- `writable`
- `value`
- `get`
- `set`

```js
const p = new Proxy(
  {},
  {
    defineProperty(target, prop, descriptor) {
      console.log(descriptor);
      return Reflect.defineProperty(target, prop, descriptor);
    },
  },
);

Object.defineProperty(p, "name", {
  value: "proxy",
  type: "custom",
}); // { value: 'proxy' }
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Hàm tạo `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Object.defineProperty()")}}
- {{jsxref("Reflect.defineProperty()")}}
