---
title: "SyntaxError: cannot use ?? unparenthesized within || and && expressions"
slug: Web/JavaScript/Reference/Errors/Cant_use_nullish_coalescing_unparenthesized
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "cannot use `??` unparenthesized within `||` and `&&` expressions" xảy ra khi một [toán tử nullish coalescing](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing) được sử dụng với [logical OR](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_OR) hoặc [logical AND](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_AND) trong cùng một biểu thức mà không có dấu ngoặc đơn.

## Thông báo

```plain
SyntaxError: Unexpected token '??' (V8-based)
SyntaxError: cannot use `??` unparenthesized within `||` and `&&` expressions (Firefox)
SyntaxError: Unexpected token '??'. Coalescing and logical operators used together in the same expression; parentheses must be used to disambiguate. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Chuỗi [độ ưu tiên toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence) trông như sau:

```plain
|   >   &&   >   ||   >   =
|   >   ??   >   =
```

Tuy nhiên, độ ưu tiên _giữa_ `??` và `&&`/`||` được cố ý để không xác định, vì hành vi short-circuit của các toán tử logic có thể khiến việc đánh giá biểu thức trở nên khó hiểu. Do đó, các tổ hợp sau đây đều là lỗi cú pháp, vì ngôn ngữ không biết cách đặt ngoặc đơn cho các toán hạng:

```js-nolint example-bad
a ?? b || c;
a || b ?? c;
a ?? b && c;
a && b ?? c;
```

Thay vào đó, hãy làm rõ ý định của bạn bằng cách đặt ngoặc đơn một cách tường minh cho một trong hai vế:

```js example-good
(a ?? b) || c;
a ?? (b && c);
```

## Ví dụ

Khi di chuyển code cũ sử dụng `||` và `&&` để kiểm tra giá trị `null` hoặc `undefined`, bạn có thể thường xuyên chuyển đổi code một cách không đầy đủ:

```js-nolint example-bad
function getId(user, fallback) {
  // Previously: user && user.id || fallback
  return user && user.id ?? fallback; // SyntaxError: cannot use `??` unparenthesized within `||` and `&&` expressions
}
```

Thay vào đó, hãy cân nhắc đặt ngoặc đơn cho `&&`:

```js
function getId(user, fallback) {
  return (user && user.id) ?? fallback;
}
```

Tốt hơn nữa, hãy cân nhắc sử dụng [optional chaining](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) thay vì `&&`:

```js example-good
function getId(user, fallback) {
  return user?.id ?? fallback;
}
```

## Xem thêm

- [Issue về độ ưu tiên nullish coalescing](https://github.com/tc39/proposal-nullish-coalescing/issues/15) trong đề xuất nullish-coalescing của TC39
- [Nullish coalescing operator (`??`)](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing)
- [Operator precedence](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence)
