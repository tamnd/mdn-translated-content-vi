---
title: border-bottom-width
slug: Web/CSS/Reference/Properties/border-bottom-width
page-type: css-property
browser-compat: css.properties.border-bottom-width
sidebar: cssref
---

Thuộc tính **`border-bottom-width`** trong [CSS](/en-US/docs/Web/CSS) đặt độ rộng của đường viền phía dưới của một phần tử.

{{InteractiveExample("CSS Demo: border-bottom-width")}}

```css interactive-example-choice
border-bottom-width: thick;
```

```css interactive-example-choice
border-bottom-width: 2em;
```

```css interactive-example-choice
border-bottom-width: 4px;
```

```css interactive-example-choice
border-bottom-width: 2ex;
```

```css interactive-example-choice
border-bottom-width: 0;
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
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
border-bottom-width: thin;
border-bottom-width: medium;
border-bottom-width: thick;

/* Giá trị <length> */
border-bottom-width: 10em;
border-bottom-width: 3vmax;
border-bottom-width: 6px;

/* Giá trị toàn cục */
border-bottom-width: inherit;
border-bottom-width: initial;
border-bottom-width: revert;
border-bottom-width: revert-layer;
border-bottom-width: unset;
```

### Giá trị

- `<line-width>`
  - : Xác định độ rộng của đường viền, dưới dạng giá trị {{cssxref("&lt;length&gt;")}} không âm tường minh hoặc một từ khóa. Nếu là từ khóa, nó phải là một trong các giá trị sau:
    - `thin`
      - Tương đương `1px`.
    - `medium`
      - Tương đương `3px`.
    - `thick`
      - Tương đương `5px`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### So sánh độ rộng đường viền dưới

#### HTML

```html
<div>Element 1</div>
<div>Element 2</div>
```

#### CSS

```css
div {
  border: 1px solid red;
  margin: 1em 0;
}

div:nth-child(1) {
  border-bottom-width: thick;
}
div:nth-child(2) {
  border-bottom-width: 2em;
}
```

#### Kết quả

{{EmbedLiveSample('Comparing_bottom_border_widths', '100%')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến độ rộng đường viền: {{Cssxref("border-left-width")}}, {{Cssxref("border-right-width")}}, {{Cssxref("border-top-width")}} và {{Cssxref("border-width")}}.
- Các thuộc tính CSS liên quan đến đường viền dưới: {{Cssxref("border")}}, {{Cssxref("border-bottom")}}, {{Cssxref("border-bottom-style")}} và {{Cssxref("border-bottom-color")}}.
