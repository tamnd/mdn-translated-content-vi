---
title: let
slug: Web/JavaScript/Reference/Statements/let
page-type: javascript-statement
browser-compat: javascript.statements.let
sidebar: jssidebar
---

Khai báo **`let`** khai báo các biến cục bộ có phạm vi block, có thể tái gán, với tùy chọn khởi tạo giá trị ban đầu.

{{InteractiveExample("JavaScript Demo: let declaration")}}

```js interactive-example
let x = 1;

if (x === 1) {
  let x = 2;

  console.log(x);
  // Expected output: 2
}

console.log(x);
// Expected output: 1
```

## Cú pháp

```js-nolint
let name1;
let name1 = value1;
let name1 = value1, name2 = value2;
let name1, name2 = value2;
let name1 = value1, name2, /* …, */ nameN = valueN;
```

### Tham số

- `nameN`
  - : Tên của biến cần khai báo. Mỗi tên phải là một [định danh](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) JavaScript hợp lệ hoặc một [mẫu binding destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).
- `valueN` {{optional_inline}}
  - : Giá trị khởi tạo của biến. Có thể là bất kỳ biểu thức hợp lệ nào. Giá trị mặc định là `undefined`.

## Mô tả

Phạm vi của biến được khai báo bằng `let` là một trong các cú pháp có cặp dấu ngoặc nhọn gần nhất chứa khai báo `let`:

