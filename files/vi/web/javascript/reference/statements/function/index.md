---
title: function
slug: Web/JavaScript/Reference/Statements/function
page-type: javascript-statement
browser-compat: javascript.statements.function
sidebar: jssidebar
---

Khai báo **`function`** tạo một {{Glossary("binding")}} của hàm mới với tên đã cho.

Bạn cũng có thể định nghĩa hàm bằng cách sử dụng [biểu thức `function`](/en-US/docs/Web/JavaScript/Reference/Operators/function).

{{InteractiveExample("JavaScript Demo: function declaration", "shorter")}}

```js interactive-example
function calcRectArea(width, height) {
  return width * height;
}

console.log(calcRectArea(5, 6));
// Expected output: 30
```

## Cú pháp

```js-nolint
function name(param0) {
  statements
}
function name(param0, param1) {
  statements
}
function name(param0, param1, /* …, */ paramN) {
  statements
}
```

### Tham số

- `name`
  - : Tên hàm.
- `param` {{optional_inline}}
  - : Tên tham số hình thức của hàm. Số lượng tham số tối đa khác nhau tùy theo từng engine. Về cú pháp tham số, xem [tham chiếu Functions](/en-US/docs/Web/JavaScript/Guide/Functions#function_parameters).
- `statements` {{optional_inline}}
  - : Các câu lệnh tạo nên thân hàm.

## Mô tả

Khai báo `function` tạo ra một đối tượng {{jsxref("Function")}}. Mỗi lần hàm được gọi, nó trả về giá trị được chỉ định bởi câu lệnh {{jsxref("Statements/return", "return")}} cuối cùng được thực thi, hoặc `undefined` nếu đến cuối thân hàm mà không có câu lệnh return. Xem [functions](/en-US/docs/Web/JavaScript/Reference/Functions) để biết thêm thông tin chi tiết về hàm.

Khai báo `function` hoạt động như sự kết hợp giữa {{jsxref("Statements/var", "var")}} và {{jsxref("Statements/let", "let")}}:

- Giống như `let`, trong chế độ strict, [khai báo hàm có phạm vi là block gần nhất chứa nó](#khai_báo_hàm_ở_cấp_block).
- Giống như `let`, khai báo hàm ở cấp cao nhất của một module hoặc bên trong các block trong chế độ strict không thể bị [khai báo lại](#khai_báo_lại) bởi bất kỳ khai báo nào khác.
- Giống như `var`, khai báo hàm ở cấp cao nhất của một script (strict hay không strict) trở thành thuộc tính của {{jsxref("globalThis")}}. Khai báo hàm ở cấp cao nhất của script hoặc thân hàm (strict hay không strict) có thể bị khai báo lại bởi một `function` hoặc `var` khác.
- Giống cả hai, khai báo hàm có thể được gán lại, nhưng bạn nên tránh làm vậy.
- Khác với cả hai, khai báo hàm được [hoisted](#hoisting) cùng với giá trị của nó và có thể được gọi ở bất kỳ đâu trong phạm vi của nó.

### Khai báo hàm ở cấp block

> [!WARNING]
> Trong [chế độ không strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), khai báo hàm bên trong các block hoạt động một cách kỳ lạ. Chỉ khai báo hàm trong các block khi bạn đang ở chế độ strict.

Hàm có thể được khai báo có điều kiện — nghĩa là, một câu lệnh hàm có thể được lồng bên trong một câu lệnh [`if`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else). Tuy nhiên, trong chế độ không strict, kết quả không nhất quán giữa các implementation.

```js
console.log(
  `'foo' name ${
    "foo" in globalThis ? "is" : "is not"
  } global. typeof foo is ${typeof foo}`,
);
if (false) {
  function foo() {
    return 1;
  }
}

// In Chrome:
// 'foo' name is global. typeof foo is undefined
//
// In Firefox:
// 'foo' name is global. typeof foo is undefined
//
// In Safari:
// 'foo' name is global. typeof foo is function
```

Hiệu ứng phạm vi và hoisting sẽ không thay đổi bất kể thân `if` có thực sự được thực thi hay không.

```js
console.log(
  `'foo' name ${
    "foo" in globalThis ? "is" : "is not"
  } global. typeof foo is ${typeof foo}`,
);
if (true) {
  function foo() {
    return 1;
  }
}

// In Chrome:
// 'foo' name is global. typeof foo is undefined
//
// In Firefox:
// 'foo' name is global. typeof foo is undefined
//
// In Safari:
// 'foo' name is global. typeof foo is function
```

Trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), khai báo hàm ở cấp [block](/en-US/docs/Web/JavaScript/Reference/Statements/block) có phạm vi trong block đó và được hoisted lên đầu block.

```js
"use strict";

{
  foo(); // Logs "foo"
  function foo() {
    console.log("foo");
  }
}

console.log(
  `'foo' name ${
    "foo" in globalThis ? "is" : "is not"
  } global. typeof foo is ${typeof foo}`,
);
// 'foo' name is not global. typeof foo is undefined
```

### Hoisting

Khai báo hàm trong JavaScript được [hoisted](/en-US/docs/Glossary/Hoisting) lên đầu hàm bao ngoài hoặc phạm vi toàn cục. Bạn có thể sử dụng hàm trước khi khai báo nó:

```js
hoisted(); // Logs "foo"

function hoisted() {
  console.log("foo");
}
```

Lưu ý rằng [biểu thức hàm](/en-US/docs/Web/JavaScript/Reference/Operators/function) không được hoisted:

```js
notHoisted(); // TypeError: notHoisted is not a function

var notHoisted = function () {
  console.log("bar");
};
```

### Khai báo lại

Việc khai báo `function` có thể được khai báo lại trong cùng phạm vi hay không phụ thuộc vào phạm vi mà nó nằm trong.

Ở cấp cao nhất của script, khai báo `function` hoạt động như `var` và có thể được khai báo lại bởi một `function` hoặc `var` khác nhưng không thể bởi {{jsxref("Statements/let", "let")}}, {{jsxref("Statements/const", "const")}}, hay {{jsxref("Statements/class", "class")}}.

```js-nolint example-bad
function a(b) {}
function a(b, c) {}
console.log(a.length); // 2
let a = 2; // SyntaxError: Identifier 'a' has already been declared
```

Khi khai báo `function` bị khai báo lại bởi `var`, bộ khởi tạo của khai báo `var` luôn ghi đè giá trị của hàm, bất kể thứ tự tương đối của chúng. Điều này là do khai báo hàm được hoisted trước khi bất kỳ bộ khởi tạo nào được đánh giá, vì vậy bộ khởi tạo đến sau và ghi đè giá trị.

```js
var a = 1;
function a() {}
console.log(a); // 1
```

Ở cấp cao nhất của thân hàm, `function` cũng hoạt động như `var` và có thể được khai báo lại hoặc có cùng tên với một tham số.

```js
function foo(a) {
  function a() {}
  console.log(typeof a);
}

foo(2); // Logs "function"
```

Ở cấp cao nhất của một module hoặc một block trong chế độ strict, khai báo `function` hoạt động như `let` và không thể được khai báo lại bởi bất kỳ khai báo nào khác.

```js-nolint example-bad
// Assuming current source is a module
function foo() {}
function foo() {} // SyntaxError: Identifier 'foo' has already been declared
```

```js-nolint example-bad
"use strict";
{
  function foo() {}
  function foo() {} // SyntaxError: Identifier 'foo' has already been declared
}
```

Khai báo `function` bên trong một block `catch` không thể có cùng tên với định danh bị ràng buộc bởi `catch`, kể cả trong chế độ không strict.

```js-nolint example-bad
try {
} catch (e) {
  function e() {} // SyntaxError: Identifier 'e' has already been declared
}
```

## Ví dụ

### Sử dụng function

Đoạn code sau khai báo một hàm trả về tổng doanh số bán hàng, khi được cung cấp số lượng đơn vị đã bán của ba sản phẩm.

```js
function calcSales(unitsA, unitsB, unitsC) {
  return unitsA * 79 + unitsB * 129 + unitsC * 699;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("Function")}}
- [Biểu thức `function`](/en-US/docs/Web/JavaScript/Reference/Operators/function)
- {{jsxref("Statements/function*", "function*")}}
- {{jsxref("Statements/async_function", "async function")}}
- {{jsxref("Statements/async_function*", "async function*")}}
