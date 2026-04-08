---
title: Box alignment in flexbox
short-title: In flexbox
slug: Web/CSS/Guides/Box_alignment/In_flexbox
page-type: guide
sidebar: cssref
---

Module [căn chỉnh hộp (box alignment)](/en-US/docs/Web/CSS/Guides/Box_alignment) mô tả chi tiết cách căn chỉnh hoạt động trong các phương pháp bố cục khác nhau. Trong hướng dẫn này, chúng ta tìm hiểu cách box alignment hoạt động trong bối cảnh của [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts). Vì hướng dẫn này nhằm mục đích trình bày chi tiết những gì đặc thù cho flexbox và box alignment, nên nó cần được đọc cùng với hướng dẫn [tổng quan về box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview), trong đó trình bày các tính năng chung của box alignment trong các phương pháp bố cục.

## Ví dụ cơ bản

Trong ví dụ flexbox này, ba flex item được căn chỉnh trên trục chính (main axis) bằng {{cssxref("justify-content")}} và trên trục chéo (cross axis) bằng {{cssxref("align-items")}}. Item đầu tiên ghi đè giá trị `align-items` được đặt cho cả nhóm bằng cách đặt {{cssxref("align-self")}} thành `center`.

```css hidden live-sample___gap live-sample___flex-align-items live-sample___auto-margins
body {
  font-family: sans-serif;
}
.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

```html live-sample___flex-align-items
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three <br />has <br />extra <br />text</div>
</div>
```

```css live-sample___flex-align-items
.box {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  border: 2px dotted rgb(96 139 168);
}

.box :first-child {
  align-self: center;
}
```

{{EmbedLiveSample("flex-align-items")}}

## Các trục và flex-direction

Flexbox tuân theo writing mode của tài liệu, do đó nếu bạn làm việc bằng tiếng Anh và đặt {{cssxref("justify-content")}} thành `flex-end`, các item sẽ được căn chỉnh về cuối flex container. Nếu bạn đang làm việc với {{cssxref("flex-direction")}} được đặt thành `row`, căn chỉnh này sẽ theo hướng inline.

Tuy nhiên, trong flexbox bạn có thể thay đổi trục chính bằng cách đặt `flex-direction` thành `column`. Trong trường hợp này, `justify-content` sẽ căn chỉnh các item theo hướng block. Do đó, cách dễ nhất để nghĩ về trục chính và trục chéo khi làm việc trong flexbox là:

- Trục chính = hướng được đặt bởi `flex-direction` = căn chỉnh thông qua `justify-content`
- Trục chéo = chạy cắt ngang trục chính = căn chỉnh thông qua {{cssxref("align-content")}}, {{cssxref("align-self")}}/{{cssxref("align-items")}}

### Căn chỉnh trục chính

- {{cssxref("justify-content")}}

### Căn chỉnh trục chéo

- {{cssxref("align-self")}}
- {{cssxref("align-items")}}
- {{cssxref("align-content")}}

### Không có justify-self trong flexbox

Trên trục chính, Flexbox xử lý các flex item như một nhóm. Lượng không gian cần thiết để bố trí các item được tính toán, và không gian còn lại sẽ sẵn sàng để phân phối. Thuộc tính `justify-content` kiểm soát cách sử dụng không gian còn lại đó. Đặt `justify-content: flex-end` và không gian thêm được đặt trước các item, `justify-content: space-around` và nó được đặt ở hai bên của item trong chiều đó, v.v.

Điều này có nghĩa là thuộc tính `justify-self` không có ý nghĩa trong flexbox vì chúng ta luôn xử lý việc di chuyển toàn bộ nhóm item.

Trên trục chéo, `align-self` có ý nghĩa vì chúng ta có thể có thêm không gian trong flex container theo chiều đó, trong đó một item đơn lẻ có thể được di chuyển đến điểm bắt đầu hoặc kết thúc.

## Căn chỉnh và margin auto

Có một trường hợp sử dụng cụ thể trong flexbox mà chúng ta có thể nghĩ rằng thuộc tính `justify-self` là thứ chúng ta cần, đó là khi chúng ta muốn tách một tập hợp các flex item, có thể để tạo ra một pattern navigation phân tách. Cho trường hợp sử dụng này, chúng ta có thể dùng margin `auto`. Margin được đặt thành `auto` sẽ hấp thụ tất cả không gian có sẵn trong chiều của nó. Đây là cách căn giữa một block với auto margin hoạt động. Bằng cách đặt margin trái và phải thành `auto`, cả hai bên của block đều cố lấy tất cả không gian có sẵn và do đó đẩy hộp vào giữa.

Bằng cách đặt {{cssxref("margin")}} `auto` trên một item trong một tập hợp các flex item đều được căn chỉnh về điểm bắt đầu, chúng ta có thể tạo ra một navigation phân tách. Điều này hoạt động tốt với flexbox và các thuộc tính căn chỉnh. Ngay khi không còn không gian cho auto margin, item sẽ hoạt động giống như tất cả các flex item khác và thu nhỏ lại để cố vừa vào không gian.

```html live-sample___auto-margins
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div class="push">Four</div>
  <div>Five</div>
</div>
```

```css live-sample___auto-margins
.box {
  display: flex;
  border: 2px dotted rgb(96 139 168);
}
.push {
  margin-left: auto;
}
```

{{EmbedLiveSample("auto-margins")}}

## Các thuộc tính `gap`

- {{cssxref("row-gap")}}
- {{cssxref("column-gap")}}
- {{cssxref("gap")}}

### Tạo khoảng cách cố định giữa các item

Trên trục chính, thuộc tính `column-gap` tạo khoảng cách có kích thước cố định giữa các item liền kề.

Trên trục chéo, thuộc tính `row-gap` tạo khoảng cách giữa các flex line liền kề, do đó {{cssxref("flex-wrap")}} cũng phải được đặt thành `wrap` để có tác dụng.

```html live-sample___gap
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
</div>
```

```css live-sample___gap
.box {
  width: 450px;
  display: flex;
  flex-wrap: wrap;
  row-gap: 10px;
  column-gap: 2em;
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  flex: 1;
}
```

{{EmbedLiveSample("gap")}}

## Xem thêm

- Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment)
- [Tổng quan về box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview)
- [Box alignment trong CSS grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [Box alignment trong multi-column layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_multi-column_layout)
- [Box alignment cho block, absolutely positioned và table layouts](/en-US/docs/Web/CSS/Guides/Box_alignment/In_block_abspos_tables)
- [Căn chỉnh item trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- {{Glossary("Cross axis")}}
- {{Glossary("Main axis")}}
