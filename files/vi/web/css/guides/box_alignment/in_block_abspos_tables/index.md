---
title: Box alignment for block, absolutely positioned, and table layouts
short-title: In block layout
slug: Web/CSS/Guides/Box_alignment/In_block_abspos_tables
page-type: guide
sidebar: cssref
---

Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) mô tả chi tiết cách hoạt động của căn chỉnh trong các phương pháp bố cục khác nhau. Trong hướng dẫn này, chúng ta khám phá cách box alignment hoạt động trong ngữ cảnh block layout, bao gồm các phần tử float, positioned và table. Vì hướng dẫn này tập trung vào những điều đặc thù của block layout và box alignment, nên cần được đọc kết hợp với hướng dẫn [box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview) — hướng dẫn mô tả các tính năng chung của box alignment xuyên suốt các phương pháp bố cục.

## align-content và justify-content

Thuộc tính {{cssxref("justify-content")}} không áp dụng cho block container hay table cell.

Thuộc tính {{cssxref("align-content")}} áp dụng cho trục block để căn chỉnh nội dung của hộp bên trong container. Nếu một phương thức phân phối nội dung như `space-between`, `space-around` hay `space-evenly` được yêu cầu, thì fallback alignment sẽ được dùng vì nội dung được coi là một [alignment subject](/en-US/docs/Glossary/Alignment_Subject) duy nhất.

## justify-self

Thuộc tính {{cssxref("justify-self")}} được dùng để căn chỉnh một phần tử bên trong containing block của nó theo trục inline.

Thuộc tính này không áp dụng cho các phần tử float hay table cell.

## align-self

Thuộc tính {{cssxref("align-self")}} không áp dụng cho các block-level box (bao gồm cả float), vì có nhiều hơn một phần tử trên trục block. Nó cũng không áp dụng cho table cell.

### Phần tử được định vị tuyệt đối (Absolutely positioned elements)

Alignment container là positioned block, tính đến các giá trị offset top, left, bottom và right. Từ khóa `normal` được giải thành `stretch`, trừ khi phần tử được định vị là replaced element — trong trường hợp đó nó được giải thành `start`.

## Căn chỉnh trong các phương pháp bố cục này hiện nay

Do hiện tại trình duyệt chưa hỗ trợ box alignment trong block layout, bạn có thể sử dụng một trong các phương pháp căn chỉnh hiện có, hoặc biến một phần tử đơn lẻ bên trong container thành flex item để sử dụng các thuộc tính căn chỉnh như đã xác định trong flexbox.

Việc căn chỉnh block theo chiều ngang trước khi có flexbox thường được thực hiện bằng cách đặt auto margin cho block. Giá trị `auto` của {{cssxref("margin")}} sẽ hấp thụ toàn bộ không gian trống theo chiều đó, do đó khi đặt margin trái và phải là auto, bạn có thể đẩy block vào giữa:

```css
.container {
  width: 20em;
  margin-left: auto;
  margin-right: auto;
}
```

Trong table layout, bạn có thể dùng thuộc tính {{cssxref("vertical-align")}} để căn chỉnh nội dung của cell bên trong cell đó.

Trong nhiều trường hợp sử dụng, việc biến block container thành flex item sẽ cung cấp khả năng căn chỉnh mà bạn đang tìm kiếm. Trong ví dụ dưới đây, một container chứa một phần tử duy nhất bên trong đã được chuyển thành flex container nhằm có thể sử dụng các thuộc tính căn chỉnh.

```html live-sample___intro
<div class="box">
  <div></div>
</div>
```

```css live-sample___intro
.box {
  height: 300px;
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
.box {
  display: flex;
  align-items: center;
  justify-content: center;
}

.box div {
  width: 100px;
  height: 100px;
}
```

{{EmbedLiveSample("intro", "", "320px")}}

## Xem thêm

- Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment)
- [Box alignment overview](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview)
- [Box alignment in flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
- [Box alignment in CSS grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [Box alignment in multiple-column layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_multi-column_layout)
