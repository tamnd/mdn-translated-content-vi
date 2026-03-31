---
title: Error.prototype.name
short-title: name
slug: Web/JavaScript/Reference/Global_Objects/Error/name
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.Error.name
sidebar: jsref
---

Thuộc tính dữ liệu **`name`** của `Error.prototype` được chia sẻ bởi tất cả các instance {{jsxref("Error")}}. Nó đại diện cho tên của loại lỗi. Đối với `Error.prototype.name`, giá trị khởi tạo là `"Error"`. Các lớp con như {{jsxref("TypeError")}} và {{jsxref("SyntaxError")}} cung cấp các thuộc tính `name` riêng của chúng.

## Giá trị

Một chuỗi. Đối với `Error.prototype.name`, giá trị khởi tạo là `"Error"`.

{{js_property_attributes(1, 0, 1)}}

## Mô tả

Theo mặc định, các instance {{jsxref("Error")}} được gán tên "Error". Thuộc tính `name`, kết hợp với thuộc tính {{jsxref("Error/message", "message")}}, được phương thức {{jsxref("Error.prototype.toString()")}} sử dụng để tạo biểu diễn chuỗi của lỗi.

## Ví dụ

### Ném một lỗi tùy chỉnh

```js
const e = new Error("Malformed input"); // e.name is 'Error'

e.name = "ParseError";
throw e;
// e.toString() would return 'ParseError: Malformed input'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error.prototype.message")}}
- {{jsxref("Error.prototype.toString()")}}
