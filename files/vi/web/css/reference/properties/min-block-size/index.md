---
title: min-block-size
slug: Web/CSS/Reference/Properties/min-block-size
page-type: css-property
browser-compat: css.properties.min-block-size
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`min-block-size`** xác định kích thước tối thiểu theo chiều ngang hoặc chiều dọc của khối phần tử, tùy thuộc vào chế độ viết của nó. Nó tương ứng với thuộc tính {{cssxref("min-width")}} hoặc {{cssxref("min-height")}}, tùy thuộc vào giá trị của {{cssxref("writing-mode")}}.

Nếu chế độ viết theo chiều dọc, giá trị của `min-block-size` liên quan đến chiều rộng tối thiểu của phần tử; ngược lại, nó liên quan đến chiều cao tối thiểu của phần tử. Thuộc tính liên quan là {{cssxref("min-inline-size")}}, xác định chiều còn lại của phần tử.

{{InteractiveExample("CSS Demo: min-block-size")}}

```css interactive-example-choice
min-block-size: 150px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
min-block-size: 150px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
min-block-size: 20px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
min-block-size: 15em;
writing-mode: vertical-lr;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box where you can change the minimum block size. <br />If there is
    more content than the minimum the box will grow in the block dimension as
    needed by the content.
  </div>
</section>
```

```css interactive-example
#example-element {
  display: flex;
  flex-direction: column;
  background-color: #5b6dcd;
  justify-content: center;
  color: white;
}
```

## Cú pháp

```css
/* Giá trị <length> */
min-block-size: 100px;
min-block-size: 5em;
min-block-size: anchor-size(self-inline);

/* Giá trị <percentage> */
min-block-size: 10%;

/* Giá trị từ khóa */
min-block-size: max-content;
min-block-size: min-content;
min-block-size: fit-content;
min-block-size: fit-content(20em);

/* Giá trị toàn cục */
min-block-size: inherit;
min-block-size: initial;
min-block-size: revert;
min-block-size: revert-layer;
min-block-size: unset;
```

### Giá trị

Thuộc tính `min-block-size` nhận các giá trị giống như thuộc tính {{cssxref("min-width")}} và {{cssxref("min-height")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước block tối thiểu cho văn bản dọc

#### HTML

```html
<p class="exampleText">Example text</p>
```

#### CSS

```css
.exampleText {
  writing-mode: vertical-rl;
  background-color: yellow;
  min-block-size: 200px;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_minimum_block_size_for_vertical_text")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính vật lý tương ứng: {{cssxref("min-width")}} và {{cssxref("min-height")}}
- {{cssxref("writing-mode")}}
