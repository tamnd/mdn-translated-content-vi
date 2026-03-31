---
title: "Error: message"
short-title: message
slug: Web/JavaScript/Reference/Global_Objects/Error/message
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.Error.message
sidebar: jsref
---

Thuộc tính dữ liệu **`message`** của một instance {{jsxref("Error")}} là mô tả lỗi mà con người có thể đọc được.

## Giá trị

Một chuỗi tương ứng với giá trị được truyền vào constructor [`Error()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/Error) làm đối số đầu tiên.

{{js_property_attributes(1, 0, 1)}}

## Mô tả

Thuộc tính này chứa mô tả ngắn gọn về lỗi nếu có hoặc đã được thiết lập. Thuộc tính `message` kết hợp với thuộc tính {{jsxref("Error/name", "name")}} được phương thức {{jsxref("Error.prototype.toString()")}} sử dụng để tạo biểu diễn chuỗi của lỗi.

Theo mặc định, thuộc tính `message` là một chuỗi rỗng, nhưng hành vi này có thể được ghi đè cho một instance bằng cách chỉ định thông báo làm đối số đầu tiên cho constructor {{jsxref("Error/Error", "Error")}}.

## Ví dụ

### Ném một lỗi tùy chỉnh

```js
const e = new Error("Could not parse input");
// e.message is 'Could not parse input'
throw e;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error.prototype.name")}}
- {{jsxref("Error.prototype.toString()")}}
