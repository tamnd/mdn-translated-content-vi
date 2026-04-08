---
title: "SyntaxError: missing } after property list"
slug: Web/JavaScript/Reference/Errors/Missing_curly_after_property_list
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "missing } after property list" xảy ra khi có lỗi trong cú pháp [object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) ở đâu đó. Có thể thực sự là thiếu dấu ngoặc nhọn, nhưng cũng có thể là thiếu dấu phẩy.

## Thông báo

```plain
SyntaxError: missing } after property list (Firefox)
SyntaxError: Unexpected identifier 'c'. Expected '}' to end an object literal. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Có lỗi trong cú pháp [object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) ở đâu đó. Có thể thực sự là thiếu dấu ngoặc nhọn, nhưng cũng có thể là thiếu dấu phẩy. Đồng thời hãy kiểm tra xem các dấu ngoặc nhọn đóng hoặc dấu ngoặc đơn có đúng thứ tự không. Thụt lề hoặc định dạng code gọn gàng hơn cũng có thể giúp bạn tìm ra vấn đề.

## Ví dụ

### Thiếu dấu phẩy

Thường gặp nhất là thiếu dấu phẩy trong code object initializer của bạn:

```js-nolint example-bad
const obj = {
  a: 1,
  b: { myProp: 2 }
  c: 3
};
```

Cách đúng là:

```js example-good
const obj = {
  a: 1,
  b: { myProp: 2 },
  c: 3,
};
```

## Xem thêm

- [Object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
