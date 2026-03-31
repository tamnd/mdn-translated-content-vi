---
title: "SyntaxError: missing = in const declaration"
slug: Web/JavaScript/Reference/Errors/Missing_initializer_in_const
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "missing = in const declaration" xảy ra khi khai báo `const` không được gán giá trị trong cùng câu lệnh (ví dụ như `const RED_FLAG;`). Bạn cần cung cấp một giá trị (`const RED_FLAG = true`).

## Thông báo

```plain
SyntaxError: Missing initializer in const declaration (V8-based)
SyntaxError: missing = in const declaration (Firefox)
SyntaxError: Unexpected token ';'. const declared variable 'x' must have an initializer. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Hằng số là giá trị không thể thay đổi bởi chương trình trong quá trình thực thi bình thường. Nó không thể thay đổi thông qua gán lại và không thể khai báo lại. Trong JavaScript, hằng số được khai báo bằng từ khóa [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const). Một giá trị khởi tạo cho hằng số là bắt buộc; tức là bạn phải chỉ định giá trị của nó trong cùng câu lệnh khi khai báo (điều này hợp lý vì nó không thể thay đổi sau đó).

## Ví dụ

### Thiếu giá trị khởi tạo cho const

Không giống như `var` hoặc `let`, bạn phải chỉ định giá trị cho khai báo `const`. Điều này sẽ ném ra lỗi:

```js-nolint example-bad
const COLUMNS;
// SyntaxError: missing = in const declaration
```

### Khắc phục lỗi

Có nhiều cách để khắc phục lỗi này. Hãy kiểm tra xem hằng số đó dự định được dùng như thế nào.

#### Thêm giá trị hằng số

Chỉ định giá trị hằng số trong cùng câu lệnh khi khai báo:

```js example-good
const COLUMNS = 80;
```

#### `const`, `let` hay `var`?

Không dùng `const` nếu bạn không có ý định khai báo một hằng số. Có thể bạn muốn khai báo một biến có phạm vi block với [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) hoặc biến toàn cục với [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var). Cả hai đều không yêu cầu giá trị khởi tạo.

```js example-good
let columns;
```

## Xem thêm

- [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const)
- [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let)
- [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var)
