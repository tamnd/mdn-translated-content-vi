---
title: inset
slug: Web/CSS/Reference/Properties/inset
page-type: css-shorthand-property
browser-compat: css.properties.inset
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`inset`** là viết tắt tương ứng với các thuộc tính {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("bottom")}} và/hoặc {{cssxref("left")}}. Nó có cú pháp đa giá trị giống như thuộc tính viết tắt {{cssxref("margin")}}.

{{glossary("inset properties", "Thuộc tính inset")}} này, bao gồm `inset`, không có tác dụng trên các phần tử không được định vị.

{{InteractiveExample("CSS Demo: inset")}}

```css interactive-example-choice
inset: 1em;
```

```css interactive-example-choice
inset: 5% 0;
```

```css interactive-example-choice
inset: 2em 50px 20px;
```

```css interactive-example-choice
inset: 10px 30% 20px 0;
```

```css interactive-example-choice
inset: 0;
```

```html interactive-example
<section id="default-example">
  <div class="example-container">
    <div id="example-element">I am absolutely positioned.</div>
    <p>
      As much mud in the streets as if the waters had but newly retired from the
      face of the earth, and it would not be wonderful to meet a Megalosaurus,
      forty feet long or so, waddling like an elephantine lizard up Holborn
      Hill.
    </p>
  </div>
</section>
```

```css interactive-example
.example-container {
  border: 0.75em solid #ad1457;
  padding: 0.75em;
  text-align: left;
  position: relative;
  width: 100%;
  min-height: 200px;
}

#example-element {
  background-color: #07136c;
  border: 6px solid #ffa000;
  color: white;
  position: absolute;
  inset: 0;
}
```

Mặc dù là một phần của module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values), nó không định nghĩa các offset _logic_. Nó định nghĩa các offset _vật lý_, bất kể chế độ viết, hướng và hướng văn bản của phần tử.

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{Cssxref("top")}}
- {{Cssxref("right")}}
- {{Cssxref("bottom")}}
- {{Cssxref("left")}}

## Cú pháp

```css
/* Giá trị <length> */
inset: 10px; /* giá trị áp dụng cho tất cả các cạnh */
inset: 4px 8px; /* trên/dưới trái/phải */
inset: 5px 15px 10px; /* trên trái/phải dưới */
inset: 2.4em 3em 3em 3em; /* trên phải dưới trái */
inset: calc(anchor(50%) + 10px) anchor(self-start) auto auto;
inset: anchor-size(block) calc(anchor(50%) + 10px) auto
  calc(anchor-size(width) / 4);

/* <percentage> của chiều rộng (trái/phải) hoặc chiều cao (trên/dưới) của khối chứa */
inset: 10% 5% 5% 5%;

/* Giá trị từ khóa */
inset: auto;

/* Giá trị toàn cục */
inset: inherit;
inset: initial;
inset: revert;
inset: revert-layer;
inset: unset;
```

### Giá trị

Thuộc tính `inset` nhận các giá trị giống như thuộc tính {{cssxref("top")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt offset cho một phần tử

#### HTML

```html
<div>
  <span class="exampleText">Example text</span>
</div>
```

#### CSS

```css
div {
  background-color: yellow;
  width: 150px;
  height: 120px;
  position: relative;
}

.exampleText {
  writing-mode: sideways-rl;
  position: absolute;
  inset: 20px 40px 30px 10px;
  background-color: #c8c800;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_offsets_for_an_element", 140, 140)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("bottom")}}, và {{cssxref("left")}}
- {{cssxref("inset-block")}} và {{cssxref("inset-inline")}}
- {{cssxref("position")}}
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
- [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
