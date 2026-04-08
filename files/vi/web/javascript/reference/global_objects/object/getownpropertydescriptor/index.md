---
title: Object.getOwnPropertyDescriptor()
short-title: getOwnPropertyDescriptor()
slug: Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptor
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.getOwnPropertyDescriptor
sidebar: jsref
---

Phương thức tĩnh **`Object.getOwnPropertyDescriptor()`** trả về một đối tượng mô tả cấu hình của một thuộc tính cụ thể trên một đối tượng đã cho (tức là, một thuộc tính có mặt trực tiếp trên đối tượng và không nằm trong chuỗi prototype của đối tượng). Đối tượng được trả về có thể thay đổi nhưng việc thay đổi nó không ảnh hưởng đến cấu hình thuộc tính gốc.

{{InteractiveExample("JavaScript Demo: Object.getOwnPropertyDescriptor()")}}

```js interactive-example
const object = {
  foo: 42,
};

const descriptor = Object.getOwnPropertyDescriptor(object, "foo");

console.log(descriptor.configurable);
// Expected output: true

console.log(descriptor.value);
// Expected output: 42
```

## Cú pháp

```js-nolint
Object.getOwnPropertyDescriptor(obj, prop)
```

### Tham số

- `obj`
  - : Đối tượng cần tìm thuộc tính.
- `prop`
  - : Tên hoặc {{jsxref("Symbol")}} của thuộc tính cần lấy mô tả.

### Giá trị trả về

Một property descriptor của thuộc tính đã cho nếu nó tồn tại trên đối tượng, {{jsxref("undefined")}} nếu không.

## Mô tả

Phương thức này cho phép kiểm tra mô tả chính xác của một thuộc tính. Một _thuộc tính_ trong JavaScript bao gồm tên có giá trị chuỗi hoặc {{jsxref("Symbol")}} và một property descriptor. Thêm thông tin về các kiểu property descriptor và các thuộc tính của chúng có thể được tìm thấy trong {{jsxref("Object.defineProperty()")}}.

Một _property descriptor_ là một bản ghi có một số thuộc tính sau:

- `value`
  - : Giá trị liên kết với thuộc tính (chỉ dành cho data descriptor).
- `writable`
  - : `true` khi và chỉ khi giá trị liên kết với thuộc tính có thể được thay đổi (chỉ dành cho data descriptor).
- `get`
  - : Một hàm đóng vai trò getter cho thuộc tính, hoặc {{jsxref("undefined")}} nếu không có getter (chỉ dành cho accessor descriptor).
- `set`
  - : Một hàm đóng vai trò setter cho thuộc tính, hoặc {{jsxref("undefined")}} nếu không có setter (chỉ dành cho accessor descriptor).
- `configurable`
  - : `true` khi và chỉ khi kiểu của property descriptor này có thể được thay đổi và thuộc tính có thể bị xóa khỏi đối tượng tương ứng.
- `enumerable`
  - : `true` khi và chỉ khi thuộc tính này xuất hiện trong quá trình liệt kê các thuộc tính trên đối tượng tương ứng.

## Ví dụ

### Sử dụng Object.getOwnPropertyDescriptor()

```js
let o, d;

o = {
  get foo() {
    return 17;
  },
};
d = Object.getOwnPropertyDescriptor(o, "foo");
console.log(d);
// {
//   configurable: true,
//   enumerable: true,
//   get: [Function: get foo],
//   set: undefined
// }

o = { bar: 42 };
d = Object.getOwnPropertyDescriptor(o, "bar");
console.log(d);
// {
//   configurable: true,
//   enumerable: true,
//   value: 42,
//   writable: true
// }

o = { [Symbol.for("baz")]: 73 };
d = Object.getOwnPropertyDescriptor(o, Symbol.for("baz"));
console.log(d);
// {
//   configurable: true,
//   enumerable: true,
//   value: 73,
//   writable: true
// }

o = {};
Object.defineProperty(o, "qux", {
  value: 8675309,
  writable: false,
  enumerable: false,
});
d = Object.getOwnPropertyDescriptor(o, "qux");
console.log(d);
// {
//   value: 8675309,
//   writable: false,
//   enumerable: false,
//   configurable: false
// }
```

### Ép kiểu đối số không phải đối tượng

Trong ES5, nếu đối số đầu tiên của phương thức này không phải là đối tượng (một giá trị nguyên thủy), nó sẽ gây ra {{jsxref("TypeError")}}. Trong ES2015, đối số đầu tiên không phải đối tượng sẽ được ép kiểu thành đối tượng trước.

```js
Object.getOwnPropertyDescriptor("foo", 0);
// TypeError: "foo" is not an object  // ES5 code

Object.getOwnPropertyDescriptor("foo", 0);
// Object returned by ES2015 code: {
//   configurable: false,
//   enumerable: true,
//   value: "f",
//   writable: false
// }
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.defineProperty()")}}
- {{jsxref("Reflect.getOwnPropertyDescriptor()")}}
