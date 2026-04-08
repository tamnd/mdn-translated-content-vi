---
title: perspective
slug: Web/CSS/Reference/Properties/perspective
page-type: css-property
browser-compat: css.properties.perspective
sidebar: cssref
---

Thuộc tính **`perspective`** [CSS](/en-US/docs/Web/CSS) xác định khoảng cách giữa mặt phẳng z=0 và người dùng nhằm tạo hiệu ứng phối cảnh cho các phần tử được định vị trong không gian 3D.

{{InteractiveExample("CSS Demo: perspective")}}

```css interactive-example-choice
perspective: none;
```

```css interactive-example-choice
perspective: 800px;
```

```css interactive-example-choice
perspective: 23rem;
```

```css interactive-example-choice
perspective: 5.5cm;
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
perspective: none;

/* Giá trị <length> */
perspective: 20px;
perspective: 3.5em;

/* Giá trị toàn cục */
perspective: inherit;
perspective: initial;
perspective: revert;
perspective: revert-layer;
perspective: unset;
```

### Giá trị

- `none`
  - : Cho biết không áp dụng phép biến đổi phối cảnh nào.
- `<length>`
  - : Một {{cssxref("&lt;length&gt;")}} cho biết khoảng cách từ người dùng đến mặt phẳng z=0. Giá trị này được dùng để áp dụng phép biến đổi phối cảnh cho các phần tử con. Giá trị âm là lỗi cú pháp. Nếu giá trị nhỏ hơn `1px`, nó sẽ bị kẹp ở `1px`.

## Mô tả

Mỗi phần tử 3D có z>0 sẽ trông lớn hơn; mỗi phần tử 3D có z<0 sẽ trông nhỏ hơn. Mức độ hiệu ứng được xác định bởi giá trị của thuộc tính này.
Giá trị lớn của `perspective` tạo ra biến đổi nhỏ;
giá trị nhỏ của `perspective` tạo ra biến đổi lớn.

Những phần của phần tử 3D nằm phía sau người dùng — tức là tọa độ trục z của chúng lớn hơn giá trị của thuộc tính CSS `perspective` — sẽ không được vẽ.

_Điểm triệt tiêu_ mặc định được đặt tại tâm của phần tử, nhưng vị trí của nó có thể được thay đổi bằng thuộc tính {{cssxref("perspective-origin")}}.

Sử dụng thuộc tính này với giá trị khác `none` sẽ tạo ra một [ngữ cảnh xếp chồng](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới. Ngoài ra, trong trường hợp đó, đối tượng sẽ hoạt động như một khối chứa cho các phần tử `position: fixed` bên trong nó.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập phối cảnh

Ví dụ minh họa cách hình khối thay đổi khi `perspective` được đặt ở các vị trí khác nhau được trình bày trong [Sử dụng CSS transforms > Thiết lập phối cảnh](/en-US/docs/Web/CSS/Guides/Transforms/Using#setting_perspective).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS Transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using)
