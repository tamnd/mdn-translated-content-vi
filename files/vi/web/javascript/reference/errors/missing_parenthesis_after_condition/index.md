---
title: "SyntaxError: missing ) after condition"
slug: Web/JavaScript/Reference/Errors/Missing_parenthesis_after_condition
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "missing ) after condition" xảy ra khi có lỗi trong cách viết điều kiện [`if`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else). Điều kiện phải xuất hiện trong dấu ngoặc đơn sau từ khóa `if`.

## Thông báo

```plain
SyntaxError: missing ) after condition (Firefox)
SyntaxError: Unexpected token '{'. Expected ')' to end an 'if' condition. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Có lỗi trong cách viết điều kiện [`if`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else). Trong bất kỳ ngôn ngữ lập trình nào, code cũng cần đưa ra quyết định và thực hiện các hành động tương ứng dựa trên các đầu vào khác nhau. Câu lệnh if thực thi một câu lệnh nếu điều kiện được chỉ định là truthy. Trong JavaScript, điều kiện này phải xuất hiện trong dấu ngoặc đơn sau từ khóa `if`, như sau:

```js
if (condition) {
  // làm gì đó nếu điều kiện đúng
}
```

## Ví dụ

### Thiếu dấu ngoặc đơn

Có thể chỉ là sơ ý, hãy kiểm tra cẩn thận tất cả các dấu ngoặc đơn trong code của bạn.

```js-nolint example-bad
if (Math.PI < 3 {
  console.log("wait what?");
}

// SyntaxError: missing ) after condition
```

Để sửa code này, bạn cần thêm một dấu ngoặc đơn đóng điều kiện.

```js example-good
if (Math.PI < 3) {
  console.log("wait what?");
}
```

### Sử dụng sai từ khóa `is`

Nếu bạn đến từ ngôn ngữ lập trình khác, cũng dễ thêm các từ khóa không có cùng nghĩa hoặc không có nghĩa gì trong JavaScript.

```js-nolint example-bad
if (done is true) {
 console.log("we are done!");
}

// SyntaxError: missing ) after condition
```

Thay vào đó bạn cần sử dụng [toán tử so sánh](/en-US/docs/Web/JavaScript/Reference/Operators) đúng. Ví dụ:

```js
if (done === true) {
  console.log("we are done!");
}
```

Hoặc tốt hơn:

```js example-good
if (done) {
  console.log("we are done!");
}
```

## Xem thêm

- [`if...else`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else)
- [Relational operators](/en-US/docs/Web/JavaScript/Reference/Operators#relational_operators)
- [Học: Đưa ra quyết định trong code — điều kiện](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals)
