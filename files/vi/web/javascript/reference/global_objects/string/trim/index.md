---
title: String.prototype.trim()
short-title: trim()
slug: Web/JavaScript/Reference/Global_Objects/String/trim
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.trim
sidebar: jsref
---

Phương thức **`trim()`** của các giá trị {{jsxref("String")}} xóa khoảng trắng ở cả hai đầu của chuỗi này và trả về một chuỗi mới, mà không sửa đổi chuỗi gốc.

Để trả về một chuỗi mới với khoảng trắng chỉ được xóa ở một đầu, hãy sử dụng {{jsxref("String/trimStart", "trimStart()")}} hoặc {{jsxref("String/trimEnd", "trimEnd()")}}.

{{InteractiveExample("JavaScript Demo: String.prototype.trim()")}}

```js interactive-example
const greeting = "   Hello world!   ";

console.log(greeting);
// Expected output: "   Hello world!   ";

console.log(greeting.trim());
// Expected output: "Hello world!";
```

## Cú pháp

```js-nolint
trim()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi mới biểu diễn `str` đã được loại bỏ khoảng trắng ở cả đầu và cuối. Khoảng trắng được định nghĩa là các ký tự [white space](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#white_space) cộng với các [ký tự kết thúc dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#line_terminators).

Nếu cả đầu và cuối của `str` đều không có khoảng trắng, vẫn sẽ trả về một chuỗi mới (về bản chất là bản sao của `str`).

## Ví dụ

### Sử dụng trim()

Ví dụ sau xóa khoảng trắng ở cả hai đầu của `str`.

```js
const str = "   foo  ";
console.log(str.trim()); // 'foo'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.trimStart()")}}
- {{jsxref("String.prototype.trimEnd()")}}
