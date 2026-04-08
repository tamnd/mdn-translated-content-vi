---
title: CSS box sizing
short-title: Box sizing
slug: Web/CSS/Guides/Box_sizing
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-sizing-4/
  - https://drafts.csswg.org/css-sizing-3/
sidebar: cssref
---

Module **CSS box sizing** cho phép bạn chỉ định cách các phần tử vừa khít với nội dung của chúng hoặc vừa khít trong một ngữ cảnh layout cụ thể. Module này định nghĩa các thuộc tính sizing, minimum sizing và maximum sizing, đồng thời mở rộng các thuộc tính sizing của CSS với các từ khóa đại diện cho {{glossary("intrinsic size")}} dựa trên nội dung và {{glossary("extrinsic size")}} dựa trên ngữ cảnh.

Các phần tử có thể được sizing theo hai cách: extrinsically (từ bên ngoài) hoặc intrinsically (từ bên trong). [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model) định nghĩa các thuộc tính liên quan đến trang để thiết lập kích thước phần tử một cách tường minh, hay còn gọi là "extrinsically", bao gồm các thuộc tính `width`, `height`, `padding`, và `margin` (cùng với các thuộc tính `border` được định nghĩa trong module [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)). Module CSS box sizing này mở rộng module CSS box model để cho phép phần tử được sizing theo intrinsic — thiết lập kích thước phần tử dựa trên kích thước nội dung của nó.

