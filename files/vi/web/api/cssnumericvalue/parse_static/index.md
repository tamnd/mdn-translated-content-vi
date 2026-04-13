---
title: "CSSNumericValue: parse() static method"
short-title: parse()
slug: Web/API/CSSNumericValue/parse_static
page-type: web-api-static-method
browser-compat: api.CSSNumericValue.parse_static
---

{{APIRef("CSS Typed OM")}}

Phương thức tĩnh **`parse()`** của giao diện {{domxref("CSSNumericValue")}} chuyển đổi một chuỗi giá trị thành một đối tượng có các thuộc tính chứa giá trị và đơn vị.

## Cú pháp

```js-nolint
CSSNumericValue.parse(cssText)
```

### Tham số

- `cssText`
  - : Một chuỗi chứa các phần giá trị số và đơn vị.

### Giá trị trả về

Một {{domxref('CSSNumericValue')}}.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Chưa xác định.

## Ví dụ

Đoạn mã sau trả về một đối tượng {{domxref('CSSUnitValue')}} với thuộc tính `unit` bằng `"px"` và thuộc tính `value` bằng `42`.

```js
let numValue = CSSNumericValue.parse("42.0px");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
