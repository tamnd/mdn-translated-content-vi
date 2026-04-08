---
title: "Error: fileName"
short-title: fileName
slug: Web/JavaScript/Reference/Global_Objects/Error/fileName
page-type: javascript-instance-data-property
status:
  - non-standard
browser-compat: javascript.builtins.Error.fileName
sidebar: jsref
---

{{Non-standard_Header}}

Thuộc tính dữ liệu **`fileName`** của một instance {{jsxref("Error")}} chứa đường dẫn đến tệp đã tạo ra lỗi này.

## Giá trị

Một chuỗi.

{{js_property_attributes(1, 0, 1)}}

## Mô tả

Thuộc tính không chuẩn này chứa đường dẫn đến tệp đã tạo ra lỗi này. Nếu được gọi từ ngữ cảnh debugger, chẳng hạn như Firefox Developer Tools, chuỗi "debugger eval code" sẽ được trả về.

## Ví dụ

### Sử dụng fileName

```js
const e = new Error("Could not parse input");
throw e;
// e.fileName could look like "file:///C:/example.html"
```

## Đặc tả kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error.prototype.stack")}}
- {{jsxref("Error.prototype.columnNumber")}}
- {{jsxref("Error.prototype.lineNumber")}}
