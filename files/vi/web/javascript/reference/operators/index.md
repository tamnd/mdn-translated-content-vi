---
title: Expressions and operators
slug: Web/JavaScript/Reference/Operators
page-type: landing-page
browser-compat: javascript.operators
sidebar: jssidebar
---

Chương này ghi lại tất cả các toán tử, biểu thức và từ khóa của ngôn ngữ JavaScript.

## Biểu thức và toán tử theo danh mục

Để xem danh sách theo bảng chữ cái, hãy xem thanh bên bên trái.

### Biểu thức cơ bản

Các từ khóa cơ bản và biểu thức chung trong JavaScript. Các biểu thức này có độ ưu tiên cao nhất (cao hơn [toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence)).

- {{jsxref("Operators/this", "this")}}
  - : Từ khóa `this` đề cập đến một thuộc tính đặc biệt của execution context.
- [Literals](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#literals)
  - : Các literal `null`, boolean, number và string cơ bản.
- {{jsxref("Array", "[]")}}
  - : Cú pháp khởi tạo/literal array.
- {{jsxref("Operators/Object_initializer", "{}")}}
  - : Cú pháp khởi tạo/literal object.
- {{jsxref("Operators/function", "function")}}
  - : Từ khóa `function` định nghĩa một function expression.
- {{jsxref("Operators/class", "class")}}
  - : Từ khóa `class` định nghĩa một class expression.
- {{jsxref("Operators/function*", "function*")}}
  - : Từ khóa `function*` định nghĩa một generator function expression.
- {{jsxref("Operators/async_function", "async function")}}
  - : `async function` định nghĩa một async function expression.
- {{jsxref("Operators/async_function*", "async function*")}}
  - : Các từ khóa `async function*` định nghĩa một async generator function expression.
- {{jsxref("RegExp", "/ab+c/i")}}
  - : Cú pháp literal biểu thức chính quy.
- {{jsxref("Template_literals", "`string`")}}
  - : Cú pháp template literal.
- {{jsxref("Operators/Grouping", "( )")}}
  - : Toán tử nhóm.

### Biểu thức vế trái

Giá trị vế trái là đích của một phép gán.

- {{jsxref("Operators/Property_accessors", "Property accessors", "", 1)}}
  - : Toán tử thành viên cho phép truy cập vào thuộc tính hoặc phương thức của object (`object.property` và `object["property"]`).
- {{jsxref("Operators/Optional_chaining", "?.")}}
  - : Toán tử optional chaining trả về `undefined` thay vì gây ra lỗi nếu một tham chiếu là [nullish](/en-US/docs/Glossary/Nullish) ([`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined)).
- {{jsxref("Operators/new", "new")}}
  - : Toán tử `new` tạo một thể hiện của constructor.
- {{jsxref("Operators/new.target", "new.target")}}
  - : Trong constructor, `new.target` đề cập đến constructor đã được gọi bởi {{jsxref("Operators/new", "new")}}.
- {{jsxref("Operators/import.meta", "import.meta")}}
  - : Một object hiển thị metadata cụ thể theo ngữ cảnh cho một module JavaScript.
- {{jsxref("Operators/super", "super")}}
  - : Từ khóa `super` gọi constructor cha hoặc cho phép truy cập các thuộc tính của object cha.
- {{jsxref("Operators/import", "import()")}}
  - : Cú pháp `import()` cho phép tải một module một cách bất đồng bộ và động vào môi trường có thể không phải là module.

### Tăng và giảm

Các toán tử tăng/giảm hậu tố và tiền tố.

- {{jsxref("Operators/Increment", "A++")}}
  - : Toán tử tăng hậu tố.
- {{jsxref("Operators/Decrement", "A--")}}
  - : Toán tử giảm hậu tố.
- {{jsxref("Operators/Increment", "++A")}}
  - : Toán tử tăng tiền tố.
- {{jsxref("Operators/Decrement", "--A")}}
  - : Toán tử giảm tiền tố.

### Toán tử unary

Một phép toán unary là phép toán chỉ có một toán hạng.

- {{jsxref("Operators/delete", "delete")}}
  - : Toán tử `delete` xóa một thuộc tính khỏi object.
- {{jsxref("Operators/void", "void")}}
  - : Toán tử `void` đánh giá một biểu thức và loại bỏ giá trị trả về của nó.
- {{jsxref("Operators/typeof", "typeof")}}
  - : Toán tử `typeof` xác định kiểu của một object đã cho.
- {{jsxref("Operators/Unary_plus", "+")}}
  - : Toán tử unary plus chuyển đổi toán hạng của nó sang kiểu Number.
- {{jsxref("Operators/Unary_negation", "-")}}
  - : Toán tử unary negation chuyển đổi toán hạng của nó sang kiểu Number rồi phủ định nó.
- {{jsxref("Operators/Bitwise_NOT", "~")}}
  - : Toán tử Bitwise NOT.
- {{jsxref("Operators/Logical_NOT", "!")}}
  - : Toán tử Logical NOT.
- {{jsxref("Operators/await", "await")}}
  - : Tạm dừng và tiếp tục async function và chờ promise được thực hiện/từ chối.

### Toán tử số học

Toán tử số học nhận giá trị số (hoặc literal hoặc biến) làm toán hạng và trả về một giá trị số duy nhất.

- {{jsxref("Operators/Exponentiation", "**")}}
  - : Toán tử lũy thừa.
- {{jsxref("Operators/Multiplication", "*")}}
  - : Toán tử nhân.
- {{jsxref("Operators/Division", "/")}}
  - : Toán tử chia.
- {{jsxref("Operators/Remainder", "%")}}
  - : Toán tử phần dư.
- {{jsxref("Operators/Addition", "+")}} (Plus)
  - : Toán tử cộng.
- {{jsxref("Operators/Subtraction", "-")}}
  - : Toán tử trừ.

### Toán tử quan hệ

Toán tử so sánh so sánh các toán hạng của nó và trả về giá trị boolean dựa trên việc so sánh có đúng không.

- {{jsxref("Operators/Less_than", "&lt;")}} (Less than)
  - : Toán tử nhỏ hơn.
- {{jsxref("Operators/Greater_than", "&gt;")}} (Greater than)
  - : Toán tử lớn hơn.
- {{jsxref("Operators/Less_than_or_equal", "&lt;=")}}
  - : Toán tử nhỏ hơn hoặc bằng.
- {{jsxref("Operators/Greater_than_or_equal", "&gt;=")}}
  - : Toán tử lớn hơn hoặc bằng.
- {{jsxref("Operators/instanceof", "instanceof")}}
  - : Toán tử `instanceof` xác định xem một object có phải là thể hiện của object khác không.
- {{jsxref("Operators/in", "in")}}
  - : Toán tử `in` xác định xem một object có thuộc tính đã cho không.

> [!NOTE]
> `=>` không phải là toán tử, mà là ký hiệu cho [Arrow functions](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).

### Toán tử bằng nhau

Kết quả của việc đánh giá toán tử bằng nhau luôn thuộc kiểu boolean dựa trên việc so sánh có đúng không.

- {{jsxref("Operators/Equality", "==")}}
  - : Toán tử bằng nhau.
- {{jsxref("Operators/Inequality", "!=")}}
  - : Toán tử không bằng nhau.
- {{jsxref("Operators/Strict_equality", "===")}}
  - : Toán tử bằng nhau nghiêm ngặt.
- {{jsxref("Operators/Strict_inequality", "!==")}}
  - : Toán tử không bằng nhau nghiêm ngặt.

### Toán tử dịch chuyển bit

Các phép toán để dịch chuyển tất cả các bit của toán hạng.

- {{jsxref("Operators/Left_shift", "&lt;&lt;")}}
  - : Toán tử dịch trái theo bit.
- {{jsxref("Operators/Right_shift", "&gt;&gt;")}}
  - : Toán tử dịch phải theo bit.
- {{jsxref("Operators/Unsigned_right_shift", "&gt;&gt;&gt;")}}
  - : Toán tử dịch phải không dấu theo bit.

### Toán tử bitwise nhị phân

Toán tử bitwise xử lý toán hạng của chúng như một tập hợp 32 bit (số không và số một) và trả về giá trị số JavaScript tiêu chuẩn.

- {{jsxref("Operators/Bitwise_AND", "&amp;")}}
  - : Bitwise AND.
- {{jsxref("Operators/Bitwise_OR", "|")}}
  - : Bitwise OR.
- {{jsxref("Operators/Bitwise_XOR", "^")}}
  - : Bitwise XOR.

### Toán tử logical nhị phân

Toán tử logical thực hiện các giá trị boolean (logical) và có hành vi [short-circuiting](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence#short-circuiting).

- {{jsxref("Operators/Logical_AND", "&amp;&amp;")}}
  - : Logical AND.
- {{jsxref("Operators/Logical_OR", "||")}}
  - : Logical OR.
- {{jsxref("Operators/Nullish_coalescing", "??")}}
  - : Toán tử Nullish Coalescing.

### Toán tử điều kiện (ternary)

- {{jsxref("Operators/Conditional_operator", "(condition ? ifTrue : ifFalse)")}}
  - : Toán tử điều kiện trả về một trong hai giá trị dựa trên giá trị logic của điều kiện.

### Toán tử gán

Toán tử gán gán một giá trị cho toán hạng bên trái của nó dựa trên giá trị của toán hạng bên phải.

- {{jsxref("Operators/Assignment", "=")}}
  - : Toán tử gán.
- {{jsxref("Operators/Multiplication_assignment", "*=")}}
  - : Gán nhân.
- {{jsxref("Operators/Division_assignment", "/=")}}
  - : Gán chia.
- {{jsxref("Operators/Remainder_assignment", "%=")}}
  - : Gán phần dư.
- {{jsxref("Operators/Addition_assignment", "+=")}}
  - : Gán cộng.
- {{jsxref("Operators/Subtraction_assignment", "-=")}}
  - : Gán trừ.
- {{jsxref("Operators/Left_shift_assignment", "&lt;&lt;=")}}
  - : Gán dịch trái.
- {{jsxref("Operators/Right_shift_assignment", "&gt;&gt;=")}}
  - : Gán dịch phải.
- {{jsxref("Operators/Unsigned_right_shift_assignment", "&gt;&gt;&gt;=")}}
  - : Gán dịch phải không dấu.
- {{jsxref("Operators/Bitwise_AND_assignment", "&amp;=")}}
  - : Gán Bitwise AND.
- {{jsxref("Operators/Bitwise_XOR_assignment", "^=")}}
  - : Gán Bitwise XOR.
- {{jsxref("Operators/Bitwise_OR_assignment", "|=")}}
  - : Gán Bitwise OR.
- {{jsxref("Operators/Exponentiation_assignment", "**=")}}
  - : Gán lũy thừa.
- {{jsxref("Operators/Logical_AND_assignment", "&amp;&amp;=")}}
  - : Gán Logical AND.
- {{jsxref("Operators/Logical_OR_assignment", "||=")}}
  - : Gán Logical OR.
- {{jsxref("Operators/Nullish_coalescing_assignment", "??=")}}
  - : Gán nullish coalescing.
- [`[a, b] = arr`, `{ a, b } = obj`](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring)
  - : Destructuring cho phép bạn gán các thuộc tính của array hoặc object cho biến bằng cú pháp trông tương tự như literal array hoặc object.

### Toán tử yield

- {{jsxref("Operators/yield", "yield")}}
  - : Tạm dừng và tiếp tục generator function.
- {{jsxref("Operators/yield*", "yield*")}}
  - : Ủy quyền cho một generator function khác hoặc iterable object.

### Cú pháp spread

- {{jsxref("Operators/Spread_syntax", "...obj")}}
  - : Cú pháp spread cho phép iterable, chẳng hạn như array hoặc string, được mở rộng ở những nơi mà không hoặc nhiều đối số (cho lời gọi function) hoặc phần tử (cho array literal) được mong đợi. Trong object literal, cú pháp spread liệt kê các thuộc tính của object và thêm các cặp key-value vào object đang được tạo.

### Toán tử dấu phẩy

- {{jsxref("Operators/Comma_operator", ",")}}
  - : Toán tử dấu phẩy cho phép nhiều biểu thức được đánh giá trong một câu lệnh đơn và trả về kết quả của biểu thức cuối cùng.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Operator precedence](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence)
