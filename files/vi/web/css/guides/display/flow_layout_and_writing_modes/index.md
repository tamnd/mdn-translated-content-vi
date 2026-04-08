---
title: Flow layout and writing modes
slug: Web/CSS/Guides/Display/Flow_layout_and_writing_modes
page-type: guide
sidebar: cssref
---

Đặc tả CSS 2.1, mô tả cách hoạt động của normal flow, giả định một writing mode theo chiều ngang. Các thuộc tính [layout](/en-US/docs/Web/CSS/Guides/Display/Block_and_inline_layout) sẽ hoạt động theo cùng cách trong các writing mode theo chiều dọc. Trong hướng dẫn này, chúng ta xem xét cách flow layout hoạt động khi sử dụng với các writing mode khác nhau của tài liệu.

Đây không phải là hướng dẫn toàn diện về cách sử dụng writing modes trong CSS; mục tiêu ở đây là ghi lại các vùng mà flow layout tương tác với writing modes theo những cách có thể ngoài dự kiến. Phần [See also](#see_also) cung cấp liên kết đến thêm tài nguyên về writing modes.

## Đặc tả writing modes

Đặc tả CSS Writing Modes Level 3 định nghĩa tác động của việc thay đổi writing mode của tài liệu đến flow layout. Trong phần giới thiệu writing modes, [đặc tả nói](https://drafts.csswg.org/css-writing-modes-3/#text-flow),

> "A writing mode in CSS is determined by the {{cssxref("writing-mode")}}, {{cssxref("direction")}}, and {{cssxref("text-orientation")}} properties. It is defined primarily in terms of its inline base direction and block flow direction."

Đặc tả định nghĩa _inline base direction_ là hướng mà nội dung được sắp xếp trên một dòng. Điều này xác định điểm bắt đầu và kết thúc của chiều inline. Điểm bắt đầu là nơi các câu bắt đầu và điểm kết thúc là nơi một dòng văn bản kết thúc trước khi nó bắt đầu xuống dòng mới.

_Block flow direction_ là hướng mà các box, ví dụ như các đoạn văn, được xếp chồng trong writing mode đó. Thuộc tính CSS `writing-mode` kiểm soát block flow direction. Nếu bạn muốn thay đổi trang của mình, hoặc một phần của trang, sang `vertical-lr` thì bạn có thể đặt `writing-mode: vertical-lr` trên phần tử và điều này sẽ thay đổi hướng của các block và do đó cũng thay đổi chiều inline.

Mặc dù một số ngôn ngữ nhất định sẽ sử dụng một writing mode hoặc text direction cụ thể, chúng ta cũng có thể sử dụng các thuộc tính này cho mục đích sáng tạo, chẳng hạn như hiển thị tiêu đề theo chiều dọc.

```html live-sample___creative-use
<div class="box">
  <h1>A heading</h1>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery.
  </p>
</div>
```

```css live-sample___creative-use
body {
  font: 1.2em sans-serif;
}
h1 {
  writing-mode: vertical-lr;
  float: left;
}
```

{{EmbedLiveSample("creative-use", "", "220px")}}

## Block flow direction

Thuộc tính {{cssxref("writing-mode")}} chấp nhận các giá trị `horizontal-tb`, `vertical-rl` và `vertical-lr`. Các giá trị này kiểm soát hướng mà các block chảy trên trang. Giá trị khởi tạo là `horizontal-tb`, đây là block flow direction từ trên xuống dưới với chiều inline theo chiều ngang. Các ngôn ngữ từ trái sang phải, như tiếng Anh, và các ngôn ngữ từ phải sang trái, như tiếng Ả Rập, đều là `horizontal-tb`.

Ví dụ sau hiển thị các block sử dụng giá trị khởi tạo `horizontal-tb` một cách tường minh:

```html live-sample___horizontal-tb
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___horizontal-tb
body {
  font: 1.2em sans-serif;
}
.box {
  writing-mode: horizontal-tb;
}
```

{{EmbedLiveSample("horizontal-tb", "", "240px")}}

So sánh với giá trị `vertical-rl`, cho bạn block flow direction từ phải sang trái với chiều inline theo chiều dọc, như thể hiện trong ví dụ tiếp theo.

```html hidden live-sample___vertical-rl
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___vertical-rl
body {
  font: 1.2em sans-serif;
}
.box {
  writing-mode: vertical-rl;
}
```

{{EmbedLiveSample("vertical-rl", "", "300px")}}

Ví dụ cuối cùng minh họa giá trị thứ ba có thể có cho `writing-mode` — `vertical-lr`. Điều này cho bạn block flow direction từ trái sang phải và chiều inline theo chiều dọc.

```html hidden live-sample___vertical-lr
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___vertical-lr
body {
  font: 1.2em sans-serif;
}
.box {
  writing-mode: vertical-lr;
}
```

{{EmbedLiveSample("vertical-lr", "", "300px")}}

## Writing modes lồng nhau

Khi một box lồng nhau được gán một writing mode khác với phần tử cha, thì một inline level box sẽ hiển thị như thể nó có `display: inline-block`.

```html live-sample___inline-change-mode
<div class="box">
  <p>
    One <span>November</span> night in the year 1782, so the story runs, two
    brothers sat over their winter fire in the little French town of Annonay,
    watching the grey smoke-wreaths from the hearth curl up the wide chimney.
    Their names were Stephen and Joseph Montgolfier, they were papermakers by
    trade, and were noted as possessing thoughtful minds and a deep interest in
    all scientific knowledge and new discovery.
  </p>
</div>
```

```css live-sample___inline-change-mode
body {
  font: 1.2em sans-serif;
}
.box {
  writing-mode: vertical-rl;
}
.box span {
  writing-mode: horizontal-tb;
  padding: 10px;
  border: 1px solid rebeccapurple;
}
```

{{EmbedLiveSample("inline-change-mode", "", "240px")}}

Một block-level box sẽ thiết lập một [block formatting context (BFC)](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) mới, nghĩa là nếu kiểu hiển thị bên trong của nó là `flow`, nó sẽ có kiểu hiển thị tính toán là `flow-root`. Điều này được thể hiện trong ví dụ tiếp theo, nơi box hiển thị dưới dạng `horizontal-tb` chứa một float được giữ lại nhờ phần tử cha thiết lập một BFC mới.

```html live-sample___block-change-mode
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>

  <div>
    <div class="float"></div>
    This box should establish a new BFC.
  </div>

  <p>
    Their names were Stephen and Joseph Montgolfier, they were papermakers by
    trade, and were noted as possessing thoughtful minds and a deep interest in
    all scientific knowledge and new discovery.
  </p>
</div>
```

```css live-sample___block-change-mode
body {
  font: 1.2em sans-serif;
}
.box {
  writing-mode: vertical-rl;
}
.box > div {
  writing-mode: horizontal-tb;
  padding: 10px;
  border: 1px solid rebeccapurple;
}
.float {
  width: 100px;
  height: 150px;
  background-color: rebeccapurple;
  float: left;
}
```

{{EmbedLiveSample("block-change-mode", "", "500px")}}

## Replaced elements

Các replaced elements như hình ảnh sẽ không thay đổi hướng của chúng dựa trên thuộc tính `writing-mode`. Tuy nhiên, các replaced elements như các control biểu mẫu có chứa văn bản, sẽ khớp với writing mode đang sử dụng.

```html live-sample___replaced
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney.
  </p>

  <img
    alt="a colorful hot air balloon against a clear sky"
    src="https://mdn.github.io/shared-assets/images/examples/balloon.jpg" />

  <p>
    Their names were Stephen and Joseph Montgolfier, they were papermakers by
    trade, and were noted as possessing thoughtful minds and a deep interest in
    all scientific knowledge and new discovery.
  </p>
</div>
```

```css live-sample___replaced
body {
  font: 1.2em sans-serif;
}
.box {
  writing-mode: vertical-rl;
}
```

{{EmbedLiveSample("replaced", "", "340px")}}

## Logical properties và values

Khi bạn làm việc trong các writing mode khác ngoài `horizontal-tb`, nhiều thuộc tính và giá trị được ánh xạ đến các kích thước vật lý của màn hình sẽ có vẻ lạ. Ví dụ, nếu bạn đặt chiều rộng của một box là 100px, trong `horizontal-tb` điều đó sẽ kiểm soát kích thước theo chiều inline. Trong `vertical-lr` nó kiểm soát kích thước theo chiều block vì nó không xoay theo văn bản.

```html live-sample___width
<div class="box">
  <div class="box1">Box 1</div>
  <div class="box2">Box 2</div>
</div>
```

```css live-sample___width
body {
  font: 1.2em sans-serif;
}
.box1 {
  writing-mode: horizontal-tb;
  border: 5px solid rebeccapurple;
  width: 100px;
  margin: 10px;
}
.box2 {
  writing-mode: vertical-lr;
  border: 5px solid rebeccapurple;
  width: 100px;
  margin: 10px;
}
```

{{EmbedLiveSample("width")}}

Do đó, chúng ta có các thuộc tính {{cssxref("block-size")}} và {{cssxref("inline-size")}}. Nếu chúng ta đặt `inline-size` của block là 100px, không quan trọng chúng ta đang ở writing mode ngang hay dọc; `inline-size` sẽ luôn có nghĩa là kích thước theo chiều inline.

```html live-sample___inline-size
<div class="box">
  <div class="box1">Box 1</div>
  <div class="box2">Box 2</div>
</div>
```

```css live-sample___inline-size
body {
  font: 1.2em sans-serif;
}
.box1 {
  writing-mode: horizontal-tb;
  border: 5px solid rebeccapurple;
  inline-size: 100px;
  margin: 10px;
}
.box2 {
  writing-mode: vertical-lr;
  border: 5px solid rebeccapurple;
  inline-size: 100px;
  margin: 10px;
}
```

{{EmbedLiveSample("inline-size", "", "200px")}}

Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values) bao gồm các phiên bản logical của các thuộc tính kiểm soát margins, padding và borders cũng như các ánh xạ khác cho những thứ mà chúng ta thường sử dụng hướng vật lý để chỉ định.

## Tóm tắt

Trong hầu hết các trường hợp, flow layout hoạt động như mong đợi khi thay đổi writing mode của toàn bộ tài liệu hoặc các phần riêng lẻ. Điều này có thể được sử dụng để sắp xếp đúng cách các ngôn ngữ dọc hoặc vì lý do sáng tạo. Với CSS logical properties và values, việc đặt kích thước theo writing mode dọc có thể dựa trên kích thước inline và block của phần tử. Điều này hữu ích để tạo các component hoạt động trong các writing mode khác nhau.

## Xem thêm

- [Writing Modes](/en-US/docs/Web/CSS/Guides/Writing_modes)
- [Writing modes and CSS layout](https://www.smashingmagazine.com/2019/08/writing-modes-layout/) on Smashing Magazine (2019)
- [CSS writing modes](https://24ways.org/2016/css-writing-modes/) on 24ways.org (2016)
