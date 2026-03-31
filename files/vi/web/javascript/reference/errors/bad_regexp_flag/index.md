---
title: 'SyntaxError: invalid regular expression flag "x"'
slug: Web/JavaScript/Reference/Errors/Bad_regexp_flag
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid regular expression flag" xảy ra khi các cờ trong một biểu thức chính quy chứa bất kỳ cờ nào không phải một trong: `d`, `g`, `i`, `m`, `s`, `u`, `v`, hoặc `y`. Nó cũng có thể được phát sinh nếu biểu thức chứa nhiều hơn một lần một cờ hợp lệ, hoặc khi các cờ [`u`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode) và [`v`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets) được sử dụng cùng nhau.

## Thông báo

```plain
SyntaxError: Invalid flags supplied to RegExp constructor 'x' (V8-based)
SyntaxError: Invalid regular expression flags (V8-based)
SyntaxError: invalid regular expression flag x (Firefox)
SyntaxError: Invalid flags supplied to RegExp constructor. (Safari)
SyntaxError: Invalid regular expression: invalid flags (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Biểu thức chính quy chứa các cờ không hợp lệ, hoặc các cờ hợp lệ đã được sử dụng nhiều hơn một lần trong biểu thức.

Các cờ hợp lệ (được phép) là `d`, `g`, `i`, `m`, `s`, `u`, `v`, và `y`. Chúng được giới thiệu chi tiết hơn trong [Regular expressions > Advanced searching with flags](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags).

Các cờ [`u`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode) và [`v`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets) loại trừ lẫn nhau, vì vậy chúng không thể được sử dụng cùng nhau. Bạn có thể đọc các tài liệu tham khảo để hiểu sự khác biệt về hành vi của chúng.

## Ví dụ

Trong một regular expression literal, bao gồm một mẫu được đặt giữa các dấu gạch chéo, các cờ được định nghĩa sau dấu gạch chéo thứ hai.
Các cờ biểu thức chính quy có thể được sử dụng riêng lẻ hoặc cùng nhau theo bất kỳ thứ tự nào.
Cú pháp này cho thấy cách khai báo các cờ bằng cách sử dụng regular expression literal:

```js
const re = /pattern/flags;
```

Chúng cũng có thể được định nghĩa trong hàm constructor của đối tượng {{jsxref("RegExp")}} (tham số thứ hai):

```js
const re = new RegExp("pattern", "flags");
```

Dưới đây là ví dụ chỉ sử dụng các cờ đúng.

```js example-good
/foo/g;
/foo/gims;
/foo/uy;
```

Dưới đây là ví dụ sử dụng một số cờ không hợp lệ `b`, `a` và `r`:

```js example-bad
/foo/bar;

// SyntaxError: invalid regular expression flag "b"
```

Đoạn code dưới đây không đúng, vì `W`, `e` và `b` không phải là cờ hợp lệ.

```js example-bad
const obj = {
  url: /docs/Web,
};

// SyntaxError: invalid regular expression flag "W"
```

Biểu thức chứa hai dấu gạch chéo được hiểu là một regular expression literal.
Rất có thể ý định là tạo một chuỗi ký tự, sử dụng dấu nháy đơn hoặc kép như dưới đây:

```js example-good
const obj = {
  url: "/docs/Web",
};
```

## Xem thêm

- [Regular expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) guide
