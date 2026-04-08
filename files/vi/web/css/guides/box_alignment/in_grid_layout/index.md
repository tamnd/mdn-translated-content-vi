---
title: Box alignment in grid layout
short-title: In grid layout
slug: Web/CSS/Guides/Box_alignment/In_grid_layout
page-type: guide
sidebar: cssref
---

Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) mô tả chi tiết cách căn chỉnh hoạt động trong các phương pháp bố cục khác nhau. Trên trang này, chúng ta tìm hiểu cách box alignment hoạt động trong bối cảnh của [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout).

Vì hướng dẫn này nhằm mục đích trình bày chi tiết những gì đặc thù cho CSS grid layout và Box Alignment, nên nó cần được đọc cùng với hướng dẫn [tổng quan về box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview), trong đó trình bày các tính năng chung của box alignment trong các phương pháp bố cục.

## Ví dụ cơ bản

Trong ví dụ sử dụng [grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts) này, có không gian thừa trong {{glossary("grid container")}} sau khi bố trí các track có độ rộng cố định trên {{glossary("main axis")}} inline. Không gian này được phân phối bằng {{cssxref("justify-content")}}. Trên {{glossary("cross axis")}} block, việc căn chỉnh các item bên trong grid area của chúng được kiểm soát bằng {{cssxref("align-items")}}. Item đầu tiên ghi đè giá trị `align-items` được đặt cho cả nhóm bằng cách đặt {{cssxref("align-self")}} thành `center`.

```html live-sample___grid-align-items
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three <br />has <br />extra <br />text</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
</div>
```

```css hidden live-sample___grid-align-items
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

```css live-sample___grid-align-items
.box {
  display: grid;
  grid-template-columns: 120px 120px 120px;
  align-items: start;
  justify-content: space-between;
  border: 2px dotted rgb(96 139 168);
}

.box :first-child {
  align-self: center;
}
```

{{EmbedLiveSample("grid-align-items", , 200)}}

## Các trục của grid

Là một phương pháp bố cục hai chiều, khi làm việc với grid layout chúng ta luôn có hai trục để căn chỉnh các item. Chúng ta có thể truy cập tất cả các thuộc tính box alignment để đạt được điều này.

Trục inline là trục tương ứng với hướng mà các từ trong một câu chạy trong writing mode được sử dụng. Do đó, trong ngôn ngữ nằm ngang như tiếng Anh hay tiếng Ả Rập, hướng inline chạy theo chiều ngang. Nếu bạn đang ở writing mode dọc, trục inline sẽ chạy theo chiều dọc.

![Các trục inline là nằm ngang.](inline_axis.png)

Để căn chỉnh các thứ trên trục inline, bạn dùng các thuộc tính bắt đầu bằng `justify-`: {{cssxref("justify-content")}}, {{cssxref("justify-items")}} và {{cssxref("justify-self")}}.

Trục block cắt ngang trục inline theo hướng mà các block được hiển thị xuống trang — ví dụ, các đoạn văn bản trong tiếng Anh được hiển thị lần lượt từ trên xuống dưới theo chiều dọc. Đây là chiều block.

Để căn chỉnh các thứ trên trục block, bạn dùng các thuộc tính bắt đầu bằng `align-`: {{cssxref("align-content")}}, {{cssxref("align-items")}} và {{cssxref("align-self")}}.

![Các trục block là dọc.](block_axis.png)

## Căn chỉnh bản thân (self alignment)

Các thuộc tính này xử lý việc căn chỉnh item bên trong grid area mà nó được đặt vào:

- {{cssxref("justify-self")}}
- {{cssxref("align-self")}}
- {{cssxref("place-self")}}
- {{cssxref("justify-items")}}
- {{cssxref("align-items")}}
- {{cssxref("place-items")}}

Các thuộc tính `*-items`, `align-items` và `justify-items`, được áp dụng cho grid container và đặt căn chỉnh cho tất cả grid item như một nhóm. Các thuộc tính `*-self`, `align-self` và `justify-self`, thay vào đó được đặt trên các grid item. Điều này có nghĩa là bạn có thể đặt căn chỉnh cho tất cả grid item, sau đó ghi đè bất kỳ item nào cần căn chỉnh khác bằng cách áp dụng thuộc tính `align-self` hoặc `justify-self` cho quy tắc của từng grid item riêng lẻ.

Giá trị ban đầu của `align-items` và `justify-items` là `stretch`, và giá trị ban đầu của `align-self` và `justify-self` là `auto`, do đó item sẽ kéo dài trên toàn bộ grid area. Ngoại lệ cho quy tắc này là khi item có {{glossary("aspect ratio")}} nội tại, ví dụ như hình ảnh. Trong trường hợp này, item sẽ được căn chỉnh về `start` trong cả hai chiều để hình ảnh không bị biến dạng.

## Căn chỉnh nội dung (content alignment)

Các thuộc tính này xử lý việc căn chỉnh các track của grid khi có không gian thừa để phân phối:

- {{cssxref("justify-content")}}
- {{cssxref("align-content")}}
- {{cssxref("place-content")}}

Tình huống này sẽ xảy ra nếu tổng các track bạn đã xác định nhỏ hơn tổng chiều rộng của grid container.

## Gap và các thuộc tính grid-gap cũ

Các thuộc tính này xác định khoảng cách giữa các grid item trong một grid container:

- {{cssxref("row-gap")}}
- {{cssxref("column-gap")}}
- {{cssxref("gap")}}

Đặc tả grid ban đầu chứa định nghĩa cho các thuộc tính {{cssxref("row-gap", "grid-row-gap")}}, {{cssxref("column-gap", "grid-column-gap")}} và {{cssxref("gap", "grid-gap")}}. Từ đó, chúng đã được chuyển vào đặc tả Box Alignment và đặt bí danh thành {{cssxref("row-gap")}}, {{cssxref("column-gap")}} và {{cssxref("gap")}}. Điều này cho phép chúng được dùng cho các phương pháp bố cục khác khi khoảng cách giữa các item có ý nghĩa.

## Xem thêm

- Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment)
- [Tổng quan về box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview)
- [Box alignment trong flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
- [Box alignment trong multi-column layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_multi-column_layout)
- [Box alignment cho block, absolutely positioned và table layouts](/en-US/docs/Web/CSS/Guides/Box_alignment/In_block_abspos_tables)
- [Căn chỉnh item trong CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Box_alignment)
