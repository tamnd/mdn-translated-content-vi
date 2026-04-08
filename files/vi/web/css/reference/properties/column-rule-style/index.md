---
title: column-rule-style
slug: Web/CSS/Reference/Properties/column-rule-style
page-type: css-property
browser-compat: css.properties.column-rule-style
sidebar: cssref
---

Thuộc tính **`column-rule-style`** [CSS](/en-US/docs/Web/CSS) đặt kiểu dáng của đường kẻ được vẽ giữa các cột trong bố cục nhiều cột.

{{InteractiveExample("CSS Demo: column-rule-style")}}

```css interactive-example-choice
column-rule-style: none;
```

```css interactive-example-choice
column-rule-style: dotted;
```

```css interactive-example-choice
column-rule-style: solid;
```

```css interactive-example-choice
column-rule-style: double;
```

```css interactive-example-choice
column-rule-style: ridge;
column-rule-color: #8888ff;
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
/* Giá trị <'border-style'> */
column-rule-style: none;
column-rule-style: hidden;
column-rule-style: dotted;
column-rule-style: dashed;
column-rule-style: solid;
column-rule-style: double;
column-rule-style: groove;
column-rule-style: ridge;
column-rule-style: inset;
column-rule-style: outset;

/* Giá trị toàn cục */
column-rule-style: inherit;
column-rule-style: initial;
column-rule-style: revert;
column-rule-style: revert-layer;
column-rule-style: unset;
```

Thuộc tính `column-rule-style` được chỉ định là một giá trị `<'border-style'>` duy nhất.

### Giá trị

- `<'border-style'>`
  - : Là một từ khóa được định nghĩa bởi {{ cssxref("border-style") }} mô tả kiểu dáng của đường kẻ. Kiểu dáng phải được diễn giải theo mô hình đường viền thu gọn.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt đường kẻ cột nét đứt

#### HTML

```html
<p>
  This is a bunch of text split into three columns. The `column-rule-style`
  property is used to change the style of the line that is drawn between
  columns. Don't you think that's wonderful?
</p>
```

#### CSS

```css
p {
  column-count: 3;
  column-rule-style: dashed;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_a_dashed_column_rule') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout)
- {{CSSXref("column-rule")}}
- {{CSSXref("column-rule-width")}}
- {{CSSXref("column-rule-color")}}
