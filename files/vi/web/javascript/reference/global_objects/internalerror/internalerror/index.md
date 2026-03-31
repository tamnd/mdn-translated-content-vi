---
title: InternalError() constructor
short-title: InternalError()
slug: Web/JavaScript/Reference/Global_Objects/InternalError/InternalError
page-type: javascript-constructor
status:
  - non-standard
browser-compat: javascript.builtins.InternalError.InternalError
sidebar: jsref
---

{{Non-standard_Header}}

Constructor **`InternalError()`** tạo ra các đối tượng {{jsxref("InternalError")}}.

## Cú pháp

```js-nolint
new InternalError()
new InternalError(message)
new InternalError(message, options)
new InternalError(message, fileName)
new InternalError(message, fileName, lineNumber)

InternalError()
InternalError(message)
InternalError(message, options)
InternalError(message, fileName)
InternalError(message, fileName, lineNumber)
```

> [!NOTE]
> `InternalError()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `InternalError` mới.

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

### Tạo một InternalError mới

```js
new InternalError("Engine failure");
```

## Đặc tả kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
