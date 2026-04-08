---
title: "AggregateError: errors"
short-title: errors
slug: Web/JavaScript/Reference/Global_Objects/AggregateError/errors
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.AggregateError.errors
sidebar: jsref
---

Thuộc tính dữ liệu **`errors`** của một instance {{jsxref("AggregateError")}} chứa một mảng đại diện cho các lỗi đã được tổng hợp.

## Value

Một {{jsxref("Array")}} chứa các giá trị theo cùng thứ tự như iterable được truyền vào tham số đầu tiên của constructor {{jsxref("AggregateError/AggregateError", "AggregateError()")}}.

{{js_property_attributes(1, 0, 1)}}

## Examples

### Sử dụng errors

```js
try {
  throw new AggregateError(
    // Một iterable chứa các lỗi
    new Set([new Error("some error"), new Error("another error")]),
    "Multiple errors thrown",
  );
} catch (err) {
  console.log(err.errors);
  // [
  //   Error: some error,
  //   Error: another error
  // ]
}
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- Hướng dẫn [Control flow and error handling](/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling)
- {{jsxref("AggregateError")}}
- [`Error`: `cause`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause)
