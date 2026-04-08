---
title: Grouping operator ( )
slug: Web/JavaScript/Reference/Operators/Grouping
page-type: javascript-operator
browser-compat: javascript.operators.grouping
sidebar: jssidebar
---

Toán tử **grouping `( )`** (nhóm) kiểm soát thứ tự ưu tiên đánh giá trong các biểu thức. Nó cũng đóng vai trò là container cho các biểu thức tùy ý trong một số cấu trúc cú pháp nhất định, nơi mà nếu không sẽ xảy ra sự mơ hồ hoặc lỗi cú pháp.

{{InteractiveExample("JavaScript Demo: Grouping operator")}}

```js-nolint interactive-example
console.log(1 + 2 * 3); // 1 + 6
// Expected output: 7

console.log(1 + (2 * 3)); // 1 + 6
// Expected output: 7

console.log((1 + 2) * 3); // 3 * 3
// Expected output: 9

console.log(1 * 3 + 2 * 3); // 3 + 6
// Expected output: 9
```

## Cú pháp

```js-nolint
(expression)
```

### Tham số

- `expression`
  - : Bất kỳ [biểu thức](/en-US/docs/Web/JavaScript/Reference/Operators) nào cần được đánh giá, bao gồm cả các biểu thức [nối bằng dấu phẩy](/en-US/docs/Web/JavaScript/Reference/Operators/Comma_operator).

## Mô tả

Toán tử grouping bao gồm một cặp dấu ngoặc đơn bao quanh một biểu thức để nhóm các nội dung. Toán tử ghi đè [thứ tự ưu tiên toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence) thông thường, cho phép các toán tử có độ ưu tiên thấp hơn (thấp đến mức như toán tử [dấu phẩy](/en-US/docs/Web/JavaScript/Reference/Operators/Comma_operator)) có thể được đánh giá trước một toán tử có độ ưu tiên cao hơn.

## Ví dụ

### Sử dụng toán tử grouping

Đánh giá phép cộng và trừ trước phép nhân và chia.

```js-nolint
const a = 1;
const b = 2;
const c = 3;

// default precedence
a + b * c; // 7
// evaluated by default like this
a + (b * c); // 7

// now overriding precedence
// addition before multiplication
(a + b) * c; // 9

// which is equivalent to
a * c + b * c; // 9
```

Hãy lưu ý trong các ví dụ này rằng thứ tự đánh giá của các _toán tử_ đã thay đổi, nhưng thứ tự đánh giá của các _toán hạng_ thì không. Ví dụ, trong code này, các lời gọi hàm `a()`, `b()`, và `c()` được đánh giá từ trái sang phải (thứ tự đánh giá thông thường) trước khi xem xét thứ tự toán tử.

```js
a() * (b() + c());
```

Hàm `a` sẽ được gọi trước hàm `b`, hàm `b` sẽ được gọi trước hàm `c`. Để biết thêm về thứ tự ưu tiên toán tử, hãy xem [trang tham khảo](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence).

### Sử dụng toán tử grouping để loại bỏ sự mơ hồ khi phân tích cú pháp

Một [expression statement](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement) không thể bắt đầu bằng từ khóa `function`, vì trình phân tích cú pháp sẽ hiểu đó là phần bắt đầu của [khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function). Điều này có nghĩa là cú pháp [IIFE](/en-US/docs/Glossary/IIFE) sau đây là không hợp lệ:

```js-nolint example-bad
function () {
  // code
}();
```

Toán tử grouping có thể được dùng để loại bỏ sự mơ hồ này, vì khi trình phân tích cú pháp thấy dấu ngoặc đơn mở, nó biết rằng những gì tiếp theo phải là một biểu thức thay vì một khai báo.

```js
(function () {
  // code
})();
```

Bạn cũng có thể dùng toán tử [`void`](/en-US/docs/Web/JavaScript/Reference/Operators/void#immediately_invoked_function_expressions) để loại bỏ sự mơ hồ.

Trong thân biểu thức [arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) (loại trực tiếp trả về một biểu thức mà không có từ khóa `return`), toán tử grouping có thể được dùng để trả về một object literal expression, vì nếu không dấu ngoặc nhọn mở sẽ bị diễn giải là phần bắt đầu của thân hàm.

```js
const f = () => ({ a: 1 });
```

Nếu một thuộc tính được truy cập trên một số nguyên literal, dấu `.` của [property accessor](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) có thể bị nhầm lẫn với dấu thập phân, trừ khi số đã có dấu thập phân. Bạn có thể bọc các số nguyên literal trong dấu ngoặc đơn để loại bỏ sự mơ hồ này.

```js
(1).toString(); // "1"
```

<!-- TODO in the future we can add a decorator section -->

### Toán tử grouping và chèn dấu chấm phẩy tự động

Toán tử grouping có thể giảm thiểu các vấn đề của [chèn dấu chấm phẩy tự động](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion) (ASI). Ví dụ, từ khóa `return` và biểu thức được trả về không thể có ngắt dòng ở giữa:

```js-nolint example-bad
function sum(a, b) {
  return
    a + b;
}
```

Code này sẽ trả về `undefined`, vì một dấu chấm phẩy được chèn ngay sau từ khóa `return`, khiến hàm trả về ngay lập tức mà không đánh giá `a + b`. Trong trường hợp biểu thức trả về dài và bạn muốn định dạng tốt, bạn có thể dùng toán tử grouping để báo hiệu rằng từ khóa `return` được theo sau bởi một biểu thức và ngăn chặn việc chèn dấu chấm phẩy:

```js-nolint example-good
function sum(a, b) {
  return (
    a + b
  );
}
```

Tuy nhiên, grouping cũng có thể _tạo ra_ các nguy cơ ASI. Khi một dòng bắt đầu bằng dấu ngoặc đơn mở và dòng trước kết thúc bằng một biểu thức, trình phân tích cú pháp sẽ không chèn dấu chấm phẩy trước ngắt dòng, vì nó có thể là phần giữa của một lời gọi hàm. Ví dụ:

```js-nolint example-bad
const a = 1
(1).toString()
```

Code này sẽ được phân tích thành:

```js
const a = 1(1).toString();
```

Điều này ném ra "TypeError: 1 is not a function". Nếu phong cách code của bạn không sử dụng dấu chấm phẩy, hãy nhớ rằng khi một dòng bắt đầu bằng dấu ngoặc đơn mở, hãy _đặt tiền tố_ bằng dấu chấm phẩy. Thực hành này được khuyến nghị bởi nhiều formatter và/hoặc style guide, bao gồm [Prettier](https://prettier.io/docs/rationale.html#semicolons) và [standard](https://standardjs.com/rules.html#semicolons).

```js-nolint example-good
const a = 1
;(1).toString()
```

Để biết thêm lời khuyên về việc làm việc với ASI, hãy xem [phần tham khảo](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Operator precedence](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence)
- {{jsxref("Operators/delete", "delete")}}
- {{jsxref("Operators/typeof", "typeof")}}
