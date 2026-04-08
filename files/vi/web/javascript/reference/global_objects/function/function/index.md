---
title: Function() constructor
short-title: Function()
slug: Web/JavaScript/Reference/Global_Objects/Function/Function
page-type: javascript-constructor
browser-compat: javascript.builtins.Function.Function
sidebar: jsref
---

> [!WARNING]
> Các tham số được truyền vào constructor này được phân tích cú pháp và thực thi động như JavaScript.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và là nguy cơ tiềm ẩn cho các cuộc tấn công [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn truyền các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi và [áp dụng trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
>
> Xem [Security considerations](#security_considerations) để biết thêm thông tin.

Constructor **`Function()`** tạo các đối tượng {{jsxref("Function")}}. Gọi constructor trực tiếp có thể tạo hàm động, nhưng gặp phải các vấn đề bảo mật và hiệu năng tương tự (nhưng kém quan trọng hơn nhiều) như {{jsxref("Global_Objects/eval", "eval()")}}. Tuy nhiên, không giống `eval` (có thể truy cập phạm vi cục bộ), constructor `Function` tạo ra các hàm chỉ thực thi trong phạm vi toàn cục.

{{InteractiveExample("JavaScript Demo: Function() constructor", "shorter")}}

```js interactive-example
const sum = new Function("a", "b", "return a + b");

console.log(sum(2, 6));
// Expected output: 8
```

## Syntax

```js-nolint
new Function(functionBody)
new Function(arg1, functionBody)
new Function(arg1, arg2, functionBody)
new Function(arg1, arg2, /* …, */ argN, functionBody)

Function(functionBody)
Function(arg1, functionBody)
Function(arg1, arg2, functionBody)
Function(arg1, arg2, /* …, */ argN, functionBody)
```

> [!NOTE]
> `Function()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `Function` mới.

### Parameters

- `arg1`, …, `argN` {{optional_inline}}
  - : Các instance {{domxref("TrustedScript")}} hoặc chuỗi xác định các tên được hàm sử dụng làm tên tham số hình thức. Giá trị phải tương ứng với một tham số JavaScript hợp lệ (bất kỳ trong số [identifier](/en-US/docs/Glossary/Identifier) thông thường, [rest parameter](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters), hoặc tham số [destructured](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring), tùy chọn có [default](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters)), hoặc một danh sách các chuỗi như vậy được phân tách bằng dấu phẩy.

    Vì các tham số được phân tích theo cùng cách như các biểu thức hàm, khoảng trắng và chú thích được chấp nhận. Ví dụ: `"x", "theValue = 42", "[a, b] /* numbers */"` — hoặc `"x, theValue = 42, [a, b] /* numbers */"`. (`"x, theValue = 42", "[a, b]"` cũng hợp lệ, dù rất khó đọc.)

- `functionBody`
  - : Một {{domxref("TrustedScript")}} hoặc chuỗi chứa các câu lệnh JavaScript tạo nên định nghĩa hàm.

### Exceptions

- {{jsxref("SyntaxError")}}
  - : Tham số hàm không thể được phân tích cú pháp như một danh sách tham số hợp lệ, hoặc `functionBody` không thể được phân tích cú pháp như các câu lệnh JavaScript hợp lệ.
- {{jsxref("TypeError")}}
  - : Bất kỳ tham số nào là chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [áp dụng bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được định nghĩa.

## Description

Các đối tượng `Function` được tạo bằng constructor `Function` được phân tích cú pháp khi hàm được tạo. Điều này kém hiệu quả hơn so với việc tạo hàm bằng [function expression](/en-US/docs/Web/JavaScript/Reference/Operators/function) hoặc [function declaration](/en-US/docs/Web/JavaScript/Reference/Statements/function) và gọi nó trong code của bạn, vì các hàm như vậy được phân tích cú pháp cùng với phần còn lại của code.

Tất cả các tham số được truyền vào hàm, ngoại trừ tham số cuối cùng, được xem là tên của các identifier tham số trong hàm được tạo, theo thứ tự chúng được truyền. Hàm sẽ được biên dịch động như một biểu thức hàm, với source được ghép theo cách sau:

```js
`function anonymous(${args.join(",")}
) {
${functionBody}
}`;
```

Điều này có thể quan sát được bằng cách gọi phương thức [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/toString) của hàm.

Tuy nhiên, không giống như các [function expressions](/en-US/docs/Web/JavaScript/Reference/Operators/function) thông thường, tên `anonymous` không được thêm vào phạm vi của `functionBody`, vì `functionBody` chỉ có quyền truy cập vào phạm vi toàn cục. Nếu `functionBody` không ở [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode) (bản thân body cần có chỉ thị `"use strict"` vì nó không kế thừa chế độ strict từ ngữ cảnh), bạn có thể dùng [`arguments.callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee) để tham chiếu đến chính hàm đó. Ngoài ra, bạn có thể định nghĩa phần đệ quy như một hàm bên trong:

```js
const recursiveFn = new Function(
  "count",
  `
(function recursiveFn(count) {
  if (count < 0) {
    return;
  }
  console.log(count);
  recursiveFn(count - 1);
})(count);
`,
);
```

Lưu ý rằng hai phần động của source được ghép — danh sách tham số `args.join(",")` và `functionBody` — sẽ được phân tích cú pháp riêng biệt trước tiên để đảm bảo chúng đều hợp lệ về mặt cú pháp. Điều này ngăn các nỗ lực injection tương tự.

```js
new Function("/*", "*/) {");
// SyntaxError: Unexpected end of arg string
// Doesn't become "function anonymous(/*) {*/) {}"
```

### Security considerations

Phương thức này có thể được dùng để thực thi đầu vào tùy ý được truyền vào bất kỳ tham số nào. Nếu đầu vào là một chuỗi không an toàn tiềm ẩn do người dùng cung cấp, đây là một nguy cơ tiềm ẩn cho các cuộc tấn công [Cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS). Ví dụ, đoạn code sau giả định `untrustedCode` được cung cấp bởi người dùng:

```js example-bad
const untrustedCode = "alert('Potentially evil code!');";
const adder = new Function("a", "b", untrustedCode);
```

Các trang web có [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) chỉ định [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) hoặc [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src) sẽ ngăn code như vậy chạy theo mặc định. Nếu bạn phải cho phép các script chạy qua `Function()`, bạn có thể giảm thiểu các vấn đề này bằng cách luôn gán các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi, và [áp dụng trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) bằng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for). Điều này đảm bảo đầu vào được chuyển qua một hàm chuyển đổi.

Để cho phép `Function()` chạy, bạn cần chỉ định thêm [từ khóa `trusted-types-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#trusted-types-eval) trong chỉ thị `script-src` của CSP. Từ khóa [`unsafe-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-eval) cũng cho phép `Function()`, nhưng kém an toàn hơn nhiều so với `trusted-types-eval` vì nó cho phép thực thi ngay cả trên các trình duyệt không hỗ trợ trusted types.

Ví dụ, CSP cần thiết cho site của bạn có thể trông như thế này:

```http
Content-Security-Policy: require-trusted-types-for 'script'; script-src '<your_allowlist>' 'trusted-types-eval'
```

Hành vi của hàm chuyển đổi phụ thuộc vào trường hợp sử dụng cụ thể yêu cầu script do người dùng cung cấp. Nếu có thể, bạn nên giới hạn các script được phép chính xác là code mà bạn tin tưởng để chạy. Nếu không thể, bạn có thể cho phép hoặc chặn việc sử dụng một số hàm nhất định trong chuỗi được cung cấp.

## Examples

Lưu ý rằng các ví dụ này bỏ qua việc sử dụng trusted types để ngắn gọn. Để xem code theo cách tiếp cận được khuyến nghị, hãy xem [Using `TrustedScript`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#using_trustedscript) trong `eval()`.

### Chỉ định tham số với constructor Function

Đoạn code sau tạo một đối tượng `Function` nhận hai tham số.

```js
// Example can be run directly in your JavaScript console

// Create a function that takes two arguments, and returns the sum of those arguments
const adder = new Function("a", "b", "return a + b");

// Call the function
adder(2, 6);
// 8
```

Các tham số `a` và `b` là các tên tham số hình thức được sử dụng trong thân hàm, `return a + b`.

### Tạo đối tượng hàm từ function declaration hoặc function expression

```js
// The function constructor can take in multiple statements separated by a semicolon. Function expressions require a return statement with the function's name

// Observe that new Function is called. This is so we can call the function we created directly afterwards
const sumOfArray = new Function(
  "const sumArray = (arr) => arr.reduce((previousValue, currentValue) => previousValue + currentValue); return sumArray",
)();

// call the function
sumOfArray([1, 2, 3, 4]);
// 10

// If you don't call new Function at the point of creation, you can use the Function.call() method to call it
const findLargestNumber = new Function(
  "function findLargestNumber (arr) { return Math.max(...arr) }; return findLargestNumber",
);

// call the function
findLargestNumber.call({}).call({}, [2, 4, 1, 8, 5]);
// 8

// Function declarations do not require a return statement
const sayHello = new Function(
  "return function (name) { return `Hello, ${name}` }",
)();

// call the function
sayHello("world");
// Hello, world
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Using the function constructor](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#using_the_function_constructor) in `eval()`
- [`function`](/en-US/docs/Web/JavaScript/Reference/Statements/function)
- [`function` expression](/en-US/docs/Web/JavaScript/Reference/Operators/function)
- {{jsxref("Functions", "Functions", "", 1)}}
