---
title: CSS pseudo-elements
short-title: Pseudo-elements
slug: Web/CSS/Guides/Pseudo-elements
page-type: css-module
spec-urls: https://drafts.csswg.org/css-pseudo/
sidebar: cssref
---

Module **CSS pseudo-element** định nghĩa các phần tử trừu tượng không có mặt trực tiếp trong cây tài liệu. Các phần tử trừu tượng này, được gọi là pseudo-elements, đại diện cho các phần của render tree có thể được chọn và tạo style. Pseudo-elements được dùng để tạo ra các trừu tượng về cây tài liệu ngoài những gì cây tài liệu cung cấp.

> [!NOTE]
> Trang này giới thiệu một CSS module. Để tìm danh sách đầy đủ tất cả pseudo-elements được định nghĩa bởi các đặc tả CSS, hãy xem trang tham khảo [pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements).

Pseudo-elements được đặt trước bằng hai dấu hai chấm (`::`). Bạn thêm pseudo-elements vào các selector (như trong `p::first-line`) để nhắm vào và tạo style cho các phần tử giả này.

Pseudo-elements cho phép nhắm vào các thực thể không được đưa vào HTML và các phần nội dung không thể được nhắm vào theo cách khác mà không thêm markup bổ sung. Hãy xem xét placeholder của phần tử {{HTMLelement("input")}}. Đây là một phần tử trừu tượng và không phải là một node riêng biệt trong cây tài liệu. Bạn có thể chọn placeholder này bằng cách dùng pseudo-element {{CSSXref("::placeholder")}}. Như một ví dụ khác, pseudo-element {{CSSXref("::selection")}} khớp với nội dung hiện đang được người dùng đánh dấu, cho phép bạn tạo style cho những gì được khớp khi người dùng tương tác với nội dung và thay đổi lựa chọn. Tương tự, pseudo-element {{CSSXref("::first-line")}} nhắm vào dòng đầu tiên của một phần tử, tự động cập nhật nếu số ký tự của dòng đầu tiên thay đổi, mà không cần truy vấn độ dài dòng của phần tử.

## Tham khảo

### Selectors

- {{CSSXref("::after")}}
- {{CSSXref("::before")}}
- {{CSSXref("::file-selector-button")}}
- {{CSSXref("::first-letter")}}
- {{CSSXref("::first-line")}}
- {{CSSXref("::grammar-error")}}
- {{CSSXref("::highlight()")}}
- {{CSSXref("::marker")}}
- {{CSSXref("::placeholder")}}
- {{CSSXref("::search-text")}}
- {{CSSXref("::selection")}}
- {{CSSXref("::spelling-error")}}
- {{CSSXref("::target-text")}}

Đặc tả kỹ thuật cũng định nghĩa pseudo-element `::details-content` và các sub-pseudo element `::postfix` và `::prefix`. Các pseudo-element này chưa được hỗ trợ bởi bất kỳ trình duyệt nào. Pseudo-element {{CSSXref("::highlight()")}} được đưa vào module này, nhưng hầu hết các chi tiết được cung cấp trong [CSS custom highlight API](/en-US/docs/Web/API/CSS_Custom_Highlight_API).

### Interfaces

- {{DOMxRef("CSSPseudoElement")}} interface
  - {{DOMxRef("CSSPseudoElement.element")}} property
  - {{DOMxRef("CSSPseudoElement.type")}} property

### Thuật ngữ

- Thuật ngữ glossary {{Glossary("Pseudo-element")}}

## Hướng dẫn

- [CSS pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements)
  - : Danh sách theo thứ tự bảng chữ cái của các pseudo-element được định nghĩa bởi tất cả các đặc tả CSS và WebVTT.

- [Learn: Pseudo-classes and pseudo-elements](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements)
  - : Phần về CSS building blocks về selector. Bài viết này định nghĩa pseudo-element là gì và cách nó có thể kết hợp với pseudo-classes và được dùng để tạo nội dung với pseudo-elements `::before` và `::after`.

- [How to create fancy boxes using pseudo-elements](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Create_fancy_boxes#pseudo-elements)
  - : Ví dụ về tạo style cho nội dung được tạo bằng cách dùng pseudo-elements `::before` và `::after` để tạo hiệu ứng thị giác.

## Khái niệm liên quan

- {{cssxref("::backdrop")}}

- Web Video Text Tracks Format (WebVTT) cues:
  - {{cssxref("::cue")}}
  - {{cssxref("::cue()")}}

- [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout) module
  - {{cssxref("::column")}}

- [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) module
  - {{cssxref("::scroll-button()")}}
  - {{cssxref("::scroll-marker")}}
  - {{cssxref("::scroll-marker-group")}}
  - {{cssxref(":target-current")}}

- [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping) module
  - {{CSSXref(":host")}}
  - {{cssxref(":host()")}}
  - {{cssxref(":host-context()")}}
  - {{cssxref("::slotted()")}}

- [CSS shadow parts](/en-US/docs/Web/CSS/Guides/Shadow_parts) module
  - {{CSSXref("::part")}}

- [CSS view transitions](/en-US/docs/Web/CSS/Guides/View_transitions) module
  - {{cssxref("::view-transition")}} {{Experimental_Inline}}
  - {{cssxref("::view-transition-image-pair()")}} {{Experimental_Inline}}
  - {{cssxref("::view-transition-group()")}} {{Experimental_Inline}}
  - {{cssxref("::view-transition-new()")}} {{Experimental_Inline}}
  - {{cssxref("::view-transition-old()")}} {{Experimental_Inline}}

- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors)
  - [Attribute selectors](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors)
  - [Combinators](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators#combinators)
  - [Class selectors](/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors)
  - [ID selectors](/en-US/docs/Web/CSS/Reference/Selectors/ID_selectors)
  - [Type selectors](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors)
  - [Pseudo-classes](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)
  - [Universal selectors](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors)

- Thuộc tính [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder) của phần tử `<input>`
- Selector {{cssxref(":placeholder-shown")}}

- [CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content)
  - Thuộc tính {{cssxref("content")}}
  - Thuộc tính {{cssxref("quotes")}}

- [Text fragments](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments)

- Thuộc tính {{DOMXref("AnimationEvent.pseudoElement")}}
- Thuộc tính {{DOMXref("KeyframeEffect.pseudoElement")}}
- Thuộc tính {{DOMXref("TransitionEvent.pseudoElement")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Danh sách pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements)
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) module
- [CSS shadow-parts](/en-US/docs/Web/CSS/Guides/Shadow_parts) module
- [CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content) module
- [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout) module
- [CSS custom highlight API](/en-US/docs/Web/API/CSS_Custom_Highlight_API)
