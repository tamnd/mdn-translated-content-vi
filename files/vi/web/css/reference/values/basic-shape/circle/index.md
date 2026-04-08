---
title: circle()
slug: Web/CSS/Reference/Values/basic-shape/circle
page-type: css-function
browser-compat: css.types.basic-shape.circle
sidebar: cssref
---

Hàm **`circle()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) dùng để định nghĩa một hình tròn thông qua bán kính và vị trí tâm. Đây là một trong các kiểu dữ liệu {{cssxref("basic-shape")}}.

{{InteractiveExample("CSS Demo: circle()")}}

```css interactive-example-choice
clip-path: circle(50px);
```

```css interactive-example-choice
clip-path: circle(6rem at right center);
```

```css interactive-example-choice
clip-path: circle(10% at 2rem 90%);
```

```css interactive-example-choice
clip-path: circle(closest-side at 5rem 6rem);
```

```css interactive-example-choice
clip-path: circle(farthest-side);
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
shape-outside: circle(50%);
clip-path: circle(6rem at 12rem 8rem);
```

### Giá trị

- `<shape-radius>`
  - : Có thể là một {{cssxref("length")}}, {{cssxref("percentage")}}, hoặc các giá trị `closest-side` và `farthest-side`.
    - `closest-side`
      - : Sử dụng khoảng cách từ tâm hình dạng đến cạnh gần nhất của hộp tham chiếu. Đối với hình tròn, đây là cạnh gần nhất theo bất kỳ chiều nào.
    - `farthest-side`
      - : Sử dụng khoảng cách từ tâm hình dạng đến cạnh xa nhất của hộp tham chiếu. Đối với hình tròn, đây là cạnh xa nhất theo bất kỳ chiều nào.

- `<position>`
  - : Di chuyển tâm của hình tròn. Có thể là một {{cssxref("length")}}, {{cssxref("percentage")}}, hoặc các giá trị như `left`. Giá trị `<position>` mặc định là center nếu bị bỏ qua.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Hình tròn cơ bản

Trong ví dụ bên dưới, thuộc tính {{cssxref("shape-outside")}} có giá trị `circle(50%)`, định nghĩa một hình tròn trên phần tử float để văn bản bao quanh nó.

```html live-sample___circle
<div class="box">
  <img
    alt="A hot air balloon"
    src="https://mdn.github.io/shared-assets/images/examples/round-balloon.png" />
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

```css live-sample___circle
body {
  font: 1.2em / 1.5 sans-serif;
}
img {
  float: left;
  shape-outside: circle(50%);
}
```

{{EmbedLiveSample("circle", "", "300px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("clip-path")}}, {{cssxref("shape-outside")}}
- [Hướng dẫn về Basic Shapes](/vi/docs/Web/CSS/Guides/Shapes/Using_shape-outside)
