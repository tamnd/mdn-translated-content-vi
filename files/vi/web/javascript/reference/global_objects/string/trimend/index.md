---
title: String.prototype.trimEnd()
short-title: trimEnd()
slug: Web/JavaScript/Reference/Global_Objects/String/trimEnd
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.trimEnd
sidebar: jsref
---

Phương thức **`trimEnd()`** của các giá trị {{jsxref("String")}} xóa khoảng trắng ở cuối chuỗi này và trả về một chuỗi mới, mà không sửa đổi chuỗi gốc. `trimRight()` là bí danh của phương thức này.

{{InteractiveExample("JavaScript Demo: String.prototype.trimEnd()")}}

```js interactive-example
const greeting = "   Hello world!   ";

console.log(greeting);
// Expected output: "   Hello world!   ";

console.log(greeting.trimEnd());
// Expected output: "   Hello world!";
```

## Cú pháp

```js-nolint
trimEnd()

trimRight()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi mới biểu diễn `str` đã được loại bỏ khoảng trắng ở cuối (phía bên phải). Khoảng trắng được định nghĩa là các ký tự [white space](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#white_space) cộng với các [ký tự kết thúc dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#line_terminators).

Nếu cuối của `str` không có khoảng trắng, vẫn sẽ trả về một chuỗi mới (về bản chất là bản sao của `str`).

### Đặt bí danh

Sau khi {{jsxref("String/trim", "trim()")}} được chuẩn hóa, các engine cũng đã triển khai phương thức không chuẩn `trimRight`. Tuy nhiên, để nhất quán với {{jsxref("String/padEnd", "padEnd()")}}, khi phương thức được chuẩn hóa, tên của nó được chọn là `trimEnd`. Vì lý do tương thích web, `trimRight` vẫn là bí danh của `trimEnd`, và chúng trỏ đến cùng một đối tượng hàm. Trong một số engine, điều này có nghĩa là:

```js
String.prototype.trimRight.name === "trimEnd";
```

## Ví dụ

### Sử dụng trimEnd()

Ví dụ sau xóa khoảng trắng ở cuối của `str`, nhưng không xóa ở đầu.

```js
let str = "   foo  ";

console.log(str.length); // 8

str = str.trimEnd();
console.log(str.length); // 6
console.log(str); // '   foo'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.trimEnd` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.trimEnd`](https://www.npmjs.com/package/string.prototype.trimend)
- {{jsxref("String.prototype.trim()")}}
- {{jsxref("String.prototype.trimStart()")}}
