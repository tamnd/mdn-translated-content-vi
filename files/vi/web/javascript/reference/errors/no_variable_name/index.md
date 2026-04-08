---
title: "SyntaxError: missing variable name"
slug: Web/JavaScript/Reference/Errors/No_variable_name
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "missing variable name" là một lỗi phổ biến. Thường do bỏ quên tên biến hoặc lỗi đánh máy.

## Thông báo

```plain
SyntaxError: missing variable name (Firefox)
SyntaxError: Unexpected token '='. Expected a parameter pattern or a ')' in parameter list. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Một biến thiếu tên. Nguyên nhân có thể là lỗi đánh máy hoặc quên tên biến. Hãy đảm bảo rằng bạn đã cung cấp tên biến trước dấu `=`.

Khi khai báo nhiều biến cùng lúc, hãy đảm bảo rằng các dòng/khai báo trước đó không kết thúc bằng dấu phẩy thay vì dấu chấm phẩy.

## Ví dụ

### Thiếu tên biến

```js-nolint example-bad
const = "foo";
```

Rất dễ quên gán tên cho biến!

```js example-good
const description = "foo";
```

### Từ khóa dành riêng không thể là tên biến

Có một số tên biến là [từ khóa dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#keywords). Bạn không thể sử dụng chúng. Rất tiếc :(

```js-nolint example-bad
const debugger = "whoop";
// SyntaxError: missing variable name
```

### Khai báo nhiều biến

Chú ý đặc biệt đến dấu phẩy khi khai báo nhiều biến. Có dấu phẩy thừa không, hoặc bạn đã dùng dấu phẩy thay vì dấu chấm phẩy không? Bạn có nhớ gán giá trị cho tất cả các biến `const` không?

```js-nolint example-bad
let x, y = "foo",
const z, = "foo"

const first = document.getElementById("one"),
const second = document.getElementById("two"),

// SyntaxError: missing variable name
```

Phiên bản đã sửa:

```js example-good
let x,
  y = "foo";
const z = "foo";

const first = document.getElementById("one");
const second = document.getElementById("two");
```

### Mảng

Các literal {{jsxref("Array")}} trong JavaScript cần có dấu ngoặc vuông bao quanh các giá trị. Điều này sẽ không hoạt động:

```js-nolint example-bad
const arr = 1,2,3,4,5;
// SyntaxError: missing variable name
```

Cách đúng là:

```js example-good
const arr = [1, 2, 3, 4, 5];
```

## Xem thêm

- [Lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar)
- {{jsxref("Statements/var", "var")}}
- [Hướng dẫn Grammar and types](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types)
