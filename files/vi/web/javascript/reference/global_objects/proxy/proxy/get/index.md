---
title: handler.get()
short-title: get()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/get
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.get
sidebar: jsref
---

Phương thức **`handler.get()`** là một trap cho [phương thức nội bộ đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[Get]]`, được sử dụng bởi các thao tác như [bộ truy cập thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors).

{{InteractiveExample("JavaScript Demo: handler.get()", "taller")}}

```js interactive-example
const monster = {
  secret: "easily scared",
  eyeCount: 4,
};

const handler = {
  get(target, prop, receiver) {
    if (prop === "secret") {
      return `${target.secret.substring(0, 4)} ... shhhh!`;
    }
    return Reflect.get(...arguments);
  },
};

const proxy = new Proxy(monster, handler);

console.log(proxy.eyeCount);
// Expected output: 4

console.log(proxy.secret);
// Expected output: "easi ... shhhh!"
```

## Cú pháp

```js-nolint
new Proxy(target, {
  get(target, property, receiver) {
  }
})
```

### Tham số

Các tham số sau được truyền vào phương thức `get()`. `this` được ràng buộc với handler.

- `target`
  - : Đối tượng đích.
- `property`
  - : Một chuỗi hoặc {{jsxref("Symbol")}} đại diện cho tên thuộc tính.
- `receiver`
  - : Giá trị `this` cho getter; xem {{jsxref("Reflect.get()")}}. Thường là chính proxy hoặc một đối tượng kế thừa từ proxy.

### Giá trị trả về

Phương thức `get()` có thể trả về bất kỳ giá trị nào, đại diện cho giá trị thuộc tính.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- Truy cập thuộc tính: `proxy[foo]` và `proxy.bar`
- {{jsxref("Reflect.get()")}}

Hoặc bất kỳ thao tác nào khác gọi [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[Get]]`.

### Bất biến

Phương thức nội bộ `[[Get]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- Giá trị được báo cáo cho một thuộc tính phải giống với giá trị của thuộc tính đối tượng đích tương ứng, nếu thuộc tính đối tượng đích là thuộc tính data riêng không ghi, không cấu hình. Tức là, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `configurable: false, writable: false` cho thuộc tính trên `target`, thì trap phải trả về cùng giá trị với thuộc tính `value` trong bộ mô tả thuộc tính của `target`.
- Giá trị được báo cáo cho một thuộc tính phải là `undefined` nếu thuộc tính đối tượng đích tương ứng là thuộc tính accessor riêng không cấu hình với getter undefined. Tức là, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `configurable: false, get: undefined` cho thuộc tính trên `target`, thì trap phải trả về `undefined`.

## Ví dụ

### Bẫy lấy giá trị thuộc tính

Đoạn mã sau bẫy việc lấy giá trị thuộc tính.

```js
const p = new Proxy(
  {},
  {
    get(target, property, receiver) {
      console.log(`called: ${property}`);
      return 10;
    },
  },
);

console.log(p.a);
// "called: a"
// 10
```

Đoạn mã sau vi phạm bất biến.

```js
const obj = {};
Object.defineProperty(obj, "a", {
  configurable: false,
  enumerable: false,
  value: 10,
  writable: false,
});

const p = new Proxy(obj, {
  get(target, property) {
    return 20;
  },
});

p.a; // TypeError is thrown
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Hàm tạo `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Reflect.get()")}}
