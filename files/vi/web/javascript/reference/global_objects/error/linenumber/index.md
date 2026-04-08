---
title: "Error: lineNumber"
short-title: lineNumber
slug: Web/JavaScript/Reference/Global_Objects/Error/lineNumber
page-type: javascript-instance-data-property
status:
  - non-standard
browser-compat: javascript.builtins.Error.lineNumber
sidebar: jsref
---

{{Non-standard_Header}}

Thuộc tính dữ liệu **`lineNumber`** của một instance {{jsxref("Error")}} chứa số dòng trong tệp đã tạo ra lỗi này.

## Giá trị

Một số nguyên dương.

{{js_property_attributes(1, 0, 1)}}

## Ví dụ

### Sử dụng lineNumber

```js
try {
  throw new Error("Could not parse input");
} catch (err) {
  console.log(err.lineNumber); // 2
}
```

### Ví dụ thay thế sử dụng sự kiện error

```js
window.addEventListener("error", (e) => {
  console.log(e.lineNumber); // 5
});
const e = new Error("Could not parse input");
throw e;
```

Đây không phải là tính năng tiêu chuẩn và thiếu sự hỗ trợ rộng rãi. Xem bảng tương thích trình duyệt bên dưới.

## Đặc tả kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error.prototype.stack")}}
- {{jsxref("Error.prototype.columnNumber")}}
- {{jsxref("Error.prototype.fileName")}}
