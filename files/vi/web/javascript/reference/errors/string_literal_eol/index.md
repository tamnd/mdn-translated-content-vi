---
title: "SyntaxError: string literal contains an unescaped line break"
slug: Web/JavaScript/Reference/Errors/String_literal_EOL
page-type: javascript-error
sidebar: jssidebar
---

Lỗi JavaScript "string literal contains an unescaped line break" xảy ra khi có một [chuỗi ký tự](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#string_literals) chưa kết thúc ở đâu đó. Chuỗi ký tự phải được bao bọc bởi dấu nháy đơn (`'`) hoặc dấu nháy kép (`"`) và không thể trải dài trên nhiều dòng.

## Thông báo

```plain
SyntaxError: Invalid or unexpected token (V8-based)
SyntaxError: '' string literal contains an unescaped line break (Firefox)
SyntaxError: Unexpected EOF (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Có một [chuỗi ký tự](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#string_literals) chưa kết thúc ở đâu đó. Chuỗi ký tự phải được bao bọc bởi dấu nháy đơn (`'`) hoặc dấu nháy kép (`"`). JavaScript không phân biệt giữa chuỗi dấu nháy đơn và chuỗi dấu nháy kép. [Chuỗi thoát](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences) hoạt động trong các chuỗi được tạo bằng dấu nháy đơn hoặc dấu nháy kép. Để sửa lỗi này, hãy kiểm tra:

- bạn có dấu nháy mở và đóng (dấu nháy đơn hoặc kép) cho chuỗi ký tự của mình,
- bạn đã thoát chuỗi ký tự đúng cách,
- chuỗi ký tự của bạn không trải dài trên nhiều dòng.

## Ví dụ

### Nhiều dòng

Bạn không thể chia một chuỗi trên nhiều dòng như thế này trong JavaScript:

```js-nolint example-bad
const longString = "This is a very long string which needs
                    to wrap across multiple lines because
                    otherwise my code is unreadable.";
// SyntaxError: unterminated string literal
```

Thay vào đó, hãy sử dụng [toán tử +](/en-US/docs/Web/JavaScript/Reference/Operators/Addition), dấu gạch chéo ngược, hoặc [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals). Biến thể sử dụng toán tử `+` trông như sau:

```js example-good
const longString =
  "This is a very long string which needs " +
  "to wrap across multiple lines because " +
  "otherwise my code is unreadable.";
```

Hoặc bạn có thể sử dụng ký tự gạch chéo ngược ("\\") ở cuối mỗi dòng để chỉ ra rằng chuỗi sẽ tiếp tục trên dòng tiếp theo. Hãy đảm bảo không có khoảng trắng hoặc bất kỳ ký tự nào khác sau dấu gạch chéo ngược (ngoại trừ ngắt dòng), hoặc như là khoảng thụt; nếu không nó sẽ không hoạt động. Dạng đó trông như sau:

```js example-good
const longString =
  "This is a very long string which needs \
to wrap across multiple lines because \
otherwise my code is unreadable.";
```

Một khả năng khác là sử dụng [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals).

```js example-good
const longString = `This is a very long string which needs
to wrap across multiple lines because
otherwise my code is unreadable.`;
```

## Xem thêm

- [chuỗi ký tự](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#string_literals)
- [Template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals)
