---
title: String.prototype.trimStart()
short-title: trimStart()
slug: Web/JavaScript/Reference/Global_Objects/String/trimStart
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.trimStart
sidebar: jsref
---

Phương thức **`trimStart()`** của các giá trị {{jsxref("String")}} xóa khoảng trắng ở đầu chuỗi này và trả về một chuỗi mới, mà không sửa đổi chuỗi gốc. `trimLeft()` là bí danh của phương thức này.

{{InteractiveExample("JavaScript Demo: String.prototype.trimStart()")}}

```js interactive-example
const greeting = "   Hello world!   ";

console.log(greeting);
// Expected output: "   Hello world!   ";

console.log(greeting.trimStart());
// Expected output: "Hello world!   ";
```

## Cú pháp

```js-nolint
trimStart()

trimLeft()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi mới biểu diễn `str` đã được loại bỏ khoảng trắng ở đầu (phía bên trái). Khoảng trắng được định nghĩa là các ký tự [white space](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#white_space) cộng với các [ký tự kết thúc dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#line_terminators).

Nếu đầu của `str` không có khoảng trắng, vẫn sẽ trả về một chuỗi mới (về bản chất là bản sao của `str`).

### Đặt bí danh

Sau khi {{jsxref("String/trim", "trim()")}} được chuẩn hóa, các engine cũng đã triển khai phương thức không chuẩn `trimLeft`. Tuy nhiên, để nhất quán với {{jsxref("String/padStart", "padStart()")}}, khi phương thức được chuẩn hóa, tên của nó được chọn là `trimStart`. Vì lý do tương thích web, `trimLeft` vẫn là bí danh của `trimStart`, và chúng trỏ đến cùng một đối tượng hàm. Trong một số engine, điều này có nghĩa là:

```js
String.prototype.trimLeft.name === "trimStart";
```

## Ví dụ

### Sử dụng trimStart()

Ví dụ sau xóa khoảng trắng ở đầu của `str`, nhưng không xóa ở cuối.

```js
let str = "   foo  ";

console.log(str.length); // 8

str = str.trimStart();
console.log(str.length); // 5
console.log(str); // 'foo  '
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.trimStart` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.trimStart`](https://www.npmjs.com/package/string.prototype.trimstart)
- {{jsxref("String.prototype.trim()")}}
- {{jsxref("String.prototype.trimEnd()")}}
