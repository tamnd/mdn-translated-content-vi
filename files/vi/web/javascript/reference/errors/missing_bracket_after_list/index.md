---
title: "SyntaxError: missing ] after element list"
slug: Web/JavaScript/Reference/Errors/Missing_bracket_after_list
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "missing ] after element list" xảy ra khi có lỗi trong cú pháp khởi tạo mảng. Có thể thiếu dấu ngoặc vuông đóng (`]`) hoặc dấu phẩy (`,`).

## Thông báo

```plain
SyntaxError: missing ] after element list (Firefox)
SyntaxError: Unexpected token ';'. Expected either a closing ']' or a ',' following an array element. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}.

## Nguyên nhân?

Có lỗi trong cú pháp khởi tạo mảng ở đâu đó. Có thể thiếu dấu ngoặc vuông đóng (`]`) hoặc dấu phẩy (`,`).

## Ví dụ

### Khởi tạo mảng không đầy đủ

```js-nolint example-bad
const list = [1, 2,

const instruments = [
  "Ukulele",
  "Guitar",
  "Piano",
};

const data = [{ foo: "bar" } { bar: "foo" }];
```

Cách đúng là:

```js example-good
const list = [1, 2];

const instruments = ["Ukulele", "Guitar", "Piano"];

const data = [{ foo: "bar" }, { bar: "foo" }];
```

## Xem thêm

- {{jsxref("Array")}}
