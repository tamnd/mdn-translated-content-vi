---
title: CSS box model
short-title: Box model
slug: Web/CSS/Guides/Box_model
page-type: css-module
spec-urls: https://drafts.csswg.org/css-box-4/
sidebar: cssref
---

Module **CSS box model** định nghĩa các thuộc tính `margin` và `padding`, cùng với các [thuộc tính height](/en-US/docs/Web/CSS/Guides/Box_sizing), [width](/en-US/docs/Web/CSS/Guides/Box_sizing) và [border](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders), tạo nên [box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction) của CSS.

Mọi phần tử hiển thị trên một trang web đều là một hộp được bố trí theo [mô hình định dạng trực quan (visual formatting model)](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model). Các thuộc tính CSS xác định kích thước, vị trí và mức xếp chồng của chúng, với các thuộc tính box model (và các thuộc tính khác) xác định kích thước bên ngoài của mỗi hộp và khoảng trống xung quanh chúng.

Mỗi hộp có một vùng nội dung hình chữ nhật, bên trong hiển thị bất kỳ văn bản, hình ảnh và nội dung nào khác. Nội dung có thể được bao quanh bởi padding, border và margin ở một hoặc nhiều phía. Padding nằm xung quanh nội dung, border nằm xung quanh padding, và margin nằm bên ngoài border. Box model mô tả cách các thành phần này — nội dung, padding, border và margin — phối hợp với nhau để tạo ra một hộp như được hiển thị bởi CSS.

![Các thành phần của CSS box model](boxmodel.png)

Module CSS box model xác định các thuộc tính vật lý (hay "page relative") như `margin-top` và `padding-top`. Các thuộc tính flow-relative như `margin-block-start` và `margin-inline-start` (liên quan đến hướng văn bản) được định nghĩa trong [Logical Properties and Values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values). Module box model được mở rộng bởi [module CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing), vốn giới thiệu giá trị {{glossary("intrinsic size")}} và cho phép định nghĩa {{glossary("aspect ratio")}} cho các phần tử được điều chỉnh kích thước tự động ở ít nhất một chiều.

## Tham khảo

### Thuộc tính

- {{cssxref("margin")}} shorthand
- {{cssxref("margin-bottom")}}
- {{cssxref("margin-left")}}
- {{cssxref("margin-right")}}
- {{cssxref("margin-top")}}
- {{cssxref("margin-trim")}}
- {{cssxref("padding")}} shorthand
- {{cssxref("padding-bottom")}}
- {{cssxref("padding-left")}}
- {{cssxref("padding-right")}}
- {{cssxref("padding-top")}}

### Kiểu dữ liệu

- {{cssxref("box-edge")}}
  - [`<visual-box>`](/en-US/docs/Web/CSS/Reference/Values/box-edge#visual-box)
  - [`<layout-box>`](/en-US/docs/Web/CSS/Reference/Values/box-edge#layout-box)
  - [`<paint-box>`](/en-US/docs/Web/CSS/Reference/Values/box-edge#paint-box)
  - [`<coord-box>`](/en-US/docs/Web/CSS/Reference/Values/box-edge#coord-box)
  - [`<geometry-box>`](/en-US/docs/Web/CSS/Reference/Values/box-edge#geometry-box)

## Hướng dẫn

- [Giới thiệu về CSS box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
  - : Giải thích một trong những khái niệm cơ bản của CSS: box model. Mô hình này định nghĩa cách CSS bố trí các phần tử, bao gồm vùng content, padding, border và margin của chúng.

- [Mastering margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing)
  - : Đôi khi, hai margin kề nhau được gộp thành một. Bài viết này mô tả các quy tắc chi phối khi nào và tại sao điều này xảy ra, và cách kiểm soát nó.

- [Visual formatting model](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)
  - : Giải thích về mô hình định dạng trực quan.

## Các khái niệm liên quan

- Module [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
  - {{cssxref("border-width")}} shorthand
  - {{cssxref("border-bottom-width")}}
  - {{cssxref("border-left-width")}}
  - {{cssxref("border-right-width")}}
  - {{cssxref("border-top-width")}}
- Module [CSS logical properties](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
  - {{CSSxRef("block-size")}}
  - {{CSSxRef("inline-size")}}
  - {{CSSxRef("max-block-size")}}
  - {{CSSxRef("max-inline-size")}}
  - {{CSSxRef("min-block-size")}}
  - {{CSSxRef("min-inline-size")}}
  - {{CSSxRef("margin-block")}}
  - {{CSSxRef("margin-block-end")}}
  - {{CSSxRef("margin-block-start")}}
  - {{CSSxRef("margin-inline")}}
  - {{CSSxRef("margin-inline-end")}}
  - {{CSSxRef("margin-inline-start")}}
  - {{CSSxRef("padding-block")}}
  - {{CSSxRef("padding-block-end")}}
  - {{CSSxRef("padding-block-start")}}
  - {{CSSxRef("padding-inline")}}
  - {{CSSxRef("padding-inline-end")}}
  - {{CSSxRef("padding-inline-start")}}
  - {{CSSxRef("border-block")}}
  - {{CSSxRef("border-block-end")}}
  - {{CSSxRef("border-block-end-width")}}
  - {{CSSxRef("border-block-start")}}
  - {{CSSxRef("border-block-start-width")}}
  - {{CSSxRef("border-block-style")}}
  - {{CSSxRef("border-block-width")}}
  - {{CSSxRef("border-inline")}}
  - {{CSSxRef("border-inline-end")}}
  - {{CSSxRef("border-inline-end-width")}}
  - {{CSSxRef("border-inline-start")}}
  - {{CSSxRef("border-inline-start-width")}}
  - {{CSSxRef("border-inline-width")}}
- Module [CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing)
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
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
  - {{CSSxRef("overflow")}} shorthand
  - {{CSSxRef("overflow-block")}}
  - {{CSSxRef("overflow-clip-margin")}}
  - {{CSSxRef("overflow-inline")}}
  - {{CSSxRef("overflow-x")}}
  - {{CSSxRef("overflow-y")}}
  - {{CSSxRef("text-overflow")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS display](/en-US/docs/Web/CSS/Guides/Display)
- Module [CSS flex layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
- Module [CSS table](/en-US/docs/Web/CSS/Guides/Table)
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
- Module [CSS fragmentation](/en-US/docs/Web/CSS/Guides/Fragmentation)
- [Understanding aspect ratios](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
