---
title: AggregateError() constructor
short-title: AggregateError()
slug: Web/JavaScript/Reference/Global_Objects/AggregateError/AggregateError
page-type: javascript-constructor
browser-compat: javascript.builtins.AggregateError.AggregateError
sidebar: jsref
---

Constructor **`AggregateError()`** tạo các đối tượng {{jsxref("AggregateError")}}.

## Syntax

```js-nolint
new AggregateError(errors)
new AggregateError(errors, message)
new AggregateError(errors, message, options)

AggregateError(errors)
AggregateError(errors, message)
AggregateError(errors, message, options)
```

> [!NOTE]
> `AggregateError()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `AggregateError` mới.

### Parameters

- `errors`
  - : Một iterable chứa các lỗi, không nhất thiết phải là các instance {{jsxref("Error")}}.
- `message` {{optional_inline}}
  - : Mô tả tùy chọn về lỗi tổng hợp, dưới dạng người đọc được.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính sau:
    - `cause` {{optional_inline}}
      - : Thuộc tính chỉ ra nguyên nhân cụ thể của lỗi.
        Khi bắt và ném lại một lỗi với thông báo lỗi cụ thể hoặc hữu ích hơn, thuộc tính này có thể được dùng để truyền lỗi gốc.

## Examples

### Tạo một AggregateError

```js
try {
  throw new AggregateError([new Error("some error")], "Hello");
} catch (e) {
  console.log(e instanceof AggregateError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "AggregateError"
  console.log(e.errors); // [ Error: "some error" ]
}
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `AggregateError` in `core-js`](https://github.com/zloirock/core-js#ecmascript-promise)
- [es-shims polyfill of `AggregateError`](https://www.npmjs.com/package/es-aggregate-error)
- {{jsxref("Promise.any")}}
