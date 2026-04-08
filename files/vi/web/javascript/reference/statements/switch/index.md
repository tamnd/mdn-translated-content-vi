---
title: switch
slug: Web/JavaScript/Reference/Statements/switch
page-type: javascript-statement
browser-compat: javascript.statements.switch
sidebar: jssidebar
---

Câu lệnh **`switch`** đánh giá một [biểu thức](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators), so khớp giá trị của biểu thức với một loạt các mệnh đề `case`, và thực thi [các câu lệnh](/en-US/docs/Web/JavaScript/Reference/Statements) sau mệnh đề `case` đầu tiên có giá trị khớp, cho đến khi gặp câu lệnh `break`. Mệnh đề `default` của câu lệnh `switch` sẽ được nhảy tới nếu không có `case` nào khớp với giá trị của biểu thức.

{{InteractiveExample("JavaScript Demo: switch statement", "taller")}}

```js interactive-example
const expr = "Papayas";
switch (expr) {
  case "Oranges":
    console.log("Oranges are $0.59 a pound.");
    break;
  case "Mangoes":
  case "Papayas":
    console.log("Mangoes and papayas are $2.79 a pound.");
    // Expected output: "Mangoes and papayas are $2.79 a pound."
    break;
  default:
    console.log(`Sorry, we are out of ${expr}.`);
}
```

## Cú pháp

```js-nolint
switch (expression) {
  case caseExpression1:
    statements
  case caseExpression2:
    statements
  // …
  case caseExpressionN:
    statements
  default:
    statements
}
```

- `expression`
  - : Một biểu thức có kết quả được so khớp với từng mệnh đề `case`.
- `caseExpressionN` {{optional_inline}}
  - : Một mệnh đề `case` dùng để so khớp với `expression`. Nếu giá trị của `expression` khớp với giá trị của bất kỳ `caseExpressionN` nào, quá trình thực thi bắt đầu từ câu lệnh đầu tiên sau mệnh đề `case` đó cho đến khi kết thúc câu lệnh `switch` hoặc gặp `break` đầu tiên.
- `default` {{optional_inline}}
  - : Một mệnh đề `default`; nếu được cung cấp, mệnh đề này sẽ được thực thi nếu giá trị của `expression` không khớp với bất kỳ mệnh đề `case` nào. Một câu lệnh `switch` chỉ có thể có một mệnh đề `default`.

## Mô tả

Câu lệnh `switch` trước tiên đánh giá biểu thức của nó. Sau đó nó tìm mệnh đề `case` đầu tiên có biểu thức cho ra cùng giá trị với kết quả của biểu thức đầu vào (sử dụng phép so sánh [strict equality](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality)) và chuyển quyền điều khiển tới mệnh đề đó, thực thi tất cả các câu lệnh sau mệnh đề đó.

