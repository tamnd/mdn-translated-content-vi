---
title: outline-offset
slug: Web/CSS/Reference/Properties/outline-offset
page-type: css-property
browser-compat: css.properties.outline-offset
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`outline-offset`** đặt khoảng cách giữa [outline](/en-US/docs/Web/CSS/Reference/Properties/outline) và cạnh hoặc border của một phần tử.

{{InteractiveExample("CSS Demo: outline-offset")}}

```css interactive-example-choice
outline-offset: 4px;
```

```css interactive-example-choice
outline-offset: 0.6rem;
```

```css interactive-example-choice
outline-offset: 12px;
outline: 5px dashed blue;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with an outline around it.
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 2px solid crimson;
  outline: 0.75em solid;
  padding: 0.75em;
  width: 80%;
  height: 100px;
}
```

## Cú pháp

```css
/* Giá trị <length> */
outline-offset: 3px;
outline-offset: 0.2em;

/* Giá trị toàn cục */
outline-offset: inherit;
outline-offset: initial;
outline-offset: revert;
outline-offset: revert-layer;
outline-offset: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Chiều rộng của khoảng cách giữa phần tử và outline của nó. Giá trị âm đặt outline bên trong phần tử. Giá trị `0` đặt outline sao cho không có khoảng cách giữa nó và phần tử.

## Mô tả

Outline là đường kẻ được vẽ xung quanh một phần tử, bên ngoài cạnh border. Khoảng cách giữa phần tử và outline của nó là trong suốt. Nói cách khác, nó giống với nền của phần tử cha.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt outline offset bằng pixel

#### HTML

```html
<p>Gallia est omnis divisa in partes tres.</p>
```

#### CSS

```css
p {
  outline: 1px dashed red;
  outline-offset: 10px;
  background: yellow;
  border: 1px solid blue;
  margin: 15px;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_outline_offset_in_pixels')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("outline")}}
- {{cssxref("outline-width")}}
- {{cssxref("outline-style")}}
- {{cssxref("outline-color")}}
