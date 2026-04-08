---
title: border-right-width
slug: Web/CSS/Reference/Properties/border-right-width
page-type: css-property
browser-compat: css.properties.border-right-width
sidebar: cssref
---

Thuộc tính **`border-right-width`** trong [CSS](/en-US/docs/Web/CSS) đặt độ rộng cho đường viền phía phải của một phần tử.

{{InteractiveExample("CSS Demo: border-right-width")}}

```css interactive-example-choice
border-right-width: thick;
```

```css interactive-example-choice
border-right-width: 2em;
```

```css interactive-example-choice
border-right-width: 4px;
```

```css interactive-example-choice
border-right-width: 2ex;
```

```css interactive-example-choice
border-right-width: 0;
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
border-right-width: thin;
border-right-width: medium;
border-right-width: thick;

/* Giá trị <length> */
border-right-width: 10em;
border-right-width: 3vmax;
border-right-width: 6px;

/* Từ khóa toàn cục */
border-right-width: inherit;
border-right-width: initial;
border-right-width: revert;
border-right-width: revert-layer;
border-right-width: unset;
```

### Giá trị

- `<line-width>`
  - : Xác định độ rộng của đường viền, có thể là giá trị {{cssxref("&lt;length&gt;")}} không âm tường minh hoặc một từ khóa. Nếu là từ khóa, phải là một trong các giá trị sau:
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

### So sánh các độ rộng đường viền

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
  border-right-width: thick;
}
div:nth-child(2) {
  border-right-width: 2em;
}
```

#### Kết quả

{{EmbedLiveSample('Comparing_border_widths', '100%')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến độ rộng đường viền khác: {{Cssxref("border-bottom-width")}}, {{Cssxref("border-left-width")}}, {{Cssxref("border-top-width")}}, và {{Cssxref("border-width")}}.
- Các thuộc tính CSS liên quan đến đường viền phải khác: {{Cssxref("border")}}, {{Cssxref("border-right")}}, {{Cssxref("border-right-style")}}, và {{Cssxref("border-right-color")}}.
