---
title: CSS anchor positioning
short-title: Anchor positioning
slug: Web/CSS/Guides/Anchor_positioning
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-anchor-position-1/
  - https://drafts.csswg.org/css-anchor-position-2/
sidebar: cssref
---

Module **CSS anchor positioning** định nghĩa các tính năng cho phép bạn gắn kết các phần tử lại với nhau. Một số phần tử được định nghĩa là **anchor element** (phần tử neo); các **anchor-positioned element** (phần tử được định vị bằng anchor) có thể được thiết lập kích thước và vị trí dựa trên kích thước và vị trí của các anchor element mà chúng được liên kết tới.

Ngoài ra, đặc tả cũng cung cấp các cơ chế chỉ dùng CSS để:

- Chỉ định một tập các vị trí thay thế cho một phần tử được neo; khi vị trí hiển thị mặc định khiến phần tử tràn ra ngoài containing block hoặc ra ngoài màn hình, trình duyệt sẽ thử hiển thị phần tử được neo ở các vị trí thay thế đó.
- Khai báo các điều kiện mà dưới đó các anchor-positioned element sẽ bị ẩn đi, trong những tình huống không thích hợp để neo chúng vào anchor element.

## Tham chiếu

### Thuộc tính

- {{cssxref("anchor-scope")}}
- {{cssxref("anchor-name")}}
- {{cssxref("position-anchor")}}
- {{cssxref("position-area")}}
- {{cssxref("position-try-fallbacks")}}
- {{cssxref("position-try-order")}}
- {{cssxref("position-try")}} shorthand
- {{cssxref("position-visibility")}}

### At-rule và descriptor

- {{cssxref("@position-try")}}

### Hàm

- [`anchor()`](/en-US/docs/Web/CSS/Reference/Values/anchor)
- [`anchor-size()`](/en-US/docs/Web/CSS/Reference/Values/anchor-size)

### Kiểu dữ liệu và giá trị

- [`anchor-center`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#centering_on_the_anchor_using_anchor-center)
- [`<anchor-side>`](/en-US/docs/Web/CSS/Reference/Values/anchor#anchor-side)
- [`<anchor-size>`](/en-US/docs/Web/CSS/Reference/Values/anchor-size#anchor-size)
- [`<position-area>`](/en-US/docs/Web/CSS/Reference/Values/position-area_value)
- [`<try-size>`](/en-US/docs/Web/CSS/Reference/Properties/position-try-order#try-size)
- [`<try-tactic>`](/en-US/docs/Web/CSS/Reference/Properties/position-try-fallbacks#try-tactic)

### Thuộc tính HTML

- [`anchor`](/en-US/docs/Web/HTML/Reference/Global_attributes/anchor) {{non-standard_inline}}

### Interface

- {{domxref("CSSPositionTryDescriptors")}}
- {{domxref("CSSPositionTryRule")}}
- {{domxref("HTMLElement.anchorElement")}} {{non-standard_inline}}

## Hướng dẫn

- [Sử dụng CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
  - : Hướng dẫn giới thiệu về các khái niệm cơ bản của anchor positioning, bao gồm cách liên kết, định vị và điều chỉnh kích thước các phần tử tương đối với anchor của chúng.

- [Fallback option và ẩn có điều kiện khi tràn nội dung](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
  - : Hướng dẫn về các cơ chế mà CSS anchor positioning cung cấp để ngăn các anchor-positioned element tràn ra ngoài containing element hoặc viewport, bao gồm các position try fallback option và ẩn phần tử có điều kiện.

- [Sử dụng anchored container queries](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Anchored_container_queries)
  - : Giải thích cách sử dụng anchored container queries để áp dụng style có điều kiện cho các anchor-positioned element tùy thuộc vào position try fallback option nào đang hoạt động trên chúng.

## Khái niệm liên quan

- Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values):
  - {{cssxref("inset-block-start")}}
  - {{cssxref("inset-block-end")}}
  - {{cssxref("inset-inline-start")}}
  - {{cssxref("inset-inline-end")}}
  - {{cssxref("inset-block")}}
  - {{cssxref("inset-inline")}}
  - {{cssxref("inset")}} shorthand
  - {{cssxref("inline-size")}}
  - {{cssxref("min-block-size")}}
  - {{cssxref("min-inline-size")}}
  - {{cssxref("block-size")}}
  - {{cssxref("max-block-size")}}
  - {{cssxref("max-inline-size")}}
  - {{cssxref("margin-block")}}
  - {{cssxref("margin-block-end")}}
  - {{cssxref("margin-block-start")}}
  - {{cssxref("margin-inline")}}
  - {{cssxref("margin-inline-end")}}
  - {{cssxref("margin-inline-start")}}
  - Thuật ngữ [Inset properties](/en-US/docs/Glossary/Inset_properties)
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout):
  - {{cssxref("top")}}
  - {{cssxref("left")}}
  - {{cssxref("bottom")}}
  - {{cssxref("right")}}
- Module [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model):
  - {{cssxref("width")}}
  - {{cssxref("height")}}
  - {{cssxref("min-width")}}
  - {{cssxref("min-height")}}
  - {{cssxref("max-width")}}
  - {{cssxref("max-height")}}
  - {{cssxref("margin")}}
  - {{cssxref("margin-bottom")}}
  - {{cssxref("margin-left")}}
  - {{cssxref("margin-right")}}
  - {{cssxref("margin-top")}}
- Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment):
  - {{cssxref("align-items")}}
  - {{cssxref("align-self")}}
  - {{cssxref("justify-items")}}
  - {{cssxref("justify-self")}}
  - {{cssxref("place-items")}}
  - {{cssxref("place-self")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS scroll anchoring](/en-US/docs/Web/CSS/Guides/Scroll_anchoring)
- [Học: CSS positioning](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning)
- Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- [Học: Sizing items in CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing)
