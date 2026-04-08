---
title: Labeled statement
slug: Web/JavaScript/Reference/Statements/label
page-type: javascript-statement
browser-compat: javascript.statements.label
sidebar: jssidebar
---

**Câu lệnh có nhãn** là bất kỳ [câu lệnh](/en-US/docs/Web/JavaScript/Reference/Statements) nào được đặt tiền tố bằng một identifier. Bạn có thể nhảy đến nhãn này bằng cách dùng câu lệnh {{jsxref("Statements/break", "break")}} hoặc {{jsxref("Statements/continue", "continue")}} được lồng bên trong câu lệnh có nhãn.

{{InteractiveExample("JavaScript Demo: Labeled statement", "taller")}}

```js interactive-example
let i, j;

loop1: for (i = 0; i < 3; i++) {
  loop2: for (j = 0; j < 3; j++) {
    if (i === 1 && j === 1) {
      break loop1;
    }
    console.log(`i = ${i}, j = ${j}`);
  }
}

// Expected output:
// "i = 0, j = 0"
// "i = 0, j = 1"
// "i = 0, j = 2"
// "i = 1, j = 0"
```

## Cú pháp

```js-nolint
label:
  statement
```

- `label`
  - : Bất kỳ [identifier](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) JavaScript nào không phải là [từ khóa dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words).
- `statement`
  - : Một câu lệnh JavaScript. `break` có thể được dùng trong bất kỳ câu lệnh có nhãn nào, và `continue` có thể được dùng trong các câu lệnh vòng lặp có nhãn.

## Mô tả

Bạn có thể dùng nhãn để nhận dạng một câu lệnh, và sau đó tham chiếu đến nó bằng câu lệnh `break` hoặc `continue`. Lưu ý rằng JavaScript _không_ có câu lệnh `goto`; bạn chỉ có thể dùng nhãn với `break` hoặc `continue`.

Bất kỳ `break` hoặc `continue` nào tham chiếu đến `label` phải được chứa trong `statement` được đánh nhãn bởi `label`. Hãy nghĩ `label` như một biến chỉ có sẵn trong phạm vi của `statement`.

Nếu câu lệnh `break label;` được gặp khi thực thi `statement`, việc thực thi `statement` kết thúc, và việc thực thi tiếp tục tại câu lệnh ngay sau câu lệnh có nhãn.

