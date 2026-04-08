---
title: margin-block-end
slug: Web/CSS/Reference/Properties/margin-block-end
page-type: css-property
browser-compat: css.properties.margin-block-end
sidebar: cssref
---

Thuộc tính CSS **`margin-block-end`** xác định lề cuối khối logic của một phần tử, ánh xạ đến lề vật lý tùy thuộc vào chế độ viết, hướng và hướng văn bản của phần tử.

{{InteractiveExample("CSS Demo: margin-block-end")}}

```css interactive-example-choice
margin-block-end: 20px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
margin-block-end: 20px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
margin-block-end: 20%;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
margin-block-end: auto;
writing-mode: vertical-lr;
```

```html interactive-example
<section id="default-example">
  <div id="container">
    <div class="row">One</div>
    <div class="row transition-all" id="example-element">Two</div>
    <div class="row">Three</div>
  </div>
</section>
```

```css interactive-example
#container {
  width: 300px;
  height: 200px;
  display: flex;
  align-content: flex-start;
  flex-direction: column;
  justify-content: flex-start;
}

.row {
  height: 33.33%;
  display: inline-block;
  border: solid #ce7777 10px;
  background-color: #2b3a55;
  color: white;
  flex-shrink: 0;
}

#example-element {
  border: solid 10px #ffbf00;
  background-color: #2b3a55;
}
```

## Cú pháp

```css
/* Giá trị <length> */
margin-block-end: 10px; /* Độ dài tuyệt đối */
margin-block-end: 1em; /* tương đối với kích thước văn bản */
margin-block-end: 5%; /* tương đối với chiều rộng của khối chứa gần nhất */
margin-block-end: anchor-size(inline);
margin-block-end: calc(anchor-size(--my-anchor block, 20px) / 4);

/* Giá trị từ khóa */
margin-block-end: auto;

/* Giá trị toàn cục */
margin-block-end: inherit;
margin-block-end: initial;
margin-block-end: revert;
margin-block-end: revert-layer;
margin-block-end: unset;
```

Thuộc tính này tương ứng với {{cssxref("margin-top")}}, {{cssxref("margin-right")}}, {{cssxref("margin-bottom")}} hoặc {{cssxref("margin-left")}} tùy thuộc vào các giá trị được xác định cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

Thuộc tính này liên quan đến {{cssxref("margin-block-start")}}, {{cssxref("margin-inline-start")}} và {{cssxref("margin-inline-end")}}, vốn xác định các lề khác của phần tử.

### Giá trị

Thuộc tính `margin-block-end` nhận các giá trị giống như thuộc tính {{cssxref("margin-top")}}.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt lề cuối khối

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
  writing-mode: vertical-rl;
  margin-block-end: 20px;
  background-color: #c8c800;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_block_end_margin", 140, 140)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Các thuộc tính vật lý ánh xạ: {{cssxref("margin-top")}}, {{cssxref("margin-right")}}, {{cssxref("margin-bottom")}} và {{cssxref("margin-left")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
