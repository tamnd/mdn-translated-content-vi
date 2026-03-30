---
title: Main axis
slug: Glossary/Main_Axis
page-type: glossary-definition
sidebar: glossarysidebar
---

Trục chính (main axis) trong {{glossary("flexbox")}} được xác định bởi hướng được thiết lập bởi thuộc tính {{cssxref("flex-direction")}}. Có bốn giá trị có thể cho `flex-direction`. Đó là:

- `row`
- `row-reverse`
- `column`
- `column-reverse`

Nếu bạn chọn `row` hoặc `row-reverse`, trục chính của bạn sẽ chạy dọc theo hàng theo hướng inline.

![In this image the flex-direction is row which forms the main axis](basics1.png)

Chọn `column` hoặc `column-reverse` và trục chính của bạn sẽ chạy từ trên xuống dưới của trang theo hướng block.

![Three flex items taking up the full width of the container, displayed one below the other in code order. Flex-direction is set to column. The main axis is vertical i.e., from top to bottom](basics2.png)

Trên trục chính bạn có thể kiểm soát kích thước của các mục flex bằng cách thêm bất kỳ không gian có sẵn nào vào bản thân các mục, thông qua các thuộc tính `flex` trên các mục. Hoặc bạn có thể kiểm soát không gian giữa và xung quanh các mục bằng thuộc tính `justify-content`.

## Xem thêm

### Tham chiếu thuộc tính

- {{cssxref("flex-basis")}}
- {{cssxref("flex-direction")}}
- {{cssxref("flex-grow")}}
- {{cssxref("flex-shrink")}}
- {{cssxref("justify-content")}}
- {{cssxref("flex")}}

### Đọc thêm

- Hướng dẫn CSS flexbox:
  - [Khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
  - [Căn chỉnh các mục trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
  - [Kiểm soát tỷ lệ của các mục flex dọc theo trục chính](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios)