`continue label;` chỉ có thể được dùng nếu `statement` là một trong các [câu lệnh vòng lặp](/en-US/docs/Web/JavaScript/Reference/Statements#iterations). Nếu câu lệnh `continue label;` được gặp khi thực thi `statement`, việc thực thi `statement` tiếp tục ở lần lặp tiếp theo của vòng lặp. `continue;` không có nhãn chỉ có thể tiếp tục vòng lặp trong cùng, trong khi `continue label;` cho phép tiếp tục bất kỳ vòng lặp nào ngay cả khi câu lệnh được lồng trong các vòng lặp khác.

Một câu lệnh có thể có nhiều nhãn. Trong trường hợp này, tất cả các nhãn đều tương đương nhau về mặt chức năng.

## Ví dụ

### Sử dụng continue có nhãn với vòng lặp for

```js
// The first for statement is labeled "loop1"
loop1: for (let i = 0; i < 3; i++) {
  // The second for statement is labeled "loop2"
  loop2: for (let j = 0; j < 3; j++) {
    if (i === 1 && j === 1) {
      continue loop1;
    }
    console.log(`i = ${i}, j = ${j}`);
  }
}

// Logs:
// i = 0, j = 0
// i = 0, j = 1
// i = 0, j = 2
// i = 1, j = 0
// i = 2, j = 0
// i = 2, j = 1
// i = 2, j = 2
```

Lưu ý cách nó bỏ qua cả "i = 1, j = 1" và "i = 1, j = 2".

### Sử dụng break có nhãn với vòng lặp for

```js
let i, j;

// The first for statement is labeled "loop1"
loop1: for (i = 0; i < 3; i++) {
  // The second for statement is labeled "loop2"
  loop2: for (j = 0; j < 3; j++) {
    if (i === 1 && j === 1) {
      break loop1;
    }
    console.log(`i = ${i}, j = ${j}`);
  }
}

// Logs:
// i = 0, j = 0
// i = 0, j = 1
// i = 0, j = 2
// i = 1, j = 0
```

Lưu ý sự khác biệt với ví dụ `continue` trước: khi `break loop1` được gặp, việc thực thi vòng lặp ngoài bị kết thúc, vì vậy không có log nào thêm sau "i = 1, j = 0"; khi `continue loop1` được gặp, việc thực thi vòng lặp ngoài tiếp tục ở lần lặp tiếp theo, vì vậy chỉ "i = 1, j = 1" và "i = 1, j = 2" bị bỏ qua.

### Sử dụng câu lệnh continue có nhãn

Cho một mảng các item và một mảng các test, ví dụ này đếm số lượng item vượt qua tất cả các test.

```js
// Numbers from 1 to 100
const items = Array.from({ length: 100 }, (_, i) => i + 1);
const tests = [
  { pass: (item) => item % 2 === 0 },
  { pass: (item) => item % 3 === 0 },
  { pass: (item) => item % 5 === 0 },
];
let itemsPassed = 0;

itemIteration: for (const item of items) {
  for (const test of tests) {
    if (!test.pass(item)) {
      continue itemIteration;
    }
  }

  itemsPassed++;
}
```

Lưu ý cách câu lệnh `continue itemIteration;` bỏ qua phần còn lại của các test cho item hiện tại cũng như câu lệnh cập nhật bộ đếm `itemsPassed`, và tiếp tục với item tiếp theo. Nếu bạn không dùng nhãn, bạn sẽ cần dùng cờ boolean thay thế.

```js
// Numbers from 1 to 100
const items = Array.from({ length: 100 }, (_, i) => i + 1);
const tests = [
  { pass: (item) => item % 2 === 0 },
  { pass: (item) => item % 3 === 0 },
  { pass: (item) => item % 5 === 0 },
];
let itemsPassed = 0;

for (const item of items) {
  let passed = true;
  for (const test of tests) {
    if (!test.pass(item)) {
      passed = false;
      break;
    }
  }
  if (passed) {
    itemsPassed++;
  }
}
```

### Sử dụng câu lệnh break có nhãn

Cho một mảng các item và một mảng các test, ví dụ này xác định liệu tất cả các item có vượt qua tất cả các test hay không.

```js
// Numbers from 1 to 100
const items = Array.from({ length: 100 }, (_, i) => i + 1);
const tests = [
  { pass: (item) => item % 2 === 0 },
  { pass: (item) => item % 3 === 0 },
  { pass: (item) => item % 5 === 0 },
];
let allPass = true;

itemIteration: for (const item of items) {
  for (const test of tests) {
    if (!test.pass(item)) {
      allPass = false;
      break itemIteration;
    }
  }
}
```

Tương tự, nếu bạn không dùng nhãn, bạn sẽ cần dùng cờ boolean thay thế.

```js
// Numbers from 1 to 100
const items = Array.from({ length: 100 }, (_, i) => i + 1);
const tests = [
  { pass: (item) => item % 2 === 0 },
  { pass: (item) => item % 3 === 0 },
  { pass: (item) => item % 5 === 0 },
];
let allPass = true;

for (const item of items) {
  let passed = true;
  for (const test of tests) {
    if (!test.pass(item)) {
      passed = false;
      break;
    }
  }
  if (!passed) {
    allPass = false;
    break;
  }
}
```

### Sử dụng block có nhãn với break

Bạn có thể đánh nhãn cho các câu lệnh khác ngoài vòng lặp, chẳng hạn như các block đơn giản, nhưng chỉ câu lệnh `break` mới có thể tham chiếu đến nhãn không phải vòng lặp.

```js
foo: {
  console.log("face");
  break foo;
  console.log("this will not be executed");
}
console.log("swap");

// Logs:
// "face"
// "swap"
```

### Khai báo hàm có nhãn

Nhãn chỉ có thể được áp dụng cho [câu lệnh, không phải khai báo](/en-US/docs/Web/JavaScript/Reference/Statements#difference_between_statements_and_declarations). Có một ngữ pháp cũ cho phép khai báo hàm được đánh nhãn trong code không phải strict:

```js
L: function F() {}
```

Tuy nhiên, trong code [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), điều này sẽ ném ra {{jsxref("SyntaxError")}}:

```js-nolint example-bad
"use strict";
L: function F() {}
// SyntaxError: functions cannot be labelled
```

Các hàm không phải plain function, chẳng hạn như [generator function](/en-US/docs/Web/JavaScript/Reference/Statements/function*) và [async function](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) không thể được đánh nhãn trong cả code strict lẫn code không phải strict:

```js-nolint example-bad
L: function* F() {}
// SyntaxError: generator functions cannot be labelled
```

Cú pháp khai báo hàm có nhãn đã bị [deprecated](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features) và bạn không nên dùng nó, ngay cả trong code không phải strict. Bạn thực sự không thể nhảy đến nhãn này bên trong thân hàm.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/break", "break")}}
- {{jsxref("Statements/continue", "continue")}}
