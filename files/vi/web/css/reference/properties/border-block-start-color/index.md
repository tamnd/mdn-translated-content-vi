---
title: border-block-start-color
slug: Web/CSS/Reference/Properties/border-block-start-color
page-type: css-property
browser-compat: css.properties.border-block-start-color
sidebar: cssref
---

Thuộc tính **`border-block-start-color`** trong [CSS](/en-US/docs/Web/CSS) xác định màu sắc của đường viền bắt đầu khối logic của một phần tử, ánh xạ tới màu viền vật lý tùy thuộc vào chế độ viết, chiều hướng và hướng văn bản của phần tử. Thuộc tính này tương ứng với {{cssxref("border-top-color")}}, {{cssxref("border-right-color")}}, {{cssxref("border-bottom-color")}} hoặc {{cssxref("border-left-color")}} tùy theo giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

{{InteractiveExample("CSS Demo: border-block-start-color")}}

```css interactive-example-choice
border-block-start-color: red;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block-start-color: #32a1ce;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-block-start-color: rgb(170 50 220 / 0.6);
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block-start-color: hsl(60 90% 50% / 0.8);
writing-mode: vertical-lr;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with a border around it.
  </div>
</section>
```

```css interactive-example
#example-element {
  background-color: #eeeeee;
  color: black;
  border: 0.75em solid;
  padding: 0.75em;
  width: 80%;
  height: 100px;
  unicode-bidi: bidi-override;
}
```

## Cú pháp

```css
border-block-start-color: blue;
border-block-start-color: #4c5d21;

/* Giá trị toàn cục */
border-block-start-color: inherit;
border-block-start-color: initial;
border-block-start-color: revert;
border-block-start-color: revert-layer;
border-block-start-color: unset;
```

Các thuộc tính liên quan là {{cssxref("border-block-end-color")}}, {{cssxref("border-inline-start-color")}} và {{cssxref("border-inline-end-color")}}, xác định màu viền còn lại của phần tử.

### Giá trị

- {{CSSXref("&lt;color&gt;")}}
  - : Màu sắc của đường viền.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Màu viền với văn bản dọc

#### HTML

```html
<div>
  <p class="exampleText">Example text</p>
</div>
```

#### CSS

```css
div {
  background-color: yellow;
  width: 120px;
  height: 120px;
}

.exampleText {
  writing-mode: vertical-lr;
  border: 10px solid blue;
  border-block-start-color: red;
}
```

#### Kết quả

{{EmbedLiveSample("Border_color_with_vertical_text", 140, 140)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Logical Properties and Values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ tới một trong các thuộc tính viền vật lý: {{cssxref("border-top-color")}}, {{cssxref("border-right-color")}}, {{cssxref("border-bottom-color")}} hoặc {{cssxref("border-left-color")}}.
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
