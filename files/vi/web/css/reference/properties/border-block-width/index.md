---
title: border-block-width
slug: Web/CSS/Reference/Properties/border-block-width
page-type: css-property
browser-compat: css.properties.border-block-width
sidebar: cssref
---

Thuộc tính **`border-block-width`** trong [CSS](/en-US/docs/Web/CSS) xác định độ rộng của các đường viền logic theo chiều khối của một phần tử, tương ứng với một độ rộng đường viền vật lý tùy thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với các thuộc tính {{cssxref("border-top-width")}} và {{cssxref("border-bottom-width")}}, hoặc {{cssxref("border-left-width")}} và {{cssxref("border-right-width")}} tùy theo các giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

Độ rộng đường viền theo chiều ngang có thể được đặt với {{cssxref("border-inline-width")}}, vốn đặt {{cssxref("border-inline-start-width")}} và {{cssxref("border-inline-end-width")}}.

{{InteractiveExample("CSS Demo: border-block-width")}}

```css interactive-example-choice
border-block-width: thick;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block-width: thick;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-block-width: 4px;
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
border-block-width: 5px;
border-block-width: thick;

/* Giá trị toàn cục */
border-block-width: inherit;
border-block-width: initial;
border-block-width: revert;
border-block-width: revert-layer;
border-block-width: unset;
```

### Giá trị

- `<'border-width'>`
  - : Độ rộng của đường viền. Xem {{ cssxref("border-width") }}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Độ rộng đường viền với văn bản dọc

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
  border-block-width: 5px;
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
- Thuộc tính này ánh xạ tới một trong các thuộc tính đường viền vật lý: {{cssxref("border-top-width")}}, {{cssxref("border-right-width")}}, {{cssxref("border-bottom-width")}} và {{cssxref("border-left-width")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
