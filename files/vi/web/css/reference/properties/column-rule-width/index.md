---
title: column-rule-width
slug: Web/CSS/Reference/Properties/column-rule-width
page-type: css-property
browser-compat: css.properties.column-rule-width
sidebar: cssref
---

Thuộc tính **`column-rule-width`** [CSS](/en-US/docs/Web/CSS) đặt độ rộng của đường kẻ được vẽ giữa các cột trong bố cục nhiều cột.

{{InteractiveExample("CSS Demo: column-rule-width")}}

```css interactive-example-choice
column-rule-width: thin;
```

```css interactive-example-choice
column-rule-width: medium;
```

```css interactive-example-choice
column-rule-width: thick;
```

```css interactive-example-choice
column-rule-width: 12px;
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
/* Giá trị từ khóa */
column-rule-width: thin;
column-rule-width: medium;
column-rule-width: thick;

/* Giá trị <length> */
column-rule-width: 1px;
column-rule-width: 2.5em;

/* Giá trị toàn cục */
column-rule-width: inherit;
column-rule-width: initial;
column-rule-width: revert;
column-rule-width: revert-layer;
column-rule-width: unset;
```

Thuộc tính `column-rule-width` được chỉ định là một giá trị `<'border-width'>` duy nhất.

### Giá trị

- `<'border-width'>`
  - : Là một từ khóa được định nghĩa bởi {{ cssxref("border-width") }} mô tả độ rộng của đường kẻ. Có thể là {{cssxref("&lt;length&gt;")}} hoặc một trong các từ khóa `thin`, `medium` hoặc `thick`.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt đường kẻ cột dày

#### HTML

```html
<p>
  This is a bunch of text split into three columns. The `column-rule-width`
  property is used to change the width of the line that is drawn between
  columns. Don't you think that's wonderful?
</p>
```

#### CSS

```css
p {
  column-count: 3;
  column-rule-style: solid;
  column-rule-width: thick;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_a_thick_column_rule")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout)
- {{CSSXref("column-rule-style")}}
- {{CSSXref("column-rule-color")}}
- {{CSSXref("column-rule")}}
