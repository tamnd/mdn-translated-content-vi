---
title: border-block-style
slug: Web/CSS/Reference/Properties/border-block-style
page-type: css-property
browser-compat: css.properties.border-block-style
sidebar: cssref
---

Thuộc tính **`border-block-style`** trong [CSS](/en-US/docs/Web/CSS) xác định kiểu của các đường viền logic theo chiều khối của một phần tử, tương ứng với một kiểu đường viền vật lý tùy thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với các thuộc tính {{cssxref("border-top-style")}} và {{cssxref("border-bottom-style")}}, hoặc {{cssxref("border-left-style")}} và {{cssxref("border-right-style")}} tùy theo các giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

Kiểu đường viền theo chiều ngang có thể được đặt với {{cssxref("border-inline-style")}}, vốn đặt {{cssxref("border-inline-start-style")}} và {{cssxref("border-inline-end-style")}}.

{{InteractiveExample("CSS Demo: border-block-style")}}

```css interactive-example-choice
border-block-style: dotted;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block-style: dotted;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-block-style: groove;
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
border-block-style: dashed;
border-block-style: dotted;
border-block-style: groove;

/* Giá trị toàn cục */
border-block-style: inherit;
border-block-style: initial;
border-block-style: revert;
border-block-style: revert-layer;
border-block-style: unset;
```

### Giá trị

- `<'border-style'>`
  - : Kiểu đường kẻ của đường viền. Xem {{ cssxref("border-style") }}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đường viền nét đứt với văn bản dọc

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
  border-block-style: dashed;
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
- Thuộc tính này ánh xạ tới một trong các thuộc tính đường viền vật lý: {{cssxref("border-top-style")}}, {{cssxref("border-right-style")}}, {{cssxref("border-bottom-style")}} hoặc {{cssxref("border-left-style")}}.
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
