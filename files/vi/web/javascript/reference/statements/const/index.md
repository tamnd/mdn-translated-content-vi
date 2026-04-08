---
title: const
slug: Web/JavaScript/Reference/Statements/const
page-type: javascript-statement
browser-compat: javascript.statements.const
sidebar: jssidebar
---

Khai báo **`const`** khai báo các biến cục bộ có phạm vi block. Giá trị của một hằng số không thể thay đổi thông qua phép tái gán bằng [toán tử gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment), nhưng nếu hằng số là một [đối tượng](/en-US/docs/Web/JavaScript/Guide/Data_structures#objects), các thuộc tính của nó có thể được thêm, cập nhật hoặc xóa.

{{InteractiveExample("JavaScript Demo: const declaration")}}

```js interactive-example
const number = 42;

try {
  number = 99;
} catch (err) {
  console.log(err);
  // Expected output: TypeError: invalid assignment to const 'number'
  // (Note: the exact output may be browser-dependent)
}

console.log(number);
// Expected output: 42
```

## Cú pháp

```js-nolint
const name1 = value1;
const name1 = value1, name2 = value2;
const name1 = value1, name2 = value2, /* …, */ nameN = valueN;
```

- `nameN`
  - : Tên của biến cần khai báo. Mỗi tên phải là một [định danh](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) JavaScript hợp lệ hoặc một [mẫu binding destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).
- `valueN`
  - : Giá trị khởi tạo của biến. Có thể là bất kỳ biểu thức hợp lệ nào.

## Mô tả

Khai báo `const` rất giống với {{jsxref("Statements/let", "let")}}:

- Khai báo `const` được giới hạn trong phạm vi cả block lẫn function.
- Khai báo `const` chỉ có thể được truy cập sau khi nơi khai báo được thực thi (xem [temporal dead zone](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz)). Vì lý do này, khai báo `const` thường được xem là [không được hoisted](/en-US/docs/Glossary/Hoisting).
- Khai báo `const` không tạo thuộc tính trên {{jsxref("globalThis")}} khi được khai báo ở cấp cao nhất của script.
- Khai báo `const` không thể được [khai báo lại](/en-US/docs/Web/JavaScript/Reference/Statements/let#redeclarations) bởi bất kỳ khai báo nào khác trong cùng phạm vi.
- `const` bắt đầu [_khai báo_, không phải _câu lệnh_](/en-US/docs/Web/JavaScript/Reference/Statements#difference_between_statements_and_declarations). Điều đó có nghĩa là bạn không thể sử dụng khai báo `const` đơn lẻ làm thân của một block (điều này hợp lý, vì không có cách nào để truy cập biến).

  ```js-nolint example-bad
  if (true) const a = 1; // SyntaxError: Lexical declaration cannot appear in a single-statement context
  ```

Trình khởi tạo cho hằng số là bắt buộc. Bạn phải chỉ định giá trị của nó trong cùng khai báo. (Điều này hợp lý, vì sau đó không thể thay đổi nó.)

```js-nolint example-bad
const FOO; // SyntaxError: Missing initializer in const declaration
```

Khai báo `const` tạo ra một tham chiếu bất biến đến một giá trị. Nó _không_ có nghĩa là giá trị mà nó giữ là bất biến — chỉ là định danh biến không thể được tái gán. Ví dụ, trong trường hợp nội dung là một đối tượng, điều này có nghĩa là nội dung của đối tượng (ví dụ: các thuộc tính của nó) có thể bị thay đổi. Bạn nên hiểu khai báo `const` là "tạo một biến có _danh tính_ không thay đổi", không phải "có _giá trị_ không thay đổi" — hay, "tạo {{Glossary("binding", "bindings")}} bất biến", không phải "giá trị bất biến".

Nhiều hướng dẫn phong cách lập trình (bao gồm [của MDN](/en-US/docs/MDN/Writing_guidelines/Code_style_guide/JavaScript#variable_declarations)) khuyến nghị sử dụng `const` thay vì {{jsxref("Statements/let", "let")}} bất cứ khi nào một biến không được tái gán trong phạm vi của nó. Điều này làm rõ ý định rằng kiểu (hoặc giá trị, trong trường hợp primitive) của biến không bao giờ thay đổi. Những người khác có thể ưu tiên `let` cho các non-primitive bị biến đổi.

Danh sách theo sau từ khóa `const` được gọi là _danh sách {{Glossary("binding")}}_ và được phân tách bằng dấu phẩy, trong đó các dấu phẩy _không phải_ là [toán tử dấu phẩy](/en-US/docs/Web/JavaScript/Reference/Operators/Comma_operator) và các dấu `=` _không phải_ là [toán tử gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment). Các trình khởi tạo của biến sau có thể tham chiếu đến các biến trước đó trong danh sách.

## Ví dụ

### Cách dùng cơ bản của const

Hằng số có thể được khai báo bằng chữ hoa hoặc chữ thường, nhưng quy ước phổ biến là sử dụng toàn chữ hoa, đặc biệt là đối với các primitive vì chúng thực sự là bất biến.

```js
// define MY_FAV as a constant and give it the value 7
const MY_FAV = 7;

console.log(`my favorite number is: ${MY_FAV}`);
```

```js-nolint example-bad
// Re-assigning to a constant variable throws an error
MY_FAV = 20; // TypeError: Assignment to constant variable

// Redeclaring a constant throws an error
const MY_FAV = 20; // SyntaxError: Identifier 'MY_FAV' has already been declared
var MY_FAV = 20; // SyntaxError: Identifier 'MY_FAV' has already been declared
let MY_FAV = 20; // SyntaxError: Identifier 'MY_FAV' has already been declared
```

### Phạm vi block

Quan trọng là phải lưu ý đặc tính của phạm vi block.

```js-nolint
const MY_FAV = 7;

if (MY_FAV === 7) {
  // This is fine because it's in a new block scope
  const MY_FAV = 20;
  console.log(MY_FAV); // 20

  // var declarations are not scoped to blocks so this throws an error
  var MY_FAV = 20; // SyntaxError: Identifier 'MY_FAV' has already been declared
}

console.log(MY_FAV); // 7
```

### const trong đối tượng và mảng

`const` cũng hoạt động với đối tượng và mảng. Việc cố gắng ghi đè đối tượng sẽ ném lỗi "Assignment to constant variable".

```js example-bad
const MY_OBJECT = { key: "value" };
MY_OBJECT = { OTHER_KEY: "value" };
```

Tuy nhiên, các khóa của đối tượng không được bảo vệ, vì vậy câu lệnh sau được thực thi mà không có vấn đề gì.

```js
MY_OBJECT.key = "otherValue";
```

Bạn sẽ cần sử dụng {{jsxref("Object.freeze()")}} để làm cho đối tượng bất biến.

Điều tương tự áp dụng cho mảng. Gán một mảng mới cho biến sẽ ném lỗi "Assignment to constant variable".

```js example-bad
const MY_ARRAY = [];
MY_ARRAY = ["B"];
```

Tuy nhiên, vẫn có thể đẩy các phần tử vào mảng và do đó làm thay đổi nó.

```js
MY_ARRAY.push("A"); // ["A"]
```

### Khai báo với destructuring

Vế trái của mỗi `=` cũng có thể là một mẫu binding. Điều này cho phép tạo nhiều biến cùng một lúc.

```js
const result = /(a+)(b+)(c+)/.exec("aaabcc");
const [, a, b, c] = result;
console.log(a, b, c); // "aaa" "b" "cc"
```

Để biết thêm thông tin, xem [Destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/var", "var")}}
- {{jsxref("Statements/let", "let")}}
- [Constants in the JavaScript Guide](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#constants)
