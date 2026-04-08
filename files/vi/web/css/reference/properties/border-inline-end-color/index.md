---
title: border-inline-end-color
slug: Web/CSS/Reference/Properties/border-inline-end-color
page-type: css-property
browser-compat: css.properties.border-inline-end-color
sidebar: cssref
---

Thuộc tính **`border-inline-end-color`** [CSS](/en-US/docs/Web/CSS) xác định màu của đường viền cuối nội tuyến logic của phần tử, ánh xạ tới màu đường viền vật lý tùy thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với thuộc tính {{cssxref("border-top-color")}}, {{cssxref("border-right-color")}}, {{cssxref("border-bottom-color")}}, hoặc {{cssxref("border-left-color")}} tùy thuộc vào các giá trị được xác định cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

{{InteractiveExample("CSS Demo: border-inline-end-color")}}

```css interactive-example-choice
border-inline-end-color: red;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-inline-end-color: #32a1ce;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-inline-end-color: rgb(170 50 220 / 0.6);
writing-mode: horizontal-tb;
direction: rtl;
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
border-inline-end-color: rebeccapurple;
border-inline-end-color: #663399;

/* Giá trị toàn cục */
border-inline-end-color: inherit;
border-inline-end-color: initial;
border-inline-end-color: revert;
border-inline-end-color: revert-layer;
border-inline-end-color: unset;
```

Các thuộc tính liên quan là {{cssxref("border-block-start-color")}}, {{cssxref("border-block-end-color")}} và {{cssxref("border-inline-start-color")}}, xác định các màu đường viền khác của phần tử.

### Giá trị

- {{CSSXref("&lt;color&gt;")}}
  - : Màu sắc của đường viền.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<div>
  <p class="exampleText">Example text</p>
</div>
```

### CSS

```css
div {
  background-color: yellow;
  width: 120px;
  height: 120px;
}

.exampleText {
  writing-mode: vertical-lr;
  border: 10px solid blue;
  border-inline-end-color: red;
}
```

{{EmbedLiveSample("Examples", 140, 140)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ tới một trong các thuộc tính đường viền vật lý: {{cssxref("border-top-color")}}, {{cssxref("border-right-color")}}, {{cssxref("border-bottom-color")}}, hoặc {{cssxref("border-left-color")}}.
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
