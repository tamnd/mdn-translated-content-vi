---
title: inset-inline-start
slug: Web/CSS/Reference/Properties/inset-inline-start
page-type: css-property
browser-compat: css.properties.inset-inline-start
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`inset-inline-start`** định nghĩa inset đầu inline logic của một phần tử, ánh xạ đến một offset vật lý tùy thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với thuộc tính {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("bottom")}}, hoặc {{cssxref("left")}} tùy thuộc vào các giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

{{glossary("inset properties", "Thuộc tính inset")}} này không có tác dụng trên các phần tử không được định vị.

{{InteractiveExample("CSS Demo: inset-inline-start")}}

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
      I am absolutely positioned with inset-inline-start: 50px
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
  inset-inline-start: 50px;
  inline-size: 140px;
  min-block-size: 80px;
}
```

## Cú pháp

```css
/* Giá trị <length> */
inset-inline-start: 3px;
inset-inline-start: 2.4em;
inset-inline-start: calc(anchor(--my-anchor 50%) + 10px);
inset-inline-start: anchor-size(width);

/* <percentage> của chiều rộng hoặc chiều cao của khối chứa */
inset-inline-start: 10%;

/* Giá trị từ khóa */
inset-inline-start: auto;

/* Giá trị toàn cục */
inset-inline-start: inherit;
inset-inline-start: initial;
inset-inline-start: revert;
inset-inline-start: revert-layer;
inset-inline-start: unset;
```

Thuộc tính viết tắt của `inset-inline-start` và {{cssxref("inset-inline-end")}} là {{cssxref("inset-inline")}}.

### Giá trị

Thuộc tính `inset-inline-start` nhận các giá trị giống như thuộc tính {{cssxref("top")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt offset đầu inline

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
  inset-inline-start: 20px;
  background-color: #c8c800;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_inline_start_offset", 140, 140)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính định nghĩa inset khác: {{cssxref("inset-block-start")}}, {{cssxref("inset-block-end")}}, và {{cssxref("inset-inline-end")}}
- Các thuộc tính vật lý được ánh xạ: {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("bottom")}}, và {{cssxref("left")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
