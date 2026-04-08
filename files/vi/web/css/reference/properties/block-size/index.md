---
title: block-size
slug: Web/CSS/Reference/Properties/block-size
page-type: css-property
browser-compat: css.properties.block-size
sidebar: cssref
---

Thuộc tính **`block-size`** [CSS](/en-US/docs/Web/CSS) xác định kích thước của một phần tử theo [trục khối](/en-US/docs/Glossary/Grid_Axis). Nếu {{cssxref("writing-mode")}} là ngang, nó tương ứng với {{cssxref("height")}}; nếu chế độ viết là dọc, nó tương ứng với {{cssxref("width")}}. Thuộc tính liên quan là {{cssxref("inline-size")}}, xác định chiều còn lại của phần tử.

{{InteractiveExample("CSS Demo: block-size")}}

```css interactive-example-choice
block-size: 150px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
block-size: 150px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
block-size: auto;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
block-size: auto;
writing-mode: vertical-lr;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box where you can change the block-size.
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
block-size: 300px;
block-size: 25em;
block-size: anchor-size(height);
block-size: calc(anchor-size(--my-anchor block) * 0.75);

/* Giá trị <percentage> */
block-size: 75%;

/* Giá trị từ khóa */
block-size: max-content;
block-size: min-content;
block-size: fit-content;
block-size: fit-content(20em);
block-size: auto;

/* Giá trị toàn cục */
block-size: inherit;
block-size: initial;
block-size: revert;
block-size: revert-layer;
block-size: unset;
```

### Giá trị

Thuộc tính `block-size` nhận cùng các giá trị như thuộc tính {{cssxref("width")}} và {{cssxref("height")}}.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Kích thước khối với văn bản dọc

#### HTML

```html
<p class="exampleText">Example text</p>
```

#### CSS

```css
.exampleText {
  writing-mode: vertical-rl;
  background-color: yellow;
  block-size: 200px;
}
```

#### Kết quả

{{EmbedLiveSample("Block_size_with_vertical_text")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính vật lý được ánh xạ: {{cssxref("width")}} và {{cssxref("height")}}
- {{cssxref("writing-mode")}}
