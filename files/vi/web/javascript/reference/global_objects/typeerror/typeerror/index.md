---
title: TypeError() constructor
short-title: TypeError()
slug: Web/JavaScript/Reference/Global_Objects/TypeError/TypeError
page-type: javascript-constructor
browser-compat: javascript.builtins.TypeError.TypeError
sidebar: jsref
---

Constructor **`TypeError()`** tạo ra các đối tượng {{jsxref("TypeError")}}.

## Cú pháp

```js-nolint
new TypeError()
new TypeError(message)
new TypeError(message, options)
new TypeError(message, fileName)
new TypeError(message, fileName, lineNumber)

TypeError()
TypeError(message)
TypeError(message, options)
TypeError(message, fileName)
TypeError(message, fileName, lineNumber)
```

> [!NOTE]
> `TypeError()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `TypeError` mới.

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

### Bắt một TypeError

```js
try {
  null.f();
} catch (e) {
  console.log(e instanceof TypeError); // true
  console.log(e.message); // "null has no properties"
  console.log(e.name); // "TypeError"
  console.log(e.stack); // Stack of the error
}
```

### Tạo một TypeError

```js
try {
  throw new TypeError("Hello");
} catch (e) {
  console.log(e instanceof TypeError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "TypeError"
  console.log(e.stack); // Stack of the error
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
