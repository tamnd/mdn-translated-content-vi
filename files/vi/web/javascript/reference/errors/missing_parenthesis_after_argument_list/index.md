---
title: "SyntaxError: missing ) after argument list"
slug: Web/JavaScript/Reference/Errors/Missing_parenthesis_after_argument_list
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "missing ) after argument list" xảy ra khi có lỗi trong cách gọi hàm. Có thể là lỗi đánh máy, thiếu toán tử, hoặc chuỗi không được thoát ký tự.

## Thông báo

```plain
SyntaxError: missing ) after argument list (V8-based & Firefox)
SyntaxError: Unexpected identifier 'x'. Expected ')' to end an argument list. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}.

## Nguyên nhân?

Có lỗi trong cách gọi hàm. Có thể là lỗi đánh máy, thiếu toán tử, hoặc chuỗi không được thoát ký tự.

## Ví dụ

Vì không có toán tử "+" để nối chuỗi, JavaScript kỳ vọng đối số của hàm `log` chỉ là `"PI: "`. Trong trường hợp đó, nó phải được kết thúc bằng dấu ngoặc đơn đóng.

```js-nolint example-bad
console.log("PI: " Math.PI);
// SyntaxError: missing ) after argument list
```

Bạn có thể sửa lời gọi `log` bằng cách thêm toán tử `+`:

```js example-good
console.log("PI: " + Math.PI);
// "PI: 3.141592653589793"
```

Ngoài ra, bạn có thể dùng [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals), hoặc tận dụng thực tế là [`console.log`](/en-US/docs/Web/API/console/log_static) chấp nhận nhiều tham số:

```js example-good
console.log(`PI: ${Math.PI}`);
console.log("PI:", Math.PI);
```

### Chuỗi chưa kết thúc

```js-nolint example-bad
console.log('"Java" + "Script" = \"' + "Java" + 'Script\");
// SyntaxError: missing ) after argument list
```

Ở đây JavaScript nghĩ rằng bạn muốn có `);` bên trong chuỗi và bỏ qua nó, dẫn đến việc không biết rằng bạn muốn `);` kết thúc hàm `console.log`. Để sửa điều này, chúng ta có thể đặt một `'` sau chuỗi "Script":

```js example-good
console.log('"Java" + "Script" = "' + "Java" + 'Script"');
// '"Java" + "Script" = "JavaScript"'
```

## Xem thêm

- [Hướng dẫn Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
