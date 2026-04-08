---
title: "SuppressedError: error"
short-title: error
slug: Web/JavaScript/Reference/Global_Objects/SuppressedError/error
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.SuppressedError.error
sidebar: jsref
---

Thuộc tính dữ liệu **`error`** của một instance {{jsxref("SuppressedError")}} chứa tham chiếu đến lỗi gây ra việc bị che khuất (suppression).

## Giá trị

Bất kỳ giá trị nào. Giống như {{jsxref("Error/cause", "cause")}}, bạn không thể giả định đây là một instance {{jsxref("Error")}}, mặc dù thường thì đó là trường hợp.

{{js_property_attributes(1, 0, 1)}}

## Ví dụ

### Sử dụng error

```js
try {
  throw new SuppressedError(
    new Error("New error"),
    new Error("Original error"),
    "Hello",
  );
} catch (e) {
  console.log(e.error); // Error: "New error"
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Luồng điều khiển và xử lý lỗi](/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling)
- {{jsxref("SuppressedError")}}
- [`Error`: `cause`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause)
