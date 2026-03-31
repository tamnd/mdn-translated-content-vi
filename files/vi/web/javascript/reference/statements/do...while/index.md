---
title: do...while
slug: Web/JavaScript/Reference/Statements/do...while
page-type: javascript-statement
browser-compat: javascript.statements.do_while
sidebar: jssidebar
---

Câu lệnh **`do...while`** tạo ra một vòng lặp thực thi một câu lệnh được chỉ định miễn là điều kiện kiểm tra còn được đánh giá là true. Điều kiện được đánh giá sau khi thực thi câu lệnh, dẫn đến câu lệnh được chỉ định được thực thi ít nhất một lần.

{{InteractiveExample("JavaScript Demo: do...while statement")}}

```js interactive-example
let result = "";
let i = 0;

do {
  i += 1;
  result += i;
} while (i < 5);

console.log(result);
// Expected output: "12345"
```

## Cú pháp

```js-nolint
do
  statement
while (condition);
```

- `statement`
  - : Một câu lệnh được thực thi ít nhất một lần và được thực thi lại miễn là điều kiện còn được đánh giá là true. Bạn có thể sử dụng [câu lệnh khối](/en-US/docs/Web/JavaScript/Reference/Statements/block) để thực thi nhiều câu lệnh.
- `condition`
  - : Một biểu thức được đánh giá _sau_ mỗi lần lặp qua vòng lặp. Nếu điều kiện này [được đánh giá là true](/en-US/docs/Glossary/Truthy), `statement` sẽ được thực thi lại. Khi điều kiện [được đánh giá là false](/en-US/docs/Glossary/Falsy), việc thực thi tiếp tục với câu lệnh sau vòng lặp `do...while`.

## Mô tả

Giống như các câu lệnh lặp khác, bạn có thể sử dụng [câu lệnh điều khiển luồng](/en-US/docs/Web/JavaScript/Reference/Statements#control_flow) bên trong `statement`:

- {{jsxref("Statements/break", "break")}} dừng việc thực thi `statement` và chuyển đến câu lệnh đầu tiên sau vòng lặp.
- {{jsxref("Statements/continue", "continue")}} dừng việc thực thi `statement` và đánh giá lại `condition`.

Cú pháp câu lệnh `do...while` yêu cầu dấu chấm phẩy ở cuối, nhưng quá trình [chèn dấu chấm phẩy tự động](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion) có thể chèn một dấu cho bạn nếu việc thiếu dấu chấm phẩy dẫn đến cú pháp không hợp lệ.

## Ví dụ

### Sử dụng do...while

Trong ví dụ sau, vòng lặp `do...while` lặp ít nhất một lần và lặp lại cho đến khi `i` không còn nhỏ hơn 5 nữa.

```js
let result = "";
let i = 0;
do {
  i += 1;
  result += `${i} `;
} while (i > 0 && i < 5);
// Despite i === 0 this will still loop as it starts off without the test

console.log(result);
```

### Sử dụng false làm điều kiện do...while

Vì câu lệnh luôn được thực thi một lần, `do...while (false)` tương đương với việc thực thi bản thân câu lệnh đó. Đây là một thành ngữ phổ biến trong các ngôn ngữ kiểu C, cho phép bạn sử dụng `break` để thoát ra khỏi logic phân nhánh sớm.

```js
do {
  if (!user.loggedIn) {
    console.log("You are not logged in");
    break;
  }
  const friends = user.getFriends();
  if (!friends.length) {
    console.log("No friends found");
    break;
  }
  for (const friend of friends) {
    handleFriend(friend);
  }
} while (false);
// The rest of code
```

Trong JavaScript, có một số phương án thay thế, chẳng hạn như sử dụng [câu lệnh khối có nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label) với `break`:

```js
handleFriends: {
  if (!user.loggedIn) {
    console.log("You are not logged in");
    break handleFriends;
  }
  const friends = user.getFriends();
  if (!friends.length) {
    console.log("No friends found");
    break handleFriends;
  }
  for (const friend of friends) {
    handleFriend(friend);
  }
}
```

Hoặc sử dụng một hàm:

```js
function handleFriends() {
  if (!user.loggedIn) {
    console.log("You are not logged in");
    return;
  }
  const friends = user.getFriends();
  if (!friends.length) {
    console.log("No friends found");
    return;
  }
  for (const friend of friends) {
    handleFriend(friend);
  }
}
```

### Sử dụng phép gán làm điều kiện

Trong một số trường hợp, việc sử dụng phép gán làm điều kiện có thể hợp lý, chẳng hạn như:

```js
do {
  // …
} while ((match = regexp.exec(str)));
```

Nhưng khi bạn làm vậy, có những sự đánh đổi về khả năng đọc. Tài liệu [`while`](/en-US/docs/Web/JavaScript/Reference/Statements/while) có phần [Sử dụng phép gán làm điều kiện](/en-US/docs/Web/JavaScript/Reference/Statements/while#using_an_assignment_as_a_condition) với các khuyến nghị của chúng tôi.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/while", "while")}}
- {{jsxref("Statements/for", "for")}}
- {{jsxref("Statements/break", "break")}}
- {{jsxref("Statements/continue", "continue")}}
