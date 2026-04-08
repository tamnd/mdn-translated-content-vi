---
title: Box alignment in multi-column layout
short-title: In multi-column layout
slug: Web/CSS/Guides/Box_alignment/In_multi-column_layout
page-type: guide
sidebar: cssref
---

Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) mô tả chi tiết cách căn chỉnh hoạt động trong các phương pháp bố cục khác nhau; trong hướng dẫn này, chúng ta tìm hiểu cách box alignment hoạt động trong bối cảnh của [multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout). Vì hướng dẫn này nhằm mục đích trình bày chi tiết những gì đặc thù cho cả hai module, nên nó cần được đọc cùng với hướng dẫn [tổng quan về box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview), trong đó trình bày các tính năng chung của box alignment trong các phương pháp bố cục.

Trong [multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout/Basic_concepts), {{glossary("alignment container")}} là content box của multicol container. {{glossary("alignment subject")}} là column box. Các thuộc tính áp dụng cho multi-column layouts được trình bày chi tiết dưới đây.

## align-content và justify-content

Thuộc tính {{cssxref("align-content")}} áp dụng cho trục block và {{cssxref("justify-content")}} cho trục inline. Bất kỳ khoảng cách nào được thêm vào các cột do việc sử dụng phân phối không gian sẽ được cộng vào khoảng cách giữa các cột, do đó làm cho khoảng cách lớn hơn so với những gì có thể được chỉ định bởi thuộc tính {{cssxref("column-gap")}} (hoặc shorthand {{cssxref("gap")}}).

Việc sử dụng giá trị `justify-content` khác `normal` hoặc `stretch` sẽ khiến các column box hiển thị với {{cssxref("column-width")}} được chỉ định trên multicol container, và không gian còn lại được phân phối theo giá trị của `justify-content`.

## column-gap

Thuộc tính {{cssxref("column-gap")}} ban đầu được chỉ định trong đặc tả multi-column layout và sau đó được hợp nhất với các thuộc tính gap cho các phương pháp bố cục khác trong box alignment. Trong khi các phương pháp bố cục khác coi giá trị ban đầu của `column-gap` là `0`, thì multi-column layout coi nó là `1em` — thông thường bạn muốn có khoảng cách giữa các cột.

## Xem thêm

- Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment)
- [Tổng quan về box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview)
- [Box alignment trong flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
- [Box alignment trong grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [Box alignment cho block, absolutely positioned và table layouts](/en-US/docs/Web/CSS/Guides/Box_alignment/In_block_abspos_tables)
