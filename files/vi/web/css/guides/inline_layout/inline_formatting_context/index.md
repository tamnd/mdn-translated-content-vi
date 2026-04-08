---
title: Inline formatting context
slug: Web/CSS/Guides/Inline_layout/Inline_formatting_context
page-type: guide
sidebar: cssref
---

Hướng dẫn này giải thích về inline formatting context.

## Các khái niệm cốt lõi

Inline formatting context là một phần của việc hiển thị trực quan trang web. Các inline boxes được bố trí lần lượt, theo hướng các câu chạy trong chế độ viết đang được sử dụng:

- Trong chế độ viết ngang, các hộp được bố trí theo chiều ngang, bắt đầu từ bên trái.
- Trong chế độ viết dọc, chúng sẽ được bố trí theo chiều dọc, bắt đầu từ trên cùng.

Trong ví dụ dưới đây, hai phần tử {{HTMLElement("div")}} với viền màu đen là một phần của [block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context), trong khi bên trong mỗi hộp, các từ tham gia vào một inline formatting context. Các từ trong chế độ viết ngang chạy theo chiều ngang, trong khi các từ trong chế độ viết dọc chạy theo chiều dọc.

```html live-sample___inline
<div class="example horizontal">One Two Three</div>
<div class="example vertical">Four Five Six</div>
```

```css live-sample___inline
body {
  font: 1.2em sans-serif;
}
.example {
  border: 5px solid black;
  margin: 20px;
}

.horizontal {
  writing-mode: horizontal-tb;
}
.vertical {
  writing-mode: vertical-rl;
}
```

{{EmbedLiveSample("inline", "", "220px")}}

Các hộp tạo thành một dòng được chứa trong một vùng hình chữ nhật gọi là line box. Hộp này sẽ đủ lớn để chứa tất cả các inline boxes trong dòng đó; khi không còn chỗ trong hướng inline, một dòng khác sẽ được tạo ra. Do đó, một đoạn văn là một tập hợp các inline line boxes, được xếp chồng theo hướng block.

Khi một inline box bị chia nhỏ, margin, border và padding không có hiệu ứng trực quan ở nơi xảy ra sự chia nhỏ. Trong ví dụ tiếp theo, có một phần tử {{HTMLElement("span")}} bao gồm một tập hợp các từ xuống dòng trên hai dòng. Viền trên `<span>` bị ngắt tại điểm xuống dòng.

```html live-sample___break
<div class="example">
  Before that night—
  <span
    >a memorable night, as it was to prove— hundreds of millions of people</span
  >
  had watched the rising smoke-wreaths of their fires without drawing any
  special inspiration from the fact.
</div>
```

```css live-sample___break
body {
  font: 1.2em sans-serif;
}
.example {
  border: 5px solid black;
  margin: 20px;
}

span {
  border: 5px solid rebeccapurple;
}
```

{{EmbedLiveSample("break")}}

Margin, border và padding trong hướng inline được áp dụng. Trong ví dụ dưới đây, bạn có thể thấy cách margin, border và padding trên phần tử inline `<span>` được thêm vào.

```html live-sample___mbp
<div class="example horizontal">One <span>Two</span> Three</div>
<div class="example vertical">Four <span>Five</span> Six</div>
```

```css live-sample___mbp
body {
  font: 1.2em sans-serif;
}

.example {
  border: 5px solid black;
  margin: 20px;
}

span {
  border: 5px solid rebeccapurple;
  padding-inline-start: 20px;
  padding-inline-end: 40px;
  margin-inline-start: 30px;
  margin-inline-end: 10px;
}
.horizontal {
  writing-mode: horizontal-tb;
}

.vertical {
  writing-mode: vertical-rl;
}
```

{{EmbedLiveSample("mbp", "", "340px")}}

> [!NOTE]
> Tôi đang sử dụng các thuộc tính logic, flow-relative — {{cssxref("padding-inline-start")}} thay vì {{cssxref("padding-left")}} — để chúng hoạt động trong chiều inline cho dù văn bản là ngang hay dọc. Đọc thêm về các thuộc tính này trong [Logical Properties and Values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values).

## Căn chỉnh theo hướng block

Các inline boxes có thể được căn chỉnh theo hướng block theo nhiều cách khác nhau, bằng cách sử dụng thuộc tính {{cssxref("vertical-align")}}, sẽ căn chỉnh trên trục block trong các chế độ viết dọc (do đó không phải theo chiều dọc chút nào!). Trong ví dụ dưới đây, văn bản lớn đang làm cho line box của câu đầu tiên lớn hơn, do đó thuộc tính `vertical-align` có thể được sử dụng để căn chỉnh các inline boxes ở hai bên của nó. Tôi đã sử dụng giá trị `top`, hãy thử thay đổi nó thành `middle`, `bottom` hoặc `baseline`.

```html live-sample___align
<div class="example horizontal">
  Before that night—<span>a memorable night</span>, as it was to prove—hundreds
  of millions of people had watched the rising smoke-wreaths of their fires
  without drawing any special inspiration from the fact.
</div>

<div class="example vertical">
  Before that night—<span>a memorable night</span>, as it was to prove—hundreds
  of millions of people had watched the rising smoke-wreaths of their fires
  without drawing any special inspiration from the fact.
</div>
```

```css live-sample___align
body {
  font: 1.2em sans-serif;
}

span {
  font-size: 200%;
  vertical-align: top;
}

.example {
  border: 5px solid black;
  margin: 20px;
  inline-size: 400px;
}

.horizontal {
  writing-mode: horizontal-tb;
}

.vertical {
  writing-mode: vertical-rl;
}
```

{{EmbedLiveSample("align", "", "640px")}}

## Căn chỉnh theo hướng inline

Nếu có thêm khoảng trống theo hướng inline, thuộc tính {{cssxref("text-align")}} có thể được sử dụng để căn chỉnh các inline boxes trong line box của chúng. Hãy thử thay đổi giá trị của `text-align` bên dưới thành `end`.

```html live-sample___text-align
<div class="example horizontal">One Two Three</div>
<div class="example vertical">Four Five Six</div>
```

```css hidden live-sample___text-align
body {
  font: 1.2em sans-serif;
}

.example {
  border: 5px solid black;
  margin: 20px;
}

.horizontal {
  writing-mode: horizontal-tb;
}

.vertical {
  writing-mode: vertical-rl;
}
```

```css live-sample___text-align
.example {
  text-align: center;
  inline-size: 250px;
}
```

{{EmbedLiveSample("text-align", "", "350px")}}

## Hiệu ứng của floats

Line boxes thường có cùng kích thước theo hướng inline, do đó cùng chiều rộng nếu làm việc trong chế độ viết ngang, hoặc chiều cao nếu làm việc trong chế độ viết dọc. Tuy nhiên, nếu có một {{cssxref("float")}} trong cùng block formatting context, float sẽ làm cho các line boxes bao quanh float trở nên ngắn hơn.

```html live-sample___float
<div class="box">
  <div class="float">I am a floated box!</div>
  <p>I am content inside the container.</p>
</div>
```

```css live-sample___float
body {
  font: 1.2em sans-serif;
}

.box {
  background-color: rgb(224 206 247);
  border: 5px solid rebeccapurple;
}

.float {
  float: left;
  width: 250px;
  height: 150px;
  background-color: white;
  border: 1px solid black;
  padding: 10px;
}
```

{{EmbedLiveSample("float", "", "200px")}}

## Xem thêm

- [Block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)
- [Visual formatting model](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)
