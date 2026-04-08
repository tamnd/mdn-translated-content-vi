---
title: text-emphasis-color
slug: Web/CSS/Reference/Properties/text-emphasis-color
page-type: css-property
browser-compat: css.properties.text-emphasis-color
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-emphasis-color`** xác định màu của các dấu nhấn mạnh. Giá trị này cũng có thể được đặt bằng thuộc tính viết tắt {{cssxref("text-emphasis")}}.

{{InteractiveExample("CSS Demo: text-emphasis-color")}}

```css interactive-example-choice
text-emphasis-color: currentColor;
```

```css interactive-example-choice
text-emphasis-color: red;
```

```css interactive-example-choice
text-emphasis-color: rgb(90 200 160 / 0.8);
```

```html interactive-example
<section id="default-example">
  <p>
    I'd far rather be
    <span class="transition-all" id="example-element">happy than right</span>
    any day.
  </p>
</section>
```

```css interactive-example
p {
  font: 1.5em sans-serif;
}

#example-element {
  text-emphasis: filled;
}
```

## Cú pháp

```css
/* Giá trị ban đầu */
text-emphasis-color: currentColor;

/* <color> */
text-emphasis-color: #555555;
text-emphasis-color: blue;
text-emphasis-color: rgb(90 200 160 / 80%);
text-emphasis-color: transparent;

/* Giá trị toàn cục */
text-emphasis-color: inherit;
text-emphasis-color: initial;
text-emphasis-color: revert;
text-emphasis-color: revert-layer;
text-emphasis-color: unset;
```

### Giá trị

- `<color>`
  - : Xác định màu của các dấu nhấn mạnh. Nếu không có màu nào được chỉ định, mặc định là `currentColor`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Nhấn mạnh với màu và ký tự tùy chỉnh

#### CSS

```css
em {
  text-emphasis-color: green;
  text-emphasis-style: "*";
}
```

#### HTML

```html
<p>Here's an example:</p>

<em>This has emphasis marks!</em>
```

#### Kết quả

{{EmbedLiveSample("Emphasis_with_a_color_and_custom_character", 450, 100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Kiểu dữ liệu {{cssxref("&lt;color&gt;")}}
- Các thuộc tính liên quan đến dấu nhấn mạnh khác: {{cssxref('text-emphasis-style')}}, {{cssxref('text-emphasis')}}, và {{cssxref("text-emphasis-position")}}.
- Các thuộc tính liên quan đến màu sắc khác: {{cssxref("color")}}, {{cssxref("background-color")}}, {{cssxref("border-color")}}, {{cssxref("outline-color")}}, {{cssxref("text-shadow")}}, {{cssxref("caret-color")}}, và {{cssxref("column-rule-color")}}
