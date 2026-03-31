---
title: "Warning: unreachable code after return statement"
slug: Web/JavaScript/Reference/Errors/Stmt_after_return
page-type: javascript-error
sidebar: jssidebar
---

Cảnh báo JavaScript "unreachable code after return statement" xảy ra khi sử dụng một biểu thức sau câu lệnh {{jsxref("Statements/return", "return")}}, hoặc khi sử dụng câu lệnh return không có dấu chấm phẩy nhưng bao gồm một biểu thức ngay sau đó.

## Thông báo

```plain
Warning: unreachable code after return statement (Firefox)
```

## Loại lỗi

Cảnh báo

## Điều gì đã xảy ra?

Code không thể tiếp cận sau câu lệnh return có thể xảy ra trong các tình huống sau:

- Khi sử dụng một biểu thức sau câu lệnh {{jsxref("Statements/return", "return")}}, hoặc
- khi sử dụng câu lệnh return không có dấu chấm phẩy nhưng bao gồm một biểu thức ngay sau đó.

Khi một biểu thức tồn tại sau câu lệnh `return` hợp lệ, một cảnh báo được đưa ra để chỉ ra rằng code sau câu lệnh `return` không thể tiếp cận, nghĩa là nó không bao giờ có thể chạy.

Tại sao tôi phải có dấu chấm phẩy sau các câu lệnh `return`? Trong trường hợp các câu lệnh `return` không có dấu chấm phẩy, có thể không rõ ràng liệu nhà phát triển có ý định trả về câu lệnh trên dòng tiếp theo hay dừng thực thi và trả về. Cảnh báo chỉ ra rằng có sự mơ hồ trong cách viết câu lệnh `return`.

Các cảnh báo sẽ không hiển thị cho các câu lệnh return không có dấu chấm phẩy nếu các câu lệnh sau đây đi theo nó:

- {{jsxref("Statements/throw", "throw")}}
- {{jsxref("Statements/break", "break")}}
- {{jsxref("Statements/var", "var")}}
- {{jsxref("Statements/function", "function")}}

## Ví dụ

### Các trường hợp không hợp lệ

```js-nolint example-bad
function f() {
  let x = 3;
  x += 4;
  return x;   // return thoát hàm ngay lập tức
  x -= 3;     // vì vậy dòng này sẽ không bao giờ chạy; nó không thể tiếp cận
}

function g() {
  return     // điều này được xử lý như `return;`
    3 + 4;   // vì vậy hàm trả về, và dòng này không bao giờ được tiếp cận
}
```

### Các trường hợp hợp lệ

```js-nolint example-good
function f() {
  let x = 3;
  x += 4;
  x -= 3;
  return x; // OK: return sau tất cả các câu lệnh khác
}

function g() {
  return 3 + 4 // OK: return không có dấu chấm phẩy với biểu thức trên cùng dòng
}
```

## Xem thêm

- [Automatic semicolon insertion](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion)
