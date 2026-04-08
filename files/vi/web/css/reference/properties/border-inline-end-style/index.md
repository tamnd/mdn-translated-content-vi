---
title: border-inline-end-style
slug: Web/CSS/Reference/Properties/border-inline-end-style
page-type: css-property
browser-compat: css.properties.border-inline-end-style
sidebar: cssref
---

Thuộc tính **`border-inline-end-style`** [CSS](/en-US/docs/Web/CSS) xác định kiểu của đường viền cuối nội tuyến logic của phần tử, ánh xạ tới kiểu đường viền vật lý tùy thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với {{cssxref("border-top-style")}}, {{cssxref("border-right-style")}}, {{cssxref("border-bottom-style")}}, hoặc {{cssxref("border-left-style")}} tùy thuộc vào các giá trị được xác định cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

{{InteractiveExample("CSS Demo: border-inline-end-style")}}

```css interactive-example-choice
border-inline-end-style: dotted;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-inline-end-style: dotted;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-inline-end-style: groove;
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
border-inline-end-style: dashed;
border-inline-end-style: dotted;
border-inline-end-style: groove;

/* Giá trị toàn cục */
border-inline-end-style: inherit;
border-inline-end-style: initial;
border-inline-end-style: revert;
border-inline-end-style: revert-layer;
border-inline-end-style: unset;
```

Các thuộc tính liên quan là {{cssxref("border-block-start-style")}}, {{cssxref("border-block-end-style")}} và {{cssxref("border-inline-start-style")}}, xác định các kiểu đường viền khác của phần tử.

### Giá trị

- `<'border-style'>`
  - : Kiểu đường của đường viền. Xem {{ cssxref("border-style") }}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kiểu inline-end

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
  border-inline-end-style: dashed;
}
```

#### Kết quả

{{EmbedLiveSample("Examples", 140, 140)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ tới một trong các thuộc tính đường viền vật lý: {{cssxref("border-top-style")}}, {{cssxref("border-right-style")}}, {{cssxref("border-bottom-style")}}, hoặc {{cssxref("border-left-style")}}.
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
