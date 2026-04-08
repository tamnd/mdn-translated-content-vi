---
title: border-top-width
slug: Web/CSS/Reference/Properties/border-top-width
page-type: css-property
browser-compat: css.properties.border-top-width
sidebar: cssref
---

Thuộc tính **`border-top-width`** [CSS](/en-US/docs/Web/CSS) đặt độ rộng của đường viền phía trên của một phần tử.

{{InteractiveExample("CSS Demo: border-top-width")}}

```css interactive-example-choice
border-top-width: thick;
```

```css interactive-example-choice
border-top-width: 2em;
```

```css interactive-example-choice
border-top-width: 4px;
```

```css interactive-example-choice
border-top-width: 2ex;
```

```css interactive-example-choice
border-top-width: 0;
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
border-top-width: thin;
border-top-width: medium;
border-top-width: thick;

/* Giá trị <length> */
border-top-width: 10em;
border-top-width: 3vmax;
border-top-width: 6px;

/* Từ khóa toàn cục */
border-top-width: inherit;
border-top-width: initial;
border-top-width: revert;
border-top-width: revert-layer;
border-top-width: unset;
```

### Giá trị

- `<line-width>`
  - : Định nghĩa độ rộng của đường viền, có thể là giá trị {{cssxref("&lt;length&gt;")}} không âm tường minh hoặc một từ khóa. Nếu là từ khóa, nó phải là một trong các giá trị sau:
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

### HTML

```html
<div>Phần tử 1</div>
<div>Phần tử 2</div>
```

### CSS

```css
div {
  border: 1px solid red;
  margin: 1em 0;
}

div:nth-child(1) {
  border-top-width: thick;
}
div:nth-child(2) {
  border-top-width: 2em;
}
```

### Kết quả

{{EmbedLiveSample('Examples', '100%')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến độ rộng đường viền: {{Cssxref("border-left-width")}}, {{Cssxref("border-right-width")}}, {{Cssxref("border-bottom-width")}}, và {{Cssxref("border-width")}}.
- Các thuộc tính CSS liên quan đến đường viền phía trên: {{Cssxref("border")}}, {{Cssxref("border-top")}}, {{Cssxref("border-top-style")}}, và {{Cssxref("border-top-color")}}.
