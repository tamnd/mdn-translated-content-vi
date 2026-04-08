---
title: Flow layout and overflow
slug: Web/CSS/Guides/Display/Flow_layout_and_overflow
page-type: guide
sidebar: cssref
---

Khi có nhiều nội dung hơn có thể vừa trong một container, tình trạng overflow xảy ra. Hiểu cách overflow hoạt động là quan trọng trong việc xử lý bất kỳ phần tử nào có kích thước bị ràng buộc trong CSS. Hướng dẫn này giải thích cách overflow hoạt động khi làm việc với normal flow.
HTML giống nhau trong mỗi ví dụ, vì vậy nó hiển thị trong phần đầu tiên, và bị ẩn trong các phần khác để ngắn gọn.

## Overflow là gì?

Cung cấp cho một phần tử một chiều cao và chiều rộng cố định, sau đó thêm nội dung đáng kể vào hộp, tạo ra một ví dụ overflow cơ bản:

```html live-sample___overflow
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>
</div>
<p>
  Their names were Stephen and Joseph Montgolfier. They were papermakers by
  trade, and were noted as possessing thoughtful minds and a deep interest in
  all scientific knowledge and new discovery.
</p>
<p>
  Before that night—a memorable night, as it was to prove—hundreds of millions
  of people had watched the rising smoke-wreaths of their fires without drawing
  any special inspiration from the fact.
</p>
```

```css live-sample___overflow
body {
  font: 1.2em / 1.5 sans-serif;
}

.box {
  width: 300px;
  height: 100px;
  border: 5px solid rebeccapurple;
  padding: 10px;
}
```

{{EmbedLiveSample("overflow", "", "370px")}}

Nội dung vào trong hộp. Một khi nó lấp đầy hộp, nó tiếp tục overflow theo cách hiển thị, hiển thị nội dung bên ngoài hộp, có thể hiển thị bên dưới nội dung tiếp theo. Thuộc tính kiểm soát cách overflow hoạt động là thuộc tính {{cssxref("overflow")}} có giá trị ban đầu là `visible`. Đây là lý do tại sao chúng ta có thể thấy nội dung overflow.

## Kiểm soát overflow

Có các giá trị khác kiểm soát cách nội dung overflow hoạt động. Để ẩn nội dung tràn, hãy sử dụng giá trị `hidden`. Điều này có thể khiến một số nội dung của bạn không hiển thị.

```html hidden live-sample___hidden
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>
</div>
<p>
  Their names were Stephen and Joseph Montgolfier. They were papermakers by
  trade, and were noted as possessing thoughtful minds and a deep interest in
  all scientific knowledge and new discovery.
</p>
<p>
  Before that night—a memorable night, as it was to prove—hundreds of millions
  of people had watched the rising smoke-wreaths of their fires without drawing
  any special inspiration from the fact.
</p>
```

```css live-sample___hidden
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  width: 300px;
  height: 100px;
  border: 5px solid rebeccapurple;
  padding: 10px;
  overflow: hidden;
}
```

{{EmbedLiveSample("hidden", "", "370px")}}

Sử dụng giá trị `scroll` chứa nội dung trong hộp của nó và thêm thanh cuộn để cho phép xem nội dung đó. Các thanh cuộn sẽ được thêm ngay cả khi nội dung vừa trong hộp.

```html hidden live-sample___scroll
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>
</div>
<p>
  Their names were Stephen and Joseph Montgolfier; they were papermakers by
  trade and were noted as possessing thoughtful minds and a deep interest in all
  scientific knowledge and new discoveries.
</p>
<p>
  Before that night—a memorable night, as it was to prove—hundreds of millions
  of people had watched the rising smoke-wreaths of their fires without drawing
  any special inspiration from the fact.
</p>
```

```css live-sample___scroll
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  width: 300px;
  height: 100px;
  border: 5px solid rebeccapurple;
  padding: 10px;
  overflow: scroll;
}
```

{{EmbedLiveSample("scroll", "", "370px")}}

Sử dụng giá trị `auto` sẽ hiển thị nội dung không có thanh cuộn nếu nội dung vừa trong hộp. Nếu không vừa, các thanh cuộn sẽ được thêm. So sánh ví dụ tiếp theo, bạn sẽ thấy ví dụ `overflow: scroll` ở trên có cả thanh cuộn ngang và dọc ngay cả khi chỉ cần cuộn dọc. Ví dụ `auto` bên dưới chỉ thêm thanh cuộn theo hướng chúng ta cần cuộn.

```html hidden live-sample___auto
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>
</div>
<p>
  Their names were Stephen and Joseph Montgolfier, they were papermakers by
  trade, and were noted as possessing thoughtful minds and a deep interest in
  all scientific knowledge and new discovery.
</p>
<p>
  Before that night—a memorable night, as it was to prove—hundreds of millions
  of people had watched the rising smoke-wreaths of their fires without drawing
  any special inspiration from the fact.
</p>
```

```css live-sample___auto
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  width: 300px;
  height: 100px;
  border: 5px solid rebeccapurple;
  padding: 10px;
  overflow: auto;
}
```

{{EmbedLiveSample("auto", "", "370px")}}

Như chúng ta đã học, sử dụng bất kỳ giá trị nào trong số này, ngoại trừ mặc định `visible`, sẽ tạo ra một [block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) mới.

