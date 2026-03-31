---
title: How to center an item
short-title: Center an item
slug: Learn_web_development/Howto/Solve_CSS_problems/Center_an_item
page-type: learn-faq
sidebar: learn-how-to
---

Trong hướng dẫn này, bạn có thể tìm hiểu cách căn giữa một phần tử bên trong một phần tử khác, cả theo chiều ngang lẫn chiều dọc.

## Căn giữa một box

Để căn giữa một box bên trong một box khác bằng CSS, bạn sẽ cần sử dụng các thuộc tính [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) trên phần tử cha. Vì các thuộc tính căn chỉnh này chưa có hỗ trợ trình duyệt cho layout block và inline, bạn sẽ cần biến phần tử cha thành container [flex](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) hoặc [grid](/en-US/docs/Web/CSS/Guides/Grid_layout) để bật khả năng sử dụng tính năng căn chỉnh.

Trong ví dụ dưới đây, chúng ta đã đặt `display: flex` cho container cha; sau đó đặt {{cssxref("justify-content")}} thành center để căn chỉnh theo chiều ngang, và {{cssxref("align-items")}} thành center để căn chỉnh theo chiều dọc.

```html live-sample___center
<div class="wrapper">
  <div class="box">center me!</div>
</div>
```

```css live-sample___center
.wrapper {
  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.box {
  background-color: rgb(69 164 181);
  border-radius: 5px;
  padding: 10px;
  color: white;
}
```

{{EmbedLiveSample("center", "", "220px")}}

> [!NOTE]
> Bạn có thể sử dụng kỹ thuật này để thực hiện bất kỳ loại căn chỉnh nào cho một hoặc nhiều phần tử bên trong một phần tử khác. Trong ví dụ trên, bạn có thể thử thay đổi các giá trị thành bất kỳ giá trị hợp lệ nào cho {{cssxref("justify-content")}} và {{cssxref("align-items")}}.

## Xem thêm

- [Box alignment in flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
- [Box alignment in grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
