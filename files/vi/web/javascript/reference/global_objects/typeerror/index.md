---
title: TypeError
slug: Web/JavaScript/Reference/Global_Objects/TypeError
page-type: javascript-class
browser-compat: javascript.builtins.TypeError
sidebar: jsref
---

Đối tượng **`TypeError`** biểu diễn một lỗi khi một thao tác không thể được thực hiện, thông thường (nhưng không phải lúc nào cũng vậy) khi một giá trị không thuộc kiểu dữ liệu mong đợi.

`TypeError` có thể được ném ra khi:

- một toán hạng hoặc đối số được truyền vào một hàm không tương thích với kiểu dữ liệu mà toán tử hoặc hàm đó yêu cầu; hoặc
- khi cố gắng thay đổi một giá trị không thể thay đổi; hoặc
- khi cố gắng sử dụng một giá trị theo cách không phù hợp.

`TypeError` là một {{Glossary("serializable object")}}, vì vậy nó có thể được nhân bản với {{DOMxRef("Window.structuredClone", "structuredClone()")}} hoặc sao chép giữa các [Worker](/en-US/docs/Web/API/Worker) bằng cách sử dụng {{domxref("Worker/postMessage()", "postMessage()")}}.

`TypeError` là lớp con của {{jsxref("Error")}}.

## Constructor

- {{jsxref("TypeError/TypeError", "TypeError()")}}
  - : Tạo một đối tượng `TypeError` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Error")}}_.

Các thuộc tính này được định nghĩa trên `TypeError.prototype` và được chia sẻ bởi tất cả các instance `TypeError`.

- {{jsxref("Object/constructor", "TypeError.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `TypeError`, giá trị khởi tạo là constructor {{jsxref("TypeError/TypeError", "TypeError")}}.
- {{jsxref("Error/name", "TypeError.prototype.name")}}
  - : Đại diện cho tên của loại lỗi. Đối với `TypeError.prototype.name`, giá trị khởi tạo là `"TypeError"`.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Error")}}_.

## Ví dụ

### Bắt một TypeError

```js
try {
  null.f();
} catch (e) {
  console.log(e instanceof TypeError); // true
  console.log(e.message); // "null has no properties"
  console.log(e.name); // "TypeError"
  console.log(e.stack); // Stack of the error
}
```

### Tạo một TypeError

```js
try {
  throw new TypeError("Hello");
} catch (e) {
  console.log(e instanceof TypeError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "TypeError"
  console.log(e.stack); // Stack of the error
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
