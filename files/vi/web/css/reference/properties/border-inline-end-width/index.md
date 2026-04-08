---
title: border-inline-end-width
slug: Web/CSS/Reference/Properties/border-inline-end-width
page-type: css-property
browser-compat: css.properties.border-inline-end-width
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`border-inline-end-width`** xác định độ rộng của đường viền logic phía cuối theo chiều ngang nội tuyến của một phần tử, ánh xạ tới đường viền vật lý tương ứng tùy thuộc vào chế độ viết, chiều hướng và hướng văn bản của phần tử đó. Nó tương ứng với thuộc tính {{cssxref("border-top-width")}}, {{cssxref("border-right-width")}}, {{cssxref("border-bottom-width")}}, hoặc {{cssxref("border-left-width")}} tùy theo các giá trị được xác định cho {{cssxref("writing-mode")}}, {{cssxref("direction")}}, và {{cssxref("text-orientation")}}.

{{InteractiveExample("CSS Demo: border-inline-end-width")}}

```css interactive-example-choice
border-inline-end-width: thick;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-inline-end-width: thick;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-inline-end-width: 4px;
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
  background-color: palegreen;
  color: black;
  border: 0 solid crimson;
  padding: 0.75em;
  width: 80%;
  height: 100px;
  unicode-bidi: bidi-override;
}
```

## Cú pháp

```css
/* Giá trị <'border-width'> */
border-inline-end-width: 2px;
border-inline-end-width: thick;

/* Giá trị toàn cục */
border-inline-end-width: inherit;
border-inline-end-width: initial;
border-inline-end-width: revert;
border-inline-end-width: revert-layer;
border-inline-end-width: unset;
```

Các thuộc tính liên quan là {{cssxref("border-block-start-width")}}, {{cssxref("border-block-end-width")}}, và {{cssxref("border-inline-start-width")}}, xác định độ rộng đường viền còn lại của phần tử.

### Giá trị

- `<'border-width'>`
  - : Độ rộng của đường viền. Xem {{ cssxref("border-width") }}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Áp dụng đường viền với văn bản dọc

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
  border: 1px solid blue;
  border-inline-end-width: 5px;
}
```

#### Kết quả

{{EmbedLiveSample("Applying_a_border_with_vertical_text", 140, 140)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ tới một trong các thuộc tính đường viền vật lý: {{cssxref("border-top-width")}}, {{cssxref("border-right-width")}}, {{cssxref("border-bottom-width")}}, và {{cssxref("border-left-width")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
