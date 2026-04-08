---
title: "SuppressedError: suppressed"
short-title: suppressed
slug: Web/JavaScript/Reference/Global_Objects/SuppressedError/suppressed
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.SuppressedError.suppressed
sidebar: jsref
---

Thuộc tính dữ liệu **`suppressed`** của một instance {{jsxref("SuppressedError")}} chứa tham chiếu đến lỗi ban đầu bị che khuất vì một lỗi mới được tạo ra trong quá trình xử lý nó.

## Giá trị

Bất kỳ giá trị nào. Giống như {{jsxref("Error/cause", "cause")}}, bạn không thể giả định đây là một instance {{jsxref("Error")}}, mặc dù thường thì đó là trường hợp.

{{js_property_attributes(1, 0, 1)}}

## Ví dụ

### Sử dụng suppressed

```js
try {
  throw new SuppressedError(
    new Error("New error"),
    new Error("Original error"),
    "Hello",
  );
} catch (e) {
  console.log(e.suppressed); // Error: "Original error"
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
