---
title: "SyntaxError: numbers out of order in {} quantifier."
slug: Web/JavaScript/Reference/Errors/Regex_numbers_out_of_order_in_quantifier
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "numbers out of order in {} quantifier" xảy ra khi một [bộ định lượng](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) trong biểu thức chính quy sử dụng cú pháp `{n,m}` nhưng `m` nhỏ hơn `n`.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /1{2,1}/: numbers out of order in {} quantifier (V8-based)
SyntaxError: numbers out of order in {} quantifier. (Firefox)
SyntaxError: Invalid regular expression: numbers out of order in {} quantifier (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Cú pháp `{n,m}` trong biểu thức chính quy được sử dụng để chỉ định rằng mục đứng trước cần được khớp ít nhất `n` lần, nhưng không quá `m` lần. Nếu `m` nhỏ hơn `n`, bộ định lượng không có nghĩa lý vì, ví dụ, một ký tự không thể xuất hiện ít nhất 2 lần nhưng không quá 1 lần. Do đó, một lỗi được ném ra.

## Ví dụ

### Các ví dụ không hợp lệ

```js example-bad
/1{2,1}/;
```

### Các ví dụ hợp lệ

```js example-good
/1{1,2}/;
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Bộ định lượng: `*`, `+`, `?`, `{n}`, `{n,}`, `{n,m}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier)
