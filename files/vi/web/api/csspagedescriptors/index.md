---
title: CSSPageDescriptors
slug: Web/API/CSSPageDescriptors
page-type: web-api-interface
browser-compat: api.CSSPageDescriptors
---

{{APIRef("CSSOM")}}

Giao diện **`CSSPageDescriptors`** đại diện cho khối khai báo CSS cho at-rule {{cssxref("@page")}}.

Giao diện cung cấp thông tin kiểu và các phương thức và thuộc tính liên quan đến kiểu cho trang. Mỗi thuộc tính nhiều từ có phiên bản camelCase và snake-case. Điều này có nghĩa là bạn có thể truy cập thuộc tính CSS `margin-top` bằng cú pháp `style["margin-top"]` hoặc `style.marginTop` (trong đó `style` là `CSSPageDescriptor`).

Đối tượng `CSSPageDescriptors` được truy cập thông qua thuộc tính {{DOMxRef("CSSPageRule.style", "style")}} của giao diện `CSSPageRule`, có thể tìm thấy bằng cách sử dụng API {{DOMxRef("CSSStyleSheet")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ cha {{domxref("CSSStyleDeclaration")}}._

Các tên thuộc tính sau, mỗi cái đại diện cho giá trị của descriptor trong at-rule `@page` tương ứng:

- `margin`: Chuỗi đại diện cho thuộc tính `margin` của at-rule `@page` tương ứng.
- `margin-top` hoặc `marginTop`: Chuỗi đại diện cho thuộc tính `margin-top` của at-rule `@page` tương ứng.
- `margin-right` hoặc `marginRight`: Chuỗi đại diện cho thuộc tính `margin-right` của at-rule `@page` tương ứng.
- `margin-bottom` hoặc `marginBottom`: Chuỗi đại diện cho thuộc tính `margin-bottom` của at-rule `@page` tương ứng.
- `margin-left` hoặc `marginLeft`: Chuỗi đại diện cho thuộc tính `margin-left` của at-rule `@page` tương ứng.
- `page-orientation` hoặc `pageOrientation` {{experimental_inline}}: Chuỗi đại diện cho thuộc tính `page-orientation` của at-rule `@page` tương ứng.
- `size`: Chuỗi đại diện cho thuộc tính `size` của at-rule `@page` tương ứng.

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức từ cha {{domxref("CSSStyleDeclaration")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@page")}}
- {{domxref("CSSPageRule")}}
