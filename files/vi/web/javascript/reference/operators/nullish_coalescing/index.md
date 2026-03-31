---
title: Nullish coalescing operator (??)
slug: Web/JavaScript/Reference/Operators/Nullish_coalescing
page-type: javascript-operator
browser-compat: javascript.operators.nullish_coalescing
sidebar: jssidebar
---

Toán tử **nullish coalescing (`??`)** là một logical operator trả về toán hạng bên phải khi toán hạng bên trái là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc {{jsxref("undefined")}}, và ngược lại trả về toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Nullish coalescing (??) operator")}}

```js interactive-example
const foo = null ?? "default string";
console.log(foo);
// Expected output: "default string"

const baz = 0 ?? 42;
console.log(baz);
// Expected output: 0
```

## Cú pháp

```js-nolint
leftExpr ?? rightExpr
```

## Mô tả

Toán tử nullish coalescing có thể được coi là trường hợp đặc biệt của [toán tử logical OR (`||`)](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_OR). Toán tử sau trả về toán hạng bên phải nếu toán hạng bên trái là _bất kỳ_ giá trị {{Glossary("falsy")}} nào, không chỉ `null` hoặc `undefined`. Nói cách khác, nếu bạn sử dụng `||` để cung cấp một giá trị mặc định cho biến `foo` khác, bạn có thể gặp phải các hành vi bất ngờ nếu bạn coi một số giá trị falsy là có thể sử dụng được (ví dụ: `''` hoặc `0`). Xem [bên dưới](#assigning_a_default_value_to_a_variable) để biết thêm ví dụ.

Toán tử nullish coalescing có độ ưu tiên thứ năm từ thấp nhất trong [độ ưu tiên toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence), thấp hơn trực tiếp so với `||` và cao hơn trực tiếp so với [toán tử điều kiện (ternary)](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator).

Không thể kết hợp trực tiếp toán tử AND (`&&`) hoặc OR (`||`) với `??`. Một [lỗi cú pháp](/en-US/docs/Web/JavaScript/Reference/Errors/Cant_use_nullish_coalescing_unparenthesized) sẽ được ném ra trong những trường hợp đó.

```js-nolint example-bad
null || undefined ?? "foo"; // raises a SyntaxError
true && undefined ?? "foo"; // raises a SyntaxError
```

Thay vào đó, hãy cung cấp dấu ngoặc để chỉ rõ độ ưu tiên:

```js example-good
(null || undefined) ?? "foo"; // returns "foo"
```

## Ví dụ

### Sử dụng toán tử nullish coalescing

Trong ví dụ này, chúng ta sẽ cung cấp các giá trị mặc định nhưng giữ lại các giá trị khác `null` hoặc `undefined`.

```js
const nullValue = null;
const emptyText = ""; // falsy
const someNumber = 42;

const valA = nullValue ?? "default for A";
const valB = emptyText ?? "default for B";
const valC = someNumber ?? 0;

console.log(valA); // "default for A"
console.log(valB); // "" (as the empty string is not null or undefined)
console.log(valC); // 42
```

### Gán giá trị mặc định cho biến

Trước đây, khi muốn gán giá trị mặc định cho một biến, một mẫu phổ biến là sử dụng toán tử logical OR ([`||`](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_OR)):

```js
let foo;

// foo is never assigned any value so it is still undefined
const someDummyText = foo || "Hello!";
```

Tuy nhiên, do `||` là toán tử boolean logic, toán hạng bên trái được ép kiểu thành boolean để đánh giá và bất kỳ giá trị _falsy_ nào (bao gồm `0`, `''`, `NaN`, `false`, v.v.) đều không được trả về. Hành vi này có thể gây ra hậu quả bất ngờ nếu bạn coi `0`, `''` hoặc `NaN` là các giá trị hợp lệ.

```js
const count = 0;
const text = "";

const qty = count || 42;
const message = text || "hi!";
console.log(qty); // 42 and not 0
console.log(message); // "hi!" and not ""
```

Toán tử nullish coalescing tránh được vấn đề này bằng cách chỉ trả về toán hạng thứ hai khi toán hạng thứ nhất được đánh giá là `null` hoặc `undefined` (nhưng không phải các giá trị falsy khác):

```js
const myText = ""; // An empty string (which is also a falsy value)

const notFalsyText = myText || "Hello world";
console.log(notFalsyText); // Hello world

const preservingFalsy = myText ?? "Hi neighborhood";
console.log(preservingFalsy); // '' (as myText is neither undefined nor null)
```

### Short-circuiting

Như toán tử logical 'OR' và 'AND', biểu thức bên phải không được đánh giá nếu bên trái không phải `null` cũng không phải `undefined`.

```js
function a() {
  console.log("a was called");
  return undefined;
}
function b() {
  console.log("b was called");
  return false;
}
function c() {
  console.log("c was called");
  return "foo";
}

console.log(a() ?? c());
// Logs "a was called" then "c was called" and then "foo"
// as a() returned undefined so both expressions are evaluated

console.log(b() ?? c());
// Logs "b was called" then "false"
// as b() returned false (and not null or undefined), the right
// hand side expression was not evaluated
```

### Mối quan hệ với toán tử optional chaining (?.)

Toán tử nullish coalescing xử lý `undefined` và `null` như các giá trị cụ thể. Toán tử [optional chaining (`?.`)](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) cũng vậy, điều này hữu ích để truy cập thuộc tính của một object có thể là `null` hoặc `undefined`. Kết hợp chúng lại, bạn có thể truy cập an toàn một thuộc tính của object có thể là nullish và cung cấp giá trị mặc định nếu nó là null.

```js
const foo = { someFooProp: "hi" };

console.log(foo.someFooProp?.toUpperCase() ?? "not available"); // "HI"
console.log(foo.someBarProp?.toUpperCase() ?? "not available"); // "not available"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Nullish coalescing assignment (`??=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_assignment)
- [Optional chaining (`?.`)](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)
- [Logical OR (`||`)](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_OR)
- [Default parameters](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters)
