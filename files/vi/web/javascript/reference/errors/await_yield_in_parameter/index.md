---
title: "SyntaxError: await/yield expression can't be used in parameter"
slug: Web/JavaScript/Reference/Errors/await_yield_in_parameter
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "await expression can't be used in parameter" hoặc "yield expression can't be used in parameter" xảy ra khi biểu thức [tham số mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters) chứa từ khóa {{jsxref("Operators/await", "await")}} hoặc {{jsxref("Operators/yield", "yield")}} và có tác dụng tạm dừng việc đánh giá tham số mặc định.

## Thông báo

```plain
SyntaxError: Illegal await-expression in formal parameters of async function (V8-based)
SyntaxError: await expression can't be used in parameter (Firefox)
SyntaxError: Cannot use 'await' within a parameter default expression. (Safari)

SyntaxError: Yield expression not allowed in formal parameter (V8-based)
SyntaxError: yield expression can't be used in parameter (Firefox)
SyntaxError: Unexpected keyword 'yield'. Cannot use yield expression within parameters. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Biểu thức mặc định phải có khả năng đánh giá _đồng bộ_. Nếu nó chứa biểu thức `await` hoặc `yield`, nó sẽ tạm dừng việc đánh giá biểu thức mặc định, điều này không được phép.

> [!NOTE]
> Lỗi này chỉ được tạo ra khi `await` hoặc `yield` là toán tử hợp lệ trong ngữ cảnh hàm này. Nếu không, `await` hoặc `yield` sẽ được phân tích cú pháp như một định danh và không gây ra lỗi, hoặc gây ra lỗi như "reserved identifier" hoặc "unexpected token" nếu có biểu thức tiếp theo sau nó.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
function *gen(a = yield 1) {}

async function f(a = await Promise.resolve(1)) {}
```

### Trường hợp hợp lệ

Bạn có thể sử dụng [nullish coalescing assignment](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_assignment) để cung cấp giá trị mặc định thay thế. Nếu bạn muốn xử lý `null` và `undefined` khác nhau, bạn cần sử dụng điều kiện.

```js example-good
function* gen(a) {
  a ??= yield 1;
}

async function f(a) {
  a ??= await Promise.resolve(1);
}
```

Bạn cũng được phép sử dụng `await` hoặc `yield` nếu biểu thức được chứa trong một biểu thức hàm của bộ khởi tạo và không tạm dừng việc đánh giá biểu thức mặc định.

```js example-good
async function f(a = (async () => await Promise.resolve(1))()) {}
```

## Xem thêm

- [Default parameters](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters)
- {{jsxref("Operators/await", "await")}}
- {{jsxref("Operators/yield", "yield")}}
