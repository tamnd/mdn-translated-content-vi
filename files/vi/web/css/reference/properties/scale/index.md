---
title: scale
slug: Web/CSS/Reference/Properties/scale
page-type: css-property
browser-compat: css.properties.scale
sidebar: cssref
---

Thuộc tính **`scale`** trong [CSS](/en-US/docs/Web/CSS) cho phép bạn chỉ định các biến đổi tỉ lệ một cách riêng lẻ và độc lập với thuộc tính {{CSSxRef("transform")}}. Điều này phù hợp hơn với cách sử dụng giao diện người dùng thông thường và giúp tránh phải nhớ thứ tự chính xác của các hàm biến đổi khi chỉ định giá trị `transform`.

{{InteractiveExample("CSS Demo: scale")}}

```css interactive-example-choice
scale: none;
```

```css interactive-example-choice
scale: 1.5;
```

```css interactive-example-choice
scale: 1.7 50%;
```

```css interactive-example-choice
scale: 1 -1;
```

```css interactive-example-choice
scale: 1.2 1.2 2;
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
scale: none;

/* Giá trị đơn */
/* giá trị lớn hơn 1 hoặc 100% làm phần tử lớn hơn */
scale: 2;
/* giá trị nhỏ hơn 1 hoặc 100% làm phần tử nhỏ lại */
scale: 50%;

/* Hai giá trị */
scale: 2 0.5;

/* Ba giá trị */
scale: 200% 50% 200%;

/* Giá trị toàn cục */
scale: inherit;
scale: initial;
scale: revert;
scale: revert-layer;
scale: unset;
```

### Giá trị

- Giá trị đơn
  - : Một giá trị {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} chỉ định hệ số tỉ lệ để phần tử bị ảnh hưởng co giãn theo cùng hệ số đó trên cả hai trục X và Y. Tương đương với hàm `scale()` (co giãn 2D) với một giá trị được chỉ định.
- Hai giá trị
  - : Hai giá trị {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} chỉ định giá trị co giãn theo trục X và Y (tương ứng) của phép co giãn 2D. Tương đương với hàm `scale()` (co giãn 2D) với hai giá trị được chỉ định.
- Ba giá trị
  - : Ba giá trị {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} chỉ định giá trị co giãn theo trục X, Y và Z (tương ứng) của phép co giãn 3D. Tương đương với hàm `scale3d()` (co giãn 3D).
- `none`
  - : Chỉ định rằng không có co giãn nào được áp dụng.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Co giãn phần tử khi di chuột

Ví dụ sau đây cho thấy cách co giãn phần tử khi di chuột vào.
Hai hộp được hiển thị, một hộp có giá trị `scale` đơn co giãn phần tử theo cả hai trục.
Hộp thứ hai có hai giá trị `scale` co giãn phần tử theo trục X và Y một cách độc lập.

#### HTML

```html
<div class="box" id="box1">single value</div>
<div class="box" id="box2">two values</div>
```

#### CSS

```css
.box {
  float: left;
  margin: 1em;
  width: 7em;
  line-height: 7em;
  text-align: center;
  transition: 0.5s ease-in-out;
  border: 3px dotted;
}

#box1:hover {
  scale: 1.25;
}

#box2:hover {
  scale: 1.25 0.75;
}
```

#### Kết quả

{{EmbedLiveSample("Scaling_an_element_on_hover", "100%", 150)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref('translate')}}
- {{cssxref('rotate')}}
- {{cssxref('transform')}}

Lưu ý: skew không phải là giá trị biến đổi độc lập
