---
title: Expression statement
slug: Web/JavaScript/Reference/Statements/Expression_statement
page-type: javascript-statement
spec-urls: https://tc39.es/ecma262/multipage/ecmascript-language-statements-and-declarations.html#sec-expression-statement
sidebar: jssidebar
---

Một **expression statement** là một biểu thức được sử dụng ở nơi mà một câu lệnh được mong đợi. Biểu thức được đánh giá và kết quả của nó bị loại bỏ — do đó, nó chỉ có ý nghĩa đối với các biểu thức có tác dụng phụ, chẳng hạn như thực thi một hàm hoặc cập nhật một biến.

## Cú pháp

```js-nolint
expression;
```

- `expression`
  - : Một [biểu thức](/en-US/docs/Web/JavaScript/Reference/Operators) tùy ý để được đánh giá. Có [một số biểu thức nhất định](#biểu_thức_bị_cấm) có thể gây mơ hồ với các cú pháp câu lệnh khác và do đó bị cấm.

## Mô tả

Ngoài các [cú pháp câu lệnh chuyên dụng](/en-US/docs/Web/JavaScript/Reference/Statements), bạn cũng có thể sử dụng hầu hết mọi [biểu thức](/en-US/docs/Web/JavaScript/Reference/Operators) như một câu lệnh độc lập. Cú pháp expression statement yêu cầu một dấu chấm phẩy ở cuối, nhưng quá trình [chèn dấu chấm phẩy tự động](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion) có thể chèn một dấu cho bạn nếu việc thiếu dấu chấm phẩy dẫn đến cú pháp không hợp lệ.

Vì biểu thức được đánh giá rồi bị loại bỏ, kết quả của biểu thức không có sẵn. Do đó, biểu thức phải có một số tác dụng phụ để có ích. Các expression statement thường là:

- Lời gọi hàm (`console.log("Hello");`, `[1, 2, 3].forEach((i) => console.log(i));`)
- [Tagged template literals](/en-US/docs/Web/JavaScript/Reference/Template_literals#tagged_templates)
- [Biểu thức gán](/en-US/docs/Web/JavaScript/Reference/Operators#assignment_operators), bao gồm các phép gán phức hợp
- [Toán tử tăng và giảm](/en-US/docs/Web/JavaScript/Reference/Operators#increment_and_decrement)
- [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete)
- [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import)
- [`yield`](/en-US/docs/Web/JavaScript/Reference/Operators/yield) và [`yield*`](/en-US/docs/Web/JavaScript/Reference/Operators/yield*)

Các biểu thức khác cũng có thể có tác dụng phụ nếu chúng kích hoạt [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) hoặc gây [ép kiểu](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion).

### Biểu thức bị cấm

Để một biểu thức có thể được sử dụng như một câu lệnh, nó không được gây mơ hồ với các cú pháp câu lệnh khác. Do đó, biểu thức không được bắt đầu bằng bất kỳ token nào sau đây:

- `function`: sẽ là một [khai báo `function`](/en-US/docs/Web/JavaScript/Reference/Statements/function) hoặc [khai báo `function*`](/en-US/docs/Web/JavaScript/Reference/Statements/function*), chứ không phải là một [biểu thức `function`](/en-US/docs/Web/JavaScript/Reference/Operators/function) hoặc [biểu thức `function*`](/en-US/docs/Web/JavaScript/Reference/Operators/function*)
- `async function`: sẽ là một [khai báo `async function`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) hoặc [khai báo `async function*`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*), chứ không phải là một [biểu thức `async function`](/en-US/docs/Web/JavaScript/Reference/Operators/async_function) hoặc [biểu thức `async function*`](/en-US/docs/Web/JavaScript/Reference/Operators/async_function*)
- `class`: sẽ là một [khai báo `class`](/en-US/docs/Web/JavaScript/Reference/Statements/class), chứ không phải là một [biểu thức `class`](/en-US/docs/Web/JavaScript/Reference/Operators/class)
- `let[`: sẽ là một [khai báo `let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) với [array destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring), chứ không phải là một [property accessor](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) trên một biến có tên `let` (`let` chỉ có thể là một identifier trong [chế độ không nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode#extra_reserved_words))
- `{`: sẽ là một [block statement](/en-US/docs/Web/JavaScript/Reference/Statements/block), chứ không phải là một [object literal](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)

Do đó, tất cả những điều sau đây đều không hợp lệ:

```js-nolint example-bad
function foo() {
  console.log("foo");
}(); // SyntaxError: Unexpected token '('

// Vì một lý do nào đó, bạn có một biến gọi là `let`
var let = [1, 2, 3];
let[0] = 4; // SyntaxError: Invalid destructuring assignment target

{
  foo: 1,
  bar: 2, // SyntaxError: Unexpected token ':'
};
```

Nguy hiểm hơn, đôi khi code lại là cú pháp hợp lệ, nhưng không phải là những gì bạn muốn.

```js-nolint example-bad
// Vì một lý do nào đó, bạn có một biến gọi là `let`
var let = [1, 2, 3];

function setIndex(index, value) {
  if (index >= 0) {
    // Có ý định gán cho mảng `let`, nhưng thay vào đó tạo ra một biến bổ sung!
    let[index] = value;
  }
}

setIndex(0, [1, 2]);
console.log(let); // [1, 2, 3]

// Đây không phải là một object literal, mà là một block statement,
// nơi `foo` là một nhãn và `1` là một expression statement.
// Điều này thường xảy ra trong console
{ foo: 1 };
```

Để tránh những vấn đề này, bạn có thể sử dụng dấu ngoặc đơn, để câu lệnh rõ ràng là một expression statement.

```js example-good
(function foo() {
  console.log("foo");
})();
```

## Ví dụ

### Tránh các câu lệnh luồng điều khiển

Bạn có thể tránh hầu hết các cách sử dụng câu lệnh luồng điều khiển bằng cách sử dụng expression statement. Ví dụ, `if...else` có thể được thay thế bằng [toán tử ba ngôi](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator) và [toán tử logic](/en-US/docs/Web/JavaScript/Reference/Operators#binary_logical_operators). Các câu lệnh lặp như `for` hoặc `for...of` có thể được thay thế bằng [phương thức mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#instance_methods).

```js
// Sử dụng câu lệnh luồng điều khiển
function range(start, end) {
  if (start > end) {
    [start, end] = [end, start];
  }
  const result = [];
  for (let i = start; i < end; i++) {
    result.push(i);
  }
  return result;
}

// Sử dụng expression statement
function range2(start, end) {
  start > end && ([start, end] = [end, start]);
  return Array.from({ length: end - start }, (_, i) => start + i);
}
```

> [!WARNING]
> Điều này chỉ minh họa một khả năng của ngôn ngữ. Việc sử dụng quá nhiều expression statement như một sự thay thế cho các câu lệnh luồng điều khiển có thể làm cho code khó đọc hơn nhiều.

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Câu lệnh và khai báo](/en-US/docs/Web/JavaScript/Reference/Statements)
- [Biểu thức và toán tử](/en-US/docs/Web/JavaScript/Reference/Operators)
