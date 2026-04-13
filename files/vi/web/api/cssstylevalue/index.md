---
title: CSSStyleValue
slug: Web/API/CSSStyleValue
page-type: web-api-interface
browser-compat: api.CSSStyleValue
---

{{APIRef("CSS Typed Object Model API")}}

Giao diện **`CSSStyleValue`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model#css_typed_object_model) là lớp cơ sở của tất cả các giá trị CSS có thể truy cập thông qua Typed OM API. Một phiên bản của lớp này có thể được sử dụng ở bất kỳ đâu một chuỗi được mong đợi.

## Giao diện dựa trên CSSStyleValue

Dưới đây là danh sách các giao diện dựa trên giao diện `CSSStyleValue`.

- {{domxref('CSSImageValue')}}
- {{domxref('CSSKeywordValue')}}
- {{domxref('CSSNumericValue')}}
- {{domxref('CSSPositionValue')}}
- {{domxref('CSSTransformValue')}}
- {{domxref('CSSUnparsedValue')}}

## Phương thức tĩnh

- [`CSSStyleValue.parse()`](/en-US/docs/Web/API/CSSStyleValue/parse_static)
  - : Đặt một thuộc tính CSS cụ thể thành các giá trị được chỉ định và trả về giá trị đầu tiên dưới dạng đối tượng `CSSStyleValue`.
- [`CSSStyleValue.parseAll()`](/en-US/docs/Web/API/CSSStyleValue/parseAll_static)
  - : Đặt tất cả các lần xuất hiện của một thuộc tính CSS cụ thể thành giá trị được chỉ định và trả về một mảng các đối tượng `CSSStyleValue`, mỗi đối tượng chứa một trong các giá trị được cung cấp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
