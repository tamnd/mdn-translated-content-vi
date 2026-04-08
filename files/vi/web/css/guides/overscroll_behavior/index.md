---
title: CSS overscroll behavior
short-title: Overscroll behavior
slug: Web/CSS/Guides/Overscroll_behavior
page-type: css-module
spec-urls: https://drafts.csswg.org/css-overscroll/
sidebar: cssref
---

Module **CSS overscroll behavior** cung cấp các thuộc tính để kiểm soát hành vi của {{Glossary("Scroll_container", "scroll container")}} khi vị trí cuộn của nó đạt đến {{Glossary("Scroll_boundary", "scroll boundary")}}. Kiểm soát khía cạnh này đặc biệt hữu ích trong các tình huống mà các vùng có thể cuộn được nhúng không nên kích hoạt cuộn trên container cha.

Khi bình luận trên một blog, bạn có thể nhận thấy rằng nếu bình luận của bạn vượt quá độ dài của {{htmlelement("textarea")}} được cung cấp, cuộn quá cuối vùng văn bản sẽ khiến toàn bộ blog cuộn. Điều này là vì khi đạt đến cuối vùng có thể cuộn, được gọi là {{Glossary("Scroll_boundary", "scroll boundary")}}, có thể dẫn đến cuộn nội dung khác hoặc toàn bộ trang. Trải nghiệm cuộn liên tục này được gọi là {{Glossary("Scroll_chaining", "scroll chaining")}}.

Trong các tình huống mà nội dung của một phần tử lớn hơn container của nó và {{cssxref("overflow")}} cho phép hoặc mặc định là cuộn (như trong `<textarea>`), tiếp tục cuộn qua vùng có thể cuộn của phần tử sẽ khởi tạo cuộn trong phần tử cha hoặc trang nền.

Ngược lại, cuộn qua điều khoản và điều kiện của một trang web và đến cuối nội dung để bật một hộp kiểm, có thể không buộc trang cuộn hoặc bật lại (như trên điện thoại). Ví dụ này cho thấy bạn có thể kiểm soát hành vi overscroll và ngăn scroll chaining.

Module này định nghĩa hành vi overscroll, cho phép bạn chỉ định các hành động khi người dùng cuộn vượt quá ranh giới của phần tử có thể cuộn.

## Tham chiếu

### Thuộc tính CSS

- Shorthand {{CSSxRef("overscroll-behavior")}}
- {{CSSxRef("overscroll-behavior-block")}}
- {{CSSxRef("overscroll-behavior-inline")}}
- {{CSSxRef("overscroll-behavior-x")}}
- {{CSSxRef("overscroll-behavior-y")}}

### Thuật ngữ bảng chú giải

- {{Glossary("Scroll_boundary", "Scroll boundary")}}
- {{Glossary("Scroll_chaining", "Scroll chaining")}}

## Hướng dẫn

- [Học: Nội dung tràn](/en-US/docs/Learn_web_development/Core/Styling_basics/Overflow)
  - : Tìm hiểu overflow là gì và cách quản lý nó.

## Khái niệm liên quan

- ARIA role [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- Khái niệm [Containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow):
  - Thuộc tính shorthand {{cssxref("overflow")}}
    - {{Cssxref("overflow-x")}}
    - {{Cssxref("overflow-y")}}
    - {{CSSxRef("overflow-block")}}
    - {{CSSxRef("overflow-inline")}}
  - Thuộc tính {{CSSxRef("overflow-clip-margin")}}
  - Thuộc tính {{CSSxRef("scroll-behavior")}}
  - Thuộc tính {{CSSxRef("text-overflow")}}
- Thuật ngữ bảng chú giải {{Glossary("Scroll_container", "Scroll container")}} và [scrollport](/en-US/docs/Glossary/Scroll_container#scrollport)

- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap):
  - Thuộc tính shorthand {{cssxref("scroll-padding")}}
  - Thuộc tính {{cssxref("scroll-snap-type")}}
  - Thuộc tính shorthand {{cssxref("scroll-margin")}}
  - Thuộc tính {{cssxref("scroll-snap-stop")}}
  - Thuộc tính {{cssxref("scroll-snap-align")}}

- Module [CSSOM view](/en-US/docs/Web/CSS/Guides/CSSOM_view):
  - Phương thức {{domxref("Element.getBoundingClientRect()")}}
  - Phương thức {{domxref("Element.scroll()")}}
  - Phương thức {{domxref("Element.scrollBy()")}}
  - Phương thức {{domxref("Element.scrollIntoView()")}}
  - Phương thức {{domxref("Element.scrollTo()")}}
  - Sự kiện Document {{domxref("Document.scroll_event", "scroll")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- Module [CSS scroll anchoring](/en-US/docs/Web/CSS/Guides/Scroll_anchoring)
- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- Module [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model)
- Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
