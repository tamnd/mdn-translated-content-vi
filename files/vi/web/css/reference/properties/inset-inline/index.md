---
title: inset-inline
slug: Web/CSS/Reference/Properties/inset-inline
page-type: css-shorthand-property
browser-compat: css.properties.inset-inline
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`inset-inline`** định nghĩa các offset đầu và cuối inline logic của một phần tử, ánh xạ đến các offset vật lý tùy thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với các thuộc tính {{cssxref("top")}} và {{cssxref("bottom")}}, hoặc {{cssxref("right")}} và {{cssxref("left")}} tùy thuộc vào các giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

{{glossary("inset properties", "Thuộc tính inset")}} này không có tác dụng trên các phần tử không được định vị.

{{InteractiveExample("CSS Demo: inset-inline")}}

```css interactive-example-choice
inset-inline: 5% 10%;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
inset-inline: 10px 40px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
inset-inline: 5% 10%;
writing-mode: horizontal-tb;
direction: rtl;
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

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("inset-inline-end")}}
- {{cssxref("inset-inline-start")}}

## Cú pháp

```css
/* Giá trị <length> */
inset-inline: 3px 10px;
inset-inline: 2.4em 3em;
inset-inline: 10px; /* giá trị áp dụng cho cả đầu và cuối */
inset-inline: auto calc(anchor(self-start) + 20px);
inset-inline: 400px anchor-size(--my-anchor height, 100px);

/* <percentage> của chiều rộng hoặc chiều cao của khối chứa */
inset-inline: 10% 5%;

/* Giá trị từ khóa */
inset-inline: auto;

/* Giá trị toàn cục */
inset-inline: inherit;
inset-inline: initial;
inset-inline: revert;
inset-inline: revert-layer;
inset-inline: unset;
```

### Giá trị

Thuộc tính `inset-inline` nhận các giá trị giống như thuộc tính {{cssxref("top")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt offset đầu và cuối inline

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
  inset-inline: 20px 50px;
  background-color: #c8c800;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_inline_start_and_end_offsets", 140, 140)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính vật lý được ánh xạ: {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("bottom")}}, và {{cssxref("left")}}
- Thuộc tính viết tắt vật lý được ánh xạ: {{cssxref("inset")}}
- Thuộc tính viết tắt block được ánh xạ: {{cssxref("inset-block")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
