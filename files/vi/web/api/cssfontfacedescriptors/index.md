---
title: CSSFontFaceDescriptors
slug: Web/API/CSSFontFaceDescriptors
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CSSFontFaceDescriptors
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Giao diện **`CSSFontFaceDescriptors`** đại diện cho khối khai báo CSS cho at-rule {{cssxref("@font-face")}}.

Mỗi descriptor trong phần thân của at-rule {{cssxref("@font-face")}} tương ứng có thể được truy cập bằng tên thuộc tính kebab-case của nó trong [ký hiệu dấu ngoặc vuông](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#bracket_notation) hoặc phiên bản camelCase của tên thuộc tính trong [ký hiệu dấu chấm](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#dot_notation). Ví dụ, bạn có thể truy cập CSS descriptor `font-family` như `style["font-family"]` hoặc `style.fontFamily`, trong đó `style` là instance `CSSFontFaceDescriptors`.

> [!NOTE]
> Giao diện {{domxref("CSSFontFaceRule")}} đại diện cho at-rule {{cssxref("@font-face")}}, và thuộc tính {{domxref("CSSFontFaceRule.style")}} là instance của đối tượng này.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên {{domxref("CSSStyleDeclaration")}}._

Các tên thuộc tính sau, trong định dạng kebab-case và camelCase, mỗi cái đại diện cho giá trị của descriptor trong at-rule `@font-face` tương ứng:

- `font-display` hoặc `fontDisplay` {{experimental_inline}}: Chuỗi đại diện cho giá trị của descriptor {{cssxref("@font-face/font-display", "font-display")}}.
- `font-family` hoặc `fontFamily` {{experimental_inline}}: Chuỗi đại diện cho giá trị của descriptor {{cssxref("@font-face/font-family", "font-family")}}.
- `font-feature-settings` hoặc `fontFeatureSettings` {{experimental_inline}}: Chuỗi đại diện cho giá trị của descriptor {{cssxref("@font-face/font-feature-settings", "font-feature-settings")}}.
- `font-stretch` hoặc `fontStretch` {{experimental_inline}}: Chuỗi đại diện cho giá trị của descriptor {{cssxref("@font-face/font-stretch", "font-stretch")}}.
- `font-style` hoặc `fontStyle` {{experimental_inline}}: Chuỗi đại diện cho giá trị của descriptor {{cssxref("@font-face/font-style", "font-style")}}.
- `font-weight` hoặc `fontWeight` {{experimental_inline}}: Chuỗi đại diện cho giá trị của descriptor {{cssxref("@font-face/font-weight", "font-weight")}}.
- `font-width` hoặc `fontWidth` {{experimental_inline}}: Chuỗi đại diện cho giá trị của descriptor {{cssxref("@font-face/font-width", "font-width")}}.
- `size-adjust` hoặc `sizeAdjust` {{experimental_inline}}: Chuỗi đại diện cho giá trị của descriptor {{cssxref("@font-face/size-adjust", "size-adjust")}}.
- `src` {{experimental_inline}}: Chuỗi đại diện cho giá trị của descriptor {{cssxref("@font-face/src", "src")}}.
- `unicode-range` hoặc `unicodeRange` {{experimental_inline}}: Chuỗi đại diện cho giá trị của descriptor {{cssxref("@font-face/unicode-range", "unicode-range")}}.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ tổ tiên {{domxref("CSSStyleDeclaration")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face")}}
- {{domxref("CSSFontFaceRule")}}
