---
title: SuppressedError() constructor
short-title: SuppressedError()
slug: Web/JavaScript/Reference/Global_Objects/SuppressedError/SuppressedError
page-type: javascript-constructor
browser-compat: javascript.builtins.SuppressedError.SuppressedError
sidebar: jsref
---

Constructor **`SuppressedError()`** tạo ra các đối tượng {{jsxref("SuppressedError")}}.

## Cú pháp

```js-nolint
new SuppressedError(error, suppressed)
new SuppressedError(error, suppressed, message)

SuppressedError(error, suppressed)
SuppressedError(error, suppressed, message)
```

> [!NOTE]
> `SuppressedError()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `SuppressedError` mới.

### Tham số

- `error`
  - : Lỗi mới dẫn đến việc chặn `suppressed`.
- `suppressed`
  - : Lỗi ban đầu được ném ra và hiện đang bị chặn.
- `message` {{optional_inline}}
  - : Mô tả tùy chọn về lỗi tổng hợp dưới dạng con người có thể đọc được.

> [!NOTE]
> `SuppressedError()` không chấp nhận `options` như {{jsxref("Error/Error", "Error()")}} và các lớp con khác, vì ngữ nghĩa của {{jsxref("Error/cause", "cause")}} trùng lặp với `suppressed`.

## Ví dụ

### Tạo một SuppressedError

```js
try {
  throw new SuppressedError(
    new Error("New error"),
    new Error("Original error"),
    "Hello",
  );
} catch (e) {
  console.log(e.suppressed); // Error: "Original error"
  console.log(e.error); // Error: "New error"
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `SuppressedError` in `core-js`](https://github.com/zloirock/core-js#explicit-resource-management)
