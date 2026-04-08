---
title: min-inline-size
slug: Web/CSS/Reference/Properties/min-inline-size
page-type: css-property
browser-compat: css.properties.min-inline-size
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`min-inline-size`** xác định kích thước tối thiểu theo chiều ngang hoặc chiều dọc của khối phần tử, tùy thuộc vào chế độ viết của nó. Nó tương ứng với thuộc tính {{cssxref("min-width")}} hoặc {{cssxref("min-height")}}, tùy thuộc vào giá trị của {{cssxref("writing-mode")}}.

{{InteractiveExample("CSS Demo: min-inline-size")}}

```css interactive-example-choice
min-inline-size: 200px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
min-inline-size: 200px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
min-inline-size: 20px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
min-inline-size: 75%;
writing-mode: vertical-lr;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">Change min-inline-size</div>
</section>
```

```css interactive-example
#example-element {
  display: flex;
  flex-direction: column;
  background-color: #5b6dcd;
  height: 80%;
  justify-content: center;
  color: white;
}
```

## Cú pháp

```css
/* Giá trị <length> */
min-inline-size: 100px;
min-inline-size: 5em;
min-inline-size: anchor-size(width);

/* Giá trị <percentage> */
min-inline-size: 10%;

/* Giá trị từ khóa */
min-inline-size: max-content;
min-inline-size: min-content;
min-inline-size: fit-content;
min-inline-size: fit-content(20em);

/* Giá trị toàn cục */
min-inline-size: inherit;
min-inline-size: initial;
min-inline-size: revert;
min-inline-size: revert-layer;
min-inline-size: unset;
```

Nếu chế độ viết theo chiều dọc, giá trị của `min-inline-size` liên quan đến chiều cao tối thiểu của phần tử; ngược lại, nó liên quan đến chiều rộng tối thiểu của phần tử. Thuộc tính liên quan là {{cssxref("min-block-size")}}, xác định chiều còn lại của phần tử.

### Giá trị

Thuộc tính `min-inline-size` nhận các giá trị giống như thuộc tính {{cssxref("min-width")}} và {{cssxref("min-height")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước inline tối thiểu cho văn bản dọc

#### HTML

```html
<p class="exampleText">Example text</p>
```

#### CSS

```css
.exampleText {
  writing-mode: vertical-rl;
  background-color: yellow;
  block-size: 5%;
  min-inline-size: 200px;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_minimum_inline_size_for_vertical_text")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính vật lý tương ứng: {{cssxref("min-width")}} và {{cssxref("min-height")}}
- {{cssxref("writing-mode")}}
