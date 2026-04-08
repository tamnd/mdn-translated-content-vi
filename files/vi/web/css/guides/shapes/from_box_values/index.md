---
title: Shapes from box values
short-title: Box-value shapes
slug: Web/CSS/Guides/Shapes/From_box_values
page-type: guide
sidebar: cssref
---

Một cách đơn giản để tạo shape là sử dụng một giá trị từ module [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model). Bài viết này giải thích cách thực hiện điều đó.

Các giá trị box của {{cssxref("box-edge")}} được phép dùng làm giá trị shape là:

- `content-box`
- `padding-box`
- `border-box`
- `margin-box`

Các giá trị {{cssxref("border-radius")}} cũng được hỗ trợ. Điều này có nghĩa là bạn có thể tạo cho một phần tử đường viền cong và cho nội dung chảy xung quanh shape được tạo ra.

## CSS box model

Các giá trị liệt kê ở trên tương ứng với các phần khác nhau của CSS Box Model. Một hộp trong CSS có nội dung (content), padding, border và margin.

![The Box Model consists of the margin, border, padding and content boxes.](box-model.png)

Khi sử dụng các giá trị box cho shape, chúng ta có thể bọc nội dung quanh các cạnh được xác định bởi các giá trị này. Trong mỗi ví dụ dưới đây, tôi sử dụng một phần tử có padding, border và margin được định nghĩa để bạn thấy nội dung chảy theo các cách khác nhau.

### margin-box

`margin-box` là shape được xác định bởi cạnh ngoài của margin và bao gồm bán kính góc của shape, nếu {{cssxref("border-radius")}} đã được dùng khi định nghĩa phần tử.

Trong ví dụ dưới đây, chúng ta có một hình tròn màu tím là một {{htmlelement("div")}} với chiều cao, chiều rộng và màu nền. Thuộc tính `border-radius` được dùng để tạo hình tròn bằng cách đặt `border-radius: 50%`. Vì phần tử có margin, bạn có thể thấy nội dung chảy xung quanh hình tròn cùng với phần margin được áp dụng.

```html live-sample___margin-box
<div class="box">
  <div class="shape"></div>
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

```css live-sample___margin-box
body {
  font: 1.2em sans-serif;
}

.shape {
  background-color: rebeccapurple;
  height: 80px;
  width: 80px;
  padding: 20px;
  margin: 20px;
  border: 10px solid black;
  border-radius: 50%;
  float: left;
  shape-outside: margin-box;
}
```

{{EmbedLiveSample("margin-box", "", "200px")}}

### border-box

Giá trị `border-box` là shape được xác định bởi cạnh ngoài của border. Shape này tuân theo tất cả các quy tắc tạo hình border radius thông thường cho phía ngoài của border. Bạn vẫn có border dù chưa sử dụng thuộc tính CSS {{cssxref("border")}}. Trong trường hợp đó, nó sẽ giống với `padding-box`, tức là shape được xác định bởi cạnh ngoài của padding.

Trong ví dụ dưới đây, bạn có thể thấy cách văn bản đi theo đường tạo ra bởi border. Thay đổi kích thước border và nội dung sẽ đi theo đó.

```html hidden live-sample___border-box
<div class="box">
  <div class="shape"></div>
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

```css live-sample___border-box
body {
  font: 1.2em sans-serif;
}
.box {
  width: 70%;
}

.shape {
  background-color: rebeccapurple;
  height: 80px;
  width: 80px;
  padding: 20px;
  margin: 20px;
  border: 10px solid black;
  border-radius: 50%;
  float: left;
  shape-outside: border-box;
}
```

{{EmbedLiveSample("border-box", "", "240px")}}

### padding-box

Giá trị `padding-box` xác định shape được bao bởi cạnh ngoài của padding. Shape này tuân theo tất cả các quy tắc tạo hình border radius thông thường cho phía trong của border. Nếu không có padding thì `padding-box` sẽ giống với `content-box`.

```html hidden live-sample___padding-box
<div class="box">
  <div class="shape"></div>
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

```css live-sample___padding-box
body {
  font: 1.2em / 1.2 sans-serif;
}
.box {
  width: 70%;
}

.shape {
  background-color: rebeccapurple;
  height: 80px;
  width: 80px;
  padding: 20px;
  margin: 20px;
  border: 10px solid black;
  border-radius: 50%;
  float: left;
  shape-outside: padding-box;
}
```

{{EmbedLiveSample("padding-box", "", "260px")}}

### content-box

Giá trị `content-box` xác định shape được bao bởi cạnh ngoài của nội dung. Mỗi bán kính góc của hộp này bằng `border-radius` trừ đi `border-width` và `padding`, hoặc `0`, tùy giá trị nào lớn hơn. Điều này có nghĩa là không thể có giá trị âm ở đây.

```html hidden live-sample___content-box
<div class="box">
  <div class="shape"></div>
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

```css live-sample___content-box
body {
  font: 1.2em / 1.2 sans-serif;
}
.box {
  width: 70%;
}

.shape {
  background-color: rebeccapurple;
  height: 80px;
  width: 80px;
  padding: 20px;
  margin: 20px;
  border: 10px solid black;
  border-radius: 50%;
  float: left;
  shape-outside: content-box;
}
```

{{EmbedLiveSample("content-box", "", "250px")}}

## Khi nào nên dùng giá trị box

Sử dụng giá trị box là một cách tạo shape; tuy nhiên, cách này chỉ tự nhiên hoạt động với các shape rất đơn giản có thể được xác định bằng thuộc tính `border-radius`. Các ví dụ trên đây là một trong những trường hợp sử dụng như vậy. Bạn có thể tạo shape hình tròn bằng `border-radius` rồi bọc văn bản xung quanh nó.

Chỉ với kỹ thuật cơ bản này, bạn có thể tạo ra một số hiệu ứng thú vị. Trong ví dụ cuối của phần này, tôi đã float hai phần tử sang trái và phải, mỗi phần tử có bán kính border là 100% ở hướng gần nhất với văn bản.

```html live-sample___bottom-margin-box
<div class="box">
  <div class="shape-left"></div>
  <div class="shape-right"></div>
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

```css live-sample___bottom-margin-box
body {
  font: 1.2em / 1.5 sans-serif;
}

.box {
  text-align: justify;
}

.shape-left,
.shape-right {
  height: 100px;
  width: 100px;
}

.shape-left {
  margin: 0 20px 20px 0;
  border-bottom-right-radius: 100%;
  float: left;
  shape-outside: margin-box;
}
.shape-right {
  margin: 0 20px 20px;
  border-bottom-left-radius: 100%;
  float: right;
  shape-outside: margin-box;
}
```

{{EmbedLiveSample("bottom-margin-box", "", "240px")}}

Đối với các shape phức tạp hơn, bạn sẽ cần sử dụng một trong các [basic shapes](/en-US/docs/Web/CSS/Guides/Shapes/Using_shape-outside) làm giá trị, hoặc xác định shape từ một hình ảnh như được đề cập trong các hướng dẫn khác trong phần này.
