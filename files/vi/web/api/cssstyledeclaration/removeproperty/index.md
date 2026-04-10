---
title: "CSSStyleDeclaration: phương thức removeProperty()"
short-title: removeProperty()
slug: Web/API/CSSStyleDeclaration/removeProperty
page-type: web-api-instance-method
browser-compat: api.CSSStyleDeclaration.removeProperty
---

{{ APIRef("CSSOM") }}

Phương thức giao diện **`CSSStyleDeclaration.removeProperty()`** xóa một thuộc tính khỏi một đối tượng khai báo kiểu CSS.

## Cú pháp

```js-nolint
removeProperty(property)
```

### Tham số

- `property`
  - : Một chuỗi đại diện cho tên thuộc tính cần xóa. Các tên thuộc tính nhiều từ được gạch nối ({{Glossary("kebab_case", "kebab-case")}}) và không phải {{Glossary("camel_case", "camel-case")}}.

### Giá trị trả về

Một chuỗi bằng với giá trị của thuộc tính CSS trước khi nó bị xóa.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref('DOMException')}}
  - : Được ném khi thuộc tính hoặc khối khai báo là chỉ đọc.

## Ví dụ

Mã JavaScript sau đây xóa thuộc tính CSS `background-color` khỏi một quy tắc bộ chọn:

```js
const declaration = document.styleSheets[0].rules[0].style;
const oldValue = declaration.removeProperty("background-color");
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
