---
title: "SyntaxError: illegal character"
slug: Web/JavaScript/Reference/Errors/Illegal_character
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "illegal character" xảy ra khi [bộ phân tích từ vựng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar) đọc một ký tự không phải là một phần của chuỗi ký tự, và ký tự đó không thể tạo thành token hợp lệ trong ngôn ngữ.

## Thông báo

```plain
SyntaxError: Invalid or unexpected token (V8-based)
SyntaxError: illegal character U+201C (Firefox)
SyntaxError: Invalid character '\u201c' (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Có một ký tự không hợp lệ mà trình thông dịch không hiểu. Bạn nên đặt nó trong một chuỗi ký tự hoặc thay thế nó bằng ký tự khác. Hãy sử dụng trình soạn thảo có hỗ trợ tô sáng cú pháp và kiểm tra kỹ mã của bạn so với các ký tự không khớp như dấu trừ (`-`) so với gạch ngang (`–`) hoặc dấu ngoặc kép đơn giản (`"`) so với dấu ngoặc kép không chuẩn (`"`).

## Ví dụ

### Ký tự không khớp

Một số ký tự trông giống nhau nhưng sẽ khiến trình phân tích cú pháp không thể diễn giải mã của bạn. Các ví dụ nổi tiếng về điều này là dấu ngoặc kép, dấu trừ hoặc dấu chấm phẩy ([dấu hỏi tiếng Hy Lạp (U+37e)](https://en.wikipedia.org/wiki/Question_mark#Greek_question_mark) trông giống nhau).

```js-nolint example-bad
"This looks like a string"; // SyntaxError: illegal character
// " and " are not " but look like it

42 – 13; // SyntaxError: illegal character
// – (en-dash) is not - but looks like it

const foo = "bar"; // SyntaxError: illegal character
// <37e> is not ; but looks like it
```

Đây mới là cú pháp đúng:

```js example-good
"This is actually a string";
42 - 13;
const foo = "bar";
```

Một số trình soạn thảo và IDE sẽ thông báo cho bạn hoặc ít nhất sử dụng tô sáng hơi khác cho nó, nhưng không phải tất cả. Khi điều này xảy ra với mã của bạn và bạn không thể tìm thấy nguồn gốc của vấn đề, thường tốt nhất là xóa dòng có vấn đề và gõ lại.

### Ký tự bị thiếu

Thật dễ quên một ký tự ở đây hay đó.

```js-nolint example-bad
const operators = ["+", "-", ×", "÷"];
// SyntaxError: illegal character U+00D7
```

Thêm dấu ngoặc kép còn thiếu cho `"×"`.

```js example-good
const operators = ["+", "-", "×", "÷"];
```

### Ký tự ẩn

Khi sao chép và dán mã từ các nguồn bên ngoài, có thể có các ký tự không hợp lệ. Hãy cẩn thận!

```js-nolint example-bad
const foo = "bar";​
// SyntaxError: illegal character
```

Khi kiểm tra mã này trong trình soạn thảo như VIM, bạn có thể thấy rằng thực sự có một ký tự [zero-width space (ZWSP) (U+200B)](https://en.wikipedia.org/wiki/Zero-width_space).

```js-nolint
const foo = "bar";<200b>
```

## Xem thêm

- [Ngữ pháp từ vựng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar)
