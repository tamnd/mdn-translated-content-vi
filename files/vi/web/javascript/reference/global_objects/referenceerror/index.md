---
title: ReferenceError
slug: Web/JavaScript/Reference/Global_Objects/ReferenceError
page-type: javascript-class
browser-compat: javascript.builtins.ReferenceError
sidebar: jsref
---

Đối tượng **`ReferenceError`** biểu diễn một lỗi khi một biến không tồn tại (hoặc chưa được khởi tạo) trong phạm vi hiện tại được tham chiếu.

`ReferenceError` là một {{Glossary("serializable object")}}, vì vậy nó có thể được nhân bản với {{DOMxRef("Window.structuredClone", "structuredClone()")}} hoặc sao chép giữa các [Worker](/en-US/docs/Web/API/Worker) bằng cách sử dụng {{domxref("Worker/postMessage()", "postMessage()")}}.

`ReferenceError` là lớp con của {{jsxref("Error")}}.

## Constructor

- {{jsxref("ReferenceError/ReferenceError", "ReferenceError()")}}
  - : Tạo một đối tượng `ReferenceError` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Error")}}_.

Các thuộc tính này được định nghĩa trên `ReferenceError.prototype` và được chia sẻ bởi tất cả các instance `ReferenceError`.

- {{jsxref("Object/constructor", "ReferenceError.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `ReferenceError`, giá trị khởi tạo là constructor {{jsxref("ReferenceError/ReferenceError", "ReferenceError")}}.
- {{jsxref("Error/name", "ReferenceError.prototype.name")}}
  - : Đại diện cho tên của loại lỗi. Đối với `ReferenceError.prototype.name`, giá trị khởi tạo là `"ReferenceError"`.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Error")}}_.

## Ví dụ

### Bắt một ReferenceError

```js
try {
  let a = undefinedVariable;
} catch (e) {
  console.log(e instanceof ReferenceError); // true
  console.log(e.message); // "undefinedVariable is not defined"
  console.log(e.name); // "ReferenceError"
  console.log(e.stack); // Stack of the error
}
```

### Tạo một ReferenceError

```js
try {
  throw new ReferenceError("Hello");
} catch (e) {
  console.log(e instanceof ReferenceError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "ReferenceError"
  console.log(e.stack); // Stack of the error
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
