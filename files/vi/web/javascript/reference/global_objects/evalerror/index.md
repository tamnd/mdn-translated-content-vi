---
title: EvalError
slug: Web/JavaScript/Reference/Global_Objects/EvalError
page-type: javascript-class
browser-compat: javascript.builtins.EvalError
sidebar: jsref
---

Đối tượng **`EvalError`** chỉ ra một lỗi liên quan đến hàm toàn cục {{jsxref("Global_Objects/eval", "eval()")}}. Ngoại lệ này không còn được JavaScript ném ra nữa, tuy nhiên đối tượng `EvalError` vẫn được giữ lại để tương thích.

`EvalError` là một {{Glossary("serializable object")}}, vì vậy nó có thể được nhân bản với {{DOMxRef("Window.structuredClone", "structuredClone()")}} hoặc sao chép giữa các [Worker](/en-US/docs/Web/API/Worker) bằng cách sử dụng {{domxref("Worker/postMessage()", "postMessage()")}}.

`EvalError` là lớp con của {{jsxref("Error")}}.

## Constructor

- {{jsxref("EvalError/EvalError", "EvalError()")}}
  - : Tạo một đối tượng `EvalError` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Error")}}_.

Các thuộc tính này được định nghĩa trên `EvalError.prototype` và được chia sẻ bởi tất cả các instance `EvalError`.

- {{jsxref("Object/constructor", "EvalError.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `EvalError`, giá trị khởi tạo là constructor {{jsxref("EvalError/EvalError", "EvalError")}}.
- {{jsxref("Error/name", "EvalError.prototype.name")}}
  - : Đại diện cho tên của loại lỗi. Đối với `EvalError.prototype.name`, giá trị khởi tạo là `"EvalError"`.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Error")}}_.

## Ví dụ

### Tạo một EvalError

```js
try {
  throw new EvalError("Hello");
} catch (e) {
  console.log(e instanceof EvalError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "EvalError"
  console.log(e.stack); // Stack of the error
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
- {{jsxref("Global_Objects/eval", "eval()")}}
