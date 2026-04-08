---
title: inset-block-start
slug: Web/CSS/Reference/Properties/inset-block-start
page-type: css-property
browser-compat: css.properties.inset-block-start
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`inset-block-start`** định nghĩa offset đầu khối logic của một phần tử, ánh xạ đến một inset vật lý tùy thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với thuộc tính {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("bottom")}}, hoặc {{cssxref("left")}} tùy thuộc vào các giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

{{glossary("inset properties", "Thuộc tính inset")}} này không có tác dụng trên các phần tử không được định vị.

{{InteractiveExample("CSS Demo: inset-block-start")}}

```css interactive-example-choice
writing-mode: horizontal-tb;
```

```css interactive-example-choice
writing-mode: vertical-rl;
```

```css interactive-example-choice
writing-mode: horizontal-tb;
direction: rtl;
```

```css interactive-example-choice
writing-mode: vertical-lr;
```

```html interactive-example
<section id="default-example">
  <div class="example-container" id="example-element">
    <div id="abspos">
      I am absolutely positioned with inset-block-start: 50px
    </div>
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
#example-element {
  border: 0.75em solid;
  padding: 0.75em;
  position: relative;
  width: 100%;
  min-height: 200px;
  unicode-bidi: bidi-override;
}

#abspos {
  background-color: yellow;
  color: black;
  border: 3px solid red;
  position: absolute;
  inset-block-start: 50px;
  inline-size: 140px;
}
```

## Cú pháp

```css
/* Giá trị <length> */
inset-block-start: 3px;
inset-block-start: 2.4em;
inset-block-start: anchor(end);
inset-block-start: calc(anchor-size(--my-anchor height, 70px) * 2);

/* <percentage> của chiều rộng hoặc chiều cao của khối chứa */
inset-block-start: 10%;

/* Giá trị từ khóa */
inset-block-start: auto;

/* Giá trị toàn cục */
inset-block-start: inherit;
inset-block-start: initial;
inset-block-start: revert;
inset-block-start: revert-layer;
inset-block-start: unset;
```

### Giá trị

Thuộc tính `inset-block-start` nhận các giá trị giống như thuộc tính {{cssxref("top")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt offset đầu khối

#### HTML

```html
<div>
  <p class="exampleText">Example text</p>
</div>
```

#### CSS

```css
div {
  background-color: yellow;
  width: 120px;
  height: 120px;
}

.exampleText {
  writing-mode: vertical-lr;
  position: relative;
  inset-block-start: 20px;
  background-color: #c8c800;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_block_start_offset", 140, 140)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính định nghĩa inset khác: {{cssxref("inset-block-end")}}, {{cssxref("inset-inline-start")}}, và {{cssxref("inset-inline-end")}}
- Các thuộc tính vật lý được ánh xạ: {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("bottom")}}, và {{cssxref("left")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
