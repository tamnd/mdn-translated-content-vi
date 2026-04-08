---
title: inline-size
slug: Web/CSS/Reference/Properties/inline-size
page-type: css-property
browser-compat: css.properties.inline-size
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`inline-size`** định nghĩa kích thước của khối phần tử theo [trục inline](/en-US/docs/Glossary/Grid_Axis). Nếu {{cssxref("writing-mode")}} là ngang, nó tương ứng với {{cssxref("width")}}; nếu chế độ viết là dọc, nó tương ứng với {{cssxref("height")}}. Thuộc tính liên quan là {{cssxref("block-size")}}, định nghĩa chiều kia của phần tử.

{{InteractiveExample("CSS Demo: inline-size")}}

```css interactive-example-choice
inline-size: 150px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
inline-size: 150px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
inline-size: auto;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
inline-size: auto;
writing-mode: vertical-lr;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box where you can change the inline-size.
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
inline-size: 300px;
inline-size: 25em;
inline-size: anchor-size(width);
inline-size: anchor-size(--my-anchor inline);

/* Giá trị <percentage> */
inline-size: 75%;

/* Giá trị từ khóa */
inline-size: max-content;
inline-size: min-content;
inline-size: fit-content;
inline-size: fit-content(20em);
inline-size: auto;

/* Giá trị toàn cục */
inline-size: inherit;
inline-size: initial;
inline-size: revert;
inline-size: revert-layer;
inline-size: unset;
```

### Giá trị

Thuộc tính `inline-size` nhận các giá trị giống như các thuộc tính {{cssxref("width")}} và {{cssxref("height")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước inline theo pixel

#### HTML

```html
<p class="exampleText">Example text</p>
```

#### CSS

```css
.exampleText {
  writing-mode: vertical-rl;
  background-color: yellow;
  inline-size: 110px;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_inline_size_in_pixels")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính vật lý được ánh xạ: {{cssxref("width")}} và {{cssxref("height")}}
- {{cssxref("writing-mode")}}
