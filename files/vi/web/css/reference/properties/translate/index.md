---
title: translate
slug: Web/CSS/Reference/Properties/translate
page-type: css-property
browser-compat: css.properties.translate
sidebar: cssref
---

Thuộc tính **`translate`** của [CSS](/vi/docs/Web/CSS) cho phép bạn chỉ định các phép biến đổi tịnh tiến một cách riêng lẻ và độc lập với thuộc tính {{CSSxRef("transform")}}. Cách này phù hợp hơn với cách sử dụng giao diện người dùng thông thường, và giúp bạn không cần nhớ thứ tự chính xác của các hàm biến đổi để chỉ định trong giá trị `transform`.

{{InteractiveExample("CSS Demo: translate")}}

```css interactive-example-choice
translate: none;
```

```css interactive-example-choice
translate: 40px;
```

```css interactive-example-choice
translate: 50% -40%;
```

```css interactive-example-choice
translate: 20px 4rem;
```

```css interactive-example-choice
translate: 20px 4rem 150px;
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
  perspective: 800px;
  perspective-origin: 150% 150%;
}

#example-element {
  width: 100px;
  height: 100px;
  perspective: 550px;
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
translate: none;

/* Giá trị đơn */
translate: 100px;
translate: 50%;

/* Hai giá trị */
translate: 100px 200px;
translate: 50% 105px;

/* Ba giá trị */
translate: 50% 105px 5rem;

/* Giá trị toàn cục */
translate: inherit;
translate: initial;
translate: revert;
translate: revert-layer;
translate: unset;
```

### Giá trị

- Giá trị {{cssxref("&lt;length-percentage&gt;")}} đơn
  - : Một {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} chỉ định phép tịnh tiến dọc theo trục X. Tương đương với hàm `translate()` (tịnh tiến 2D) với một giá trị được chỉ định.
- Hai giá trị {{cssxref("&lt;length-percentage&gt;")}}
  - : Hai {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} chỉ định các giá trị tịnh tiến theo trục X và Y (lần lượt) của một phép tịnh tiến 2D. Tương đương với hàm `translate()` (tịnh tiến 2D) với hai giá trị được chỉ định.
- Ba giá trị
  - : Hai {{cssxref("&lt;length-percentage&gt;")}} và một giá trị {{cssxref("&lt;length&gt;")}} chỉ định các giá trị tịnh tiến theo trục X, Y và Z (lần lượt) của một phép tịnh tiến 3D. Tương đương với hàm `translate3d()` (tịnh tiến 3D).
- `none`
  - : Chỉ định rằng không có phép tịnh tiến nào được áp dụng.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Tịnh tiến một phần tử khi di chuột

Ví dụ này cho thấy cách sử dụng thuộc tính `translate` để di chuyển một phần tử theo ba trục.
Hộp đầu tiên được di chuyển dọc theo trục X và hộp thứ hai được di chuyển dọc theo trục X và Y.
Hộp thứ ba được di chuyển dọc theo trục X, Y và Z và có vẻ như đang di chuyển về phía người xem do việc thêm {{cssxref('perspective')}} vào phần tử cha.

#### HTML

```html
<div class="wrapper">
  <div id="box1">tịnh tiến X</div>
  <div id="box2">tịnh tiến X,Y</div>
  <div id="box3">tịnh tiến X,Y,Z</div>
</div>
```

#### CSS

```css
.wrapper {
  perspective: 100px;
  display: inline-flex;
  gap: 1em;
}
.wrapper > div {
  width: 7em;
  line-height: 7em;
  text-align: center;
  transition: 0.5s ease-in-out;
  border: 3px dotted;
}
#box1:hover {
  translate: 20px;
}

#box2:hover {
  translate: 20px 20px;
}

#box3:hover {
  translate: 5px 5px 30px;
}
```

#### Kết quả

{{EmbedLiveSample("Translating_an_element_on_hover", "100%", 175)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref('scale')}}
- {{cssxref('rotate')}}
- {{cssxref('transform')}}

Lưu ý: skew không phải là giá trị biến đổi độc lập
