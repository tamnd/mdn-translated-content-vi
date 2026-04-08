---
title: String.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/String/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các giá trị {{jsxref("String")}} trả về giá trị string này.

{{InteractiveExample("JavaScript Demo: String.prototype.valueOf()")}}

```js interactive-example
const stringObj = new String("foo");

console.log(stringObj);
// Expected output: String { "foo" }

console.log(stringObj.valueOf());
// Expected output: "foo"
```

## Cú pháp

```js-nolint
valueOf()
```

### Tham số

Không có.

### Giá trị trả về

Một string biểu diễn giá trị primitive của một đối tượng {{jsxref("String")}} đã cho.

## Mô tả

Phương thức `valueOf()` của {{jsxref("String")}} trả về giá trị primitive của một đối tượng {{jsxref("String")}} dưới dạng kiểu dữ liệu string. Giá trị này tương đương với {{jsxref("String.prototype.toString()")}}.

Phương thức này thường được JavaScript gọi nội bộ và không được gọi tường minh trong code.

## Ví dụ

### Sử dụng `valueOf()`

```js
const x = new String("Hello world");
console.log(x.valueOf()); // 'Hello world'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.toString()")}}
- {{jsxref("Object.prototype.valueOf()")}}
