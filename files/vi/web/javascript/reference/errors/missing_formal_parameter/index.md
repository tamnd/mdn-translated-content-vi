---
title: "SyntaxError: missing formal parameter"
slug: Web/JavaScript/Reference/Errors/Missing_formal_parameter
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "missing formal parameter" xảy ra khi khai báo hàm thiếu tham số hợp lệ.

## Thông báo

```plain
SyntaxError: missing formal parameter (Firefox)
SyntaxError: Unexpected number '3'. Expected a parameter pattern or a ')' in parameter list. (Safari)
SyntaxError: Unexpected string literal "x". Expected a parameter pattern or a ')' in parameter list. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

"Formal parameter" (tham số hình thức) là cách nói khác của "tham số hàm". Khai báo hàm của bạn thiếu tham số hợp lệ. Trong khai báo hàm, các tham số phải là [identifier](/en-US/docs/Glossary/Identifier), không phải bất kỳ giá trị nào như số, chuỗi hoặc đối tượng. Khai báo hàm và gọi hàm là hai bước riêng biệt. Khai báo yêu cầu identifier làm tham số, và chỉ khi gọi (invoke) hàm, bạn mới cung cấp các giá trị mà hàm sẽ sử dụng.

Trong [JavaScript](/en-US/docs/Glossary/JavaScript), identifier chỉ có thể chứa các ký tự chữ và số (hoặc "$" hoặc "\_"), và không được bắt đầu bằng một chữ số. Một identifier khác với một **chuỗi** ở chỗ chuỗi là dữ liệu, còn identifier là một phần của code.

## Ví dụ

### Cung cấp tham số hàm đúng

Tham số hàm phải là identifier khi thiết lập hàm. Tất cả các khai báo hàm này đều thất bại vì chúng cung cấp giá trị cho tham số:

```js-nolint example-bad
function square(3) {
  return number * number;
}
// SyntaxError: missing formal parameter

function greet("Howdy") {
  return greeting;
}
// SyntaxError: missing formal parameter

function log({ obj: "value"}) {
  console.log(arg)
}
// SyntaxError: missing formal parameter
```

Bạn cần sử dụng identifier trong khai báo hàm:

```js example-good
function square(number) {
  return number * number;
}

function greet(greeting) {
  return greeting;
}

function log(arg) {
  console.log(arg);
}
```

Sau đó bạn có thể gọi các hàm này với các đối số tùy ý:

```js
square(2); // 4

greet("Howdy"); // "Howdy"

log({ obj: "value" }); // { obj: "value" }
```

## Xem thêm

- [SyntaxError: redeclaration of formal parameter "x"](/en-US/docs/Web/JavaScript/Reference/Errors/Redeclared_parameter)
