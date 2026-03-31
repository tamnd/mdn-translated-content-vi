---
title: Nullish coalescing assignment (??=)
slug: Web/JavaScript/Reference/Operators/Nullish_coalescing_assignment
page-type: javascript-operator
browser-compat: javascript.operators.nullish_coalescing_assignment
sidebar: jssidebar
---

Toán tử **nullish coalescing assignment (`??=`)**, còn được gọi là toán tử **logical nullish assignment**, chỉ tính toán toán hạng bên phải và gán cho toán hạng bên trái nếu toán hạng bên trái là {{Glossary("nullish")}} (`null` hoặc `undefined`).

{{InteractiveExample("JavaScript Demo: Nullish coalescing assignment (??=) operator")}}

```js interactive-example
const a = { duration: 50 };

a.speed ??= 25;
console.log(a.speed);
// Expected output: 25

a.duration ??= 10;
console.log(a.duration);
// Expected output: 50
```

## Cú pháp

```js-nolint
x ??= y
```

## Mô tả

Nullish coalescing assignment [_short-circuits_](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence#short-circuiting), nghĩa là `x ??= y` tương đương với `x ?? (x = y)`, ngoại trừ biểu thức `x` chỉ được tính một lần.

Không có phép gán nào được thực hiện nếu toán hạng bên trái không phải nullish, do cơ chế short-circuit của toán tử [nullish coalescing](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing). Ví dụ, đoạn mã dưới đây không ném lỗi dù `x` là `const`:

```js
const x = 1;
x ??= 2;
```

Đoạn mã dưới đây cũng không kích hoạt setter:

```js
const x = {
  get value() {
    return 1;
  },
  set value(v) {
    console.log("Setter called");
  },
};

x.value ??= 2;
```

Thực tế, nếu `x` không phải nullish thì `y` hoàn toàn không được tính toán.

```js
const x = 1;
x ??= console.log("y evaluated");
// Logs nothing
```

## Ví dụ

### Sử dụng nullish coalescing assignment

Bạn có thể dùng toán tử nullish coalescing assignment để áp dụng giá trị mặc định cho các thuộc tính của object. So với việc dùng destructuring và [giá trị mặc định](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#default_value), `??=` cũng áp dụng giá trị mặc định nếu thuộc tính có giá trị `null`.

```js
function config(options) {
  options.duration ??= 100;
  options.speed ??= 25;
  return options;
}

config({ duration: 125 }); // { duration: 125, speed: 25 }
config({}); // { duration: 100, speed: 25 }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Nullish coalescing operator (`??`)](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing)
- {{Glossary("Nullish")}}
- {{Glossary("Truthy")}}
- {{Glossary("Falsy")}}
