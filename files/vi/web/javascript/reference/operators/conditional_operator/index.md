---
title: Conditional (ternary) operator
slug: Web/JavaScript/Reference/Operators/Conditional_operator
page-type: javascript-operator
browser-compat: javascript.operators.conditional
sidebar: jssidebar
---

**Toán tử điều kiện (ternary)** là toán tử JavaScript duy nhất nhận ba toán hạng:
một điều kiện theo sau là dấu chấm hỏi (`?`), sau đó là một biểu thức thực thi nếu điều kiện là {{Glossary("truthy")}} tiếp theo là dấu hai chấm (`:`), và cuối cùng là biểu thức thực thi nếu điều kiện là {{Glossary("falsy")}}.
Toán tử này thường được dùng thay thế cho câu lệnh [`if...else`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else).

{{InteractiveExample("JavaScript Demo: Conditional operator")}}

```js interactive-example
function getFee(isMember) {
  return isMember ? "$2.00" : "$10.00";
}

console.log(getFee(true));
// Expected output: "$2.00"

console.log(getFee(false));
// Expected output: "$10.00"

console.log(getFee(null));
// Expected output: "$10.00"
```

## Cú pháp

```js-nolint
condition ? exprIfTrue : exprIfFalse
```

### Tham số

- `condition`
  - : Một biểu thức có giá trị được dùng làm điều kiện.
- `exprIfTrue`
  - : Một biểu thức được thực thi nếu `condition` đánh giá là giá trị {{Glossary("truthy")}} (giá trị bằng hoặc có thể chuyển đổi thành `true`).
- `exprIfFalse`
  - : Một biểu thức được thực thi nếu `condition` là {{Glossary("falsy")}} (tức là có giá trị có thể chuyển đổi thành `false`).

## Mô tả

Ngoài `false`, các biểu thức falsy có thể là: `null`, `NaN`, `0`, chuỗi rỗng (`""`), và `undefined`.
Nếu `condition` là bất kỳ giá trị nào trong số này, kết quả của biểu thức điều kiện sẽ là kết quả của việc thực thi biểu thức `exprIfFalse`.

## Ví dụ

### Ví dụ cơ bản

```js
const age = 26;
const beverage = age >= 21 ? "Beer" : "Juice";
console.log(beverage); // "Beer"
```

### Xử lý giá trị null

Một cách dùng phổ biến là xử lý giá trị có thể là `null`:

```js
const greeting = (person) => {
  const name = person ? person.name : "stranger";
  return `Howdy, ${name}`;
};

console.log(greeting({ name: "Alice" })); // "Howdy, Alice"
console.log(greeting(null)); // "Howdy, stranger"
```

### Chuỗi điều kiện

Toán tử ternary là kết hợp từ phải, có nghĩa là nó có thể được "nối thành chuỗi" theo cách sau, tương tự như chuỗi `if … else if … else if … else`:

```js-nolint
function example() {
  return condition1 ? value1
    : condition2 ? value2
    : condition3 ? value3
    : value4;
}
```

Đoạn này tương đương với chuỗi [`if...else`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else) sau.

```js
function example() {
  if (condition1) {
    return value1;
  } else if (condition2) {
    return value2;
  } else if (condition3) {
    return value3;
  } else {
    return value4;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [`if...else`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else)
- [Nullish coalescing operator (`??`)](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing)
- [Optional chaining (`?.`)](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)
- [Học: Đưa ra quyết định trong mã của bạn — điều kiện](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals)
- [Hướng dẫn Biểu thức và toán tử](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators)
