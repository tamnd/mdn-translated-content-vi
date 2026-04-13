---
title: "CSSStyleValue: phương thức tĩnh parseAll()"
short-title: parseAll()
slug: Web/API/CSSStyleValue/parseAll_static
page-type: web-api-static-method
browser-compat: api.CSSStyleValue.parseAll_static
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức tĩnh **`parseAll()`** của giao diện {{domxref("CSSStyleValue")}} đặt tất cả các lần xuất hiện của một thuộc tính CSS cụ thể thành giá trị được chỉ định và trả về một mảng các đối tượng {{domxref('CSSStyleValue')}}, mỗi đối tượng chứa một trong các giá trị được cung cấp.

## Cú pháp

```js-nolint
CSSStyleValue.parseAll(property, value)
```

### Tham số

- `property`
  - : Một thuộc tính CSS cần đặt.
- `value`
  - : Một chuỗi phân cách bằng dấu phẩy chứa một hoặc nhiều giá trị áp dụng cho thuộc tính được cung cấp.

### Giá trị trả về

Một mảng các đối tượng `CSSStyleValue`, mỗi đối tượng chứa một trong các giá trị được cung cấp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`CSSStyleValue.parse()`](/en-US/docs/Web/API/CSSStyleValue/parse_static)
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
