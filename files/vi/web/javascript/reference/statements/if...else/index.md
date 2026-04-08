---
title: if...else
slug: Web/JavaScript/Reference/Statements/if...else
page-type: javascript-statement
browser-compat: javascript.statements.if_else
sidebar: jssidebar
---

Câu lệnh **`if...else`** thực thi một câu lệnh nếu điều kiện được chỉ định là {{Glossary("truthy")}}. Nếu điều kiện là {{Glossary("falsy")}}, câu lệnh khác trong mệnh đề `else` tùy chọn sẽ được thực thi.

{{InteractiveExample("JavaScript Demo: if...else statement")}}

```js interactive-example
function testNum(a) {
  let result;
  if (a > 0) {
    result = "positive";
  } else {
    result = "NOT positive";
  }
  return result;
}

console.log(testNum(-5));
// Expected output: "NOT positive"
```

## Cú pháp

```js-nolint
if (condition)
  statement1

// With an else clause
if (condition)
  statement1
else
  statement2
```

- `condition`
  - : Một biểu thức được xem xét là {{Glossary("truthy")}} hoặc {{Glossary("falsy")}}.
- `statement1`
  - : Câu lệnh được thực thi nếu _condition_ là {{Glossary("truthy")}}. Có thể là bất kỳ câu lệnh nào, kể cả các câu lệnh `if` lồng nhau. Để thực thi nhiều câu lệnh, sử dụng câu lệnh [block](/en-US/docs/Web/JavaScript/Reference/Statements/block) (`{ /* ... */ }`) để nhóm các câu lệnh đó. Để không thực thi câu lệnh nào, sử dụng câu lệnh [rỗng](/en-US/docs/Web/JavaScript/Reference/Statements/Empty).
- `statement2`
  - : Câu lệnh được thực thi nếu `condition` là {{Glossary("falsy")}} và mệnh đề `else` tồn tại. Có thể là bất kỳ câu lệnh nào, kể cả câu lệnh block và các câu lệnh `if` lồng nhau.

## Mô tả

Nhiều câu lệnh `if...else` có thể lồng vào nhau để tạo ra mệnh đề `else if`. Lưu ý rằng không có từ khóa `elseif` (viết liền) trong JavaScript.

```js-nolint
if (condition1)
  statement1
else if (condition2)
  statement2
else if (condition3)
  statement3
// …
else
  statementN
```

Để hiểu cách hoạt động, đây là cách nó trông nếu thụt lề đúng cách:

```js-nolint
if (condition1)
  statement1
else
  if (condition2)
    statement2
  else
    if (condition3)
      statement3
// …
```

Để thực thi nhiều câu lệnh trong một mệnh đề, sử dụng câu lệnh block (`{ /* ... */ }`) để nhóm các câu lệnh đó.

```js-nolint
if (condition) {
  statements1
} else {
  statements2
}
```

Không sử dụng block có thể dẫn đến hành vi khó hiểu, đặc biệt là nếu code được định dạng thủ công. Ví dụ:

```js-nolint example-bad
function checkValue(a, b) {
  if (a === 1)
    if (b === 2)
      console.log("a is 1 and b is 2");
  else
    console.log("a is not 1");
}
```

Code này trông vô hại — tuy nhiên, thực thi `checkValue(1, 3)` sẽ in ra "a is not 1". Điều này là vì trong trường hợp [dangling else](https://en.wikipedia.org/wiki/Dangling_else), mệnh đề `else` sẽ được kết nối với mệnh đề `if` gần nhất. Do đó, code trên, với thụt lề đúng, sẽ trông như sau:

```js-nolint
function checkValue(a, b) {
  if (a === 1)
    if (b === 2)
      console.log("a is 1 and b is 2");
    else
      console.log("a is not 1");
}
```

Nhìn chung, là một thói quen tốt khi luôn sử dụng câu lệnh block, đặc biệt trong code có các câu lệnh `if` lồng nhau.

```js example-good
function checkValue(a, b) {
  if (a === 1) {
    if (b === 2) {
      console.log("a is 1 and b is 2");
    }
  } else {
    console.log("a is not 1");
  }
}
```

Đừng nhầm lẫn giá trị Boolean nguyên thủy `true` và `false` với tính truthy hay falsy của đối tượng {{jsxref("Boolean")}}. Bất kỳ giá trị nào không phải `false`, `undefined`, `null`, `0`, `-0`, `NaN`, hoặc chuỗi rỗng (`""`), và bất kỳ đối tượng nào, kể cả đối tượng Boolean có giá trị là `false`, đều được coi là {{Glossary("truthy")}} khi được dùng làm điều kiện. Ví dụ:

```js
const b = new Boolean(false);
if (b) {
  console.log("b is truthy"); // "b is truthy"
}
```

## Ví dụ

### Sử dụng if...else

```js
if (cipherChar === fromChar) {
  result += toChar;
  x++;
} else {
  result += clearChar;
}
```

### Sử dụng else if

Lưu ý rằng không có cú pháp `elseif` trong JavaScript. Tuy nhiên, bạn có thể viết nó với một khoảng trắng giữa `else` và `if`:

```js
if (x > 50) {
  /* do something */
} else if (x > 5) {
  /* do something */
} else {
  /* do something */
}
```

### Sử dụng phép gán làm điều kiện

Bạn hầu như không bao giờ nên có `if...else` với phép gán như `x = y` làm điều kiện:

```js example-bad
if ((x = y)) {
  // …
}
```

Vì không giống như vòng lặp {{jsxref("Statements/while", "while")}}, điều kiện chỉ được đánh giá một lần, vì vậy phép gán cũng chỉ được thực hiện một lần. Code trên tương đương với:

```js example-good
x = y;
if (x) {
  // …
}
```

Cách này rõ ràng hơn nhiều. Tuy nhiên, trong trường hợp hiếm gặp bạn muốn làm điều gì đó như vậy, tài liệu [`while`](/en-US/docs/Web/JavaScript/Reference/Statements/while) có phần [Sử dụng phép gán làm điều kiện](/en-US/docs/Web/JavaScript/Reference/Statements/while#using_an_assignment_as_a_condition) với các khuyến nghị của chúng tôi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/block", "block")}}
- {{jsxref("Statements/switch", "switch")}}
- [Toán tử điều kiện (ternary)](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator)
