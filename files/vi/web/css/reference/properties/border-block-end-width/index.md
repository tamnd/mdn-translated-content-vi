---
title: border-block-end-width
slug: Web/CSS/Reference/Properties/border-block-end-width
page-type: css-property
browser-compat: css.properties.border-block-end-width
sidebar: cssref
---

Thuộc tính **`border-block-end-width`** trong [CSS](/en-US/docs/Web/CSS) xác định độ rộng của đường viền kết thúc khối logic của một phần tử, ánh xạ tới độ rộng viền vật lý tùy thuộc vào chế độ viết, chiều hướng và hướng văn bản của phần tử. Thuộc tính này tương ứng với {{cssxref("border-top-width")}}, {{cssxref("border-right-width")}}, {{cssxref("border-bottom-width")}} hoặc {{cssxref("border-left-width")}} tùy theo giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

{{InteractiveExample("CSS Demo: border-block-end-width")}}

```css interactive-example-choice
border-block-end-width: thick;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block-end-width: thick;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-block-end-width: 4px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block-end-width: 4px;
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
border-block-end-width: 5px;
border-block-end-width: thick;

/* Giá trị toàn cục */
border-block-end-width: inherit;
border-block-end-width: initial;
border-block-end-width: revert;
border-block-end-width: revert-layer;
border-block-end-width: unset;
```

Các thuộc tính liên quan là {{cssxref("border-block-start-width")}}, {{cssxref("border-inline-start-width")}} và {{cssxref("border-inline-end-width")}}, xác định độ rộng viền còn lại của phần tử.

### Giá trị

- `<'border-width'>`
  - : Độ rộng của đường viền. Xem {{ cssxref("border-width") }}.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Độ rộng viền với văn bản dọc

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
  border-block-end-width: 5px;
}
```

#### Kết quả

{{EmbedLiveSample("Border_width_with_vertical_text", 140, 140)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Logical Properties and Values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ tới một trong các thuộc tính viền vật lý: {{cssxref("border-top-width")}}, {{cssxref("border-right-width")}}, {{cssxref("border-bottom-width")}} và {{cssxref("border-left-width")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
