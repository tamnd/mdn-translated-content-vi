---
title: Expressions and operators
slug: Web/JavaScript/Guide/Expressions_and_operators
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Functions", "Web/JavaScript/Guide/Numbers_and_strings")}}

Chương này mô tả các biểu thức và toán tử của JavaScript, bao gồm gán giá trị, so sánh, số học, bitwise, logic, chuỗi, ternary và nhiều hơn nữa.

Ở mức cao, một _biểu thức_ là một đơn vị code hợp lệ được giải quyết thành một giá trị. Có hai loại biểu thức: những biểu thức có tác dụng phụ (chẳng hạn như gán giá trị) và những biểu thức chỉ đơn thuần _đánh giá_.

Biểu thức `x = 7` là một ví dụ về loại đầu tiên. Biểu thức này sử dụng _toán tử_ `=` để gán giá trị bảy cho biến `x`. Bản thân biểu thức được đánh giá thành `7`.

Biểu thức `3 + 4` là một ví dụ về loại thứ hai. Biểu thức này sử dụng toán tử `+` để cộng `3` và `4` với nhau và tạo ra giá trị `7`. Tuy nhiên, nếu nó không phải là một phần của cấu trúc lớn hơn (ví dụ, một [khai báo biến](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#declarations) như `const z = 3 + 4`), kết quả của nó sẽ bị loại bỏ ngay lập tức — đây thường là lỗi của lập trình viên vì việc đánh giá không tạo ra bất kỳ hiệu ứng nào.

Như các ví dụ trên cũng minh họa, tất cả các biểu thức phức tạp đều được liên kết bởi _toán tử_, chẳng hạn như `=` và `+`. Trong phần này, chúng ta sẽ giới thiệu các toán tử sau:

- [Toán tử gán](#assignment_operators)
- [Toán tử so sánh](#comparison_operators)
- [Toán tử số học](#arithmetic_operators)
- [Toán tử bitwise](#bitwise_operators)
- [Toán tử logic](#logical_operators)
- [Toán tử BigInt](#bigint_operators)
- [Toán tử chuỗi](#string_operators)
- [Toán tử điều kiện (ternary)](#conditional_ternary_operator)
- [Toán tử phẩy](#comma_operator)
- [Toán tử đơn ngôi](#unary_operators)
- [Toán tử quan hệ](#relational_operators)

Các toán tử này liên kết các toán hạng được tạo thành bởi các toán tử có độ ưu tiên cao hơn hoặc một trong các [biểu thức cơ bản](#basic_expressions). Danh sách đầy đủ và chi tiết về toán tử và biểu thức cũng có trong [tài liệu tham khảo](/en-US/docs/Web/JavaScript/Reference/Operators).

_Độ ưu tiên_ của toán tử xác định thứ tự chúng được áp dụng khi đánh giá một biểu thức. Ví dụ:

```js
const x = 1 + 2 * 3;
const y = 2 * 3 + 1;
```

Mặc dù `*` và `+` xuất hiện theo thứ tự khác nhau, cả hai biểu thức đều cho kết quả `7` vì `*` có độ ưu tiên cao hơn `+`, vì vậy biểu thức được liên kết bởi `*` sẽ luôn được đánh giá đầu tiên. Bạn có thể ghi đè độ ưu tiên toán tử bằng cách sử dụng dấu ngoặc đơn (tạo ra một [biểu thức nhóm](#grouping_operator) — biểu thức cơ bản). Để xem bảng độ ưu tiên toán tử đầy đủ cũng như các lưu ý khác nhau, hãy xem trang [Tham khảo Độ ưu tiên Toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence#table).

JavaScript có cả toán tử _nhị phân_ và _đơn ngôi_, và một toán tử ternary đặc biệt, toán tử điều kiện.
Toán tử nhị phân yêu cầu hai toán hạng, một trước toán tử và một sau toán tử:

```plain
operand1 operator operand2
```

Ví dụ, `3 + 4` hoặc `x * y`. Dạng này được gọi là toán tử nhị phân _infix_, vì toán tử được đặt giữa hai toán hạng. Tất cả các toán tử nhị phân trong JavaScript đều là infix.

Toán tử đơn ngôi yêu cầu một toán hạng duy nhất, trước hoặc sau toán tử:

```plain
operator operand
operand operator
```

Ví dụ, `x++` hoặc `++x`. Dạng `operator operand` được gọi là toán tử đơn ngôi _tiền tố_, và dạng `operand operator` được gọi là toán tử đơn ngôi _hậu tố_. `++` và `--` là các toán tử hậu tố duy nhất trong JavaScript — tất cả các toán tử khác, như `!`, `typeof`, v.v. đều là tiền tố.

## Toán tử gán

Toán tử gán gán một giá trị cho toán hạng bên trái dựa trên giá trị của toán hạng bên phải.
Toán tử gán đơn giản là bằng (`=`), gán giá trị của toán hạng bên phải cho toán hạng bên trái.
Tức là `x = f()` là biểu thức gán giá trị của `f()` cho `x`.

Cũng có các toán tử gán kết hợp là viết tắt cho các phép toán được liệt kê trong bảng sau:

| Tên                                                                                                       | Toán tử viết tắt | Ý nghĩa            |
| --------------------------------------------------------------------------------------------------------- | ---------------- | ------------------ |
| [Gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment)                                          | `x = f()`        | `x = f()`          |
| [Gán cộng](/en-US/docs/Web/JavaScript/Reference/Operators/Addition_assignment)                            | `x += f()`       | `x = x + f()`      |
| [Gán trừ](/en-US/docs/Web/JavaScript/Reference/Operators/Subtraction_assignment)                          | `x -= f()`       | `x = x - f()`      |
| [Gán nhân](/en-US/docs/Web/JavaScript/Reference/Operators/Multiplication_assignment)                      | `x *= f()`       | `x = x * f()`      |
| [Gán chia](/en-US/docs/Web/JavaScript/Reference/Operators/Division_assignment)                            | `x /= f()`       | `x = x / f()`      |
| [Gán phần dư](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder_assignment)                        | `x %= f()`       | `x = x % f()`      |
| [Gán lũy thừa](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation_assignment)                  | `x **= f()`      | `x = x ** f()`     |
| [Gán dịch trái](/en-US/docs/Web/JavaScript/Reference/Operators/Left_shift_assignment)                     | `x <<= f()`      | `x = x << f()`     |
| [Gán dịch phải](/en-US/docs/Web/JavaScript/Reference/Operators/Right_shift_assignment)                    | `x >>= f()`      | `x = x >> f()`     |
| [Gán dịch phải không dấu](/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift_assignment) | `x >>>= f()`     | `x = x >>> f()`    |
| [Gán AND bitwise](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_AND_assignment)                  | `x &= f()`       | `x = x & f()`      |
| [Gán XOR bitwise](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_XOR_assignment)                  | `x ^= f()`       | `x = x ^ f()`      |
| [Gán OR bitwise](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_OR_assignment)                    | `x \|= f()`      | `x = x \| f()`     |
| [Gán AND logic](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_AND_assignment)                    | `x &&= f()`      | `x && (x = f())`   |
| [Gán OR logic](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_OR_assignment)                      | `x \|\|= f()`    | `x \|\| (x = f())` |
| [Gán hợp nhất nullish](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_assignment)      | `x ??= f()`      | `x ?? (x = f())`   |

### Gán cho thuộc tính

Nếu một biểu thức được đánh giá thành một [object](/en-US/docs/Web/JavaScript/Guide/Working_with_objects), thì phía bên trái của biểu thức gán có thể thực hiện các phép gán cho thuộc tính của biểu thức đó.
Ví dụ:

```js
const obj = {};

obj.x = 3;
console.log(obj.x); // Prints 3.
console.log(obj); // Prints { x: 3 }.

const key = "y";
obj[key] = 5;
console.log(obj[key]); // Prints 5.
console.log(obj); // Prints { x: 3, y: 5 }.
```

Để biết thêm thông tin về object, hãy đọc [Làm việc với Object](/en-US/docs/Web/JavaScript/Guide/Working_with_objects).

Nếu một biểu thức không được đánh giá thành object, thì các phép gán cho thuộc tính của biểu thức đó sẽ không gán:

```js
const val = 0;
val.x = 3;

console.log(val.x); // Prints undefined.
console.log(val); // Prints 0.
```

Trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode#converting_mistakes_into_errors), code trên sẽ ném lỗi, vì không thể gán thuộc tính cho kiểu nguyên thủy.

Đó là lỗi khi gán giá trị cho các thuộc tính không thể sửa đổi hoặc cho các thuộc tính của biểu thức không có thuộc tính (`null` hoặc `undefined`).

### Destructuring

Đối với các phép gán phức tạp hơn, cú pháp [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) là một biểu thức JavaScript cho phép trích xuất dữ liệu từ mảng hoặc object bằng cú pháp phản ánh cấu trúc của mảng và
object literal.

Không có destructuring, cần nhiều câu lệnh để trích xuất giá trị từ mảng và object:

```js
const foo = ["one", "two", "three"];

const one = foo[0];
const two = foo[1];
const three = foo[2];
```

Với destructuring, bạn có thể trích xuất nhiều giá trị thành các biến riêng biệt bằng một câu lệnh duy nhất:

```js
const [one, two, three] = foo;
```

### Đánh giá và lồng nhau

Nói chung, các phép gán được sử dụng trong khai báo biến (tức là với [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), hoặc [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var)) hoặc như các câu lệnh độc lập.

```js
// Declares a variable x and initializes it to the result of f().
// The result of the x = f() assignment expression is discarded.
let x = f();

x = g(); // Reassigns the variable x to the result of g().
```

Tuy nhiên, giống như các biểu thức khác, các biểu thức gán như `x = f()` đánh giá thành một giá trị kết quả.
Mặc dù giá trị kết quả này thường không được sử dụng, nhưng sau đó nó có thể được sử dụng bởi một biểu thức khác.

Việc xâu chuỗi phép gán hoặc lồng các phép gán trong các biểu thức khác có thể dẫn đến hành vi bất ngờ.
Vì lý do này, một số hướng dẫn phong cách JavaScript [không khuyến khích việc xâu chuỗi hoặc lồng phép gán](https://github.com/airbnb/javascript/blob/master/README.md#variables--no-chain-assignment).
Tuy nhiên, việc xâu chuỗi và lồng phép gán đôi khi có thể xảy ra, vì vậy điều quan trọng là phải hiểu cách chúng hoạt động.

Bằng cách xâu chuỗi hoặc lồng một biểu thức gán, kết quả của nó có thể được gán cho một biến khác.
Nó có thể được ghi log, có thể được đặt bên trong một mảng literal hoặc lời gọi hàm, v.v.

```js-nolint
let x;
const y = (x = f()); // Or equivalently: const y = x = f();
console.log(y); // Logs the return value of the assignment x = f().

console.log(x = f()); // Logs the return value directly.

// An assignment expression can be nested in any place
// where expressions are generally allowed,
// such as array literals' elements or as function calls' arguments.
console.log([0, x = f(), 0]);
console.log(f(0, x = f(), 0));
```

Kết quả đánh giá khớp với biểu thức ở bên phải dấu `=` trong
cột "Ý nghĩa" của bảng trên. Điều đó có nghĩa là `x = f()` đánh giá thành
bất kỳ kết quả nào của `f()`, `x += f()` đánh giá thành tổng kết quả `x + f()`,
`x **= f()` đánh giá thành lũy thừa kết quả `x ** f()`, v.v.

Trong trường hợp các phép gán logic, `x &&= f()`,
`x ||= f()`, và `x ??= f()`, giá trị trả về là giá trị của
phép toán logic không có phép gán, vì vậy lần lượt là `x && f()`,
`x || f()`, và `x ?? f()`.

Khi xâu chuỗi các biểu thức này mà không có dấu ngoặc đơn hoặc các toán tử nhóm khác
như mảng literal, các biểu thức gán được **nhóm từ phải sang trái**
(chúng là [phải kết hợp](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence#precedence_and_associativity)), nhưng chúng được **đánh giá từ trái sang phải**.

Lưu ý rằng, đối với tất cả các toán tử gán ngoài `=` chính nó,
các giá trị kết quả luôn dựa trên giá trị của các toán hạng _trước_
phép toán.

Ví dụ, giả sử rằng các hàm `f` và `g` sau
và các biến `x` và `y` đã được khai báo:

```js
function f() {
  console.log("F!");
  return 2;
}
function g() {
  console.log("G!");
  return 3;
}
let x, y;
```

Xem xét ba ví dụ này:

```js-nolint
y = x = f();
y = [f(), x = g()];
x[f()] = g();
```

#### Ví dụ đánh giá 1

`y = x = f()` tương đương với `y = (x = f())`,
vì toán tử gán `=` là [phải kết hợp](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence#precedence_and_associativity).
Tuy nhiên, nó được đánh giá từ trái sang phải:

1. Biểu thức gán `y = x = f()` bắt đầu đánh giá.
   1. `y` ở phía bên trái của phép gán này đánh giá
      thành một tham chiếu đến biến có tên `y`.
   2. Biểu thức gán `x = f()` bắt đầu đánh giá.
      1. `x` ở phía bên trái của phép gán này đánh giá
         thành một tham chiếu đến biến có tên `x`.
      2. Lời gọi hàm `f()` in "F!" ra console và
         sau đó đánh giá thành số `2`.
      3. Kết quả `2` từ `f()` được gán cho `x`.
   3. Biểu thức gán `x = f()` đã hoàn thành đánh giá;
      kết quả của nó là giá trị mới của `x`, là `2`.
   4. Kết quả `2` đó lần lượt cũng được gán cho `y`.
2. Biểu thức gán `y = x = f()` đã hoàn thành đánh giá;
   kết quả của nó là giá trị mới của `y` — là `2`.
   `x` và `y` được gán thành `2`,
   và console đã in "F!".

#### Ví dụ đánh giá 2

`y = [ f(), x = g() ]` cũng đánh giá từ trái sang phải:

1. Biểu thức gán `y = [ f(), x = g() ]` bắt đầu đánh giá.
   1. `y` ở phía bên trái của phép gán này đánh giá
      thành một tham chiếu đến biến có tên `y`.
   2. Mảng literal bên trong `[ f(), x = g() ]` bắt đầu đánh giá.
      1. Lời gọi hàm `f()` in "F!" ra console và
         sau đó đánh giá thành số `2`.
      2. Biểu thức gán `x = g()` bắt đầu đánh giá.
         1. `x` ở phía bên trái của phép gán này đánh giá
            thành một tham chiếu đến biến có tên `x`.
         2. Lời gọi hàm `g()` in "G!" ra console và
            sau đó đánh giá thành số `3`.
         3. Kết quả `3` từ `g()` được gán cho `x`.
      3. Biểu thức gán `x = g()` đã hoàn thành đánh giá;
         kết quả của nó là giá trị mới của `x`, là `3`.
         Kết quả `3` đó trở thành phần tử tiếp theo
         trong mảng literal bên trong (sau `2` từ `f()`).
   3. Mảng literal bên trong `[ f(), x = g() ]`
      đã hoàn thành đánh giá;
      kết quả của nó là mảng có hai giá trị: `[ 2, 3 ]`.
   4. Mảng `[ 2, 3 ]` đó bây giờ được gán cho `y`.
2. Biểu thức gán `y = [ f(), x = g() ]` đã
   hoàn thành đánh giá;
   kết quả của nó là giá trị mới của `y` — là `[ 2, 3 ]`.
   `x` bây giờ được gán thành `3`,
   `y` bây giờ được gán thành `[ 2, 3 ]`,
   và console đã in "F!" rồi "G!".

#### Ví dụ đánh giá 3

`x[f()] = g()` cũng đánh giá từ trái sang phải.
(Ví dụ này giả sử rằng `x` đã được gán cho một object nào đó.
Để biết thêm thông tin về object, hãy đọc [Làm việc với Object](/en-US/docs/Web/JavaScript/Guide/Working_with_objects).)

1. Biểu thức gán `x[f()] = g()` bắt đầu đánh giá.
   1. Truy cập thuộc tính `x[f()]` ở phía bên trái của phép gán này
      bắt đầu đánh giá.
      1. `x` trong truy cập thuộc tính này đánh giá
         thành một tham chiếu đến biến có tên `x`.
      2. Sau đó lời gọi hàm `f()` in "F!" ra console và
         sau đó đánh giá thành số `2`.
   2. Truy cập thuộc tính `x[f()]` trong phép gán này
      đã hoàn thành đánh giá;
      kết quả của nó là một tham chiếu thuộc tính biến: `x[2]`.
   3. Sau đó lời gọi hàm `g()` in "G!" ra console và
      đánh giá thành số `3`.
   4. `3` đó bây giờ được gán cho `x[2]`.
      (Bước này sẽ thành công chỉ nếu `x` được gán cho một [object](/en-US/docs/Web/JavaScript/Guide/Working_with_objects).)
2. Biểu thức gán `x[f()] = g()` đã hoàn thành đánh giá;
   kết quả của nó là giá trị mới của `x[2]` — là `3`.
   `x[2]` bây giờ được gán thành `3`,
   và console đã in "F!" rồi "G!".

### Tránh xâu chuỗi phép gán

Việc xâu chuỗi phép gán hoặc lồng phép gán trong các biểu thức khác có thể
dẫn đến hành vi bất ngờ. Vì lý do này,
[việc xâu chuỗi phép gán trong cùng một câu lệnh không được khuyến khích](https://github.com/airbnb/javascript/blob/master/README.md#variables--no-chain-assignment).

Đặc biệt, việc đặt chuỗi biến trong câu lệnh [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), hoặc [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var) thường _không_ hoạt động. Chỉ biến ngoài cùng/bên trái nhất mới được khai báo; các biến khác trong chuỗi gán _không_ được khai báo bởi câu lệnh `const`/`let`/`var`.
Ví dụ:

```js-nolint
const z = y = x = f();
```

Câu lệnh này có vẻ như khai báo các biến `x`, `y`, và `z`.
Tuy nhiên, nó thực sự chỉ khai báo biến `z`.
`y` và `x` là các tham chiếu không hợp lệ đến các biến không tồn tại (trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode)) hoặc tệ hơn, sẽ ngầm tạo ra [biến toàn cục](/en-US/docs/Glossary/Global_variable) cho `x` và `y` trong [sloppy mode](/en-US/docs/Glossary/Sloppy_mode).

## Toán tử so sánh

Toán tử so sánh so sánh các toán hạng của nó và trả về một giá trị logic dựa trên việc so sánh có đúng hay không.
Các toán hạng có thể là giá trị số, chuỗi, logic, hoặc [object](/en-US/docs/Web/JavaScript/Guide/Working_with_objects).
Các chuỗi được so sánh dựa trên thứ tự từ điển chuẩn, sử dụng giá trị Unicode.
Trong hầu hết các trường hợp, nếu hai toán hạng không cùng loại, JavaScript cố gắng chuyển đổi chúng sang loại thích hợp để so sánh.
Hành vi này thường dẫn đến việc so sánh các toán hạng dưới dạng số.
Ngoại lệ duy nhất cho việc chuyển đổi kiểu trong so sánh là các toán tử `===` và `!==`, thực hiện so sánh bằng và không bằng nghiêm ngặt.
Các toán tử này không cố gắng chuyển đổi các toán hạng sang các loại tương thích trước khi kiểm tra bằng.
Bảng sau mô tả các toán tử so sánh theo code mẫu này:

```js
const var1 = 3;
const var2 = 4;
```

<table class="standard-table">
  <caption>
    Comparison operators
  </caption>
  <thead>
    <tr>
      <th scope="col">Operator</th>
      <th scope="col">Description</th>
      <th scope="col">Examples returning true</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Equality">Equal</a> (<code>==</code>)
      </td>
      <td>Returns <code>true</code> if the operands are equal.</td>
      <td>
        <code>3 == var1</code>
        <p><code>"3" == var1</code></p>
        <code>3 == '3'</code>
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Inequality">Not equal</a> (<code>!=</code>)
      </td>
      <td>Returns <code>true</code> if the operands are not equal.</td>
      <td>
        <code>var1 != 4<br />var2 != "3"</code>
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality">Strict equal</a> (<code>===</code>)
      </td>
      <td>
        Returns <code>true</code> if the operands are equal and of the same
        type. See also {{jsxref("Object.is")}} and
        <a href="/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness">sameness in JS</a>.
      </td>
      <td><code>3 === var1</code></td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Strict_inequality">Strict not equal</a> (<code>!==</code>)
      </td>
      <td>
        Returns <code>true</code> if the operands are of the same type but not equal, or are of different type.
      </td>
      <td>
        <code>var1 !== "3"<br />3 !== '3'</code>
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Greater_than">Greater than</a> (<code>></code>)
      </td>
      <td>
        Returns <code>true</code> if the left operand is greater than the right operand.
      </td>
      <td>
        <code>var2 > var1<br />"12" > 2</code>
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Greater_than_or_equal">Greater than or equal</a>
        (<code>>=</code>)
      </td>
      <td>
        Returns <code>true</code> if the left operand is greater than or equal to the right operand.
      </td>
      <td>
        <code>var2 >= var1<br />var1 >= 3</code>
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Less_than">Less than</a>
        (<code>&#x3C;</code>)
      </td>
      <td>
        Returns <code>true</code> if the left operand is less than the right operand.
      </td>
      <td>
        <code>var1 &#x3C; var2<br />"2" &#x3C; 12</code>
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Less_than_or_equal">Less than or equal</a>
        (<code>&#x3C;=</code>)
      </td>
      <td>
        Returns <code>true</code> if the left operand is less than or equal to the right operand.
      </td>
      <td>
        <code>var1 &#x3C;= var2<br />var2 &#x3C;= 5</code>
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> `=>` không phải là toán tử so sánh mà là ký hiệu
> cho [Hàm mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).

## Toán tử số học

Toán tử số học nhận các giá trị số (dù là literal hay biến) làm toán hạng và trả về một giá trị số duy nhất.
Các toán tử số học chuẩn là cộng (`+`), trừ (`-`), nhân (`*`), và chia (`/`).
Các toán tử này hoạt động như trong hầu hết các ngôn ngữ lập trình khác khi được sử dụng với số thực dấu phảy động (đặc biệt lưu ý rằng phép chia cho không tạo ra {{jsxref("Infinity")}}). Ví dụ:

```js
1 / 2; // 0.5
1 / 2 === 1.0 / 2.0; // this is true
```

Ngoài các phép toán số học chuẩn (`+`, `-`, `*`, `/`), JavaScript cung cấp các toán tử số học được liệt kê trong bảng sau:

<table class="fullwidth-table">
  <caption>
    Arithmetic operators
  </caption>
  <thead>
    <tr>
      <th scope="col">Operator</th>
      <th scope="col">Description</th>
      <th scope="col">Example</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Remainder">Remainder</a> (<code>%</code>)
      </td>
      <td>
        Binary operator. Returns the integer remainder of dividing the two operands.
      </td>
      <td>12 % 5 returns 2.</td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Increment">Increment</a> (<code>++</code>)
      </td>
      <td>
        Unary operator. Adds one to its operand. If used as a prefix operator
        (<code>++x</code>), returns the value of its operand after adding one;
        if used as a postfix operator (<code>x++</code>), returns the value of
        its operand before adding one.
      </td>
      <td>
        If <code>x</code> is 3, then <code>++x</code> sets <code>x</code> to 4
        and returns 4, whereas <code>x++</code> returns 3 and, only then, sets <code>x</code> to 4.
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Decrement">Decrement</a> (<code>--</code>)
      </td>
      <td>
        Unary operator. Subtracts one from its operand.
        The return value is analogous to that for the increment operator.
      </td>
      <td>
        If <code>x</code> is 3, then <code>--x</code> sets <code>x</code> to 2
        and returns 2, whereas <code>x--</code> returns 3 and, only then, sets <code>x</code> to 2.
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation">Unary negation</a> (<code>-</code>)
      </td>
      <td>Unary operator. Returns the negation of its operand.</td>
      <td>If <code>x</code> is 3, then <code>-x</code> returns -3.</td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus">Unary plus</a> (<code>+</code>)
      </td>
      <td>
        Unary operator. Attempts to <a href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion">convert the operand to a number</a>, if it is not already.
      </td>
      <td>
        <p><code>+"3"</code> returns <code>3</code>.</p>
        <p><code>+true</code> returns <code>1</code>.</p>
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation">Exponentiation operator</a> (<code>**</code>)
      </td>
      <td>
        Calculates the <code>base</code> to the <code>exponent</code> power,
        that is, <code>base^exponent</code>
      </td>
      <td>
        <code>2 ** 3</code> returns <code>8</code>.<br /><code>10 ** -1</code>
        returns <code>0.1</code>.
      </td>
    </tr>
  </tbody>
</table>

## Toán tử bitwise

Toán tử bitwise xử lý các toán hạng của chúng như một tập hợp 32 bit (số không và số một), thay vì
như số thập phân, thập lục phân, hoặc bát phân. Ví dụ, số thập phân chín có
biểu diễn nhị phân là 1001. Toán tử bitwise thực hiện các phép toán của chúng trên các
biểu diễn nhị phân như vậy, nhưng chúng trả về các giá trị số JavaScript chuẩn.

Bảng sau tóm tắt các toán tử bitwise của JavaScript.

| Toán tử                                                                                      | Cách dùng | Mô tả                                                                                                                        |
| -------------------------------------------------------------------------------------------- | --------- | ---------------------------------------------------------------------------------------------------------------------------- |
| [Bitwise AND](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_AND)                    | `a & b`   | Trả về một ở mỗi vị trí bit mà các bit tương ứng của cả hai toán hạng đều là một.                                            |
| [Bitwise OR](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_OR)                      | `a \| b`  | Trả về không ở mỗi vị trí bit mà các bit tương ứng của cả hai toán hạng đều là không.                                        |
| [Bitwise XOR](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_XOR)                    | `a ^ b`   | Trả về không ở mỗi vị trí bit mà các bit tương ứng giống nhau. [Trả về một ở mỗi vị trí bit mà các bit tương ứng khác nhau.] |
| [Bitwise NOT](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_NOT)                    | `~ a`     | Đảo ngược các bit của toán hạng của nó.                                                                                      |
| [Left shift](/en-US/docs/Web/JavaScript/Reference/Operators/Left_shift)                      | `a << b`  | Dịch `a` trong biểu diễn nhị phân `b` bit sang trái, điền các số không vào từ phía phải.                                     |
| [Sign-propagating right shift](/en-US/docs/Web/JavaScript/Reference/Operators/Right_shift)   | `a >> b`  | Dịch `a` trong biểu diễn nhị phân `b` bit sang phải, loại bỏ các bit bị dịch ra.                                             |
| [Zero-fill right shift](/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift) | `a >>> b` | Dịch `a` trong biểu diễn nhị phân `b` bit sang phải, loại bỏ các bit bị dịch ra, và điền các số không vào từ phía trái.      |

### Toán tử logic bitwise

Về mặt khái niệm, các toán tử logic bitwise hoạt động như sau:

- Các toán hạng được chuyển đổi sang số nguyên 32 bit và được biểu diễn bằng một chuỗi bit (số không và số một).
  Các số có hơn 32 bit sẽ bị loại bỏ các bit có nghĩa nhất.
  Ví dụ, số nguyên sau có hơn 32 bit sẽ được chuyển đổi thành số nguyên 32 bit:

  ```plain
  Before: 1110 0110 1111 1010 0000 0000 0000 0110 0000 0000 0001
  After:                 1010 0000 0000 0000 0110 0000 0000 0001
  ```

- Mỗi bit trong toán hạng đầu tiên được ghép đôi với bit tương ứng trong toán hạng thứ hai: bit đầu tiên với bit đầu tiên, bit thứ hai với bit thứ hai, v.v.
- Toán tử được áp dụng cho từng cặp bit, và kết quả được xây dựng theo từng bit.

Ví dụ, biểu diễn nhị phân của chín là 1001, và biểu diễn nhị phân của mười lăm là 1111.
Vì vậy, khi các toán tử bitwise được áp dụng cho các giá trị này, kết quả như sau:

| Biểu thức | Kết quả | Mô tả nhị phân                                    |
| --------- | ------- | ------------------------------------------------- |
| `15 & 9`  | `9`     | `1111 & 1001 = 1001`                              |
| `15 \| 9` | `15`    | `1111 \| 1001 = 1111`                             |
| `15 ^ 9`  | `6`     | `1111 ^ 1001 = 0110`                              |
| `~15`     | `-16`   | `~ 0000 0000 … 0000 1111 = 1111 1111 … 1111 0000` |
| `~9`      | `-10`   | `~ 0000 0000 … 0000 1001 = 1111 1111 … 1111 0110` |

Lưu ý rằng tất cả 32 bit được đảo ngược bằng toán tử Bitwise NOT, và các giá trị có
bit có nghĩa nhất (bit trái nhất) được đặt thành 1 biểu diễn các số âm
(biểu diễn bù hai). `~x` đánh giá thành cùng giá trị mà
`-x - 1` đánh giá thành.

### Toán tử dịch bitwise

Các toán tử dịch bitwise nhận hai toán hạng: toán hạng đầu tiên là lượng cần dịch, và toán hạng thứ hai chỉ định số vị trí bit mà toán hạng đầu tiên cần được
dịch.
Hướng của phép toán dịch được điều khiển bởi toán tử được sử dụng.

Toán tử dịch chuyển đổi các toán hạng của chúng sang số nguyên 32 bit và trả về kết quả có kiểu {{jsxref("Number")}} hoặc {{jsxref("BigInt")}}: cụ thể, nếu kiểu
của toán hạng bên trái là {{jsxref("BigInt")}}, chúng trả về {{jsxref("BigInt")}};
nếu không, chúng trả về {{jsxref("Number")}}.

Các toán tử dịch được liệt kê trong bảng sau.

<table class="fullwidth-table">
  <caption>
    Bitwise shift operators
  </caption>
  <thead>
    <tr>
      <th scope="col">Operator</th>
      <th scope="col">Description</th>
      <th scope="col">Example</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Left_shift">Left shift</a><br />(<code>&#x3C;&#x3C;</code>)
      </td>
      <td>
        This operator shifts the first operand the specified number of bits to
        the left. Excess bits shifted off to the left are discarded. Zero bits
        are shifted in from the right.
      </td>
      <td>
        <code>9&#x3C;&#x3C;2</code> yields 36, because 1001 shifted 2 bits to
        the left becomes 100100, which is 36.
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Right_shift">Sign-propagating right shift</a> (<code>>></code>)
      </td>
      <td>
        This operator shifts the first operand the specified number of bits to
        the right. Excess bits shifted off to the right are discarded. Copies of
        the leftmost bit are shifted in from the left.
      </td>
      <td>
        <code>9>>2</code> yields 2, because 1001 shifted 2 bits to the right
        becomes 10, which is 2. Likewise, <code>-9>>2</code> yields -3, because the sign is preserved.
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift">Zero-fill right shift</a> (<code>>>></code>)
      </td>
      <td>
        This operator shifts the first operand the specified number of bits to
        the right. Excess bits shifted off to the right are discarded. Zero bits
        are shifted in from the left.
      </td>
      <td>
        <code>19>>>2</code> yields 4, because 10011 shifted 2 bits to the right
        becomes 100, which is 4. For non-negative numbers, zero-fill right shift
        and sign-propagating right shift yield the same result.
      </td>
    </tr>
  </tbody>
</table>

## Toán tử logic

Toán tử logic thường được sử dụng với các giá trị Boolean (logic); khi được sử dụng như vậy, chúng trả về giá trị Boolean.
Tuy nhiên, các toán tử `&&`, `||`, và `??` thực sự trả về giá trị của một trong các toán hạng được chỉ định, vì vậy nếu các
toán tử này được sử dụng với các giá trị không phải Boolean, chúng có thể trả về giá trị không phải Boolean. Do đó, chúng được gọi chính xác hơn là "toán tử chọn giá trị".
Các toán tử logic được mô tả trong bảng sau.

<table class="fullwidth-table">
  <caption>
    Logical operators
  </caption>
  <thead>
    <tr>
      <th scope="col">Operator</th>
      <th scope="col">Usage</th>
      <th scope="col">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Logical_AND">Logical AND</a> (<code>&#x26;&#x26;</code>)
      </td>
      <td><code>expr1 &#x26;&#x26; expr2</code></td>
      <td>
        Returns <code>expr1</code> if it can be converted to <code>false</code>;
        otherwise, returns <code>expr2</code>. Thus, when used with Boolean
        values, <code>&#x26;&#x26;</code> returns <code>true</code> if both
        operands are true; otherwise, returns <code>false</code>.
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Logical_OR">Logical OR</a> (<code>||</code>)
      </td>
      <td><code>expr1 || expr2</code></td>
      <td>
        Returns <code>expr1</code> if it can be converted to <code>true</code>;
        otherwise, returns <code>expr2</code>. Thus, when used with Boolean
        values, <code>||</code> returns <code>true</code> if either operand is
        true; if both are false, returns <code>false</code>.
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing">Nullish coalescing operator</a> (<code>??</code>)
      </td>
      <td><code>expr1 ?? expr2</code></td>
      <td>
        Returns <code>expr1</code> if it is neither <code>null</code> nor
        <code>undefined</code>; otherwise, returns <code>expr2</code>.
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Logical_NOT">Logical NOT</a> (<code>!</code>)
      </td>
      <td><code>!expr</code></td>
      <td>
        Returns <code>false</code> if its single operand can be converted
        to <code>true</code>; otherwise, returns <code>true</code>.
      </td>
    </tr>
  </tbody>
</table>

Ví dụ về các biểu thức có thể được chuyển đổi thành `false` là những biểu thức đánh giá thành `null`, `0`, `0n`, `NaN`, chuỗi rỗng (`""`), hoặc `undefined`.

Đoạn code sau hiển thị các ví dụ về toán tử `&&` (AND logic).

```js
const a1 = true && true; // t && t returns true
const a2 = true && false; // t && f returns false
const a3 = false && true; // f && t returns false
const a4 = false && 3 === 4; // f && f returns false
const a5 = "Cat" && "Dog"; // t && t returns Dog
const a6 = false && "Cat"; // f && t returns false
const a7 = "Cat" && false; // t && f returns false
```

Đoạn code sau hiển thị các ví dụ về toán tử `||` (OR logic).

```js
const o1 = true || true; // t || t returns true
const o2 = false || true; // f || t returns true
const o3 = true || false; // t || f returns true
const o4 = false || 3 === 4; // f || f returns false
const o5 = "Cat" || "Dog"; // t || t returns Cat
const o6 = false || "Cat"; // f || t returns Cat
const o7 = "Cat" || false; // t || f returns Cat
```

Đoạn code sau hiển thị các ví dụ về toán tử `??` (hợp nhất nullish).

```js
const n1 = null ?? 1; // 1
const n2 = undefined ?? 2; // 2
const n3 = false ?? 3; // false
const n4 = 0 ?? 4; // 0
```

Lưu ý cách `??` hoạt động giống như `||`, nhưng nó chỉ trả về biểu thức thứ hai khi biểu thức đầu tiên là "[nullish](/en-US/docs/Glossary/Nullish)", tức là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined). `??` là lựa chọn tốt hơn so với `||` để đặt giá trị mặc định cho các giá trị có thể là `null` hoặc `undefined`, đặc biệt khi các giá trị như `''` hoặc `0` là giá trị hợp lệ và giá trị mặc định không nên áp dụng.

Đoạn code sau hiển thị các ví dụ về toán tử `!` (NOT logic).

```js
const n1 = !true; // !t returns false
const n2 = !false; // !f returns true
const n3 = !"Cat"; // !t returns false
```

### Đánh giá rút gọn

Khi các biểu thức logic được đánh giá từ trái sang phải, chúng được kiểm tra xem có thể
đánh giá "rút gọn" hay không bằng cách sử dụng các quy tắc sau:

- `falsy && anything` được đánh giá rút gọn thành giá trị falsy.
- `truthy || anything` được đánh giá rút gọn thành giá trị truthy.
- `nonNullish ?? anything` được đánh giá rút gọn thành giá trị non-nullish.

Các quy tắc logic đảm bảo rằng các đánh giá này luôn đúng. Lưu ý rằng phần
_anything_ của các biểu thức trên không được đánh giá, vì vậy mọi tác dụng phụ của
việc thực hiện đó sẽ không có hiệu lực.

## Toán tử BigInt

Hầu hết các toán tử có thể được sử dụng giữa các số cũng có thể được sử dụng giữa các giá trị [`BigInt`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt).

```js
// BigInt addition
const a = 1n + 2n; // 3n
// Division with BigInts round towards zero
const b = 1n / 2n; // 0n
// Bitwise operations with BigInts do not truncate either side
const c = 40000000000000000n >> 2n; // 10000000000000000n
```

Một ngoại lệ là [dịch phải không dấu (`>>>`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift), không được định nghĩa cho các giá trị BigInt. Điều này là vì BigInt không có độ rộng cố định, vì vậy về mặt kỹ thuật nó không có "bit cao nhất".

```js
const d = 8n >>> 2n; // TypeError: BigInts have no unsigned right shift, use >> instead
```

BigInt và số không thể thay thế nhau — bạn không thể kết hợp chúng trong các phép tính.

```js example-bad
const a = 1n + 2; // TypeError: Cannot mix BigInt and other types
```

Điều này là vì BigInt không phải là tập con hay siêu tập của số. BigInt có độ chính xác cao hơn số khi biểu diễn các số nguyên lớn, nhưng không thể biểu diễn các số thập phân, vì vậy chuyển đổi ngầm định ở bất kỳ phía nào có thể mất độ chính xác. Sử dụng chuyển đổi rõ ràng để chỉ ra bạn muốn phép toán là phép toán số hay BigInt.

```js example-good
const a = Number(1n) + 2; // 3
const b = 1n + BigInt(2); // 3n
```

Bạn có thể so sánh BigInt với số.

```js
const a = 1n > 2; // false
const b = 3 > 2n; // true
```

## Toán tử chuỗi

Ngoài các toán tử so sánh, có thể được sử dụng trên các giá trị chuỗi, toán tử nối (+) nối hai giá trị chuỗi với nhau, trả về một chuỗi khác là sự kết hợp của hai chuỗi toán hạng.

Ví dụ,

```js
console.log("my " + "string"); // console logs the string "my string".
```

Toán tử gán viết tắt `+=` cũng có thể được sử dụng để nối chuỗi.

Ví dụ,

```js
let myString = "alpha";
myString += "bet"; // evaluates to "alphabet" and assigns this value to myString.
```

## Toán tử điều kiện (ternary)

[Toán tử điều kiện](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator)
là toán tử JavaScript duy nhất nhận ba toán hạng.
Toán tử có thể có một trong hai giá trị dựa trên một điều kiện.
Cú pháp là:

```js-nolint
condition ? val1 : val2
```

Nếu `condition` là true, toán tử có giá trị của `val1`.
Nếu không, nó có giá trị của `val2`. Bạn có thể sử dụng toán tử điều kiện ở bất kỳ đâu bạn sẽ sử dụng toán tử tiêu chuẩn.

Ví dụ,

```js
const status = age >= 18 ? "adult" : "minor";
```

Câu lệnh này gán giá trị "adult" cho biến `status` nếu
`age` là mười tám trở lên. Ngược lại, nó gán giá trị "minor" cho
`status`.

## Toán tử phẩy

[Toán tử phẩy](/en-US/docs/Web/JavaScript/Reference/Operators/Comma_operator) (`,`)
đánh giá cả hai toán hạng của nó và trả về giá trị của toán hạng cuối cùng.
Toán tử này chủ yếu được sử dụng bên trong vòng lặp `for`, để cho phép nhiều biến được cập nhật mỗi lần qua vòng lặp.
Nó được coi là phong cách xấu khi sử dụng nó ở nơi khác, khi không cần thiết.
Thường hai câu lệnh riêng biệt có thể và nên được sử dụng thay thế.

Ví dụ, nếu `a` là mảng hai chiều với 10 phần tử mỗi chiều, đoạn code sau sử dụng toán tử phẩy để cập nhật hai biến cùng một lúc.
Code in các giá trị của các phần tử đường chéo trong mảng:

```js
const x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
const a = [x, x, x, x, x];

for (let i = 0, j = 9; i <= j; i++, j--) {
  //                              ^
  console.log(`a[${i}][${j}]= ${a[i][j]}`);
}
```

## Toán tử đơn ngôi

Phép toán đơn ngôi là phép toán chỉ có một toán hạng.

### delete

Toán tử [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete) xóa thuộc tính của một object.
Cú pháp là:

```js
delete object.property;
delete object[propertyKey];
delete objectName[index];
```

trong đó `object` là tên của object, `property` là thuộc tính hiện có, và `propertyKey` là chuỗi hoặc symbol tham chiếu đến thuộc tính hiện có.

Nếu toán tử `delete` thành công, nó xóa thuộc tính khỏi object.
Việc cố gắng truy cập nó sau đó sẽ trả về `undefined`.
Toán tử `delete` trả về `true` nếu thao tác có thể thực hiện; nó trả về `false` nếu thao tác không thể thực hiện.

```js
delete Math.PI; // returns false (cannot delete non-configurable properties)

const myObj = { h: 4 };
delete myObj.h; // returns true (can delete user-defined properties)
```

#### Xóa phần tử mảng

Vì mảng chỉ là object, về mặt kỹ thuật có thể `delete` các phần tử từ chúng.
Tuy nhiên, điều này được coi là thực hành xấu — hãy cố tránh điều đó.
Khi bạn xóa thuộc tính mảng, độ dài mảng không bị ảnh hưởng và các phần tử khác không được đánh lại chỉ mục.
Để đạt được hành vi đó, tốt hơn nhiều là chỉ ghi đè phần tử với giá trị `undefined`.
Để thực sự thao tác mảng, hãy sử dụng các phương thức mảng khác nhau như [`splice`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice).

### typeof

[Toán tử `typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof) trả về một chuỗi chỉ ra kiểu của toán hạng chưa được đánh giá.
`operand` là chuỗi, biến, từ khóa, hoặc object mà kiểu của nó cần được trả về.
Dấu ngoặc đơn là tùy chọn.

Giả sử bạn định nghĩa các biến sau:

```js
const myFun = () => 5 + 2;
const shape = "round";
const size = 1;
const foo = ["Apple", "Mango", "Orange"];
const today = new Date();
```

Toán tử `typeof` trả về các kết quả sau cho các biến này:

```js
typeof myFun; // returns "function"
typeof shape; // returns "string"
typeof size; // returns "number"
typeof foo; // returns "object"
typeof today; // returns "object"
typeof doesntExist; // returns "undefined"
```

Đối với các từ khóa `true` và `null`, toán tử `typeof`
trả về các kết quả sau:

```js
typeof true; // returns "boolean"
typeof null; // returns "object"
```

Đối với số hoặc chuỗi, toán tử `typeof` trả về các kết quả sau:

```js
typeof 62; // returns "number"
typeof "Hello world"; // returns "string"
```

Đối với các giá trị thuộc tính, toán tử `typeof` trả về kiểu giá trị mà
thuộc tính chứa:

```js
typeof document.lastModified; // returns "string"
typeof window.length; // returns "number"
typeof Math.LN2; // returns "number"
```

Đối với các phương thức và hàm, toán tử `typeof` trả về kết quả như sau:

```js
typeof blur; // returns "function"
typeof parseInt; // returns "function"
typeof shape.split; // returns "function"
```

Đối với các object được xây dựng sẵn, toán tử `typeof` trả về kết quả như sau:

```js
typeof Date; // returns "function"
typeof Function; // returns "function"
typeof Math; // returns "object"
typeof Option; // returns "function"
typeof String; // returns "function"
```

### void

[Toán tử `void`](/en-US/docs/Web/JavaScript/Reference/Operators/void) chỉ định một biểu thức cần được đánh giá mà không trả về giá trị. `expression` là biểu thức JavaScript cần đánh giá.
Dấu ngoặc đơn bao quanh biểu thức là tùy chọn, nhưng nên sử dụng chúng để tránh các vấn đề về độ ưu tiên.

## Toán tử quan hệ

Toán tử quan hệ so sánh các toán hạng của nó và trả về giá trị Boolean dựa trên việc so sánh có đúng hay không.

### in

[Toán tử `in`](/en-US/docs/Web/JavaScript/Reference/Operators/in) trả về `true` nếu thuộc tính được chỉ định có trong object được chỉ định.
Cú pháp là:

```js-nolint
propNameOrNumber in objectName
```

trong đó `propNameOrNumber` là chuỗi, số, hoặc biểu thức symbol biểu diễn tên thuộc tính hoặc chỉ mục mảng, và `objectName` là tên của object.

Các ví dụ sau hiển thị một số cách sử dụng của toán tử `in`.

```js
// Arrays
const trees = ["redwood", "bay", "cedar", "oak", "maple"];
0 in trees; // returns true
3 in trees; // returns true
6 in trees; // returns false
"bay" in trees; // returns false
// (you must specify the index number, not the value at that index)
"length" in trees; // returns true (length is an Array property)

// built-in objects
"PI" in Math; // returns true
const myString = new String("coral");
"length" in myString; // returns true

// Custom objects
const myCar = { make: "Honda", model: "Accord", year: 1998 };
"make" in myCar; // returns true
"model" in myCar; // returns true
```

### instanceof

[Toán tử `instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) trả về `true`
nếu object được chỉ định là kiểu object được chỉ định. Cú pháp là:

```js-nolint
object instanceof objectType
```

trong đó `object` là object cần kiểm tra so với `objectType`, và `objectType` là constructor biểu diễn một kiểu, chẳng hạn như {{jsxref("Map")}} hoặc {{jsxref("Array")}}.

Sử dụng `instanceof` khi bạn cần xác nhận kiểu của object trong lúc chạy.
Ví dụ, khi bắt ngoại lệ, bạn có thể phân nhánh sang code xử lý ngoại lệ khác nhau tùy thuộc vào kiểu ngoại lệ được ném ra.

Ví dụ, đoạn code sau sử dụng `instanceof` để xác định xem `obj` có phải là object `Map` không. Vì `obj` là object `Map`, các câu lệnh bên trong khối `if` sẽ thực thi.

```js
const obj = new Map();
if (obj instanceof Map) {
  // statements to execute
}
```

## Biểu thức cơ bản

Tất cả các toán tử cuối cùng đều hoạt động trên một hoặc nhiều biểu thức cơ bản. Các biểu thức cơ bản này bao gồm [định danh](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#declarations) và [literal](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#literals), nhưng cũng có một vài loại khác. Chúng được giới thiệu ngắn gọn dưới đây, và ngữ nghĩa của chúng được mô tả chi tiết trong các phần tham khảo tương ứng.

### this

[Từ khóa `this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) thường được sử dụng trong một hàm. Nói chung, khi hàm được gắn vào một object như một method, `this` tham chiếu đến object mà method được gọi trên đó. Nó hoạt động như một tham số ẩn được truyền vào hàm. `this` là một biểu thức đánh giá thành object, vì vậy bạn có thể sử dụng tất cả các phép toán object mà chúng tôi đã giới thiệu.

```js
this["propertyName"];
this.propertyName;
doSomething(this);
```

Ví dụ, giả sử một hàm được định nghĩa như sau:

```js
function getFullName() {
  return `${this.firstName} ${this.lastName}`;
}
```

Bây giờ chúng ta có thể gắn hàm này vào một object, và nó sẽ sử dụng các thuộc tính của object đó khi được gọi:

```js
const person1 = {
  firstName: "Chris",
  lastName: "Martin",
};

const person2 = {
  firstName: "Chester",
  lastName: "Bennington",
};

// Attach the same function
person1.getFullName = getFullName;
person2.getFullName = getFullName;

console.log(person1.getFullName()); // "Chris Martin"
console.log(person2.getFullName()); // "Chester Bennington"
```

### Toán tử nhóm

Toán tử nhóm `( )` kiểm soát độ ưu tiên của đánh giá trong
các biểu thức. Ví dụ, bạn có thể ghi đè phép nhân và chia trước, sau đó
cộng và trừ để đánh giá phép cộng trước.

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

### Truy cập thuộc tính

Cú pháp [truy cập thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) lấy các giá trị thuộc tính trên object, sử dụng ký hiệu dấu chấm hoặc ký hiệu ngoặc.

```js
object.property;
object["property"];
```

Hướng dẫn [làm việc với object](/en-US/docs/Web/JavaScript/Guide/Working_with_objects) đi vào chi tiết hơn về các thuộc tính object.

### Optional chaining

Cú pháp [optional chaining](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) (`?.`) thực hiện phép toán được xâu chuỗi trên một object nếu nó được định nghĩa và không phải `null`, và ngược lại rút gọn phép toán và trả về `undefined`.
Điều này cho phép bạn thao tác trên một giá trị có thể là `null` hoặc `undefined` mà không gây ra `TypeError`.

```js
maybeObject?.property;
maybeObject?.[property];
maybeFunction?.();
```

### new

Bạn có thể sử dụng [toán tử `new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) để tạo một instance của kiểu object do người dùng định nghĩa hoặc một trong các kiểu object có sẵn. Sử dụng `new` như sau:

```js
const objectName = new ObjectType(param1, param2, /* …, */ paramN);
```

### super

[Từ khóa `super`](/en-US/docs/Web/JavaScript/Reference/Operators/super) được sử dụng để gọi các hàm trên parent của object.
Nó hữu ích với [class](/en-US/docs/Web/JavaScript/Reference/Classes) để gọi constructor cha, ví dụ.

```js-nolint
super(args); // calls the parent constructor.
super.functionOnParent(args);
```

{{PreviousNext("Web/JavaScript/Guide/Functions", "Web/JavaScript/Guide/Numbers_and_strings")}}
