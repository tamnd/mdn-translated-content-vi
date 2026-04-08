---
title: SyntaxError
slug: Web/JavaScript/Reference/Global_Objects/SyntaxError
page-type: javascript-class
browser-compat: javascript.builtins.SyntaxError
sidebar: jsref
---

Đối tượng **`SyntaxError`** biểu diễn một lỗi khi cố gắng diễn giải code không đúng cú pháp. Nó được ném ra khi JavaScript engine gặp các token hoặc thứ tự token không phù hợp với cú pháp của ngôn ngữ khi phân tích code.

`SyntaxError` là một {{Glossary("serializable object")}}, vì vậy nó có thể được nhân bản với {{DOMxRef("Window.structuredClone", "structuredClone()")}} hoặc sao chép giữa các [Worker](/en-US/docs/Web/API/Worker) bằng cách sử dụng {{domxref("Worker/postMessage()", "postMessage()")}}.

`SyntaxError` là lớp con của {{jsxref("Error")}}.

## Constructor

- {{jsxref("SyntaxError/SyntaxError", "SyntaxError()")}}
  - : Tạo một đối tượng `SyntaxError` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Error")}}_.

Các thuộc tính này được định nghĩa trên `SyntaxError.prototype` và được chia sẻ bởi tất cả các instance `SyntaxError`.

- {{jsxref("Object/constructor", "SyntaxError.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `SyntaxError`, giá trị khởi tạo là constructor {{jsxref("SyntaxError/SyntaxError", "SyntaxError")}}.
- {{jsxref("Error/name", "SyntaxError.prototype.name")}}
  - : Đại diện cho tên của loại lỗi. Đối với `SyntaxError.prototype.name`, giá trị khởi tạo là `"SyntaxError"`.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Error")}}_.

## Ví dụ

### Bắt một SyntaxError

```js
try {
  eval("hoo bar");
} catch (e) {
  console.log(e instanceof SyntaxError); // true
  console.log(e.message);
  console.log(e.name); // "SyntaxError"
  console.log(e.stack); // Stack of the error
}
```

### Tạo một SyntaxError

```js
try {
  throw new SyntaxError("Hello");
} catch (e) {
  console.log(e instanceof SyntaxError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "SyntaxError"
  console.log(e.stack); // Stack of the error
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
