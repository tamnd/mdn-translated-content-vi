---
title: CSS selectors
short-title: Selectors
slug: Web/CSS/Guides/Selectors
page-type: css-module
spec-urls: https://drafts.csswg.org/selectors/
sidebar: cssref
---

Module **CSS selectors** định nghĩa các mẫu để chọn các phần tử mà một tập hợp quy tắc CSS sau đó sẽ được áp dụng cùng với [specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) của chúng. Module CSS selectors cung cấp hơn 60 selector và năm combinator. [Các module khác](#related_concepts) cung cấp thêm các pseudo-class selector và pseudo-element.

> [!NOTE]
> Trang này giới thiệu một module CSS. Để tìm danh sách đầy đủ tất cả các selector được định nghĩa trong các đặc tả CSS, hãy xem trang tham chiếu [selectors](/en-US/docs/Web/CSS/Reference/Selectors).

Trong CSS, selector là các mẫu dùng để khớp hoặc chọn các phần tử bạn muốn tạo kiểu. Selector cũng được dùng trong JavaScript để cho phép chọn các node DOM trả về dưới dạng [`NodeList`](/en-US/docs/Web/API/NodeList).

Selector, dù dùng trong CSS hay JavaScript, đều cho phép nhắm mục tiêu vào các phần tử HTML dựa trên loại, thuộc tính, trạng thái hiện tại, thậm chí vị trí trong DOM. Combinator cho phép bạn chọn chính xác hơn bằng cách chọn các phần tử dựa trên mối quan hệ của chúng với các phần tử khác.

## Tham chiếu

### Combinator và dấu phân cách

- `+` ([Next-sibling combinator](/en-US/docs/Web/CSS/Reference/Selectors/Next-sibling_combinator))
- `>` ([Child combinator](/en-US/docs/Web/CSS/Reference/Selectors/Child_combinator))
- `~` ([Subsequent sibling combinator](/en-US/docs/Web/CSS/Reference/Selectors/Subsequent-sibling_combinator))
- " " ([Descendant combinator](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator))
- `|` ([Namespace separator](/en-US/docs/Web/CSS/Reference/Selectors/Namespace_separator))
- `,` ([Selector list](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list))

Module CSS selectors cũng giới thiệu [column combinator](/en-US/docs/Web/CSS/Reference/Selectors/Column_combinator) (`||`). Hiện tại chưa có trình duyệt nào hỗ trợ tính năng này.

### Selector

- {{CSSXref(":active")}}
- {{CSSXref(":any-link")}}
- {{CSSXref(":autofill")}}
- {{CSSXref(":buffering")}}
- {{CSSXref(":checked")}}
- {{CSSXref(":default")}}
- {{CSSXref(":defined")}}
- {{cssxref(":dir()")}}
- {{CSSXref(":disabled")}}
- {{CSSXref(":empty")}}
- {{CSSXref(":enabled")}}
- {{CSSXref(":first-child")}}
- {{CSSXref(":first-of-type")}}
- {{CSSXref(":focus")}}
- {{CSSXref(":focus-visible")}}
- {{CSSXref(":focus-within")}}
- {{CSSXref(":fullscreen")}}
- {{CSSXref(":future")}}
- {{cssxref(":has()")}}
- {{CSSXref(":hover")}}
- {{CSSXref(":in-range")}}
- {{CSSXref(":indeterminate")}}
- {{CSSXref(":interest-source")}}
- {{CSSXref(":interest-target")}}
- {{CSSXref(":invalid")}}
- {{cssxref(":is()")}}
- {{cssxref(":lang()")}}
- {{CSSXref(":last-child")}}
- {{CSSXref(":last-of-type")}}
- {{CSSXref(":link")}}
- `:matches()` (obsolete legacy selector alias for {{CSSXref( ":is", ":is()")}})
- {{CSSXref(":modal")}}
- {{CSSXref(":muted")}}
- {{cssxref(":not()")}}
- {{cssxref(":nth-child()")}}
- {{cssxref(":nth-of-type()")}}
- {{cssxref(":nth-last-child()")}}
- {{cssxref(":nth-last-of-type()")}}
- {{CSSXref(":only-child")}}
- {{CSSXref(":only-of-type")}}
- {{CSSXref(":open")}}
- {{CSSXref(":optional")}}
- {{CSSXref(":out-of-range")}}
- {{CSSXref(":past")}}
- {{CSSXref(":paused")}}
- {{CSSXref(":picture-in-picture")}}
- {{CSSXref(":placeholder-shown")}}
- {{CSSXref(":playing")}}
- {{CSSXref(":popover-open")}}
- {{CSSXref(":read-only")}}
- {{CSSXref(":read-write")}}
- {{CSSXref(":required")}}
- {{CSSXref(":root")}}
- {{CSSXref(":scope")}}
- {{CSSXref(":seeking")}}
- {{CSSXref(":stalled")}}
- {{CSSXref(":target")}}
- {{CSSXref(":user-invalid")}}
- {{CSSXref(":user-valid")}}
- {{CSSXref(":valid")}}
- {{CSSXref(":visited")}}
- {{CSSXref(":volume-locked")}}
- {{cssxref(":where()")}}
- [`:-webkit-` pseudo-classes](/en-US/docs/Web/CSS/Reference/Webkit_extensions#pseudo-classes)
- [Attribute selectors](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors)
- [Class selector](/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors)
- [ID selectors](/en-US/docs/Web/CSS/Reference/Selectors/ID_selectors)
- [Type selectors](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors)
- [Universal selectors](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors)

Module CSS selectors cũng giới thiệu các pseudo-class {{CSSXref(":blank")}}, {{CSSXref(":current")}} và {{CSSXref(":local-link")}}. Hiện tại chưa có trình duyệt nào hỗ trợ những tính năng này.

## Thuật ngữ

- {{glossary("Pseudo-class")}} glossary term
- [Functional pseudo-classes](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#functional_pseudo-classes)
- [Combinators](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators#combinators)
- [Simple selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#simple_selector)
- [Compound selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector)
- [Complex selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#complex_selector)
- [Relative selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#relative_selector)
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)

## Hướng dẫn

- [CSS selectors and combinators](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators)
  - : Tổng quan về các loại simple selector khác nhau và nhiều combinator được định nghĩa trong module CSS selectors và module CSS pseudo.

- [CSS selector structure](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure)
  - : Giải thích cấu trúc của CSS selector và các thuật ngữ được giới thiệu trong module CSS selectors, từ "simple selector" đến "forgiving relative selector list".

- [Pseudo classes](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)
  - : Liệt kê các pseudo-class, là các selector cho phép chọn phần tử dựa trên thông tin trạng thái không có trong cây tài liệu, được định nghĩa trong các module CSS và HTML.

- [Using the `:target` pseudo-class in selectors](/en-US/docs/Web/CSS/Guides/Selectors/Using_:target)
  - : Tìm hiểu cách sử dụng pseudo-class {{CSSXref(":target")}} để tạo kiểu cho phần tử đích của fragment identifier trong URL.

- [Privacy and the `:visited` selector](/en-US/docs/Web/CSS/Guides/Selectors/Privacy_and_:visited)
  - : Khám phá các giới hạn tạo kiểu được đặt ra trên class `:visited` nhằm bảo vệ quyền riêng tư của người dùng.

- [CSS building blocks: CSS selectors](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors)
  - : Giới thiệu về các CSS selector cơ bản, bao gồm hướng dẫn về [Type, class, and ID selectors](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors), [Attribute selectors](/en-US/docs/Learn_web_development/Core/Styling_basics/Attribute_selectors), [Pseudo-classes and pseudo-elements](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements) và [Combinators](/en-US/docs/Learn_web_development/Core/Styling_basics/Combinators).

- [Learn: UI pseudo-classes](/en-US/docs/Learn_web_development/Extensions/Forms/UI_pseudo-classes)
  - : Tìm hiểu các UI pseudo-class khác nhau có sẵn để tạo kiểu form ở các trạng thái khác nhau.

- [Selection and traversal on the DOM tree](/en-US/docs/Web/API/Document_Object_Model/Selection_and_traversal_on_the_DOM_tree)
  - : Selectors API cho phép sử dụng selector trong JavaScript để lấy các node phần tử từ DOM.

## Khái niệm liên quan

- {{CSSXref(":state","state()")}} pseudo-class
- [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting) module
  - [`&` nesting selector](/en-US/docs/Web/CSS/Reference/Selectors/Nesting_selector)
- [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping) module
  - {{CSSXref(":host")}} pseudo-class
  - {{cssxref(":host()")}} pseudo-class
  - {{cssxref(":host-context()")}} pseudo-class
  - {{CSSXref(":has-slotted")}} pseudo-class
  - {{CSSXref("::slotted")}} pseudo-element

- [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) module
  - {{cssxref("::scroll-button()")}}
  - {{cssxref("::scroll-marker")}}
  - {{cssxref("::scroll-marker-group")}}
  - {{cssxref(":target-current")}}

- [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout) module
  - {{cssxref("::column")}}

- [CSS paged media](/en-US/docs/Web/CSS/Guides/Paged_media) module
  - {{CSSXref(":left")}} pseudo-class
  - {{CSSXref(":right")}} pseudo-class
  - {{CSSXref(":first")}} pseudo-class
  - `:blank` pseudo-class

- [CSS pseudo-element module](/en-US/docs/Web/CSS/Guides/Pseudo-elements) (representing entities not included in HTML)
  - {{CSSXref("::after")}}
  - {{CSSXref("::before")}}
  - {{CSSXref("::file-selector-button")}}
  - {{CSSXref("::first-letter")}}
  - {{CSSXref("::first-line")}}
  - {{CSSXref("::grammar-error")}}
  - {{CSSXref("::marker")}}
  - {{CSSXref("::placeholder")}}
  - {{CSSXref("::selection")}}
  - {{CSSXref("::spelling-error")}}
  - {{CSSXref("::target-text")}}

- [CSS shadow parts module](/en-US/docs/Web/CSS/Guides/Shadow_parts)
  - {{CSSXref("::part")}} pseudo-element

- [CSS positioned layout module](/en-US/docs/Web/CSS/Guides/Positioned_layout)
  - {{CSSxRef("::backdrop")}}

- Other [pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements)
  - {{CSSxRef("::cue")}}

- [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
  - [`<keyframe-selector>`](/en-US/docs/Web/CSS/Reference/Selectors/Keyframe_selectors)

- {{CSSXref("@namespace")}} at-rule

- {{cssxref("important", "!important")}}
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [Cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction)

- {{domxref("Document.querySelector")}} method
- {{domxref("Document.querySelectorAll")}} method
- {{domxref("NodeList.forEach()")}} method

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [CSS pseudo-element module](/en-US/docs/Web/CSS/Guides/Pseudo-elements)
- [CSS cascading and inheritance module](/en-US/docs/Web/CSS/Guides/Cascade)
- [CSS nesting module](/en-US/docs/Web/CSS/Guides/Nesting)
- [Using shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
