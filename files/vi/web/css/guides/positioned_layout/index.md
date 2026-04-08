---
title: CSS positioned layout
short-title: Positioned layout
slug: Web/CSS/Guides/Positioned_layout
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-position/
  - https://drafts.csswg.org/css-position-4/
sidebar: cssref
---

Module **CSS positioned layout** định nghĩa các scheme định vị và bù đắp dựa trên tọa độ có sẵn trong CSS, cùng với các thuộc tính dùng để định vị và xếp chồng các phần tử trên trang web. Module này nổi tiếng nhất với việc xác định các phương pháp định vị cơ bản, bao gồm relative positioning, sticky positioning, absolute positioning và fixed positioning. Nó cũng định nghĩa cách các phần tử được định vị được vẽ và xếp lớp, làm rõ hành vi stacking và thứ tự hiển thị.

Module positioned layout định nghĩa các {{glossary("inset properties")}} vật lý, logic và shorthand. Các thuộc tính logic giúp phát triển với tư duy quốc tế hóa và tính đáp ứng.

Giống như tất cả các module CSS, module này ảnh hưởng và bị ảnh hưởng bởi các module khác. Module này mô tả cách định vị tương tác với các module layout khác như [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) và [CSS Grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout). Các module khác, chẳng hạn như [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning), được xây dựng dựa trên module này để cho phép định vị các phần tử tương đối với các phần tử và lớp khác.

## Tham khảo

### Thuộc tính

- {{cssxref("bottom")}}
- {{cssxref("inset")}}
- {{cssxref("inset-block")}}
- {{cssxref("inset-block-end")}}
- {{cssxref("inset-block-start")}}
- {{cssxref("inset-inline")}}
- {{cssxref("inset-inline-end")}}
- {{cssxref("inset-inline-start")}}
- {{cssxref("left")}}
- {{cssxref("overlay")}}
- {{cssxref("position")}}
- {{cssxref("right")}}
- {{cssxref("top")}}

### Selectors

- {{cssxref("::backdrop")}}

### Thuật ngữ và định nghĩa

- [Block direction](/en-US/docs/Glossary/Flow_relative_values#block_direction)
- [Containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block)
- {{glossary("Flow relative values")}}
- [Inline direction](/en-US/docs/Glossary/Flow_relative_values#inline_direction)
- {{glossary("Inset properties")}}
- [Positioning context](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning#positioning_contexts)
- [Relative position](/en-US/docs/Web/CSS/Reference/Properties/position#relative_positioning)
- {{glossary("Stacking context")}}
- [Static positioning](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning#static_positioning)
- {{glossary("Top layer")}}

## Hướng dẫn

- [Understanding z-index](/en-US/docs/Web/CSS/Guides/Positioned_layout/Understanding_z-index)
  - : Giới thiệu khái niệm stacking context và giải thích cách z-ordering hoạt động, kèm theo một số ví dụ.
- [Stacking without the `z-index` property](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_without_z-index)
  - : Các quy tắc stacking áp dụng khi không dùng `z-index`.
- [Stacking floating elements](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_floating_elements)
  - : Cách các phần tử float được xử lý với stacking.
- [Using `z-index`](/en-US/docs/Web/CSS/Guides/Positioned_layout/Using_z-index)
  - : Cách dùng `z-index` để thay đổi thứ tự stacking mặc định.
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
  - : CSS stacking context, các tính năng CSS tạo stacking context mới, và stacking context lồng nhau.
- [Learn: positioning](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning)
  - : Các giá trị position khác nhau và cách sử dụng chúng.

## Khái niệm liên quan

- {{cssxref("float")}}
- {{cssxref("clear")}}
- {{cssxref("transition-property")}}
- {{cssxref("transition-behavior")}}
- [Popover API](/en-US/docs/Web/API/Popover_API)
- Phần tử {{htmlelement("dialog")}}

- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
  - {{cssxref("position-anchor")}}
  - {{cssxref("position-area")}}
  - {{cssxref("position-try-fallbacks")}}
  - {{cssxref("position-try-order")}}
  - Shorthand {{cssxref("position-try")}}
  - {{cssxref("position-visibility")}}

- Module [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms)
  - {{cssxref("transform")}}
  - {{cssxref("transform-origin")}}
  - {{cssxref("translate")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Các thuộc tính CSS `*-position` khác:
  - {{cssxref("background-position")}}
  - {{cssxref("background-position")}}
  - {{cssxref("background-position")}}
  - {{cssxref("font-synthesis-position")}}
  - {{cssxref("font-variant-position")}}
  - {{cssxref("list-style-position")}}
  - {{cssxref("mask-position")}}
  - {{cssxref("object-position")}}
  - {{cssxref("offset-position")}}
  - {{cssxref("ruby-position")}}
  - {{cssxref("text-emphasis-position")}}
  - {{cssxref("text-underline-position")}}
- [Kiểu dữ liệu](/en-US/docs/Web/CSS/Reference/Values/Data_types) liên quan đến position
  - {{cssxref("baseline-position")}}
  - {{cssxref("content-position")}}
  - {{cssxref("overflow-position")}}
  - {{cssxref("self-position")}}
- Module [CSS Scroll Snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
  - {{glossary("Snap positions")}}
