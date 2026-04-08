---
title: margin-inline-end
slug: Web/CSS/Reference/Properties/margin-inline-end
page-type: css-property
browser-compat: css.properties.margin-inline-end
sidebar: cssref
---

Thuộc tính **`margin-inline-end`** [CSS](/en-US/docs/Web/CSS) xác định lề logic kết thúc theo chiều ngang của phần tử, ánh xạ tới một lề vật lý tùy theo chế độ viết, hướng và hướng văn bản của phần tử. Nói cách khác, nó tương ứng với thuộc tính {{cssxref("margin-top")}}, {{cssxref("margin-right")}}, {{cssxref("margin-bottom")}} hoặc {{cssxref("margin-left")}} tùy thuộc vào các giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}}, và {{cssxref("text-orientation")}}.

{{InteractiveExample("CSS Demo: margin-inline-end")}}

```css interactive-example-choice
margin-inline-end: 20px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
margin-inline-end: 20px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
margin-inline-end: 20%;
writing-mode: horizontal-tb;
direction: rtl;
```

```html interactive-example
<section id="default-example">
  <div id="container">
    <div class="col">One</div>
    <div class="col transition-all" id="example-element">Two</div>
    <div class="col">Three</div>
  </div>
</section>
```

```css interactive-example
#container {
  width: 300px;
  height: 200px;
  display: flex;
  align-content: flex-start;
  justify-content: flex-start;
}

.col {
  width: 33.33%;
  border: solid #ce7777 10px;
  background-color: #2b3a55;
  color: white;
  flex-shrink: 0;
}

#example-element {
  border: solid 10px #ffbf00;
  background-color: #2b3a55;
  unicode-bidi: bidi-override;
}
```

## Cú pháp

```css
/* Giá trị <length> */
margin-inline-end: 10px; /* Độ dài tuyệt đối */
margin-inline-end: 1em; /* Tương đối với kích thước văn bản */
margin-inline-end: 5%; /* Tương đối với chiều rộng của khối chứa gần nhất */
margin-inline-end: anchor-size(height);
margin-inline-end: calc(anchor-size(--my-anchor self-inline, 25px) / 5);

/* Giá trị từ khóa */
margin-inline-end: auto;

/* Giá trị toàn cục */
margin-inline-end: inherit;
margin-inline-end: initial;
margin-inline-end: revert;
margin-inline-end: revert-layer;
margin-inline-end: unset;
```

Thuộc tính này liên quan đến {{cssxref("margin-block-start")}}, {{cssxref("margin-block-end")}}, và {{cssxref("margin-inline-start")}}, là những thuộc tính xác định các lề khác của phần tử.

### Giá trị

Thuộc tính `margin-inline-end` nhận các giá trị giống như thuộc tính {{cssxref("margin-top")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt lề kết thúc theo chiều ngang

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
  margin-inline-end: 20px;
  background-color: #c8c800;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_inline_end_margin", 140, 140)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- {{cssxref("margin-inline-start")}}
- Các thuộc tính vật lý được ánh xạ: {{cssxref("margin-top")}}, {{cssxref("margin-right")}}, {{cssxref("margin-bottom")}}, và {{cssxref("margin-left")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
