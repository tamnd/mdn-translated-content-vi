---
title: CSSPositionTryDescriptors
slug: Web/API/CSSPositionTryDescriptors
page-type: web-api-interface
browser-compat: api.CSSPositionTryDescriptors
---

{{APIRef("CSSOM")}}

Giao diện **`CSSPositionTryDescriptors`** xác định các thuộc tính đại diện cho danh sách các CSS descriptor có thể được đặt trong phần thân của at-rule {{cssxref("@position-try")}}.

Mỗi descriptor trong phần thân của at-rule {{cssxref("@position-try")}} tương ứng có thể được truy cập bằng tên thuộc tính của nó trong [ký hiệu dấu ngoặc vuông](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#bracket_notation) hoặc phiên bản camelCase của tên thuộc tính trong [ký hiệu dấu chấm](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#dot_notation). Ví dụ, bạn có thể truy cập thuộc tính CSS "property-name" như `style["property-name"]` hoặc `style.propertyName`, trong đó `style` là instance `CSSPositionTryDescriptors`.

> [!NOTE]
> Giao diện {{domxref("CSSPositionTryRule")}} đại diện cho at-rule {{cssxref("@position-try")}}, và thuộc tính {{domxref("CSSPositionTryRule.style")}} là instance của đối tượng này.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên {{domxref("CSSStyleDeclaration")}}._

Các tên thuộc tính sau, trong định dạng snake-case (truy cập bằng ký hiệu dấu ngoặc vuông) và camelCase (truy cập bằng ký hiệu dấu chấm), mỗi cái đại diện cho giá trị của descriptor trong at-rule `@position-try` tương ứng:

- `align-self` hoặc `alignSelf`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("align-self")}}.
- `block-size` hoặc `blockSize`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("block-size")}}.
- `bottom`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("bottom")}}.
- `height`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("height")}}.
- `inline-size` hoặc `inlineSize`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("inline-size")}}.
- `inset`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("inset")}}.
- `position-area` hoặc `positionArea`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("position-area")}}.
- `inset-block` hoặc `insetBlock`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("inset-block")}}.
- `inset-block-end` hoặc `insetBlockEnd`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("inset-block-end")}}.
- `inset-block-start` hoặc `insetBlockStart`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("inset-block-start")}}.
- `inset-inline` hoặc `insetInline`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("inset-inline")}}.
- `inset-inline-end` hoặc `insetInlineEnd`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("inset-inline-end")}}.
- `inset-inline-start` hoặc `insetInlineStart`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("inset-inline-start")}}.
- `justify-self` hoặc `justifySelf`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("justify-self")}}.
- `left`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("left")}}.
- `margin`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("margin")}}.
- `margin-block` hoặc `marginBlock`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("margin-block")}}.
- `right`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("right")}}.
- `top`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("top")}}.
- `width`: Chuỗi đại diện cho giá trị của descriptor {{cssxref("width")}}.

## Phương thức phiên bản

_Kế thừa các phương thức từ tổ tiên {{domxref("CSSStyleDeclaration")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@position-try")}}
- {{domxref("CSSPositionTryRule")}}