`overflow: clip` hoạt động như `overflow: hidden`, nhưng nó không cho phép cuộn theo cách lập trình; hộp trở nên không thể cuộn. Nó cũng không tạo ra một block formatting context.

Thuộc tính overflow thực ra là viết tắt cho các thuộc tính {{cssxref("overflow-x")}} và {{cssxref("overflow-y")}}. Nếu bạn chỉ định một giá trị cho overflow, giá trị này được sử dụng cho cả hai trục. Tuy nhiên, bạn có thể chỉ định cả hai giá trị trong đó giá trị đầu tiên được sử dụng cho `overflow-x` và do đó là hướng ngang, và giá trị thứ hai cho `overflow-y` và hướng dọc. Trong ví dụ dưới đây, tôi chỉ chỉ định `overflow-y: scroll` vì vậy chúng ta không nhận được thanh cuộn ngang không mong muốn.

```html hidden live-sample___overflow-y
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>
</div>
<p>
  Their names were Stephen and Joseph Montgolfier, they were papermakers by
  trade, and were noted as possessing thoughtful minds and a deep interest in
  all scientific knowledge and new discovery.
</p>
<p>
  Before that night—a memorable night, as it was to prove—hundreds of millions
  of people had watched the rising smoke-wreaths of their fires without drawing
  any special inspiration from the fact.
</p>
```

```css live-sample___overflow-y
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  width: 300px;
  height: 100px;
  border: 5px solid rebeccapurple;
  padding: 10px;
  overflow-y: scroll;
}
```

{{EmbedLiveSample("overflow-y", "", "370px")}}

## Thuộc tính Flow Relative

Trong hướng dẫn về [Writing Modes and Flow Layout](/en-US/docs/Web/CSS/Guides/Display/Flow_layout_and_writing_modes), chúng ta đã xem xét các thuộc tính `block-size` và `inline-size`, có ý nghĩa hơn khi làm việc với các writing mode khác nhau so với việc gắn layout của chúng ta với các chiều vật lý của màn hình. [Module CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) cũng bao gồm các thuộc tính flow relative cho overflow - [`overflow-block`](/en-US/docs/Web/CSS/Reference/At-rules/@media/overflow-block) và [`overflow-inline`](/en-US/docs/Web/CSS/Reference/At-rules/@media/overflow-inline). Chúng tương ứng với `overflow-x` và `overflow-y` nhưng ánh xạ phụ thuộc vào writing mode của tài liệu.

## Chỉ báo Overflow

Trong module CSS overflow, có một số thuộc tính có thể giúp cải thiện cách nội dung trông trong tình huống overflow.

### Overflow theo trục Inline

Thuộc tính {{cssxref("text-overflow")}} xử lý văn bản tràn theo hướng inline. Nó nhận một trong hai giá trị `clip`, trong đó nội dung bị cắt khi nó tràn, đây là giá trị ban đầu và do đó là hành vi mặc định. Chúng ta cũng có `ellipsis` hiển thị dấu ba chấm, có thể được thay thế bằng ký tự phù hợp hơn cho ngôn ngữ hoặc writing mode đang được sử dụng.

```html hidden live-sample___text-overflow
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>

  <p>
    Their names were Stephen and Joseph Montgolfier, they were papermakers by
    trade, and were noted as possessing thoughtful minds and a deep interest in
    all scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___text-overflow
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  width: 300px;
  border: 5px solid rebeccapurple;
  padding: 10px;
}

.box p {
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}
```

{{EmbedLiveSample("text-overflow", "", "220px")}}

### Overflow theo trục Block

Đặc tả [Overflow Module Level 4](https://drafts.csswg.org/css-overflow-4/#propdef-block-ellipsis) thêm thuộc tính `block-ellipsis` ([trước đây được gọi là `block-overflow`](https://github.com/w3c/csswg-drafts/commit/20b15b4d66b0fdfa8406f1ce28604128f02ee7bb)). Thuộc tính này cho phép thêm dấu ba chấm (hoặc chuỗi tùy chỉnh) khi văn bản tràn theo chiều block, mặc dù không có hỗ trợ trình duyệt cho điều này vào thời điểm viết.

Điều này hữu ích trong tình huống bạn có danh sách các bài viết, ví dụ, và bạn hiển thị danh sách trong các hộp có chiều cao cố định chỉ lấy một lượng văn bản giới hạn. Người đọc có thể không rõ ràng rằng có thêm nội dung để click vào khi click vào hộp hoặc tiêu đề. Dấu ba chấm chỉ rõ ràng rằng có thêm nội dung. Đặc tả sẽ cho phép một chuỗi nội dung hoặc dấu ba chấm thông thường được chèn vào.

## Tóm tắt

Cho dù bạn đang ở media liên tục trên web hay trong định dạng Paged Media như in hoặc EPUB, hiểu cách nội dung tràn là hữu ích khi xử lý bất kỳ phương pháp layout nào. Hiểu cách overflow hoạt động trong normal flow cho phép hiểu rõ hơn về các hàm ý của nội dung overflow trong các phương pháp layout như grid và flexbox.

## Xem thêm

- [Overflowing content](/en-US/docs/Learn_web_development/Core/Styling_basics/Overflow) guide
- [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) module
- [CSS containment](/en-US/docs/Web/CSS/Guides/Containment) module
