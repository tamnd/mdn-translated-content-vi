---
title: inset()
slug: Web/CSS/Reference/Values/basic-shape/inset
page-type: css-function
browser-compat: css.types.basic-shape.inset
sidebar: cssref
---

Hàm **`inset()`** trong [CSS](/vi/docs/Web/CSS) định nghĩa một hình chữ nhật ở các khoảng cách lùi vào được chỉ định từ mỗi cạnh của hộp tham chiếu. Đây là hàm hình dạng cơ bản dùng để định nghĩa một trong các kiểu dữ liệu {{cssxref("basic-shape")}} [data types](/vi/docs/Web/CSS/Reference/Values/Data_types).

{{InteractiveExample("CSS Demo: inset()")}}

```css interactive-example-choice
clip-path: inset(30px);
```

```css interactive-example-choice
clip-path: inset(1rem 2rem 3rem 4rem);
```

```css interactive-example-choice
clip-path: inset(20% 30% round 20px);
```

```css interactive-example-choice
clip-path: inset(4rem 20% round 1rem 2rem 3rem 4rem);
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
shape-outside: inset(20px 50px 10px 0 round 50px);
```

### Giá trị

- `<length-percentage>{1,4}`
  - : Khi cả bốn đối số được cung cấp, chúng đại diện cho các độ lệch từ trên, phải, dưới và trái tính vào trong từ hộp tham chiếu, xác định vị trí các cạnh của hình chữ nhật lùi vào. Các đối số này tuân theo cú pháp rút gọn của margin, cho phép đặt cả bốn giá trị lùi vào bằng một, hai hoặc bốn giá trị.

    Nếu tổng hai giá trị lùi vào cho một chiều vượt quá 100% của chiều đó, cả hai giá trị sẽ được giảm theo tỷ lệ sao cho tổng bằng 100%. Ví dụ, giá trị `inset(90% 10% 60% 10%)` có lùi vào trên là `90%` và lùi vào dưới là `60%`. Các giá trị này được giảm theo tỷ lệ thành `inset(60% 10% 40% 10%)`. Các hình dạng như thế này, không bao gồm diện tích và không có {{cssxref("shape-margin")}}, không ảnh hưởng đến việc bao văn bản.

- `<border-radius>`
  - : Đối số [`<border-radius>`](/vi/docs/Web/CSS/Reference/Properties/border-radius) tùy chọn định nghĩa các góc bo tròn cho hình chữ nhật lùi vào sử dụng cú pháp rút gọn border-radius.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ inset cơ bản

Trong ví dụ bên dưới, chúng ta có một hình dạng `inset()` được dùng để kéo nội dung qua phần tử nổi. Thay đổi các giá trị độ lệch để xem hình dạng thay đổi.

```html
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

```css
.box {
  width: 400px;
  margin: 0 auto;
}

.shape {
  float: left;
  width: 150px;
  height: 100px;
  clip-path: inset(45px 50px 15px 0 round 50px);
  shape-outside: inset(40px 40px 10px 0 round 50px);
  background-color: coral;
  border-radius: 20px;
  margin: 0;
  padding: 20px;
}
```

{{EmbedLiveSample("Basic inset example", '100%', 280)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("clip-path")}}, {{cssxref("shape-outside")}}
- Module [CSS shapes](/vi/docs/Web/CSS/Guides/Shapes)
- [Hướng dẫn về basic shapes](/vi/docs/Web/CSS/Guides/Shapes/Using_shape-outside)