Các biểu thức của mệnh đề chỉ được đánh giá khi cần thiết — nếu đã tìm thấy kết quả khớp, các biểu thức mệnh đề `case` tiếp theo sẽ không được đánh giá, ngay cả khi chúng sẽ được truy cập qua [fall-through](#breaking_and_fall-through).

```js
switch (undefined) {
  case console.log(1):
  case console.log(2):
}
// Only logs 1
```

Nếu không tìm thấy mệnh đề `case` khớp nào, chương trình tìm mệnh đề `default` tùy chọn, và nếu tìm thấy, chuyển quyền điều khiển tới mệnh đề đó, thực thi các câu lệnh sau đó. Nếu không tìm thấy mệnh đề `default`, chương trình tiếp tục thực thi tại câu lệnh ngay sau phần cuối của `switch`. Theo quy ước, mệnh đề `default` là mệnh đề cuối cùng, nhưng không bắt buộc phải như vậy. Một câu lệnh `switch` chỉ có thể có một mệnh đề `default`; nhiều mệnh đề `default` sẽ dẫn đến {{jsxref("SyntaxError")}}.

### Break và fall-through

Bạn có thể sử dụng câu lệnh [`break`](/en-US/docs/Web/JavaScript/Reference/Statements/break) trong thân của câu lệnh `switch` để thoát sớm, thường khi tất cả các câu lệnh giữa hai mệnh đề `case` đã được thực thi. Quá trình thực thi sẽ tiếp tục tại câu lệnh đầu tiên sau `switch`.

Nếu `break` bị bỏ qua, quá trình thực thi sẽ tiến tới mệnh đề `case` tiếp theo, thậm chí tới mệnh đề `default`, bất kể giá trị của biểu thức mệnh đề đó có khớp hay không. Hành vi này được gọi là "fall-through".

```js
const foo = 0;
switch (foo) {
  case -1:
    console.log("negative 1");
    break;
  case 0: // Value of foo matches this criteria; execution starts from here
    console.log(0);
  // Forgotten break! Execution falls through
  case 1: // no break statement in 'case 0:' so this case will run as well
    console.log(1);
    break; // Break encountered; will not continue into 'case 2:'
  case 2:
    console.log(2);
    break;
  default:
    console.log("default");
}
// Logs 0 and 1
```

Trong các ngữ cảnh phù hợp, các câu lệnh điều khiển luồng khác cũng có tác dụng thoát khỏi câu lệnh `switch`. Ví dụ, nếu câu lệnh `switch` nằm trong một hàm, thì câu lệnh [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return) kết thúc quá trình thực thi thân hàm và do đó cả câu lệnh `switch`. Nếu câu lệnh `switch` nằm trong một vòng lặp, thì câu lệnh [`continue`](/en-US/docs/Web/JavaScript/Reference/Statements/continue) dừng câu lệnh `switch` và nhảy tới lần lặp tiếp theo của vòng lặp.

### Phạm vi từ vựng

Các mệnh đề `case` và `default` giống như các [nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label): chúng chỉ ra các vị trí có thể mà luồng điều khiển có thể nhảy tới. Tuy nhiên, chúng không tạo ra các [phạm vi](/en-US/docs/Glossary/Scope) từ vựng (cũng không tự động thoát — như đã trình bày ở trên). Ví dụ:

```js-nolint example-bad
const action = "say_hello";
switch (action) {
  case "say_hello":
    const message = "hello";
    console.log(message);
    break;
  case "say_hi":
    const message = "hi";
    console.log(message);
    break;
  default:
    console.log("Empty action received.");
}
```

Ví dụ này sẽ xuất ra lỗi "Uncaught SyntaxError: Identifier 'message' has already been declared", vì khai báo `const message = 'hello';` đầu tiên xung đột với khai báo `const message = 'hi';` thứ hai, ngay cả khi chúng nằm trong các mệnh đề case riêng biệt của chúng. Xét cho cùng, điều này là do cả hai khai báo `const` đều nằm trong cùng một phạm vi block được tạo bởi thân `switch`.

Để khắc phục điều này, bất cứ khi nào bạn cần sử dụng khai báo `let` hoặc `const` trong một mệnh đề `case`, hãy bọc nó trong một block.

```js
const action = "say_hello";
switch (action) {
  case "say_hello": {
    const message = "hello";
    console.log(message);
    break;
  }
  case "say_hi": {
    const message = "hi";
    console.log(message);
    break;
  }
  default: {
    console.log("Empty action received.");
  }
}
```

Code này sẽ xuất ra `hello` trong console như dự kiến, không có lỗi nào.

## Ví dụ

### Sử dụng switch

Trong ví dụ sau, nếu `expr` có giá trị là `Bananas`, chương trình so khớp giá trị với `case 'Bananas'` và thực thi câu lệnh liên quan. Khi gặp `break`, chương trình thoát khỏi `switch` và thực thi câu lệnh sau `switch`. Nếu `break` bị bỏ qua, câu lệnh cho `case 'Cherries'` cũng sẽ được thực thi.

```js
switch (expr) {
  case "Oranges":
    console.log("Oranges are $0.59 a pound.");
    break;
  case "Apples":
    console.log("Apples are $0.32 a pound.");
    break;
  case "Bananas":
    console.log("Bananas are $0.48 a pound.");
    break;
  case "Cherries":
    console.log("Cherries are $3.00 a pound.");
    break;
  case "Mangoes":
  case "Papayas":
    console.log("Mangoes and papayas are $2.79 a pound.");
    break;
  default:
    console.log(`Sorry, we are out of ${expr}.`);
}

console.log("Is there anything else you'd like?");
```

### Đặt mệnh đề default giữa hai mệnh đề case

Nếu không tìm thấy kết quả khớp, quá trình thực thi sẽ bắt đầu từ mệnh đề `default` và thực thi tất cả các câu lệnh sau đó.

```js
const foo = 5;
switch (foo) {
  case 2:
    console.log(2);
    break; // it encounters this break so will not continue into 'default:'
  default:
    console.log("default");
  // fall-through
  case 1:
    console.log("1");
}
```

Cách này cũng hoạt động khi bạn đặt `default` trước tất cả các mệnh đề `case` khác.

### Tận dụng fall-through

Phương pháp này tận dụng thực tế là nếu không có `break` dưới một mệnh đề `case`, quá trình thực thi sẽ tiếp tục tới mệnh đề `case` tiếp theo bất kể `case` đó có thỏa mãn điều kiện hay không.

Sau đây là ví dụ về câu lệnh `case` tuần tự cho một thao tác duy nhất, trong đó bốn giá trị khác nhau thực hiện hoàn toàn cùng một việc.

```js
const Animal = "Giraffe";
switch (Animal) {
  case "Cow":
  case "Giraffe":
  case "Dog":
  case "Pig":
    console.log("This animal is not extinct.");
    break;
  case "Dinosaur":
  default:
    console.log("This animal is extinct.");
}
```

Sau đây là ví dụ về mệnh đề `case` tuần tự với nhiều thao tác, trong đó tùy thuộc vào số nguyên được cung cấp, bạn có thể nhận được kết quả khác nhau. Điều này cho thấy nó sẽ duyệt theo thứ tự bạn đặt các mệnh đề `case`, và không nhất thiết phải theo thứ tự số. Trong JavaScript, bạn thậm chí có thể kết hợp các định nghĩa chuỗi vào các câu lệnh `case` này.

```js
const foo = 1;
let output = "Output: ";
switch (foo) {
  case 0:
    output += "So ";
  case 1:
    output += "What ";
    output += "Is ";
  case 2:
    output += "Your ";
  case 3:
    output += "Name";
  case 4:
    output += "?";
    console.log(output);
    break;
  case 5:
    output += "!";
    console.log(output);
    break;
  default:
    console.log("Please pick a number from 0 to 5!");
}
```

Kết quả từ ví dụ này:

| Giá trị                                                          | Văn bản in ra                     |
| ---------------------------------------------------------------- | --------------------------------- |
| `foo` là `NaN` hoặc không phải `1`, `2`, `3`, `4`, `5`, hoặc `0` | Please pick a number from 0 to 5! |
| `0`                                                              | Output: So What Is Your Name?     |
| `1`                                                              | Output: What Is Your Name?        |
| `2`                                                              | Output: Your Name?                |
| `3`                                                              | Output: Name?                     |
| `4`                                                              | Output: ?                         |
| `5`                                                              | Output: !                         |

### Thay thế cho chuỗi if...else

Đôi khi bạn thấy mình thực hiện một loạt các so khớp [`if...else`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else).

```js
if ("fetch" in globalThis) {
  // Fetch a resource with fetch
} else if ("XMLHttpRequest" in globalThis) {
  // Fetch a resource with XMLHttpRequest
} else {
  // Fetch a resource with some custom AJAX logic
}
```

Pattern này không thực hiện một chuỗi các phép so sánh `===`, nhưng bạn vẫn có thể chuyển đổi nó sang cấu trúc `switch`.

```js
switch (true) {
  case "fetch" in globalThis:
    // Fetch a resource with fetch
    break;
  case "XMLHttpRequest" in globalThis:
    // Fetch a resource with XMLHttpRequest
    break;
  default:
    // Fetch a resource with some custom AJAX logic
    break;
}
```

Pattern `switch (true)` như một sự thay thế cho `if...else` đặc biệt hữu ích nếu bạn muốn sử dụng hành vi fall-through.

```js
switch (true) {
  case isSquare(shape):
    console.log("This shape is a square.");
  // Fall-through, since a square is a rectangle as well!
  case isRectangle(shape):
    console.log("This shape is a rectangle.");
  case isQuadrilateral(shape):
    console.log("This shape is a quadrilateral.");
    break;
  case isCircle(shape):
    console.log("This shape is a circle.");
    break;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/if...else", "if...else")}}