- Câu lệnh [Block](/en-US/docs/Web/JavaScript/Reference/Statements/block)
- Câu lệnh {{jsxref("Statements/switch", "switch")}}
- Câu lệnh {{jsxref("Statements/try...catch", "try...catch")}}
- Thân của [một trong các câu lệnh `for`](/en-US/docs/Web/JavaScript/Reference/Statements#iterations), nếu `let` ở trong header của câu lệnh
- Thân hàm
- [Khối khởi tạo tĩnh](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks)

Hoặc nếu không có trường hợp nào ở trên áp dụng:

- [Module](/en-US/docs/Web/JavaScript/Guide/Modules) hiện tại, đối với code chạy ở chế độ module
- Phạm vi toàn cục, đối với code chạy ở chế độ script.

So với {{jsxref("Statements/var", "var")}}, khai báo `let` có những điểm khác biệt sau:

- Khai báo `let` được giới hạn trong phạm vi cả block lẫn function.
- Khai báo `let` chỉ có thể được truy cập sau khi nơi khai báo được thực thi (xem [temporal dead zone](#temporal_dead_zone_tdz)). Vì lý do này, khai báo `let` thường được xem là [không được hoisted](/en-US/docs/Glossary/Hoisting).
- Khai báo `let` không tạo thuộc tính trên {{jsxref("globalThis")}} khi được khai báo ở cấp cao nhất của script.
- Khai báo `let` không thể được [khai báo lại](#redeclarations) bởi bất kỳ khai báo nào khác trong cùng phạm vi.
- `let` bắt đầu [_khai báo_, không phải _câu lệnh_](/en-US/docs/Web/JavaScript/Reference/Statements#difference_between_statements_and_declarations). Điều đó có nghĩa là bạn không thể sử dụng khai báo `let` đơn lẻ làm thân của một block (điều này hợp lý, vì không có cách nào để truy cập biến).

  ```js-nolint example-bad
  if (true) let a = 1; // SyntaxError: Lexical declaration cannot appear in a single-statement context
  ```

Lưu ý rằng `let` được phép là tên định danh khi được khai báo bằng `var` hoặc `function` trong [non-strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), nhưng bạn nên tránh dùng `let` làm tên định danh để tránh những sự mơ hồ về cú pháp không mong muốn.

Nhiều hướng dẫn phong cách lập trình (bao gồm [của MDN](/en-US/docs/MDN/Writing_guidelines/Code_style_guide/JavaScript#variable_declarations)) khuyến nghị sử dụng {{jsxref("Statements/const", "const")}} thay vì `let` bất cứ khi nào một biến không được tái gán trong phạm vi của nó. Điều này làm rõ ý định rằng kiểu (hoặc giá trị, trong trường hợp primitive) của biến không bao giờ thay đổi. Những người khác có thể ưu tiên `let` cho các non-primitive bị biến đổi.

Danh sách theo sau từ khóa `let` được gọi là _danh sách {{Glossary("binding")}}_ và được phân tách bằng dấu phẩy, trong đó các dấu phẩy _không phải_ là [toán tử dấu phẩy](/en-US/docs/Web/JavaScript/Reference/Operators/Comma_operator) và các dấu `=` _không phải_ là [toán tử gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment). Các trình khởi tạo của biến sau có thể tham chiếu đến các biến trước đó trong danh sách.

### Temporal dead zone (TDZ)

Một biến được khai báo bằng `let`, `const`, hoặc `class` được coi là ở trong "temporal dead zone" (TDZ) từ khi bắt đầu block cho đến khi việc thực thi code đến nơi biến được khai báo và khởi tạo.

Trong khi ở trong TDZ, biến chưa được khởi tạo với giá trị, và bất kỳ nỗ lực truy cập nào vào nó sẽ dẫn đến {{jsxref("ReferenceError")}}. Biến được khởi tạo với giá trị khi quá trình thực thi đến nơi nó được khai báo trong code. Nếu không có giá trị khởi tạo nào được chỉ định với khai báo biến, nó sẽ được khởi tạo với giá trị `undefined`.

Điều này khác với biến {{jsxref("Statements/var", "var", "hoisting")}}, biến này sẽ trả về giá trị `undefined` nếu được truy cập trước khi khai báo. Code dưới đây minh họa kết quả khác nhau khi `let` và `var` được truy cập trong code trước nơi chúng được khai báo.

```js example-bad
{
  // TDZ starts at beginning of scope
  console.log(bar); // "undefined"
  console.log(foo); // ReferenceError: Cannot access 'foo' before initialization
  var bar = 1;
  let foo = 2; // End of TDZ (for foo)
}
```

Thuật ngữ "temporal" được sử dụng vì vùng phụ thuộc vào thứ tự thực thi (thời gian) hơn là thứ tự trong đó code được viết (vị trí). Ví dụ, code dưới đây hoạt động vì, mặc dù function sử dụng biến `let` xuất hiện trước khi biến được khai báo, function đó được _gọi_ bên ngoài TDZ.

```js
{
  // TDZ starts at beginning of scope
  const func = () => console.log(letVar); // OK

  // Within the TDZ letVar access throws `ReferenceError`

  let letVar = 3; // End of TDZ (for letVar)
  func(); // Called outside TDZ!
}
```

Sử dụng toán tử `typeof` cho một biến trong TDZ của nó sẽ ném ra {{jsxref("ReferenceError")}}:

```js example-bad
{
  typeof i; // ReferenceError: Cannot access 'i' before initialization
  let i = 10;
}
```

Điều này khác với việc sử dụng `typeof` cho các biến chưa được khai báo, và các biến có giá trị `undefined`:

```js
console.log(typeof undeclaredVariable); // "undefined"
```

> [!NOTE]
> Khai báo `let` và `const` chỉ được xử lý khi script hiện tại được xử lý. Nếu bạn có hai phần tử `<script>` chạy trong chế độ script trong một HTML, script đầu tiên không bị ràng buộc bởi các hạn chế TDZ cho các biến `let` hoặc `const` cấp cao nhất được khai báo trong script thứ hai, mặc dù nếu bạn khai báo biến `let` hoặc `const` trong script đầu tiên, việc khai báo lại trong script thứ hai sẽ gây ra [lỗi khai báo lại](#redeclarations).

### Khai báo lại

Khai báo `let` không thể ở cùng phạm vi với bất kỳ khai báo nào khác, bao gồm `let`, {{jsxref("Statements/const", "const")}}, {{jsxref("Statements/class", "class")}}, {{jsxref("Statements/function", "function")}}, {{jsxref("Statements/var", "var")}}, và khai báo {{jsxref("Statements/import", "import")}}.

```js-nolint example-bad
{
  let foo;
  let foo; // SyntaxError: Identifier 'foo' has already been declared
}
```

Khai báo `let` trong thân function không thể có cùng tên với một tham số. Khai báo `let` trong block `catch` không thể có cùng tên với định danh ràng buộc `catch`.

```js-nolint example-bad
function foo(a) {
  let a = 1; // SyntaxError: Identifier 'a' has already been declared
}
try {
} catch (e) {
  let e; // SyntaxError: Identifier 'e' has already been declared
}
```

Nếu bạn đang thử nghiệm trong REPL, chẳng hạn như web console của Firefox (**Công cụ** > **Nhà phát triển web** > **Web Console**), và bạn chạy hai khai báo `let` có cùng tên trong hai lần nhập riêng biệt, bạn có thể gặp lỗi khai báo lại tương tự. Xem thêm thảo luận về vấn đề này tại [Firefox bug 1580891](https://bugzil.la/1580891). Chrome console cho phép khai báo lại `let` giữa các lần nhập REPL khác nhau.

Bạn có thể gặp lỗi trong các câu lệnh {{jsxref("Statements/switch", "switch")}} vì chỉ có một block.

```js-nolint example-bad
let x = 1;

switch (x) {
  case 0:
    let foo;
    break;
  case 1:
    let foo; // SyntaxError: Identifier 'foo' has already been declared
    break;
}
```

Để tránh lỗi, hãy bọc mỗi `case` trong một câu lệnh block mới.

```js
let x = 1;

switch (x) {
  case 0: {
    let foo;
    break;
  }
  case 1: {
    let foo;
    break;
  }
}
```

## Ví dụ

### Quy tắc phạm vi

Các biến được khai báo bằng `let` có phạm vi trong block mà chúng được khai báo, cũng như trong bất kỳ block con nào được chứa trong đó. Theo cách này, `let` hoạt động rất giống `var`. Sự khác biệt chính là phạm vi của biến `var` là toàn bộ function bao quanh:

```js
function varTest() {
  var x = 1;
  {
    var x = 2; // same variable!
    console.log(x); // 2
  }
  console.log(x); // 2
}

function letTest() {
  let x = 1;
  {
    let x = 2; // different variable
    console.log(x); // 2
  }
  console.log(x); // 1
}
```

Ở cấp cao nhất của chương trình và function, `let`, không giống `var`, không tạo thuộc tính trên đối tượng toàn cục. Ví dụ:

```js
var x = "global";
let y = "global";
console.log(this.x); // "global"
console.log(this.y); // undefined
```

### TDZ kết hợp với lexical scoping

Code sau đây dẫn đến `ReferenceError` tại dòng được chỉ ra:

```js example-bad
function test() {
  var foo = 33;
  if (foo) {
    let foo = foo + 55; // ReferenceError
  }
}
test();
```

Block `if` được đánh giá vì `var foo` bên ngoài có giá trị. Tuy nhiên, do lexical scoping, giá trị này không khả dụng bên trong block: định danh `foo` _bên trong_ block `if` là `let foo`. Biểu thức `foo + 55` ném ra `ReferenceError` vì quá trình khởi tạo `let foo` chưa hoàn tất — nó vẫn đang trong temporal dead zone.

Hiện tượng này có thể gây nhầm lẫn trong tình huống như sau. Lệnh `let n of n.a` đã ở trong phạm vi của block vòng lặp `for...of`. Vì vậy, định danh `n.a` được phân giải thành thuộc tính `a` của đối tượng `n` nằm trong phần đầu tiên của chính lệnh đó (`let n`). Nó vẫn đang trong temporal dead zone vì câu lệnh khai báo của nó chưa được thực thi và kết thúc.

```js example-bad
function go(n) {
  // n here is defined!
  console.log(n); // { a: [1, 2, 3] }

  for (let n of n.a) {
    //          ^ ReferenceError
    console.log(n);
  }
}

go({ a: [1, 2, 3] });
```

### Các tình huống khác

Khi sử dụng bên trong một block, `let` giới hạn phạm vi của biến trong block đó. Lưu ý sự khác biệt với `var`, có phạm vi bên trong function nơi nó được khai báo.

```js
var a = 1;
var b = 2;

{
  var a = 11; // the scope is global
  let b = 22; // the scope is inside the block

  console.log(a); // 11
  console.log(b); // 22
}

console.log(a); // 11
console.log(b); // 2
```

Tuy nhiên, sự kết hợp của khai báo `var` và `let` dưới đây là {{jsxref("SyntaxError")}} vì `var` không có phạm vi block, dẫn đến chúng ở cùng phạm vi. Điều này dẫn đến khai báo lại biến ngầm định.

```js-nolint example-bad
let x = 1;

{
  var x = 2; // SyntaxError for re-declaration
}
```

### Khai báo với destructuring

Vế trái của mỗi `=` cũng có thể là một mẫu binding. Điều này cho phép tạo nhiều biến cùng một lúc.

```js
const result = /(a+)(b+)(c+)/.exec("aaabcc");
let [, a, b, c] = result;
console.log(a, b, c); // "aaa" "b" "cc"
```

Để biết thêm thông tin, xem [Destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/var", "var")}}
- {{jsxref("Statements/const", "const")}}
- [Hoisting](/en-US/docs/Glossary/Hoisting)
- [ES6 In Depth: `let` and `const`](https://hacks.mozilla.org/2015/07/es6-in-depth-let-and-const/) on hacks.mozilla.org (2015)
- [Breaking changes in `let` and `const` in Firefox 44](https://blog.mozilla.org/addons/2015/10/14/breaking-changes-let-const-firefox-nightly-44/) on blog.mozilla.org (2015)
- [You Don't Know JS: Scope & Closures, Ch.3: Function vs. Block Scope](https://github.com/getify/You-Dont-Know-JS/blob/1st-ed/scope%20%26%20closures/ch3.md) by Kyle Simpson
- [What is the Temporal Dead Zone?](https://stackoverflow.com/questions/33198849/what-is-the-temporal-dead-zone/33198850) on Stack Overflow
- [What is the difference between using `let` and `var`?](https://stackoverflow.com/questions/762011/whats-the-difference-between-using-let-and-var) on Stack Overflow
- [Why was the name 'let' chosen for block-scoped variable declarations in JavaScript?](https://stackoverflow.com/questions/37916940/why-was-the-name-let-chosen-for-block-scoped-variable-declarations-in-javascri) on Stack Overflow
