---
title: max-inline-size
slug: Web/CSS/Reference/Properties/max-inline-size
page-type: css-property
browser-compat: css.properties.max-inline-size
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`max-inline-size`** xác định kích thước tối đa theo chiều ngang hoặc chiều dọc của khối phần tử, tùy thuộc vào chế độ viết của nó. Nó tương ứng với thuộc tính {{cssxref("max-width")}} hoặc {{cssxref("max-height")}}, tùy thuộc vào giá trị của {{cssxref("writing-mode")}}.

Nếu chế độ viết theo chiều dọc, giá trị của `max-inline-size` liên quan đến chiều cao tối đa của phần tử; ngược lại, nó liên quan đến chiều rộng tối đa của phần tử. Thuộc tính liên quan là {{cssxref("max-block-size")}}, xác định chiều còn lại của phần tử.

{{InteractiveExample("CSS Demo: max-inline-size")}}

```css interactive-example-choice
max-inline-size: 150px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
max-inline-size: 150px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
max-inline-size: 20px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
max-inline-size: 75%;
writing-mode: vertical-lr;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box where you can change the max-inline-size.
  </div>
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
max-inline-size: 300px;
max-inline-size: 25em;
max-inline-size: anchor-size(width);
max-inline-size: anchor-size(--my-anchor self-block, 200px);

/* Giá trị <percentage> */
max-inline-size: 75%;

/* Giá trị từ khóa */
max-inline-size: none;
max-inline-size: max-content;
max-inline-size: min-content;
max-inline-size: fit-content;
max-inline-size: fit-content(20em);

/* Giá trị toàn cục */
max-inline-size: inherit;
max-inline-size: initial;
max-inline-size: revert;
max-inline-size: revert-layer;
max-inline-size: unset;
```

### Giá trị

Thuộc tính `max-inline-size` nhận các giá trị giống như thuộc tính {{cssxref("max-width")}} và {{cssxref("max-height")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước inline tối đa bằng pixel

#### HTML

```html
<p class="exampleText">Example text</p>
```

#### CSS

```css
.exampleText {
  writing-mode: vertical-rl;
  background-color: yellow;
  block-size: 100%;
  max-inline-size: 200px;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_maximum_inline_size_in_pixels")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính vật lý tương ứng: {{cssxref("max-width")}} và {{cssxref("max-height")}}
- {{cssxref("writing-mode")}}
