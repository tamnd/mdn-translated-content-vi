---
title: rotate
slug: Web/CSS/Reference/Properties/rotate
page-type: css-property
browser-compat: css.properties.rotate
sidebar: cssref
---

Thuộc tính **`rotate`** của [CSS](/vi/docs/Web/CSS) cho phép bạn chỉ định các phép biến đổi xoay một cách riêng lẻ và độc lập với thuộc tính {{CSSxRef("transform")}}. Cách này phù hợp hơn với các trường hợp sử dụng giao diện người dùng thông thường, và giúp bạn không cần phải nhớ thứ tự chính xác của các hàm transform khi chỉ định trong thuộc tính `transform`.

{{InteractiveExample("CSS Demo: rotate")}}

```css interactive-example-choice
rotate: none;
```

```css interactive-example-choice
rotate: -45deg;
```

```css interactive-example-choice
rotate: z 45deg;
```

```css interactive-example-choice
rotate: x 45deg;
```

```css interactive-example-choice
rotate: y 45deg;
```

```css interactive-example-choice
rotate: 3 0.5 2 45deg;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    <div class="face front">1</div>
    <div class="face back">2</div>
    <div class="face right">3</div>
    <div class="face left">4</div>
    <div class="face top">5</div>
    <div class="face bottom">6</div>
  </div>
</section>
```

```css interactive-example
#default-example {
  background: linear-gradient(skyblue, khaki);
  perspective: 550px;
}

#example-element {
  width: 100px;
  height: 100px;
  transform-style: preserve-3d;
}

.face {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  position: absolute;
  backface-visibility: inherit;
  font-size: 60px;
  color: white;
}

.front {
  background: rgb(90 90 90 / 0.7);
  transform: translateZ(50px);
}

.back {
  background: rgb(0 210 0 / 0.7);
  transform: rotateY(180deg) translateZ(50px);
}

.right {
  background: rgb(210 0 0 / 0.7);
  transform: rotateY(90deg) translateZ(50px);
}

.left {
  background: rgb(0 0 210 / 0.7);
  transform: rotateY(-90deg) translateZ(50px);
}

.top {
  background: rgb(210 210 0 / 0.7);
  transform: rotateX(90deg) translateZ(50px);
}

.bottom {
  background: rgb(210 0 210 / 0.7);
  transform: rotateX(-90deg) translateZ(50px);
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
rotate: none;

/* Giá trị góc */
rotate: 90deg;
rotate: 0.25turn;
rotate: 1.57rad;

/* Tên trục x, y, hoặc z cộng với góc */
rotate: x 90deg;
rotate: y 0.25turn;
rotate: z 1.57rad;

/* Vector cộng với giá trị góc */
rotate: 1 1 1 90deg;

/* Giá trị toàn cục */
rotate: inherit;
rotate: initial;
rotate: revert;
rotate: revert-layer;
rotate: unset;
```

### Giá trị

- giá trị góc
  - : Một {{cssxref("angle")}} chỉ định góc xoay phần tử bị ảnh hưởng quanh trục Z. Tương đương với hàm `rotate()` (xoay 2D).
- tên trục x, y, hoặc z cộng với giá trị góc
  - : Tên của trục bạn muốn xoay phần tử bị ảnh hưởng quanh đó (`x`, `y`, hoặc `z`), cộng với một {{cssxref("angle")}} chỉ định góc xoay phần tử. Tương đương với hàm `rotateX()`/`rotateY()`/`rotateZ()` (xoay 3D).
- vector cộng với giá trị góc
  - : Ba số {{CSSxRef("&lt;number&gt;")}} đại diện cho một vector có gốc tại origin xác định đường thẳng mà bạn muốn xoay phần tử quanh đó, cộng với một {{cssxref("angle")}} chỉ định góc xoay phần tử. Tương đương với hàm `rotate3d()` (xoay 3D).
- `none`
  - : Chỉ định rằng không áp dụng phép xoay nào.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xoay phần tử khi hover

Ví dụ sau đây cho thấy cách dùng thuộc tính `rotate` để xoay phần tử quanh các trục khác nhau khi hover.
Hộp đầu tiên xoay 90 độ quanh trục Z khi hover, hộp thứ hai xoay 180 độ quanh trục Y khi hover, và hộp thứ ba xoay 360 độ khi hover quanh một vector được xác định bởi các tọa độ.

#### HTML

```html
<div class="box" id="box1">rotate Z</div>
<div class="box" id="box2">rotate Y</div>
<div class="box" id="box3">vector & angle</div>
```

#### CSS

```css
.box {
  display: inline-block;
  margin: 1em;
  min-width: 6.5em;
  line-height: 6.5em;
  text-align: center;
  transition: 1s ease-in-out;
  border: 0.25em dotted;
}

#box1:hover {
  rotate: 90deg;
}

#box2:hover {
  rotate: y 180deg;
}

#box3:hover {
  rotate: 1 2 1 360deg;
}
```

#### Kết quả

{{EmbedLiveSample("Rotating_an_element_on_hover", "100%", 150)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref('translate')}}
- {{cssxref('scale')}}
- {{cssxref('transform')}}

Lưu ý: `skew` không phải là giá trị `transform` độc lập
