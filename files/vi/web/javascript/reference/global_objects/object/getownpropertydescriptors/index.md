---
title: Object.getOwnPropertyDescriptors()
short-title: getOwnPropertyDescriptors()
slug: Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptors
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.getOwnPropertyDescriptors
sidebar: jsref
---

Phương thức tĩnh **`Object.getOwnPropertyDescriptors()`** trả về tất cả các property descriptor của chính đối tượng đã cho.

{{InteractiveExample("JavaScript Demo: Object.getOwnPropertyDescriptors()")}}

```js interactive-example
const object = {
  foo: 42,
};

const descriptors = Object.getOwnPropertyDescriptors(object);

console.log(descriptors.foo.writable);
// Expected output: true

console.log(descriptors.foo.value);
// Expected output: 42
```

## Cú pháp

```js-nolint
Object.getOwnPropertyDescriptors(obj)
```

### Tham số

- `obj`
  - : Đối tượng cần lấy tất cả các property descriptor của chính nó.

### Giá trị trả về

Một đối tượng chứa tất cả các property descriptor của chính đối tượng. Có thể là một đối tượng rỗng nếu không có thuộc tính nào.

## Mô tả

Phương thức này cho phép kiểm tra mô tả chính xác của tất cả các thuộc tính của chính đối tượng. Một _thuộc tính_ trong JavaScript bao gồm tên có giá trị chuỗi hoặc {{jsxref("Symbol")}} và một property descriptor. Thêm thông tin về các kiểu property descriptor và các thuộc tính của chúng có thể được tìm thấy trong {{jsxref("Object.defineProperty()")}}.

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

### Tạo bản sao nông

Trong khi phương thức {{jsxref("Object.assign()")}} chỉ sao chép các thuộc tính có thể đếm và của chính đối tượng từ đối tượng nguồn sang đối tượng đích, bạn có thể sử dụng phương thức này và {{jsxref("Object.create()")}} để tạo [bản sao nông](/en-US/docs/Glossary/Shallow_copy) giữa hai đối tượng không xác định:

```js
Object.create(
  Object.getPrototypeOf(obj),
  Object.getOwnPropertyDescriptors(obj),
);
```

### Tạo lớp con

Một cách thông thường để tạo lớp con là định nghĩa lớp con, đặt prototype của nó thành một instance của lớp cha, và sau đó định nghĩa các thuộc tính trên instance đó. Điều này có thể trở nên cồng kềnh đặc biệt với getter và setter. Thay vào đó, bạn có thể sử dụng code này để đặt prototype:

```js
function superclass() {}
superclass.prototype = {
  // Định nghĩa hàm tạo, phương thức và thuộc tính của lớp cha ở đây
};
function subclass() {}
subclass.prototype = Object.create(superclass.prototype, {
  // Định nghĩa hàm tạo, phương thức và thuộc tính của lớp con ở đây
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.getOwnPropertyDescriptors` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [es-shims polyfill of `Object.getOwnPropertyDescriptors`](https://www.npmjs.com/package/object.getownpropertydescriptors)
- {{jsxref("Object.getOwnPropertyDescriptor()")}}
- {{jsxref("Object.defineProperty()")}}
