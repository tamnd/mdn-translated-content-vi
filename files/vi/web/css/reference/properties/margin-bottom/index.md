---
title: margin-bottom
slug: Web/CSS/Reference/Properties/margin-bottom
page-type: css-property
browser-compat: css.properties.margin-bottom
sidebar: cssref
---

Thuộc tính CSS **`margin-bottom`** đặt [vùng lề](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#margin_area) ở phía dưới của một phần tử. Giá trị dương đặt phần tử xa các phần tử lân cận hơn, trong khi giá trị âm đặt nó gần hơn.

{{InteractiveExample("CSS Demo: margin-bottom")}}

```css interactive-example-choice
margin-bottom: 1em;
```

```css interactive-example-choice
margin-bottom: 10%;
```

```css interactive-example-choice
margin-bottom: 10px;
```

```css interactive-example-choice
margin-bottom: 0;
```

```html interactive-example
<section id="default-example">
  <div id="container">
    <div class="row"></div>
    <div class="row transition-all" id="example-element"></div>
    <div class="row"></div>
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
  flex-shrink: 0;
}

#example-element {
  border: solid 10px #ffbf00;
  background-color: #2b3a55;
}
```

![Hiệu ứng của thuộc tính CSS margin-bottom trên hộp phần tử](margin-bottom.svg)

Thuộc tính này không có tác dụng đối với các phần tử inline _không phải [thay thế](/en-US/docs/Glossary/Replaced_elements)_, chẳng hạn như {{HTMLElement("span")}} hoặc {{HTMLElement("code")}}.

## Cú pháp

```css
/* Giá trị <length> */
margin-bottom: 10px; /* Độ dài tuyệt đối */
margin-bottom: 1em; /* tương đối với kích thước văn bản */
margin-bottom: 5%; /* tương đối với chiều rộng của khối chứa gần nhất */
margin-bottom: anchor-size(width);
margin-bottom: calc(anchor-size(--my-anchor self-block, 20px) / 3);

/* Giá trị từ khóa */
margin-bottom: auto;

/* Giá trị toàn cục */
margin-bottom: inherit;
margin-bottom: initial;
margin-bottom: revert;
margin-bottom: revert-layer;
margin-bottom: unset;
```

Thuộc tính `margin-bottom` được chỉ định là từ khóa `auto`, hoặc `<length>`, hoặc `<percentage>`. Giá trị của nó có thể là dương, không hoặc âm.

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước lề dưới dạng giá trị cố định.
    - Đối với các _phần tử định vị theo neo_, hàm {{cssxref("anchor-size()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối với chiều rộng hoặc chiều cao của _phần tử neo_ liên kết (xem [Đặt lề phần tử dựa trên kích thước neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_element_margin_based_on_anchor_size)).

- {{cssxref("&lt;percentage&gt;")}}
  - : Kích thước lề dưới dạng phần trăm, tương đối với kích thước inline (_chiều rộng_ trong ngôn ngữ ngang, được xác định bởi {{cssxref("writing-mode")}}) của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block).
- `auto`
  - : Trình duyệt chọn một giá trị phù hợp để sử dụng. Xem {{cssxref("margin")}}.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt lề dưới dương và âm

#### HTML

```html
<div class="container">
  <div class="box0">Box 0</div>
  <div class="box1">Box 1</div>
  <div class="box2">Box one's negative margin pulls me up</div>
</div>
```

#### CSS

CSS cho các div để đặt margin-bottom và chiều cao

```css
.box0 {
  margin-bottom: 1em;
  height: 3em;
}
.box1 {
  margin-bottom: -1.5em;
  height: 4em;
}
.box2 {
  border: 1px dashed black;
  border-width: 1px 0;
  margin-bottom: 2em;
}
```

Một số định nghĩa cho container và div để các tác dụng của lề có thể thấy rõ hơn

```css
.container {
  background-color: orange;
  width: 320px;
  border: 1px solid black;
}
div {
  width: 320px;
  background-color: gold;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_positive_and_negative_bottom_margins',350,200) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("margin-top")}}, {{cssxref("margin-right")}} và {{cssxref("margin-left")}}
- Thuộc tính rút gọn {{cssxref("margin")}}
- {{cssxref("margin-block-start")}}, {{cssxref("margin-block-end")}}, {{cssxref("margin-inline-start")}} và {{cssxref("margin-inline-end")}}
- Các thuộc tính rút gọn {{cssxref("margin-block")}} và {{cssxref("margin-inline")}}
- Mô-đun [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model)
