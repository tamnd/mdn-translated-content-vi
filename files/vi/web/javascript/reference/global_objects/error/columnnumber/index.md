---
title: "Error: columnNumber"
short-title: columnNumber
slug: Web/JavaScript/Reference/Global_Objects/Error/columnNumber
page-type: javascript-instance-data-property
status:
  - non-standard
browser-compat: javascript.builtins.Error.columnNumber
sidebar: jsref
---

{{Non-standard_Header}}

Thuộc tính dữ liệu **`columnNumber`** của một instance {{jsxref("Error")}} chứa số cột trong dòng của tệp đã tạo ra lỗi này.

## Giá trị

Một số nguyên dương.

{{js_property_attributes(1, 0, 1)}}

## Ví dụ

### Sử dụng columnNumber

```js
try {
  throw new Error("Could not parse input");
} catch (err) {
  console.log(err.columnNumber); // 9
}
```

## Đặc tả kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error.prototype.stack")}}
- {{jsxref("Error.prototype.lineNumber")}}
- {{jsxref("Error.prototype.fileName")}}
