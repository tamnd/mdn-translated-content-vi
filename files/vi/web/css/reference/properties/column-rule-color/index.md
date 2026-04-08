---
title: column-rule-color
slug: Web/CSS/Reference/Properties/column-rule-color
page-type: css-property
browser-compat: css.properties.column-rule-color
sidebar: cssref
---

Thuộc tính **`column-rule-color`** [CSS](/en-US/docs/Web/CSS) đặt màu của đường kẻ được vẽ giữa các cột trong bố cục nhiều cột.

{{InteractiveExample("CSS Demo: column-rule-color")}}

```css interactive-example-choice
column-rule-color: red;
```

```css interactive-example-choice
column-rule-color: rgb(48 125 222);
```

```css interactive-example-choice
column-rule-color: hsl(120 80% 40% / 0.6);
```

```css interactive-example-choice
column-rule-color: currentColor;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather. As much mud in the streets
    as if the waters had but newly retired from the face of the earth, and it
    would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

```css interactive-example
#example-element {
  columns: 3;
  column-rule: solid;
  text-align: left;
}
```

## Cú pháp

```css
/* Giá trị <color> */
column-rule-color: red;
column-rule-color: rgb(192 56 78);
column-rule-color: transparent;
column-rule-color: hsl(0 100% 50% / 60%);

/* Giá trị toàn cục */
column-rule-color: inherit;
column-rule-color: initial;
column-rule-color: revert;
column-rule-color: revert-layer;
column-rule-color: unset;
```

Thuộc tính `column-rule-color` được chỉ định là một giá trị `<color>` duy nhất.

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Màu của đường kẻ phân tách các cột.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt đường kẻ cột màu xanh

#### HTML

```html
<p>
  This is a bunch of text split into three columns. The `column-rule-color`
  property is used to change the color of the line that is drawn between
  columns. Don't you think that's wonderful?
</p>
```

#### CSS

```css
p {
  column-count: 3;
  column-rule-style: solid;
  column-rule-color: blue;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_a_blue_column_rule")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Kiểu dữ liệu {{cssxref("&lt;color&gt;")}}
- Các thuộc tính liên quan đến màu khác: {{cssxref("color")}}, {{cssxref("background-color")}}, {{cssxref("border-color")}}, {{cssxref("outline-color")}}, {{cssxref("text-decoration-color")}}, {{cssxref("text-emphasis-color")}}, {{cssxref("text-shadow")}}, và {{cssxref("caret-color")}}
