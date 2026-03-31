---
title: while
slug: Web/JavaScript/Reference/Statements/while
page-type: javascript-statement
browser-compat: javascript.statements.while
sidebar: jssidebar
---

Câu lệnh **`while`** tạo ra một vòng lặp thực thi một câu lệnh được chỉ định miễn là điều kiện kiểm tra còn được đánh giá là true. Điều kiện được đánh giá trước khi thực thi câu lệnh.

{{InteractiveExample("JavaScript Demo: while statement")}}

```js interactive-example
let n = 0;

while (n < 3) {
  n++;
}

console.log(n);
// Expected output: 3
```

## Cú pháp

```js-nolint
while (condition)
  statement
```

- `condition`
  - : Một biểu thức được đánh giá _trước_ mỗi lần lặp qua vòng lặp. Nếu điều kiện này [được đánh giá là true](/en-US/docs/Glossary/Truthy), `statement` sẽ được thực thi. Khi điều kiện [được đánh giá là false](/en-US/docs/Glossary/Falsy), việc thực thi tiếp tục với câu lệnh sau vòng lặp `while`.
- `statement`
  - : Một câu lệnh được thực thi miễn là điều kiện còn được đánh giá là true. Bạn có thể sử dụng [câu lệnh khối](/en-US/docs/Web/JavaScript/Reference/Statements/block) để thực thi nhiều câu lệnh.

## Mô tả

Giống như các câu lệnh lặp khác, bạn có thể sử dụng [câu lệnh điều khiển luồng](/en-US/docs/Web/JavaScript/Reference/Statements#control_flow) bên trong `statement`:

- {{jsxref("Statements/break", "break")}} dừng việc thực thi `statement` và chuyển đến câu lệnh đầu tiên sau vòng lặp.
- {{jsxref("Statements/continue", "continue")}} dừng việc thực thi `statement` và đánh giá lại `condition`.

## Ví dụ

### Sử dụng while

Vòng lặp `while` sau đây lặp miễn là `n` còn nhỏ hơn ba.

```js
let n = 0;
let x = 0;

while (n < 3) {
  n++;
  x += n;
}
```

Mỗi lần lặp, vòng lặp tăng `n` lên 1 và cộng nó vào `x`. Do đó, `x` và `n` nhận các giá trị sau:

- Sau lần lặp đầu tiên: `n` = 1 và `x` = 1
- Sau lần lặp thứ hai: `n` = 2 và `x` = 3
- Sau lần lặp thứ ba: `n` = 3 và `x` = 6

Sau khi hoàn thành lần lặp thứ ba, điều kiện `n` < 3 không còn đúng nữa, nên vòng lặp kết thúc.

### Sử dụng phép gán làm điều kiện

Trong một số trường hợp, việc sử dụng phép gán làm điều kiện có thể hợp lý. Điều này đi kèm với sự đánh đổi về khả năng đọc, vì vậy có một số khuyến nghị về phong cách giúp làm rõ hơn ý định của đoạn mã cho mọi người.

Xem xét ví dụ sau, lặp qua các comment trong tài liệu và ghi chúng ra console.

```js-nolint example-bad
const iterator = document.createNodeIterator(document, NodeFilter.SHOW_COMMENT);
let currentNode;
while (currentNode = iterator.nextNode()) {
  console.log(currentNode.textContent.trim());
}
```

Đây không hoàn toàn là ví dụ thực hành tốt, do dòng sau cụ thể:

```js-nolint example-bad
while (currentNode = iterator.nextNode()) {
```

_Tác dụng_ của dòng đó là ổn — cụ thể là, mỗi khi tìm thấy một comment node:

1. `iterator.nextNode()` trả về comment node đó, được gán cho `currentNode`.
2. Giá trị của `currentNode = iterator.nextNode()` do đó là [truthy](/en-US/docs/Glossary/Truthy).
3. Vì vậy, lệnh gọi `console.log()` thực thi và vòng lặp tiếp tục.

…và sau đó, khi không còn comment node nào trong tài liệu:

1. `iterator.nextNode()` trả về [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).
2. Giá trị của `currentNode = iterator.nextNode()` do đó cũng là `null`, là [falsy](/en-US/docs/Glossary/Falsy).
3. Vì vậy, vòng lặp kết thúc.

Vấn đề với dòng này là: điều kiện thường sử dụng [toán tử so sánh](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#comparison_operators) như `===`, nhưng `=` trong dòng đó không phải là toán tử so sánh — thay vào đó, nó là [toán tử gán](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators). Vì vậy `=` _trông giống như_ đó là lỗi đánh máy cho `===` — mặc dù thực tế _không phải_ là lỗi đánh máy.

Do đó, trong những trường hợp như vậy, một số [công cụ kiểm tra code](/en-US/docs/Learn_web_development/Extensions/Client-side_tools/Introducing_complete_toolchain#code_linting_tools) như quy tắc [`no-cond-assign`](https://eslint.org/docs/latest/rules/no-cond-assign) của ESLint — để giúp bạn phát hiện lỗi đánh máy có thể xảy ra để bạn có thể sửa nó — sẽ báo cảnh báo như sau:

> Expected a conditional expression and instead saw an assignment.

Nhiều hướng dẫn phong cách khuyến nghị chỉ ra rõ ràng hơn ý định rằng điều kiện là một phép gán. Bạn có thể làm điều đó ở mức tối thiểu bằng cách thêm dấu ngoặc đơn bổ sung như một [toán tử nhóm](/en-US/docs/Web/JavaScript/Reference/Operators/Grouping) xung quanh phép gán:

```js example-good
const iterator = document.createNodeIterator(document, NodeFilter.SHOW_COMMENT);
let currentNode;
while ((currentNode = iterator.nextNode())) {
  console.log(currentNode.textContent.trim());
}
```

Trên thực tế, đây là phong cách được ESLint `no-cond-assign` áp dụng trong cấu hình mặc định, cũng như [Prettier](https://prettier.io/), vì vậy bạn có thể thấy mẫu này thường xuyên trong thực tế.

Một số người có thể tiếp tục khuyến nghị thêm toán tử so sánh để biến điều kiện thành một so sánh rõ ràng:

```js-nolint example-good
while ((currentNode = iterator.nextNode()) !== null) {
```

Có những cách khác để viết mẫu này, chẳng hạn như:

```js-nolint example-good
while ((currentNode = iterator.nextNode()) && currentNode) {
```

Hoặc, bỏ qua ý tưởng sử dụng vòng lặp `while` hoàn toàn:

```js example-good
const iterator = document.createNodeIterator(document, NodeFilter.SHOW_COMMENT);
for (
  let currentNode = iterator.nextNode();
  currentNode;
  currentNode = iterator.nextNode()
) {
  console.log(currentNode.textContent.trim());
}
```

Nếu người đọc đã quen thuộc đủ với mẫu phép gán làm điều kiện, tất cả các biến thể này nên có khả năng đọc tương đương. Nếu không, dạng cuối cùng có lẽ là dễ đọc nhất, mặc dù là dài dòng nhất.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/do...while", "do...while")}}
- {{jsxref("Statements/for", "for")}}
- {{jsxref("Statements/break", "break")}}
- {{jsxref("Statements/continue", "continue")}}
