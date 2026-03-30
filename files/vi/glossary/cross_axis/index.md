---
title: Trục chéo
slug: Glossary/Cross_Axis
page-type: glossary-definition
sidebar: glossarysidebar
---

**Trục chéo** (cross axis) trong {{glossary("flexbox")}} chạy vuông góc với {{glossary("main axis","trục chính")}}, do đó nếu {{cssxref("flex-direction")}} của bạn là `row` hoặc `row-reverse` thì trục chéo chạy theo chiều cột.

![Trục chéo chạy theo chiều cột](basics3.png)

Nếu trục chính của bạn là `column` hoặc `column-reverse` thì trục chéo chạy theo chiều hàng.

![Trục chéo chạy theo chiều hàng.](basics4.png)

Việc căn chỉnh các mục trên trục chéo được thực hiện bằng thuộc tính `align-items` trên flex container hoặc thuộc tính `align-self` trên các mục riêng lẻ. Trong trường hợp flex container nhiều dòng với không gian bổ sung trên trục chéo, bạn có thể sử dụng `align-content` để kiểm soát khoảng cách giữa các hàng.

## Xem thêm

### Tham chiếu thuộc tính

- {{cssxref("align-content")}}
- {{cssxref("align-items")}}
- {{cssxref("align-self")}}
- {{cssxref("flex-wrap")}}
- {{cssxref("flex-direction")}}
- {{cssxref("flex")}}
- {{cssxref("flex-basis")}}
- {{cssxref("flex-flow")}}
- {{cssxref("flex-grow")}}
- {{cssxref("flex-shrink")}}
- {{cssxref("justify-content")}}
- {{cssxref("order")}}

### Đọc thêm

Hướng dẫn CSS flexbox:

- [Các khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Căn chỉnh các mục trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Nắm vững việc bọc các flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Wrapping_items)
- Các thuật ngữ liên quan:
  - {{Glossary("Flex")}}
  - {{Glossary("Flex Container")}}
  - {{Glossary("Flex Item")}}
  - {{Glossary("Grid")}}
