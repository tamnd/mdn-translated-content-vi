---
title: "SyntaxError: identifier starts immediately after numeric literal"
slug: Web/JavaScript/Reference/Errors/Identifier_after_number
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "identifier starts immediately after numeric literal" xảy ra khi một định danh bắt đầu bằng một chữ số. Định danh chỉ có thể bắt đầu bằng chữ cái, dấu gạch dưới (\_), hoặc ký hiệu đô la ($).

## Thông báo

```plain
SyntaxError: Invalid or unexpected token (V8-based)
SyntaxError: identifier starts immediately after numeric literal (Firefox)
SyntaxError: No identifiers allowed directly after numeric literal (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Tên của các biến, được gọi là [định danh](/en-US/docs/Glossary/Identifier), tuân theo các quy tắc nhất định mà mã của bạn phải tuân theo!

Một định danh JavaScript phải bắt đầu bằng chữ cái, dấu gạch dưới (\_), hoặc ký hiệu đô la ($). Chúng không thể bắt đầu bằng chữ số! Chỉ các ký tự tiếp theo mới có thể là chữ số (0-9).

## Ví dụ

### Tên biến bắt đầu bằng ký tự số

Tên biến không thể bắt đầu bằng số trong JavaScript. Những ví dụ sau đây sẽ thất bại:

```js-nolint example-bad
const 1life = "foo";
// SyntaxError: identifier starts immediately after numeric literal

const foo = 1life;
// SyntaxError: identifier starts immediately after numeric literal
```

Bạn cần đổi tên biến để tránh số đứng đầu.

```js example-good
const life1 = "foo";
const foo = life1;
```

Trong JavaScript, có một đặc điểm cú pháp khi gọi thuộc tính hoặc phương thức trên số. Nếu bạn muốn gọi một phương thức trên số nguyên, bạn không thể dùng dấu chấm ngay sau số vì dấu chấm sẽ được hiểu là phần đầu của phần thập phân, khiến trình phân tích cú pháp thấy tên phương thức như một định danh ngay sau ký tự số. Để tránh điều này, bạn cần bọc số trong dấu ngoặc đơn hoặc sử dụng dấu chấm kép, trong đó dấu chấm đầu tiên là dấu chấm thập phân cho ký tự số và dấu chấm thứ hai là bộ truy cập thuộc tính.

```js-nolint example-bad
alert(typeof 1.toString())
// SyntaxError: identifier starts immediately after numeric literal
```

Các cách đúng để gọi phương thức trên số:

```js-nolint example-good
// Bọc số trong dấu ngoặc đơn
alert(typeof (1).toString());

// Thêm một dấu chấm nữa cho ký tự số
alert(typeof 2..toString());

// Sử dụng dấu ngoặc vuông
alert(typeof 3["toString"]());
```

## Xem thêm

- [Ngữ pháp từ vựng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar)
- [Ngữ pháp và kiểu dữ liệu](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types) hướng dẫn
