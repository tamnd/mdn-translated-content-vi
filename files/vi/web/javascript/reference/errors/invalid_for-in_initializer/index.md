---
title: "SyntaxError: for-in loop head declarations may not have initializers"
slug: Web/JavaScript/Reference/Errors/Invalid_for-in_initializer
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript chỉ xảy ra ở [chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode)
"for-in loop head declarations may not have initializers"
xảy ra khi phần đầu của vòng lặp [for...in](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) chứa
một biểu thức khởi tạo, chẳng hạn như `for (var i = 0 in obj)`. Điều này không
được phép trong vòng lặp for-in ở chế độ nghiêm ngặt. Ngoài ra, các khai báo từ khóa có khởi tạo như `for (const i = 0 in obj)` cũng không được phép kể cả ngoài chế độ nghiêm ngặt.

## Thông báo

```plain
SyntaxError: for-in loop variable declaration may not have an initializer. (V8-based)
SyntaxError: for-in loop head declarations may not have initializers (Firefox)
SyntaxError: a lexical declaration in the head of a for-in loop can't have an initializer (Firefox)
SyntaxError: Cannot assign to the loop variable inside a for-in loop header. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}.

## Nguyên nhân?

Phần đầu của vòng lặp [for...in](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) chứa một biểu thức khởi tạo.
Tức là, một biến được khai báo và gán giá trị `for (var i = 0 in obj)`.
Trong chế độ không nghiêm ngặt, khai báo này trong phần đầu bị bỏ qua âm thầm và hoạt động như `for (var i in obj)`.
Tuy nhiên, trong [chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode), một `SyntaxError` được ném ra. Ngoài ra, các khai báo từ khóa có khởi tạo như `for (const i = 0 in obj)` cũng không được phép kể cả ngoài chế độ nghiêm ngặt, và luôn tạo ra `SyntaxError`.

## Ví dụ

Ví dụ này ném ra `SyntaxError`:

```js-nolint example-bad
const obj = { a: 1, b: 2, c: 3 };

for (const i = 0 in obj) {
  console.log(obj[i]);
}

// SyntaxError: for-in loop head declarations may not have initializers
```

### Vòng lặp for-in hợp lệ

Bạn có thể bỏ phần khởi tạo (`i = 0`) trong phần đầu của vòng lặp for-in.

```js example-good
const obj = { a: 1, b: 2, c: 3 };

for (const i in obj) {
  console.log(obj[i]);
}
```

### Duyệt mảng

Vòng lặp for...in [không nên được dùng để duyệt mảng](/en-US/docs/Web/JavaScript/Reference/Statements/for...in#array_iteration_and_for...in).
Bạn có muốn dùng vòng lặp [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for)
thay vì vòng lặp `for-in` để duyệt qua {{jsxref("Array")}} không? Vòng lặp
`for` cho phép bạn đặt một biểu thức khởi tạo như thế này:

```js example-good
const arr = ["a", "b", "c"];

for (let i = 2; i < arr.length; i++) {
  console.log(arr[i]);
}

// "c"
```

## Xem thêm

- [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in)
- [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of)
- [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for)
