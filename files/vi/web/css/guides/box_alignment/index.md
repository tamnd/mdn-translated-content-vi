---
title: CSS box alignment
short-title: Box alignment
slug: Web/CSS/Guides/Box_alignment
page-type: css-module
spec-urls: https://drafts.csswg.org/css-align/
sidebar: cssref
---

Module **CSS box alignment** xác định các tính năng CSS liên quan đến việc căn chỉnh các hộp (box) trong container của chúng. Module này định nghĩa cách căn chỉnh cho các mô hình bố cục CSS khác nhau bao gồm block layout, table layout, flexible box layout (flexbox) và grid layout, tạo ra một phương pháp căn chỉnh nhất quán xuyên suốt toàn bộ CSS.

Module này mô tả chi tiết thuật ngữ về căn chỉnh, cho phép các thuộc tính căn chỉnh được sử dụng trong nhiều module bố cục khác nhau, thay vì bị giới hạn trong một phương pháp bố cục cụ thể.

Căn chỉnh được liên kết với chế độ viết (writing mode) — khi căn chỉnh một phần tử, chúng ta không xét đến các chiều vật lý như trên, phải, dưới, trái. Thay vào đó, căn chỉnh được mô tả theo điểm bắt đầu và kết thúc của chiều đang làm việc. Điều này đảm bảo căn chỉnh hoạt động nhất quán bất kể tài liệu sử dụng chế độ viết nào.

Căn chỉnh của văn bản và nội dung inline-level được định nghĩa trong [CSS text module](/en-US/docs/Web/CSS/Guides/Text) và [CSS inline module](/en-US/docs/Web/CSS/Guides/Inline_layout) tương ứng.

## Tham chiếu

### Thuộc tính CSS

- {{cssxref("align-content")}}
- {{cssxref("align-items")}}
- {{cssxref("align-self")}}
- {{cssxref("column-gap")}}
- {{cssxref("gap")}}
- {{cssxref("justify-content")}}
- {{cssxref("justify-items")}}
- {{cssxref("justify-self")}}
- {{cssxref("place-content")}}
- {{cssxref("place-items")}}
- {{cssxref("place-self")}}
- {{cssxref("row-gap")}}

### Kiểu dữ liệu

- {{cssxref("baseline-position")}}
- {{cssxref("content-distribution")}}
- {{cssxref("content-position")}}
- {{cssxref("overflow-position")}}
- {{cssxref("self-position")}}

### Thuật ngữ và định nghĩa

- {{Glossary("Alignment container")}}
- {{Glossary("Alignment subject")}}
- [Baseline alignment](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview#baseline_alignment)
- [Distributed alignment](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview#distributed_alignment)
- {{Glossary("Fallback alignment")}}
- [Positional alignment](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview#positional_alignment)

## Hướng dẫn

- [Box alignment overview](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview)
  - : Tổng quan về các khái niệm chung trong module CSS box alignment.

- [Box alignment in flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
  - : Cách box alignment hoạt động trong ngữ cảnh flexbox.

- [Box alignment in CSS grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
  - : Cách box alignment hoạt động trong ngữ cảnh grid layout.

- [Box alignment in multiple-column layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_multi-column_layout)
  - : Cách box alignment hoạt động trong ngữ cảnh multi-column layout.

- [Box alignment for block, absolutely positioned and table layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_block_abspos_tables)
  - : Cách box alignment hoạt động trong ngữ cảnh block layout, bao gồm các phần tử float, positioned và table.

## Khái niệm liên quan

- {{cssxref("alignment-baseline")}}
- {{cssxref("dominant-baseline")}}
- {{cssxref("scroll-snap-align")}}
- Thuộc tính SVG {{SVGAttr("dominant-baseline")}}
- {{Glossary("Cross axis")}}
- {{Glossary("Main axis")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Basic concepts of flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Aligning items in a flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Box alignment in grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- Module [CSS display](/en-US/docs/Web/CSS/Guides/Display)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
