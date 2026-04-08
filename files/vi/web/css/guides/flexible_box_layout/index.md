---
title: CSS flexible box layout
short-title: Flexible box layout
slug: Web/CSS/Guides/Flexible_box_layout
page-type: css-module
spec-urls: https://drafts.csswg.org/css-flexbox/
sidebar: cssref
---

Module **CSS flexible box layout** định nghĩa một mô hình CSS box được tối ưu cho thiết kế giao diện người dùng và bố cục các phần tử theo một chiều. Trong mô hình flex layout, các phần tử con của flex container có thể được sắp xếp theo bất kỳ hướng nào và có thể "co giãn" kích thước của chúng, hoặc phát triển để lấp đầy không gian trống hoặc thu nhỏ để tránh tràn ra ngoài phần tử cha. Cả căn chỉnh ngang và dọc của các phần tử con đều có thể được thao tác dễ dàng.

## Flexible box layout trong thực tế

Trong ví dụ sau, một container được đặt thành `display: flex`, có nghĩa là ba phần tử con trở thành flex item. Giá trị của `justify-content` được đặt thành `space-between` để phân bổ các phần tử đều nhau trên main axis. Một lượng không gian bằng nhau được đặt giữa mỗi phần tử với các phần tử bên trái và bên phải nằm sát cạnh flex container. Bạn cũng có thể thấy rằng các phần tử đang kéo dài trên cross axis, do giá trị mặc định của `align-items` là `stretch`. Các phần tử kéo dài đến chiều cao của flex container, khiến chúng mỗi cái trông cao bằng phần tử cao nhất.

```html live-sample___simple-example
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three <br />has <br />extra <br />text</div>
</div>
```

```css live-sample___simple-example
body {
  font-family: sans-serif;
}

.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  justify-content: space-between;
}

.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 1em;
}
```

{{EmbedLiveSample("simple-example")}}

## Tham chiếu

### Thuộc tính

- {{cssxref("align-content")}}
- {{cssxref("align-items")}}
- {{cssxref("align-self")}}
- {{cssxref("flex")}}
- {{cssxref("flex-basis")}}
- {{cssxref("flex-direction")}}
- {{cssxref("flex-flow")}}
- {{cssxref("flex-grow")}}
- {{cssxref("flex-shrink")}}
- {{cssxref("flex-wrap")}}
- {{cssxref("justify-content")}}

### Thuật ngữ

- {{Glossary("Flexbox")}}
- {{Glossary("Flex container")}}
- {{Glossary("Flex item")}}
- {{Glossary("Main axis")}}
- {{Glossary("Cross axis")}}
- {{Glossary("Flex")}}

## Hướng dẫn

- [Các khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
  - : Tổng quan về các tính năng của flexbox.
- [Mối quan hệ của flexbox với các phương pháp bố cục khác](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Relationship_with_other_layout_methods)
  - : Cách flexbox liên quan đến các phương pháp bố cục khác và các CSS specification khác.
- [Căn chỉnh các phần tử trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
  - : Cách các thuộc tính box alignment hoạt động với flexbox.
- [Sắp xếp thứ tự flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Ordering_items)
  - : Giải thích các cách khác nhau để thay đổi thứ tự và hướng của các phần tử, cùng với các vấn đề tiềm ẩn khi làm điều đó.
- [Kiểm soát tỷ lệ flex item theo main axis](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios)
  - : Giải thích các thuộc tính flex-grow, flex-shrink và flex-basis.
- [Làm chủ việc bao quanh flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Wrapping_items)
  - : Cách tạo flex container với nhiều dòng và kiểm soát cách hiển thị các phần tử trong những dòng đó.
- [Các trường hợp sử dụng điển hình của flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Use_cases)
  - : Các mẫu thiết kế phổ biến là các trường hợp sử dụng flexbox điển hình.
- [CSS layout: flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox)
  - : Tìm hiểu cách sử dụng flexbox layout để tạo bố cục web.
- [Box alignment trong flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
  - : Chi tiết về các tính năng của [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) dành riêng cho flexbox.

## Khái niệm liên quan

[Module CSS display](/en-US/docs/Web/CSS/Guides/Display)

- {{cssxref("display")}}
- {{cssxref("order")}}

Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment)

- {{cssxref("align-content")}}
- {{cssxref("align-items")}}
- {{cssxref("align-self")}}
- {{cssxref("column-gap")}}
- {{cssxref("gap")}}
- {{cssxref("justify-items")}}
- {{cssxref("place-content")}}
- {{cssxref("place-items")}}
- {{cssxref("row-gap")}}

Module [CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing)

- {{cssxref("aspect-ratio")}}
- Giá trị {{cssxref("max-content")}}
- Giá trị {{cssxref("min-content")}}
- Giá trị {{cssxref("fit-content")}}
- Thuật ngữ {{glossary("intrinsic size")}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
- Module [CSS writing modes](/en-US/docs/Web/CSS/Guides/Writing_modes)
- [Sử dụng cú pháp multi-keyword với CSS display](/en-US/docs/Web/CSS/Guides/Display/Multi-keyword_syntax)