Các giá trị sizing được giới thiệu trong module này cho phép các phần tử có [size containment](/en-US/docs/Web/CSS/Guides/Containment/Using#size_containment) sử dụng các intrinsic size tường minh, như thể chiều rộng và chiều cao của nội dung trong luồng khớp với intrinsic size tường minh đã chỉ định, thay vì được sizing như thể chúng rỗng.

Module này cũng giới thiệu khả năng định nghĩa aspect ratio cho box của phần tử, nghĩa là trình duyệt có thể tự động điều chỉnh kích thước của phần tử để duy trì aspect ratio đã chỉ định miễn là một trong các kích thước được sizing tự động.

[Module logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values) đã mở rộng các thuộc tính có sẵn trong các module box model và box sizing để bao gồm các tương đương liên quan đến writing mode của các thuộc tính box model vật lý và intrinsic box sizing tương ứng.

## Tham chiếu

### Thuộc tính

- {{cssxref("aspect-ratio")}}
- {{cssxref("box-sizing")}}
- {{cssxref("contain-intrinsic-block-size")}}
- {{cssxref("contain-intrinsic-height")}}
- {{cssxref("contain-intrinsic-inline-size")}}
- {{cssxref("contain-intrinsic-size")}}
- {{cssxref("contain-intrinsic-width")}}
- {{cssxref("height")}}
- {{cssxref("max-height")}}
- {{cssxref("max-width")}}
- {{cssxref("min-height")}}
- {{cssxref("min-width")}}
- {{cssxref("width")}}

Module CSS box sizing cũng giới thiệu thuộc tính `min-intrinsic-sizing`. Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

### Kiểu dữ liệu và giá trị

- Kiểu dữ liệu {{cssxref("ratio")}}
- Giá trị {{cssxref("min-content")}}
- Giá trị {{cssxref("max-content")}}
- Giá trị {{cssxref("fit-content")}}

### Hàm

- [`fit-content()`](/en-US/docs/Web/CSS/Reference/Values/fit-content_function)

### Thuật ngữ bảng chú giải

- {{glossary("Intrinsic size")}}
- {{glossary("Extrinsic size")}}

## Hướng dẫn

- [Tìm hiểu về aspect ratio](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
  - : Tìm hiểu về thuộc tính `aspect-ratio`, thảo luận về aspect ratio cho các phần tử replaced và non-replaced, và xem xét một số trường hợp sử dụng aspect ratio phổ biến.

- [Giới thiệu về CSS box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
  - : Giải thích một trong những khái niệm cơ bản của CSS: box model. Mô hình này định nghĩa cách CSS bố trí các phần tử, bao gồm content, padding, border và margin của chúng.

- [Thành thạo margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing)
  - : Đôi khi, hai margin liền kề được gộp thành một. Bài viết này mô tả các quy tắc điều chỉnh khi nào và tại sao điều này xảy ra, và cách kiểm soát nó.

- [Mô hình định dạng trực quan](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)
  - : Giải thích mô hình định dạng trực quan.

- [Kiểm soát tỷ lệ của flex item trên trục chính](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios)
  - : Giải thích intrinsic sizing như một tiền đề để hiểu cách kiểm soát kích thước và tính linh hoạt của flex item trên trục chính bằng cách sử dụng {{CSSxRef("flex-grow")}}, {{CSSxRef("flex-shrink")}}, và {{CSSxRef("flex-basis")}}.

## Khái niệm liên quan

- Module [CSS logical properties](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
  - {{CSSxRef("min-inline-size")}}
  - {{CSSxRef("block-size")}}
  - {{CSSxRef("inline-size")}}
  - {{CSSxRef("max-block-size")}}
  - {{CSSxRef("max-inline-size")}}
  - {{CSSxRef("min-block-size")}}
  - {{CSSxRef("min-inline-size")}}
  - {{CSSxRef("margin-block")}}
  - {{CSSxRef("margin-inline")}}
  - {{CSSxRef("padding-block")}}
  - {{CSSxRef("padding-inline")}}
  - {{CSSxRef("border-block")}}
  - {{CSSxRef("border-inline")}}
  - {{CSSxRef("contain-intrinsic-block-size")}}
  - {{CSSxRef("contain-intrinsic-inline-size")}}
  - {{CSSxRef("overflow-block")}}
  - {{CSSxRef("overflow-inline")}}
  - {{CSSxRef("overscroll-behavior-block")}}
  - {{CSSxRef("overscroll-behavior-inline")}}
- Module [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model)
  - Shorthand {{cssxref("margin")}}
  - {{cssxref("margin-bottom")}}
  - {{cssxref("margin-left")}}
  - {{cssxref("margin-right")}}
  - {{cssxref("margin-top")}}
  - {{cssxref("margin-trim")}}
  - Shorthand {{cssxref("padding")}}
  - {{cssxref("padding-bottom")}}
  - {{cssxref("padding-left")}}
  - {{cssxref("padding-right")}}
  - {{cssxref("padding-top")}}
- Module [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
  - Shorthand {{cssxref("border")}}
  - Shorthand {{cssxref("border-width")}}
  - {{cssxref("border-bottom-width")}}
  - {{cssxref("border-left-width")}}
  - {{cssxref("border-right-width")}}
  - {{cssxref("border-top-width")}}
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
  - Shorthand {{CSSxRef("overflow")}}
  - {{CSSxRef("overflow-block")}}
  - {{CSSxRef("overflow-clip-margin")}}
  - {{CSSxRef("overflow-inline")}}
  - {{CSSxRef("overflow-x")}}
  - {{CSSxRef("overflow-y")}}
  - {{CSSxRef("text-overflow")}}
- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
  - {{CSSxRef("grid")}}
  - {{CSSxRef("grid-auto-columns")}}
  - {{CSSxRef("grid-auto-rows")}}
  - {{CSSxRef("grid-template-columns")}}
  - {{CSSxRef("grid-template-rows")}}
  - {{CSSxRef("repeat")}}
  - Hàm {{CSSxRef("minmax")}}
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
  - {{CSSxRef("flex-basis")}}
  - {{CSSxRef("flex")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS display](/en-US/docs/Web/CSS/Guides/Display)
- Module [CSS flex layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
- Module [CSS fragmentation](/en-US/docs/Web/CSS/Guides/Fragmentation)
