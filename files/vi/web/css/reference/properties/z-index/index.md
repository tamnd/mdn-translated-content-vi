---
title: z-index
slug: Web/CSS/Reference/Properties/z-index
page-type: css-property
browser-compat: css.properties.z-index
sidebar: cssref
---

Thuộc tính **`z-index`** của [CSS](/vi/docs/Web/CSS) đặt thứ tự z của một phần tử [được định vị](/vi/docs/Web/CSS/Reference/Properties/position) và các phần tử con của nó hoặc các mục flex và grid. Các phần tử chồng lên nhau với z-index lớn hơn sẽ che phủ những phần tử có z-index nhỏ hơn.

{{InteractiveExample("CSS Demo: z-index")}}

```css interactive-example-choice
z-index: auto;
```

```css interactive-example-choice
z-index: 1;
```

```css interactive-example-choice
z-index: 3;
```

```css interactive-example-choice
z-index: 5;
```

```css interactive-example-choice
z-index: 7;
```

```html interactive-example
<section class="default-example container" id="default-example">
  <div id="example-element">Change my z-index</div>
  <div class="block blue position1">z-index: 6</div>
  <div class="block blue position2">z-index: 4</div>
  <div class="block blue position3">z-index: 2</div>
  <div class="block red position4">z-index: auto</div>
  <div class="block red position5">z-index: auto</div>
  <div class="block red position6">z-index: auto</div>
</section>
```

```css interactive-example
#example-element {
  top: 15px;
  left: 15px;
  width: 180px;
  height: 230px;
  position: absolute;
  /* center the text so it is visible even when z-index is set to auto */
  line-height: 215px;
  font-family: monospace;
  background-color: #fcfbe5;
  border: solid 5px #e3e0a1;
  z-index: auto;
  color: black;
}

.container {
  display: inline-block;
  width: 250px;
  position: relative;
}

.block {
  width: 150px;
  height: 50px;
  position: absolute;
  font-family: monospace;
  color: black;
}

.blue {
  background-color: #e5e8fc;
  border: solid 5px #112382;
  /* move text to the bottom of the box */
  line-height: 55px;
}

.red {
  background-color: #fce5e7;
  border: solid 5px #e3a1a7;
}

.position1 {
  top: 0;
  left: 0;
  z-index: 6;
}

.position2 {
  top: 30px;
  left: 30px;
  z-index: 4;
}

.position3 {
  top: 60px;
  left: 60px;
  z-index: 2;
}

.position4 {
  top: 150px;
  left: 0;
  z-index: auto;
}

.position5 {
  top: 180px;
  left: 30px;
  z-index: auto;
}

.position6 {
  top: 210px;
  left: 60px;
  z-index: auto;
}
```

Đối với một hộp được định vị (tức là một hộp có `position` khác `static`), thuộc tính `z-index` xác định:

1. Cấp độ xếp chồng của hộp trong [ngữ cảnh xếp chồng](/vi/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) hiện tại.
2. Liệu hộp có thiết lập một ngữ cảnh xếp chồng cục bộ hay không.

## Cú pháp

```css
/* Giá trị từ khóa */
z-index: auto;

/* Giá trị <integer> */
z-index: 0;
z-index: 3;
z-index: 289;
z-index: -1; /* Giá trị âm để giảm độ ưu tiên */

/* Giá trị toàn cục */
z-index: inherit;
z-index: initial;
z-index: revert;
z-index: revert-layer;
z-index: unset;
```

Thuộc tính `z-index` được chỉ định là từ khóa `auto` hoặc một `<integer>`.

### Giá trị

- `auto`
  - : Hộp không thiết lập một ngữ cảnh xếp chồng cục bộ mới. Cấp độ xếp chồng của hộp được tạo ra trong ngữ cảnh xếp chồng hiện tại là `0`.
- `<integer>`
  - : {{cssxref("&lt;integer&gt;")}} này là cấp độ xếp chồng của hộp được tạo ra trong ngữ cảnh xếp chồng hiện tại. Hộp cũng thiết lập một ngữ cảnh xếp chồng cục bộ. Điều này có nghĩa là các z-index của các phần tử con không được so sánh với z-index của các phần tử bên ngoài phần tử này.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Xếp lớp các phần tử trực quan

#### HTML

```html
<div class="wrapper">
  <div class="dashed-box">Dashed box</div>
  <div class="gold-box">Gold box</div>
  <div class="green-box">Green box</div>
</div>
```

#### CSS

```css
.wrapper {
  position: relative;
}

.dashed-box {
  position: relative;
  z-index: 1;
  border: dashed;
  height: 8em;
  margin-bottom: 1em;
  margin-top: 2em;
}
.gold-box {
  position: absolute;
  z-index: 3; /* put .gold-box above .green-box and .dashed-box */
  background: gold;
  width: 80%;
  left: 60px;
  top: 3em;
}
.green-box {
  position: absolute;
  z-index: 2; /* put .green-box above .dashed-box */
  background: lightgreen;
  width: 20%;
  left: 65%;
  top: -25px;
  height: 7em;
  opacity: 0.9;
}
```

#### Kết quả

{{EmbedLiveSample('Visually_layering_elements', '550', '200')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{Cssxref("position")}}
- [Hiểu về z-index trong CSS](/vi/docs/Web/CSS/Guides/Positioned_layout/Understanding_z-index)
