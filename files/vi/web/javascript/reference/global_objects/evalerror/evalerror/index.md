---
title: EvalError() constructor
short-title: EvalError()
slug: Web/JavaScript/Reference/Global_Objects/EvalError/EvalError
page-type: javascript-constructor
browser-compat: javascript.builtins.EvalError.EvalError
sidebar: jsref
---

Constructor **`EvalError()`** tạo ra các đối tượng {{jsxref("EvalError")}}.

## Cú pháp

```js-nolint
new EvalError()
new EvalError(message)
new EvalError(message, options)
new EvalError(message, fileName)
new EvalError(message, fileName, lineNumber)

EvalError()
EvalError(message)
EvalError(message, options)
EvalError(message, fileName)
EvalError(message, fileName, lineNumber)
```

> [!NOTE]
> `EvalError()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `EvalError` mới.

### Tham số

- `message` {{optional_inline}}
  - : Mô tả lỗi dưới dạng con người có thể đọc được.
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

`EvalError` không được dùng trong đặc tả ECMAScript hiện tại và do đó sẽ không được runtime ném ra. Tuy nhiên, bản thân đối tượng vẫn được giữ lại để tương thích ngược với các phiên bản đặc tả trước đó.

### Tạo một EvalError

```js
try {
  throw new EvalError("Hello");
} catch (e) {
  console.log(e instanceof EvalError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "EvalError"
  console.log(e.stack); // Stack of the error
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
- {{jsxref("Global_Objects/eval", "eval()")}}
