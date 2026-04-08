---
title: ellipse()
slug: Web/CSS/Reference/Values/basic-shape/ellipse
page-type: css-function
browser-compat: css.types.basic-shape.ellipse
sidebar: cssref
---

Hàm **`ellipse()`** trong [CSS](/vi/docs/Web/CSS) là một trong các kiểu dữ liệu {{cssxref("basic-shape")}} [data types](/vi/docs/Web/CSS/Reference/Values/Data_types).

{{InteractiveExample("CSS Demo: ellipse()")}}

```css interactive-example-choice
clip-path: ellipse(20px 50px);
```

```css interactive-example-choice
clip-path: ellipse(4rem 50% at right center);
```

```css interactive-example-choice
clip-path: ellipse(closest-side closest-side at 5rem 6rem);
```

```css interactive-example-choice
clip-path: ellipse(closest-side farthest-side);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element"></div>
</section>
```

```css interactive-example
#default-example {
  background: #ffee99;
}

#example-element {
  background: linear-gradient(to bottom right, #ff5522, #0055ff);
  width: 100%;
  height: 100%;
}
```

## Cú pháp

```css
shape-outside: ellipse(40% 50% at left);
shape-outside: ellipse(closest-side farthest-side at 30%);
```

Hình elip về bản chất là một hình tròn bị dẹt, vì vậy `ellipse()` hoạt động rất giống {{cssxref("basic-shape/circle","circle()")}} ngoại trừ việc chúng ta phải chỉ định hai bán kính x và y.

### Giá trị

- `<shape-radius>`
  - : Hai bán kính, x và y theo thứ tự đó. Có thể là một {{cssxref("length")}}, {{cssxref("percentage")}}, hoặc các giá trị `closest-side` và `farthest-side`.
    - `closest-side`
      - : Sử dụng khoảng cách từ tâm hình dạng đến cạnh gần nhất của hộp tham chiếu. Đối với hình elip, đây là cạnh gần nhất theo chiều bán kính.
    - `farthest-side`
      - : Sử dụng khoảng cách từ tâm hình dạng đến cạnh xa nhất của hộp tham chiếu. Đối với hình elip, đây là cạnh xa nhất theo chiều bán kính.

- `<position>`
  - : Di chuyển tâm của hình elip. Có thể là một {{cssxref("length")}}, {{cssxref("percentage")}}, hoặc các giá trị như `left`. Giá trị `<position>` mặc định là center nếu bị bỏ qua.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ ellipse() cơ bản

Ví dụ này cho thấy một hình elip nổi trái với bán kính ngang 40%, bán kính dọc 50%, và vị trí left. Điều này có nghĩa là tâm của hình elip nằm ở cạnh trái của hộp, tạo ra hình nửa elip để văn bản bao xung quanh.
Nhấn "Play" trong các khối mã để thay đổi các giá trị này và xem hình elip thay đổi như thế nào:

```html live-sample___ellipse
<div class="box">
  <div class="shape"></div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___ellipse
body {
  font: 1.2em / 1.5 sans-serif;
}
.shape {
  float: left;
  shape-outside: ellipse(40% 50% at left);
  margin: 20px;
  width: 100px;
  height: 200px;
}
```

{{EmbedLiveSample("ellipse", "", "300px")}}

### Sử dụng giá trị closest-side / farthest-side

Các giá trị từ khóa `closest-side` và `farthest-side` hữu ích để tạo nhanh một hình elip dựa trên kích thước của hộp tham chiếu phần tử nổi.

```html live-sample___ellipse-keywords
<div class="box">
  <div class="shape"></div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___ellipse-keywords
body {
  font: 1.2em / 1.5 sans-serif;
}
.shape {
  float: left;
  shape-outside: ellipse(closest-side farthest-side at 30%);
  margin: 20px;
  width: 100px;
  height: 140px;
}
```

{{EmbedLiveSample("ellipse-keywords", "", "300px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("clip-path")}}, {{cssxref("shape-outside")}}
- [Hướng dẫn về Basic Shapes](/vi/docs/Web/CSS/Guides/Shapes/Using_shape-outside)
