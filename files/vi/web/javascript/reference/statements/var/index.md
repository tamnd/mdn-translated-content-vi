---
title: var
slug: Web/JavaScript/Reference/Statements/var
page-type: javascript-statement
browser-compat: javascript.statements.var
sidebar: jssidebar
---

Câu lệnh **`var`** khai báo biến có phạm vi function hoặc phạm vi toàn cục, với tùy chọn khởi tạo giá trị ban đầu.

{{InteractiveExample("JavaScript Demo: var statement")}}

```js interactive-example
var x = 1;

if (x === 1) {
  var x = 2;

  console.log(x);
  // Expected output: 2
}

console.log(x);
// Expected output: 2
```

## Cú pháp

```js-nolint
var name1;
var name1 = value1;
var name1 = value1, name2 = value2;
var name1, name2 = value2;
var name1 = value1, name2, /* …, */ nameN = valueN;
```

- `nameN`
  - : Tên của biến cần khai báo. Mỗi tên phải là một [định danh](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) JavaScript hợp lệ hoặc một [mẫu binding destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).
- `valueN` {{optional_inline}}
  - : Giá trị khởi tạo của biến. Có thể là bất kỳ biểu thức hợp lệ nào. Giá trị mặc định là `undefined`.

## Mô tả

Phạm vi của biến được khai báo bằng `var` là một trong các cú pháp có cặp dấu ngoặc nhọn gần nhất chứa câu lệnh `var`:

- Thân hàm
- [Khối khởi tạo tĩnh](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks)

Hoặc nếu không có trường hợp nào ở trên áp dụng:

- [Module](/en-US/docs/Web/JavaScript/Guide/Modules) hiện tại, đối với code chạy ở chế độ module
- Phạm vi toàn cục, đối với code chạy ở chế độ script.

```js
function foo() {
  var x = 1;
  function bar() {
    var y = 2;
    console.log(x); // 1 (function `bar` closes over `x`)
    console.log(y); // 2 (`y` is in scope)
  }
  bar();
  console.log(x); // 1 (`x` is in scope)
  console.log(y); // ReferenceError, `y` is scoped to `bar`
}

foo();
```

