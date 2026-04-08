---
title: CSS writing modes
short-title: Writing modes
slug: Web/CSS/Guides/Writing_modes
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-writing-modes/
  - https://drafts.csswg.org/css-writing-modes-3/
sidebar: cssref
---

Module **CSS writing modes** định nghĩa hỗ trợ cho các chế độ viết quốc tế khác nhau và các tổ hợp của chúng, bao gồm thứ tự văn bản từ trái sang phải và từ phải sang trái cũng như hướng ngang và dọc.

Một _writing mode_ trong CSS được xác định bởi các thuộc tính {{cssxref("writing-mode")}}, {{cssxref("direction")}}, và {{cssxref("text-orientation")}} được định nghĩa trong module này. Nó được định nghĩa chủ yếu theo hướng cơ sở inline và hướng luồng block của nó.

Một số ngôn ngữ viết theo chiều ngang từ trái sang phải, bao gồm chữ Latin và chữ Ấn Độ. Các ngôn ngữ ngang khác được viết từ phải sang trái, bao gồm chữ Hebrew và chữ Ả Rập. Đôi khi văn bản cần là hai chiều, chẳng hạn khi kết hợp chữ viết từ trái sang phải và từ phải sang trái. Một số ngôn ngữ có thể được viết theo hướng dọc, ví dụ chữ viết Trung Quốc, Nhật Bản và Hàn Quốc (CJK).

Module CSS writing modes giải quyết hướng của tất cả các chế độ viết. Các module khác, như module [CSS ruby layout](/en-US/docs/Web/CSS), cung cấp mô hình hiển thị và kiểm soát định dạng liên quan đến chú thích văn bản hiển thị.

## Tham chiếu

### Thuộc tính

- {{cssxref("direction")}}
- {{cssxref("glyph-orientation-vertical")}}
- {{cssxref("text-combine-upright")}}
- {{cssxref("text-orientation")}}
- {{cssxref("unicode-bidi")}}
- {{cssxref("writing-mode")}}

### Thuật ngữ

- {{glossary("/Baseline/Typography", "Baseline")}}
- {{Glossary("Internationalization")}}
- {{glossary("Localization")}}
- {{glossary("Leading")}}

## Hướng dẫn

- [Tạo form control dọc](/en-US/docs/Web/CSS/Guides/Writing_modes/Vertical_controls)
  - : Bài viết giải thích cách sử dụng các thuộc tính CSS {{cssxref("writing-mode")}} và {{cssxref("direction")}} để tạo và cấu hình các form control dọc.
- [Giới thiệu về các hệ thống writing mode](/en-US/docs/Web/CSS/Guides/Writing_modes/Writing_mode_systems)
  - : Tổng quan ngắn gọn về các hệ thống writing mode và chiều hướng của chúng.

## Các khái niệm liên quan

Module [CSS text](/en-US/docs/Web/CSS/Guides/Text)

- {{cssxref("hanging-punctuation")}}
- {{cssxref("hyphens")}}
- {{cssxref("letter-spacing")}}
- {{cssxref("line-break")}}
- {{cssxref("overflow-wrap")}}
- {{cssxref("text-align")}}
- {{cssxref("text-align-last")}}
- {{cssxref("text-indent")}}
- {{cssxref("text-justify")}}
- {{cssxref("word-break")}}
- {{cssxref("word-spacing")}}

Module [CSS inline layout](/en-US/docs/Web/CSS/Guides/Inline_layout)

- {{cssxref("alignment-baseline")}}
- {{cssxref("dominant-baseline")}}
- {{cssxref("line-height")}}
- {{cssxref("text-box-edge")}}
- {{cssxref("text-box-trim")}}
- Shorthand {{cssxref("text-box")}}
- {{cssxref("text-edge")}}

Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)

- {{glossary("Flow relative values")}}
- {{glossary("Inset properties")}}
- {{glossary("Logical properties")}}
- {{glossary("Physical properties")}}

Module [CSS display](/en-US/docs/Web/CSS/Guides/Display)

- {{cssxref("display")}}

- {{CSSxRef("&lt;display-internal&gt;")}}
- [Mô hình định dạng trực quan](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)

[CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content)

- {{CSSxRef("quotes")}}

[SVG](/en-US/docs/Web/SVG)

- {{SVGAttr("glyph-orientation-horizontal")}} {{deprecated_inline}}
- {{SVGAttr("glyph-orientation-vertical")}} {{deprecated_inline}}
- {{SVGAttr("writing-mode")}}

[HTML](/en-US/docs/Web/HTML)

- {{htmlelement("bdo")}}
- {{htmlelement("blockquote")}}
- {{htmlelement("q")}}
- {{htmlelement("ruby")}}
- {{htmlelement("sub")}}
- {{htmlelement("sup")}}
- Thuộc tính [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir)
- Thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang)

[JavaScript](/en-US/docs/Web/JavaScript)

- [Hướng dẫn quốc tế hóa](/en-US/docs/Web/JavaScript/Guide/Internationalization)
- Đối tượng [`Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl)

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS fonts](/en-US/docs/Web/CSS/Guides/Fonts)
- Module [CSS ruby layout](/en-US/docs/Web/CSS/Guides/Ruby_layout)
- Module [CSS text decoration](/en-US/docs/Web/CSS/Guides/Text_decoration)
- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
- Module [CSS lists](/en-US/docs/Web/CSS/Guides/Lists)
- Module [CSS containment](/en-US/docs/Web/CSS/Guides/Containment): {{CSSxRef("contain-intrinsic-block-size")}} và {{CSSxRef("contain-intrinsic-inline-size")}}
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow): {{CSSxRef("overflow-block")}} và {{CSSxRef("overflow-inline")}}
- Module [CSS overscroll behavior](/en-US/docs/Web/CSS/Guides/Overscroll_behavior): {{CSSxRef("overscroll-behavior-block")}} và {{CSSxRef("overscroll-behavior-inline")}}
