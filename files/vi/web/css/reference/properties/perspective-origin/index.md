---
title: perspective-origin
slug: Web/CSS/Reference/Properties/perspective-origin
page-type: css-property
browser-compat: css.properties.perspective-origin
sidebar: cssref
---

Thuộc tính **`perspective-origin`** [CSS](/en-US/docs/Web/CSS) xác định vị trí mà người xem đang nhìn vào. Nó được dùng làm _điểm triệt tiêu_ bởi thuộc tính {{cssxref("perspective")}}.

{{InteractiveExample("CSS Demo: perspective-origin")}}

```css interactive-example-choice
perspective-origin: center;
```

```css interactive-example-choice
perspective-origin: top;
```

```css interactive-example-choice
perspective-origin: bottom right;
```

```css interactive-example-choice
perspective-origin: -170%;
```

```css interactive-example-choice
perspective-origin: 500% 200%;
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
  perspective: 250px;
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

Thuộc tính **`perspective-origin`** và {{cssxref('perspective')}} được áp dụng lên phần tử cha của phần tử con được biến đổi trong không gian 3 chiều, khác với hàm biến đổi [`perspective()`](/en-US/docs/Web/CSS/Reference/Values/transform-function/perspective) được đặt trực tiếp trên phần tử được biến đổi.

## Cú pháp

```css
/* Cú pháp một giá trị */
perspective-origin: x-position;

/* Cú pháp hai giá trị */
perspective-origin: x-position y-position;

/* Khi cả x-position và y-position đều là từ khóa,
   cú pháp sau cũng hợp lệ */
perspective-origin: y-position x-position;

/* Giá trị toàn cục */
perspective-origin: inherit;
perspective-origin: initial;
perspective-origin: revert;
perspective-origin: revert-layer;
perspective-origin: unset;
```

### Giá trị

- _x-position_
  - : Cho biết vị trí trục hoành của _điểm triệt tiêu_. Có thể nhận một trong các giá trị sau:
    - {{cssxref("&lt;length-percentage&gt;")}} cho biết vị trí dưới dạng giá trị độ dài tuyệt đối hoặc tương đối theo chiều rộng của phần tử. Giá trị có thể âm.
    - `left`, từ khóa viết tắt cho giá trị độ dài `0`.
    - `center`, từ khóa viết tắt cho giá trị phần trăm `50%`.
    - `right`, từ khóa viết tắt cho giá trị phần trăm `100%`.

- _y-position_
  - : Cho biết vị trí trục tung của _điểm triệt tiêu_. Có thể nhận một trong các giá trị sau:
    - {{cssxref("&lt;length-percentage&gt;")}} cho biết vị trí dưới dạng giá trị độ dài tuyệt đối hoặc tương đối theo chiều cao của phần tử. Giá trị có thể âm.
    - `top`, từ khóa viết tắt cho giá trị độ dài `0`.
    - `center`, từ khóa viết tắt cho giá trị phần trăm `50%`.
    - `bottom`, từ khóa viết tắt cho giá trị phần trăm `100%`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thay đổi gốc phối cảnh

Ví dụ về cách thay đổi `perspective-origin` được trình bày trong [Sử dụng CSS transforms > Thay đổi gốc phối cảnh](/en-US/docs/Web/CSS/Guides/Transforms/Using#changing_the_perspective_origin).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS Transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using)
- {{cssxref('transform-style')}}
- {{cssxref('transform-function')}}
- {{cssxref('perspective')}}
- Hàm [`transform: perspective()`](/en-US/docs/Web/CSS/Reference/Values/transform-function/perspective)
