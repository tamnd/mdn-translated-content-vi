---
title: URIError
slug: Web/JavaScript/Reference/Global_Objects/URIError
page-type: javascript-class
browser-compat: javascript.builtins.URIError
sidebar: jsref
---

Đối tượng **`URIError`** biểu diễn một lỗi khi một hàm xử lý URI toàn cục được sử dụng theo cách sai.

`URIError` là một {{Glossary("serializable object")}}, vì vậy nó có thể được nhân bản với {{DOMxRef("Window.structuredClone", "structuredClone()")}} hoặc sao chép giữa các [Worker](/en-US/docs/Web/API/Worker) bằng cách sử dụng {{domxref("Worker/postMessage()", "postMessage()")}}.

`URIError` là lớp con của {{jsxref("Error")}}.

## Constructor

- {{jsxref("URIError/URIError", "URIError()")}}
  - : Tạo một đối tượng `URIError` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Error")}}_.

Các thuộc tính này được định nghĩa trên `URIError.prototype` và được chia sẻ bởi tất cả các instance `URIError`.

- {{jsxref("Object/constructor", "URIError.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `URIError`, giá trị khởi tạo là constructor {{jsxref("URIError/URIError", "URIError")}}.
- {{jsxref("Error/name", "URIError.prototype.name")}}
  - : Đại diện cho tên của loại lỗi. Đối với `URIError.prototype.name`, giá trị khởi tạo là `"URIError"`.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Error")}}_.

## Ví dụ

### Bắt một URIError

```js
try {
  decodeURIComponent("%");
} catch (e) {
  console.log(e instanceof URIError); // true
  console.log(e.message); // "malformed URI sequence"
  console.log(e.name); // "URIError"
  console.log(e.stack); // Stack of the error
}
```

### Tạo một URIError

```js
try {
  throw new URIError("Hello");
} catch (e) {
  console.log(e instanceof URIError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "URIError"
  console.log(e.stack); // Stack of the error
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
- {{jsxref("decodeURI()")}}
- {{jsxref("decodeURIComponent()")}}
- {{jsxref("encodeURI()")}}
- {{jsxref("encodeURIComponent()")}}
