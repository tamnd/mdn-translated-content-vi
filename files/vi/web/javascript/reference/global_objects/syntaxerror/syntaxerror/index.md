---
title: SyntaxError() constructor
short-title: SyntaxError()
slug: Web/JavaScript/Reference/Global_Objects/SyntaxError/SyntaxError
page-type: javascript-constructor
browser-compat: javascript.builtins.SyntaxError.SyntaxError
sidebar: jsref
---

Constructor **`SyntaxError()`** tạo ra các đối tượng {{jsxref("SyntaxError")}}.

## Cú pháp

```js-nolint
new SyntaxError()
new SyntaxError(message)
new SyntaxError(message, options)
new SyntaxError(message, fileName)
new SyntaxError(message, fileName, lineNumber)

SyntaxError()
SyntaxError(message)
SyntaxError(message, options)
SyntaxError(message, fileName)
SyntaxError(message, fileName, lineNumber)
```

> [!NOTE]
> `SyntaxError()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `SyntaxError` mới.

### Tham số

- `message` {{optional_inline}}
  - : Mô tả lỗi dưới dạng con người có thể đọc được
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính sau:
    - `cause` {{optional_inline}}
      - : Thuộc tính chỉ ra nguyên nhân cụ thể của lỗi.
        Khi bắt và ném lại một lỗi với thông báo lỗi cụ thể hơn hoặc hữu ích hơn, thuộc tính này có thể được dùng để truyền lỗi gốc.
- `fileName` {{optional_inline}} {{non-standard_inline}}
  - : Tên tệp chứa mã gây ra ngoại lệ
- `lineNumber` {{optional_inline}} {{non-standard_inline}}
  - : Số dòng của mã gây ra ngoại lệ

## Ví dụ

### Bắt một SyntaxError

```js
try {
  eval("hoo bar");
} catch (e) {
  console.log(e instanceof SyntaxError); // true
  console.log(e.message);
  console.log(e.name); // "SyntaxError"
  console.log(e.stack); // Stack of the error
}
```

### Tạo một SyntaxError

```js
try {
  throw new SyntaxError("Hello");
} catch (e) {
  console.log(e instanceof SyntaxError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "SyntaxError"
  console.log(e.stack); // Stack of the error
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