Quan trọng là, các cấu trúc block khác, bao gồm [câu lệnh block](/en-US/docs/Web/JavaScript/Reference/Statements/block), {{jsxref("Statements/try...catch", "try...catch")}}, {{jsxref("Statements/switch", "switch")}}, phần header của [một trong các câu lệnh `for`](/en-US/docs/Web/JavaScript/Reference/Statements#iterations), đều không tạo phạm vi cho `var`, và các biến được khai báo bằng `var` bên trong các block đó vẫn có thể được tham chiếu bên ngoài block.

```js
for (var a of [1, 2, 3]);
console.log(a); // 3
```

Trong một script, biến được khai báo bằng `var` được thêm vào như một thuộc tính không thể cấu hình của đối tượng toàn cục. Điều này có nghĩa là bộ mô tả thuộc tính của nó không thể thay đổi và không thể bị xóa bằng {{jsxref("Operators/delete", "delete")}}. JavaScript có quản lý bộ nhớ tự động, và sẽ không có ý nghĩa gì khi sử dụng toán tử `delete` trên một biến toàn cục.

```js-nolint example-bad
"use strict";
var x = 1;
Object.hasOwn(globalThis, "x"); // true
delete globalThis.x; // TypeError in strict mode. Fails silently otherwise.
delete x; // SyntaxError in strict mode. Fails silently otherwise.
```

Trong cả hai module NodeJS [CommonJS](https://wiki.commonjs.org/wiki/CommonJS) và module [ECMAScript](/en-US/docs/Web/JavaScript/Guide/Modules) native, khai báo biến cấp cao nhất được giới hạn trong phạm vi module, và không được thêm vào như thuộc tính của đối tượng toàn cục.

Danh sách theo sau từ khóa `var` được gọi là _danh sách {{Glossary("binding")}}_ và được phân tách bằng dấu phẩy, trong đó các dấu phẩy _không phải_ là [toán tử dấu phẩy](/en-US/docs/Web/JavaScript/Reference/Operators/Comma_operator) và các dấu `=` _không phải_ là [toán tử gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment). Các trình khởi tạo của biến sau có thể tham chiếu đến các biến trước đó trong danh sách và nhận được giá trị đã khởi tạo.

### Hoisting

Các khai báo `var`, dù xuất hiện ở bất cứ đâu trong một script, đều được xử lý trước khi bất kỳ code nào trong script đó được thực thi. Khai báo biến ở bất kỳ đâu trong code tương đương với việc khai báo nó ở đầu. Điều này cũng có nghĩa là biến có thể xuất hiện như đang được sử dụng trước khi nó được khai báo. Hành vi này được gọi là [_hoisting_](/en-US/docs/Glossary/Hoisting), vì có vẻ như khai báo biến được di chuyển lên đầu function, khối khởi tạo tĩnh, hoặc nguồn script mà nó xuất hiện.

> [!NOTE]
> Các khai báo `var` chỉ được hoisted lên đầu script hiện tại. Nếu bạn có hai phần tử `<script>` trong một HTML, script đầu tiên không thể truy cập các biến được khai báo bởi script thứ hai trước khi script thứ hai được xử lý và thực thi.

```js
bla = 2;
var bla;
```

Điều này được hiểu ngầm là:

```js
var bla;
bla = 2;
```

Vì lý do đó, khuyến nghị luôn khai báo biến ở đầu phạm vi của chúng (đầu code toàn cục và đầu code function) để rõ ràng biến nào thuộc phạm vi của function hiện tại.

Chỉ có khai báo của biến được hoisted, không phải khởi tạo của nó. Việc khởi tạo chỉ xảy ra khi câu lệnh gán được thực thi. Cho đến lúc đó, biến vẫn là `undefined` (nhưng đã được khai báo):

```js
function doSomething() {
  console.log(bar); // undefined
  var bar = 111;
  console.log(bar); // 111
}
```

Điều này được hiểu ngầm là:

```js
function doSomething() {
  var bar;
  console.log(bar); // undefined
  bar = 111;
  console.log(bar); // 111
}
```

### Khai báo lại

Các khai báo biến trùng lặp sử dụng `var` sẽ không gây ra lỗi, ngay cả trong strict mode, và biến sẽ không mất giá trị của nó, trừ khi khai báo có một trình khởi tạo.

```js
var a = 1;
var a = 2;
console.log(a); // 2
var a;
console.log(a); // 2; not undefined
```

Khai báo `var` cũng có thể ở cùng phạm vi với khai báo `function`. Trong trường hợp này, trình khởi tạo của khai báo `var` luôn ghi đè giá trị của function, bất kể vị trí tương đối của chúng. Điều này là vì khai báo function được hoisted trước khi bất kỳ trình khởi tạo nào được đánh giá, do đó trình khởi tạo đến sau và ghi đè giá trị.

```js
var a = 1;
function a() {}
console.log(a); // 1
```

Khai báo `var` không thể ở cùng phạm vi với khai báo {{jsxref("Statements/let", "let")}}, {{jsxref("Statements/const", "const")}}, {{jsxref("Statements/class", "class")}}, hoặc {{jsxref("Statements/import", "import")}}.

```js-nolint example-bad
var a = 1;
let a = 2; // SyntaxError: Identifier 'a' has already been declared
```

Vì khai báo `var` không được giới hạn trong các block, điều này cũng áp dụng cho trường hợp sau:

```js-nolint example-bad
let a = 1;
{
  var a = 1; // SyntaxError: Identifier 'a' has already been declared
}
```

Nó không áp dụng cho trường hợp sau, trong đó `let` ở trong phạm vi con của `var`, không phải cùng phạm vi:

```js example-good
var a = 1;
{
  let a = 2;
}
```

Khai báo `var` trong thân function có thể có cùng tên với một tham số.

```js
function foo(a) {
  var a = 1;
  console.log(a);
}

foo(2); // Logs 1
```

Khai báo `var` trong một block `catch` có thể có cùng tên với định danh ràng buộc `catch`, nhưng chỉ khi binding của `catch` là một định danh đơn giản, không phải mẫu destructuring. Đây là một [cú pháp không còn được khuyến nghị](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#statements) và bạn không nên dựa vào nó. Trong trường hợp này, khai báo được hoisted ra ngoài block `catch`, nhưng bất kỳ giá trị nào được gán trong block `catch` đều không hiển thị bên ngoài.

```js-nolint example-bad
try {
  throw new Error();
} catch (e) {
  var e = 2; // Works
}
console.log(e); // undefined
```

## Ví dụ

### Khai báo và khởi tạo hai biến

```js
var a = 0,
  b = 0;
```

### Gán hai biến với một giá trị chuỗi đơn

```js
var a = "A";
var b = a;
```

Điều này tương đương với:

```js-nolint
var a, b = a = "A";
```

Lưu ý thứ tự:

```js
var x = y,
  y = "A";
console.log(x, y); // undefined A
```

Ở đây, `x` và `y` được khai báo trước khi bất kỳ code nào được thực thi, nhưng các phép gán xảy ra sau. Tại thời điểm `x = y` được đánh giá, `y` tồn tại nên không có `ReferenceError` nào được ném và giá trị của nó là `undefined`. Vì vậy, `x` được gán giá trị undefined. Sau đó, `y` được gán giá trị `"A"`.

### Khởi tạo nhiều biến

Hãy cẩn thận với cú pháp `var x = y = 1` — `y` thực ra không được khai báo là biến, vì vậy `y = 1` là một [phép gán định danh không đủ điều kiện](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment#unqualified_identifier_assignment), tạo ra một biến toàn cục trong non-strict mode.

```js-nolint
var x = 0;
function f() {
  var x = y = 1; // Declares x locally; declares y globally.
}
f();

console.log(x, y); // 0 1

// In non-strict mode:
// x is the global one as expected;
// y is leaked outside of the function, though!
```

Ví dụ tương tự như trên nhưng với strict mode:

```js-nolint
"use strict";

var x = 0;
function f() {
  var x = y = 1; // ReferenceError: y is not defined
}
f();

console.log(x, y);
```

### Biến toàn cục ngầm và phạm vi function bên ngoài

Các biến có vẻ là toàn cục ngầm có thể là tham chiếu đến các biến trong phạm vi function bên ngoài:

```js
var x = 0; // Declares x within file scope, then assigns it a value of 0.

console.log(typeof z); // "undefined", since z doesn't exist yet

function a() {
  var y = 2; // Declares y within scope of function a, then assigns it a value of 2.

  console.log(x, y); // 0 2

  function b() {
    x = 3; // Assigns 3 to existing file scoped x.
    y = 4; // Assigns 4 to existing outer y.
    z = 5; // Creates a new global variable z, and assigns it a value of 5.
    // (Throws a ReferenceError in strict mode.)
  }

  b(); // Creates z as a global variable.
  console.log(x, y, z); // 3 4 5
}

a(); // Also calls b.
console.log(x, z); // 3 5
console.log(typeof y); // "undefined", as y is local to function a
```

### Khai báo với destructuring

Vế trái của mỗi `=` cũng có thể là một mẫu binding. Điều này cho phép tạo nhiều biến cùng một lúc.

```js
const result = /(a+)(b+)(c+)/.exec("aaabcc");
var [, a, b, c] = result;
console.log(a, b, c); // "aaa" "b" "cc"
```

Để biết thêm thông tin, xem [Destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/let", "let")}}
- {{jsxref("Statements/const", "const")}}
