---
title: 'TypeError: "x" is (not) "y"'
slug: Web/JavaScript/Reference/Errors/Unexpected_type
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "_x_ is (not) _y_" xảy ra khi có kiểu dữ liệu bất ngờ. Thường xảy ra với các giá trị {{jsxref("undefined")}} hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) không mong đợi.

## Thông báo

```plain
TypeError: Cannot read properties of undefined (reading 'x') (V8-based)
TypeError: "x" is undefined (Firefox)
TypeError: "undefined" is not an object (Firefox)
TypeError: undefined is not an object (evaluating 'obj.x') (Safari)

TypeError: "x" is not a symbol (V8-based & Firefox)
TypeError: Symbol.keyFor requires that the first argument be a symbol (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}.

## Điều gì đã xảy ra?

Có kiểu dữ liệu bất ngờ. Điều này thường xảy ra với các giá trị {{jsxref("undefined")}} hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

Ngoài ra, một số phương thức nhất định, như {{jsxref("Object.create()")}} hoặc {{jsxref("Symbol.keyFor()")}}, yêu cầu một kiểu cụ thể phải được cung cấp.

## Ví dụ

### Các trường hợp không hợp lệ

Bạn không thể gọi phương thức trên biến `undefined` hoặc `null`.

```js example-bad
const foo = undefined;
foo.substring(1); // TypeError: foo is undefined

const foo2 = null;
foo2.substring(1); // TypeError: foo2 is null
```

Một số phương thức có thể yêu cầu một kiểu cụ thể.

```js example-bad
const foo = {};
Symbol.keyFor(foo); // TypeError: foo is not a symbol

const foo2 = "bar";
Object.create(foo2); // TypeError: "foo2" is not an object or null
```

### Khắc phục vấn đề

Để sửa lỗi con trỏ null đến các giá trị `undefined` hoặc `null`, bạn có thể kiểm tra xem giá trị có phải là `undefined` hoặc `null` trước.

```js example-good
if (foo !== undefined && foo !== null) {
  // Bây giờ chúng ta biết rằng foo đã được định nghĩa, chúng ta có thể tiếp tục.
}
```

Hoặc, nếu bạn chắc chắn rằng `foo` sẽ không phải là một giá trị [falsy](/en-US/docs/Glossary/Falsy) khác như `""` hoặc `0`, hoặc nếu việc lọc các trường hợp đó không phải là vấn đề, bạn có thể đơn giản kiểm tra tính trung thực của nó.

```js example-good
if (foo) {
  // Bây giờ chúng ta biết rằng foo là truthy, nó nhất thiết không phải là null/undefined.
}
```

## Xem thêm

- {{jsxref("undefined")}}
- [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null)
