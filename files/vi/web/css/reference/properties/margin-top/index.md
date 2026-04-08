---
title: margin-top
slug: Web/CSS/Reference/Properties/margin-top
page-type: css-property
browser-compat: css.properties.margin-top
sidebar: cssref
---

Thuộc tính **`margin-top`** [CSS](/en-US/docs/Web/CSS) đặt [vùng lề](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#margin_area) ở phía trên cùng của phần tử. Giá trị dương đặt phần tử xa hơn so với các phần tử lân cận, trong khi giá trị âm đặt nó gần hơn.

{{InteractiveExample("CSS Demo: margin-top")}}

```css interactive-example-choice
margin-top: 1em;
```

```css interactive-example-choice
margin-top: 10%;
```

```css interactive-example-choice
margin-top: 10px;
```

```css interactive-example-choice
margin-top: 0;
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

Thuộc tính này không có hiệu lực đối với các phần tử nội tuyến _không phải [phần tử thay thế](/en-US/docs/Glossary/Replaced_elements)_, chẳng hạn như {{HTMLElement("span")}} hoặc {{HTMLElement("code")}}.

## Cú pháp

```css
/* Giá trị <length> */
margin-top: 10px; /* Độ dài tuyệt đối */
margin-top: 1em; /* Tương đối với kích thước văn bản */
margin-top: 5%; /* Tương đối với chiều rộng của khối chứa gần nhất */
margin-top: anchor-size(height);
margin-top: calc(anchor-size(--my-anchor self-inline, 25px) / 4);

/* Giá trị từ khóa */
margin-top: auto;

/* Giá trị toàn cục */
margin-top: inherit;
margin-top: initial;
margin-top: revert;
margin-top: revert-layer;
margin-top: unset;
```

Thuộc tính `margin-top` được chỉ định là từ khóa `auto`, hoặc một `<length>`, hoặc một `<percentage>`. Giá trị của nó có thể là dương, không hoặc âm.

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước của lề dưới dạng giá trị cố định.
    - Đối với _các phần tử được định vị bằng neo_, hàm {{cssxref("anchor-size()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối với chiều rộng hoặc chiều cao của _phần tử neo_ liên kết (xem [Đặt lề phần tử dựa trên kích thước neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_element_margin_based_on_anchor_size)).

- {{cssxref("&lt;percentage&gt;")}}
  - : Kích thước của lề dưới dạng phần trăm, tương đối với kích thước nội tuyến (_chiều rộng_ trong ngôn ngữ ngang, được xác định bởi {{cssxref("writing-mode")}}) của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block).
- `auto`
  - : Trình duyệt chọn một giá trị phù hợp để sử dụng. Xem {{cssxref("margin")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt lề trên dương và âm

```css
.content {
  margin-top: 5%;
}
.side-box {
  margin-top: 10px;
}
.logo {
  margin-top: -5px;
}
#footer {
  margin-top: 1em;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("margin-right")}}, {{cssxref("margin-bottom")}}, và {{cssxref("margin-left")}}
- Viết tắt {{cssxref("margin")}}
- {{cssxref("margin-block-start")}}, {{cssxref("margin-block-end")}}, {{cssxref("margin-inline-start")}}, và {{cssxref("margin-inline-end")}}
- Các viết tắt {{cssxref("margin-block")}} và {{cssxref("margin-inline")}}
- Mô-đun [mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model)
