---
title: Logical AND assignment (&&=)
slug: Web/JavaScript/Reference/Operators/Logical_AND_assignment
page-type: javascript-operator
browser-compat: javascript.operators.logical_and_assignment
sidebar: jssidebar
---

Toán tử **logical AND assignment (`&&=`)** chỉ tính toán toán hạng bên phải và gán cho toán hạng bên trái nếu toán hạng bên trái là {{Glossary("truthy")}}.

{{InteractiveExample("JavaScript Demo: Logical AND assignment (&&=) operator")}}

```js interactive-example
let a = 1;
let b = 0;

a &&= 2;
console.log(a);
// Expected output: 2

b &&= 2;
console.log(b);
// Expected output: 0
```

## Cú pháp

```js-nolint
x &&= y
```

## Mô tả

Logical AND assignment [_short-circuits_](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence#short-circuiting), nghĩa là `x &&= y` tương đương với `x && (x = y)`, ngoại trừ biểu thức `x` chỉ được tính một lần.

Không có phép gán nào được thực hiện nếu toán hạng bên trái không phải truthy, do cơ chế short-circuit của toán tử [logical AND](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_AND). Ví dụ, đoạn mã dưới đây không ném lỗi dù `x` là `const`:

```js
const x = 0;
x &&= 2;
```

Đoạn mã dưới đây cũng không kích hoạt setter:

```js
const x = {
  get value() {
    return 0;
  },
  set value(v) {
    console.log("Setter called");
  },
};

x.value &&= 2;
```

Thực tế, nếu `x` không phải truthy thì `y` hoàn toàn không được tính toán.

```js
const x = 0;
x &&= console.log("y evaluated");
// Logs nothing
```

## Ví dụ

### Sử dụng logical AND assignment

```js
let x = 0;
let y = 1;

x &&= 0; // 0
x &&= 1; // 0
y &&= 1; // 1
y &&= 0; // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Logical AND (`&&`)](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_AND)
- [Nullish coalescing operator (`??`)](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing)
- [Bitwise AND assignment (`&=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_AND_assignment)
- {{Glossary("Truthy")}}
- {{Glossary("Falsy")}}
