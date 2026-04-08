---
title: border-block-end-style
slug: Web/CSS/Reference/Properties/border-block-end-style
page-type: css-property
browser-compat: css.properties.border-block-end-style
sidebar: cssref
---

Thuộc tính **`border-block-end-style`** trong [CSS](/en-US/docs/Web/CSS) xác định kiểu của đường viền kết thúc khối logic của một phần tử, ánh xạ tới kiểu viền vật lý tùy thuộc vào chế độ viết, chiều hướng và hướng văn bản của phần tử. Thuộc tính này tương ứng với {{cssxref("border-top-style")}}, {{cssxref("border-right-style")}}, {{cssxref("border-bottom-style")}} hoặc {{cssxref("border-left-style")}} tùy theo giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

{{InteractiveExample("CSS Demo: border-block-end-style")}}

```css interactive-example-choice
border-block-end-style: dotted;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block-end-style: dotted;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-block-end-style: groove;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block-end-style: dashed;
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
/* Giá trị <'border-style'> */
border-block-end-style: dashed;
border-block-end-style: dotted;
border-block-end-style: groove;

/* Giá trị toàn cục */
border-block-end-style: inherit;
border-block-end-style: initial;
border-block-end-style: revert;
border-block-end-style: revert-layer;
border-block-end-style: unset;
```

Các thuộc tính liên quan là {{cssxref("border-block-start-style")}}, {{cssxref("border-inline-start-style")}} và {{cssxref("border-inline-end-style")}}, xác định kiểu viền còn lại của phần tử.

### Giá trị

- `<'border-style'>`
  - : Kiểu đường của đường viền. Xem {{ cssxref("border-style") }}.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Viền nét đứt với văn bản dọc

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
  border: 5px solid blue;
  border-block-end-style: dashed;
}
```

#### Kết quả

{{EmbedLiveSample("Dashed_border_with_vertical_text", 140, 140)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Logical Properties and Values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ tới một trong các thuộc tính viền vật lý: {{cssxref("border-top-style")}}, {{cssxref("border-right-style")}}, {{cssxref("border-bottom-style")}} và {{cssxref("border-left-style")}}.
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
