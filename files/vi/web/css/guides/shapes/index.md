---
title: CSS shapes
short-title: Shapes
slug: Web/CSS/Guides/Shapes
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-shapes-1/
  - https://drafts.csswg.org/css-shapes-2/
sidebar: cssref
---

Module **CSS shapes** mô tả các hình học hình học. Nó cũng định nghĩa các thuộc tính CSS có thể sử dụng các shape để kiểm soát vùng float của phần tử; vùng này sau đó có thể được áp dụng cho exclusion hoặc xác định vùng nội dung của phần tử.

Đặc tả định nghĩa nhiều cách khác nhau để tạo shape. Nội dung có thể bao quanh hoặc nằm bên trong một shape thay vì tuân theo hình chữ nhật mặc định của hộp phần tử.

Shape định nghĩa các hình học có thể được sử dụng làm giá trị CSS. Module này cung cấp các hàm để tạo hình ellipse, đa giác và các hình học tùy ý. Các module CSS khác có thể sử dụng các shape được định nghĩa trong đặc tả này, bao gồm [CSS motion path](/en-US/docs/Web/CSS/Guides/Motion_path) và [CSS masking](/en-US/docs/Web/CSS/Guides/Masking).

## CSS shapes thực tế

Ví dụ dưới đây hiển thị một hình ảnh được float trái và áp dụng thuộc tính `shape-outside` với giá trị `circle(50%)`. Điều này tạo ra hình tròn, và nội dung bao quanh float giờ sẽ bao quanh hình đó. Điều này thay đổi độ dài của các line box văn bản bao quanh. Bạn có thể nhấn "Play" để chỉnh sửa mã trong MDN Playground.

```html live-sample___circle hidden
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

```css live-sample___circle hidden
body {
  font: 1.2em / 1.5 sans-serif;
}
img {
  float: left;
  shape-outside: circle(50%);
}
```

{{EmbedLiveSample("circle", "", "300px")}}

## Tham chiếu

### Thuộc tính

- {{cssxref("shape-image-threshold")}}
- {{cssxref("shape-margin")}}
- {{cssxref("shape-outside")}}

Module CSS shapes cũng giới thiệu các thuộc tính `shape-inside` và `shape-padding`. Hiện tại chưa có trình duyệt nào hỗ trợ những tính năng này.

### Kiểu dữ liệu

- {{cssxref("basic-shape")}}

### Hàm

- {{cssxref("basic-shape/circle","circle()")}}
- {{cssxref("basic-shape/ellipse","ellipse()")}}
- {{cssxref("basic-shape/inset","inset()")}}
- {{cssxref("basic-shape/path","path()")}}
- {{cssxref("basic-shape/polygon","polygon()")}}
- {{cssxref("basic-shape/rect","rect()")}}
- {{cssxref("basic-shape/shape","shape()")}}
- {{cssxref("basic-shape/xywh","xywh()")}}

### Thuật ngữ

- [Reference box](/en-US/docs/Web/CSS/Guides/Shapes/Using_shape-outside#the_reference_box)

## Hướng dẫn

- [Overview of shapes](/en-US/docs/Web/CSS/Guides/Shapes/Overview)
  - : Định nghĩa các basic shape bằng thuộc tính `shape-margin` và `clip-path`, và debug basic shape bằng Developer Tools.

- [Shapes from box values](/en-US/docs/Web/CSS/Guides/Shapes/From_box_values)
  - : Sử dụng độ cong `border-radius` và các giá trị box model CSS để tạo shape.

- [Basic shapes with `shape-outside`](/en-US/docs/Web/CSS/Guides/Shapes/Using_shape-outside)
  - : Tạo hình chữ nhật, hình tròn, hình ellipse và đa giác bằng CSS shapes, reference box và thuộc tính `shape-outside`.

- [Shapes from images](/en-US/docs/Web/CSS/Guides/Shapes/From_images)
  - : Tạo shape từ các tệp hình ảnh bán trong suốt và CSS Gradient.

## Khái niệm liên quan

[CSS motion path](/en-US/docs/Web/CSS/Guides/Motion_path) module

- {{cssxref("offset")}}
- {{cssxref("offset-anchor")}}
- {{cssxref("offset-distance")}}
- {{cssxref("offset-path")}}
- {{cssxref("offset-position")}}
- {{cssxref("offset-rotate")}}
- {{cssxref("ray")}} function

[CSS masking](/en-US/docs/Web/CSS/Guides/Masking) module

- {{cssxref("clip")}}
- {{cssxref("clip-path")}}
- {{SVGAttr("clip-rule")}}
- {{cssxref("mask")}}
- {{cssxref("mask-origin")}}
- {{cssxref("mask-position")}}

[CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module

- {{cssxref("border-radius")}} shorthand

[CSS box model](/en-US/docs/Web/CSS/Guides/Box_model) module

- {{cssxref("box-edge")}} data type

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Shape generator](/en-US/docs/Web/CSS/Guides/Shapes/Shape_generator)
- [CSS Shapes resources](https://codepen.io/KristopherVanSant/post/css-shapes-resources)
- [CSS Shapes 101](https://alistapart.com/article/css-shapes-101/) via alistapart.com (2014)
- [Creating non-rectangular layouts with CSS Shapes](https://www.sarasoueidan.com/blog/css-shapes/) via sarasoueidan.com (2013)
- [How to use CSS Shapes in your web design](https://webdesign.tutsplus.com/how-to-use-css-shapes-in-your-web-design--cms-27498t) via tutsplus.com (2016)
- [Edit CSS shapes with the shape path editor](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/edit_css_shapes/index.html) via mozilla.org (2018) ([Video](https://www.youtube.com/watch?v=u9bDe3Bw0sA))
