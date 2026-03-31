---
title: Error.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Error/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Error.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("Error")}} trả về một chuỗi biểu diễn lỗi này.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi biểu diễn đối tượng {{jsxref("Error")}} được chỉ định.

## Mô tả

Đối tượng {{jsxref("Error")}} ghi đè phương thức {{jsxref("Object.prototype.toString()")}}
được kế thừa bởi tất cả các đối tượng. Ngữ nghĩa của nó như sau:

```js
Error.prototype.toString = function () {
  if (
    this === null ||
    (typeof this !== "object" && typeof this !== "function")
  ) {
    throw new TypeError();
  }
  let name = this.name;
  name = name === undefined ? "Error" : `${name}`;
  let msg = this.message;
  msg = msg === undefined ? "" : `${msg}`;
  if (name === "") {
    return msg;
  }
  if (msg === "") {
    return name;
  }
  return `${name}: ${msg}`;
};
```

## Ví dụ

### Sử dụng toString()

```js
const e1 = new Error("fatal error");
console.log(e1.toString()); // "Error: fatal error"

const e2 = new Error("fatal error");
e2.name = undefined;
console.log(e2.toString()); // "Error: fatal error"

const e3 = new Error("fatal error");
e3.name = "";
console.log(e3.toString()); // "fatal error"

const e4 = new Error("fatal error");
e4.name = "";
e4.message = undefined;
console.log(e4.toString()); // ""

const e5 = new Error("fatal error");
e5.name = "hello";
e5.message = undefined;
console.log(e5.toString()); // "hello"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Error.prototype.toString` với nhiều bản sửa lỗi trong `core-js`](https://github.com/zloirock/core-js#ecmascript-error)
