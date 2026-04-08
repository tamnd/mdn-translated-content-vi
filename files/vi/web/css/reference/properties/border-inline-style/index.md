---
title: border-inline-style
slug: Web/CSS/Reference/Properties/border-inline-style
page-type: css-property
browser-compat: css.properties.border-inline-style
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`border-inline-style`** xác định kiểu của các đường viền logic theo chiều ngang nội tuyến của một phần tử, ánh xạ tới kiểu đường viền vật lý tương ứng tùy thuộc vào chế độ viết, chiều hướng và hướng văn bản của phần tử đó. Nó tương ứng với thuộc tính {{cssxref("border-top-style")}} và {{cssxref("border-bottom-style")}}, hoặc {{cssxref("border-left-style")}} và {{cssxref("border-right-style")}} tùy theo các giá trị được xác định cho {{cssxref("writing-mode")}}, {{cssxref("direction")}}, và {{cssxref("text-orientation")}}.

Kiểu đường viền theo chiều còn lại có thể được thiết lập bằng {{cssxref("border-block-style")}}, vốn thiết lập {{cssxref("border-block-start-style")}} và {{cssxref("border-block-end-style")}}.

{{InteractiveExample("CSS Demo: border-inline-style")}}

```css interactive-example-choice
border-inline-style: dotted;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-inline-style: dotted;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-inline-style: groove;
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
/* Giá trị <'border-style'> */
border-inline-style: dashed;
border-inline-style: dotted;
border-inline-style: groove;

/* Giá trị toàn cục */
border-inline-style: inherit;
border-inline-style: initial;
border-inline-style: revert;
border-inline-style: revert-layer;
border-inline-style: unset;
```

### Giá trị

- `<'border-style'>`
  - : Kiểu đường của đường viền. Xem {{ cssxref("border-style") }}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập border-inline-style

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
  border-inline-style: dashed;
}
```

{{EmbedLiveSample("Setting border-inline-style", 140, 140)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ tới một trong các thuộc tính đường viền vật lý: {{cssxref("border-top-style")}}, {{cssxref("border-right-style")}}, {{cssxref("border-bottom-style")}}, hoặc {{cssxref("border-left-style")}}.
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
