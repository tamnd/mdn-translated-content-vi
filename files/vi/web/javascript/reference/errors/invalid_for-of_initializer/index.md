---
title: "SyntaxError: a declaration in the head of a for-of loop can't have an initializer"
slug: Web/JavaScript/Reference/Errors/Invalid_for-of_initializer
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "a declaration in the head of a for-of loop can't have an initializer" xảy ra khi đầu của vòng lặp [for...of](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) chứa một biểu thức khởi tạo như `for (const i = 0 of iterable)`. Điều này không được phép trong vòng lặp for-of.

## Thông báo

```plain
SyntaxError: for-of loop variable declaration may not have an initializer. (V8-based)
SyntaxError: a declaration in the head of a for-of loop can't have an initializer (Firefox)
SyntaxError: Cannot assign to the loop variable inside a for-of loop header. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Đầu của vòng lặp [for...of](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) chứa một biểu thức khởi tạo. Tức là, một biến được khai báo và gán giá trị `for (const i = 0 of iterable)`. Điều này không được phép trong vòng lặp for-of. Bạn có thể muốn dùng vòng lặp [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for) cho phép khởi tạo.

## Ví dụ

### Vòng lặp for-of không hợp lệ

```js-nolint example-bad
const iterable = [10, 20, 30];

for (const value = 50 of iterable) {
  console.log(value);
}

// SyntaxError: a declaration in the head of a for-of loop can't
// have an initializer
```

### Vòng lặp for-of hợp lệ

Bạn cần xóa giá trị khởi tạo (`value = 50`) trong đầu của vòng lặp `for-of`. Có thể bạn muốn làm cho 50 là một giá trị offset, trong trường hợp đó bạn có thể thêm nó vào thân vòng lặp, ví dụ.

```js example-good
const iterable = [10, 20, 30];

for (let value of iterable) {
  value += 50;
  console.log(value);
}
// 60
// 70
// 80
```

## Xem thêm

- [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of)
- [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in)
- [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for)
