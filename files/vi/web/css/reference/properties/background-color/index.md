---
title: background-color
slug: Web/CSS/Reference/Properties/background-color
page-type: css-property
browser-compat: css.properties.background-color
sidebar: cssref
---

Thuộc tính **`background-color`** trong [CSS](/en-US/docs/Web/CSS) dùng để đặt màu nền cho một phần tử.

{{InteractiveExample("CSS Demo: background-color")}}

```css interactive-example-choice
background-color: brown;
```

```css interactive-example-choice
background-color: #74992e;
```

```css interactive-example-choice
background-color: rgb(255 255 128);
```

```css interactive-example-choice
background-color: rgb(255 255 128 / 0.5);
```

```css interactive-example-choice
background-color: hsl(50 33% 25%);
```

```css interactive-example-choice
background-color: hsl(50 33% 25% / 0.75);
```

```html interactive-example
<section id="default-example">
  <div class="transition-all" id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  min-width: 100%;
  min-height: 100%;
  padding: 10%;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
background-color: red;
background-color: indigo;

/* Giá trị thập lục phân */
background-color: #bbff00; /* Hoàn toàn không trong suốt */
background-color: #bf0; /* Viết tắt hoàn toàn không trong suốt */
background-color: #11ffee00; /* Hoàn toàn trong suốt */
background-color: #1fe0; /* Viết tắt hoàn toàn trong suốt */
background-color: #11ffeeff; /* Hoàn toàn không trong suốt */
background-color: #1fef; /* Viết tắt hoàn toàn không trong suốt */

/* Giá trị RGB */
background-color: rgb(255 255 128); /* Hoàn toàn không trong suốt */
background-color: rgb(117 190 218 / 50%); /* Trong suốt 50% */

/* Giá trị HSL */
background-color: hsl(50 33% 25%); /* Hoàn toàn không trong suốt */
background-color: hsl(50 33% 25% / 75%); /* Độ mờ 75%, tức trong suốt 25% */

/* Giá trị từ khóa đặc biệt */
background-color: currentColor;
background-color: transparent;

/* Giá trị toàn cục */
background-color: inherit;
background-color: initial;
background-color: revert;
background-color: revert-layer;
background-color: unset;
```

Thuộc tính `background-color` được chỉ định bằng một giá trị `<color>` duy nhất.

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Màu đồng nhất của nền. Màu này được hiển thị phía sau bất kỳ {{cssxref("background-image")}} nào được chỉ định, mặc dù màu sắc vẫn có thể nhìn thấy qua các phần trong suốt của hình ảnh.

## Khả năng tiếp cận

Điều quan trọng là phải đảm bảo tỷ lệ tương phản giữa màu nền và màu của văn bản đặt lên trên đó đủ cao để người dùng có thị lực kém vẫn có thể đọc được nội dung của trang.

Tỷ lệ tương phản màu sắc được xác định bằng cách so sánh độ sáng của các giá trị màu chữ và màu nền. Để đáp ứng [Hướng dẫn Khả năng tiếp cận Nội dung Web (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/) hiện tại, tỷ lệ 4.5:1 được yêu cầu đối với nội dung văn bản và 3:1 đối với văn bản lớn hơn như tiêu đề. Văn bản lớn được định nghĩa là 18.66px và [đậm](/en-US/docs/Web/CSS/Reference/Properties/font-weight) trở lên, hoặc 24px trở lên.

- [WebAIM: Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.3 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tô màu các hộp

Ví dụ này minh họa việc áp dụng `background-color` cho các phần tử HTML {{HTMLelement("div")}} sử dụng các giá trị CSS {{cssxref("color_value", "&lt;color&gt;")}} khác nhau.

#### HTML

```html
<div class="example-one">Lorem ipsum dolor sit amet, consectetuer</div>

<div class="example-two">Lorem ipsum dolor sit amet, consectetuer</div>

<div class="example-three">Lorem ipsum dolor sit amet, consectetuer</div>
```

#### CSS

```css
.example-one {
  background-color: transparent;
}

.example-two {
  background-color: rgb(153 102 153);
  color: rgb(255 255 204);
}

.example-three {
  background-color: #777799;
  color: white;
}
```

#### Kết quả

{{EmbedLiveSample("Colorize boxes", 200, 150)}}

### Tô màu bảng

Ví dụ này minh họa việc sử dụng `background-color` trên các phần tử HTML {{HTMLelement("table")}}, bao gồm các hàng {{HTMLelement("tr")}} và các ô {{HTMLelement("td")}}.

#### HTML

```html
<table>
  <tbody>
    <tr id="r1">
      <td id="c11">11</td>
      <td id="c12">12</td>
      <td id="c13">13</td>
    </tr>
    <tr id="r2">
      <td id="c21">21</td>
      <td id="c22">22</td>
      <td id="c23">23</td>
    </tr>
    <tr id="r3">
      <td id="c31">31</td>
      <td id="c32">32</td>
      <td id="c33">33</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
table {
  border-collapse: collapse;
  border: solid black 1px;
  width: 250px;
  height: 150px;
}
td {
  border: solid 1px black;
}
#r1 {
  background-color: lightblue;
}
#c12 {
  background-color: cyan;
}
#r2 {
  background-color: grey;
}
#r3 {
  background-color: olive;
}
```

#### Kết quả

{{EmbedLiveSample('Colorize tables', "100%", "100%")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Multiple backgrounds](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
- Kiểu dữ liệu {{cssxref("&lt;color&gt;")}}
- Các thuộc tính liên quan đến màu sắc khác: {{cssxref("color")}}, {{cssxref("border-color")}}, {{cssxref("outline-color")}}, {{cssxref("text-decoration-color")}}, {{cssxref("text-emphasis-color")}}, {{cssxref("text-shadow")}}, {{cssxref("caret-color")}}, và {{cssxref("column-rule-color")}}
