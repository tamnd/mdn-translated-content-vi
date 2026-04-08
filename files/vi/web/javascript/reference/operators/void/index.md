---
title: void operator
slug: Web/JavaScript/Reference/Operators/void
page-type: javascript-operator
browser-compat: javascript.operators.void
sidebar: jssidebar
---

Toán tử **`void`** đánh giá `expression` đã cho và sau đó trả về {{jsxref("undefined")}}.

{{InteractiveExample("JavaScript Demo: void operator", "taller")}}

```js interactive-example
const output = void 1;
console.log(output);
// Expected output: undefined

void console.log("expression evaluated");
// Expected output: "expression evaluated"

void (function iife() {
  console.log("iife is executed");
})();
// Expected output: "iife is executed"

void function test() {
  console.log("test function executed");
};
try {
  test();
} catch (e) {
  console.log("test function is not defined");
  // Expected output: "test function is not defined"
}
```

## Cú pháp

```js-nolint
void expression
```

## Mô tả

Toán tử này cho phép đánh giá các biểu thức tạo ra một giá trị vào những nơi cần một biểu thức được đánh giá thành {{jsxref("undefined")}}.

Toán tử `void` thường chỉ được dùng để lấy giá trị primitive `undefined`, thường sử dụng `void(0)` (tương đương với `void 0`). Trong những trường hợp này, có thể sử dụng biến global {{jsxref("undefined")}}.

Cần lưu ý rằng [độ ưu tiên](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence) của toán tử `void` nên được tính đến và rằng dấu ngoặc đơn có thể giúp làm rõ việc giải quyết biểu thức theo sau toán tử `void`:

```js
void 2 === "2"; // (void 2) === '2', returns false
void (2 === "2"); // void (2 === '2'), returns undefined
```

## Ví dụ

### Biểu thức hàm được gọi ngay (IIFE)

Khi sử dụng [immediately-invoked function expression](/en-US/docs/Glossary/IIFE), từ khóa `function` không thể ở đầu ngay lập tức của [câu lệnh](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement), vì điều đó sẽ được phân tích như [function declaration](/en-US/docs/Web/JavaScript/Reference/Statements/function), và sẽ tạo ra lỗi cú pháp khi đến dấu ngoặc đơn đại diện cho việc gọi — nếu hàm không có tên, nó sẽ ngay lập tức là lỗi cú pháp nếu hàm được phân tích như một declaration.

```js-nolint example-bad
function iife() {
  console.log("Executed!");
}(); // SyntaxError: Unexpected token ')'

function () {
  console.log("Executed!");
}(); // SyntaxError: Function statements require a function name
```

Để hàm được phân tích như một [biểu thức](/en-US/docs/Web/JavaScript/Reference/Operators/function), từ khóa `function` phải xuất hiện ở vị trí chỉ chấp nhận các biểu thức, không phải các câu lệnh. Điều này có thể đạt được bằng cách đặt tiền tố từ khóa với một [toán tử unary](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#unary_operators), chỉ chấp nhận các biểu thức làm toán hạng. Việc gọi hàm có [độ ưu tiên](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence) cao hơn các toán tử unary, vì vậy nó sẽ được thực thi trước. Giá trị trả về của nó (hầu như luôn là `undefined`) sẽ được truyền đến toán tử unary và sau đó ngay lập tức bị loại bỏ.

Trong tất cả các toán tử unary, `void` cung cấp ngữ nghĩa tốt nhất, vì nó rõ ràng báo hiệu rằng giá trị trả về của lời gọi hàm nên được loại bỏ.

```js-nolint
void function () {
  console.log("Executed!");
}();

// Logs "Executed!"
```

Điều này dài hơn một chút so với việc bọc biểu thức hàm trong dấu ngoặc đơn, có cùng hiệu lực là buộc từ khóa `function` được phân tích như bắt đầu của một biểu thức thay vì một câu lệnh.

```js
(function () {
  console.log("Executed!");
})();
```

Lưu ý rằng mẹo này chỉ áp dụng cho IIFE được định nghĩa với từ khóa `function`. Cố gắng sử dụng toán tử `void` để tránh dấu ngoặc cho arrow function dẫn đến lỗi cú pháp. Biểu thức arrow function luôn yêu cầu dấu ngoặc xung quanh chúng khi được gọi.

```js example-bad
void () => { console.log("iife!"); }(); // SyntaxError: Malformed arrow function parameter list
```

### URI JavaScript

Khi trình duyệt theo sau một [`javascript:` URI](/en-US/docs/Web/URI/Reference/Schemes/javascript), nó đánh giá code trong URI và sau đó thay thế nội dung của trang bằng giá trị được trả về, trừ khi giá trị được trả về là {{jsxref("undefined")}}. Toán tử `void` có thể được sử dụng để trả về `undefined`. Ví dụ:

```html
<a href="javascript:void(0);">Click here to do nothing</a>

<a href="javascript:void(document.body.style.backgroundColor='green');">
  Click here for green background
</a>
```

> [!NOTE]
> Pseudo protocol `javascript:` không được khuyến khích so với các lựa chọn thay thế khác, chẳng hạn như các event handler không xâm phạm.

### Arrow function không rò rỉ

Arrow function giới thiệu cú pháp tắt không có dấu ngoặc nhọn trả về một biểu thức. Điều này có thể gây ra các tác dụng phụ không mong muốn nếu biểu thức là một lời gọi hàm nơi giá trị trả về thay đổi từ `undefined` sang một giá trị khác.

Ví dụ: nếu `doSomething()` trả về `false` trong code dưới đây, checkbox sẽ không còn được đánh dấu hoặc bỏ đánh dấu khi click vào checkbox (trả về `false` từ handler vô hiệu hóa hành động mặc định).

```js example-bad
checkbox.onclick = () => doSomething();
```

Đây có thể không phải là hành vi mong muốn! Để an toàn, khi giá trị trả về của một hàm không có ý định được sử dụng, nó có thể được truyền đến toán tử `void` để đảm bảo rằng (ví dụ) việc thay đổi các API không khiến hành vi của arrow function thay đổi.

```js example-good
checkbox.onclick = () => void doSomething();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("undefined")}}
