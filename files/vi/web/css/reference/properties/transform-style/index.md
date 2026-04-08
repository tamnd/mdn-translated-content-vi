---
title: transform-style
slug: Web/CSS/Reference/Properties/transform-style
page-type: css-property
browser-compat: css.properties.transform-style
sidebar: cssref
---

Thuộc tính **`transform-style`** của [CSS](/vi/docs/Web/CSS) đặt xem các phần tử con của một phần tử có được định vị trong không gian 3D hay được làm phẳng trong mặt phẳng của phần tử.

{{InteractiveExample("CSS Demo: transform-style")}}

```css interactive-example-choice
transform-style: flat;
```

```css interactive-example-choice
transform-style: preserve-3d;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all layer" id="example-element">
    <p>Parent</p>
    <div class="numeral"><code>rotate3d(1, 1, 1, 45deg)</code></div>
  </div>
</section>
```

```css interactive-example
.layer {
  background: #623e3f;
  border-radius: 0.75rem;
  color: white;
  transform: perspective(200px) rotateY(30deg);
}

.numeral {
  background-color: #ffba08;
  border-radius: 0.2rem;
  color: black;
  margin: 1rem;
  padding: 0.2rem;
  transform: rotate3d(1, 1, 1, 45deg);
}
```

Nếu bị làm phẳng, các phần tử con của phần tử sẽ không tồn tại trong không gian 3D của riêng chúng.

Vì thuộc tính này không được kế thừa, nó phải được đặt cho tất cả các phần tử con không phải lá của phần tử.

## Cú pháp

```css
/* Giá trị từ khóa */
transform-style: flat;
transform-style: preserve-3d;

/* Giá trị toàn cục */
transform-style: inherit;
transform-style: initial;
transform-style: revert;
transform-style: revert-layer;
transform-style: unset;
```

### Giá trị

- `flat`
  - : Chỉ ra rằng các phần tử con của phần tử nằm trong mặt phẳng của chính phần tử đó.
- `preserve-3d`
  - : Chỉ ra rằng các phần tử con của phần tử nên được định vị trong không gian 3D.

## Mô tả

Thông số kỹ thuật liệt kê một số [giá trị thuộc tính nhóm](https://drafts.csswg.org/css-transforms-2/#grouping-property-values) yêu cầu tác nhân người dùng tạo ra biểu diễn phẳng của các phần tử con trước khi chúng có thể được áp dụng, và do đó buộc phần tử có [giá trị sử dụng](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value) là `transform-style: flat`, ngay cả khi `preserve-3d` được chỉ định. Các giá trị thuộc tính này bao gồm:

- {{cssxref("overflow")}}: bất kỳ giá trị nào khác `visible` hoặc `clip`.
- {{cssxref("opacity")}}: bất kỳ giá trị nào nhỏ hơn `1`.
- {{cssxref("filter")}}: bất kỳ giá trị nào khác `none`.
- {{cssxref("clip")}}: bất kỳ giá trị nào khác `auto`.
- {{cssxref("clip-path")}}: bất kỳ giá trị nào khác `none`.
- {{cssxref("isolation")}}: giá trị sử dụng là `isolate`.
- {{cssxref("mask-image")}}: bất kỳ giá trị nào khác `none`.
- {{cssxref("mask-border-source")}}: bất kỳ giá trị nào khác `none`.
- {{cssxref("mix-blend-mode")}}: bất kỳ giá trị nào khác `normal`.
- {{cssxref("contain")}}: `paint` và bất kỳ tổ hợp thuộc tính/giá trị nào khác gây ra giới hạn paint. Điều này bao gồm bất kỳ thuộc tính nào ảnh hưởng đến giá trị sử dụng của thuộc tính `contain`, chẳng hạn như `content-visibility: hidden`.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Minh họa transform-style

Trong ví dụ này, chúng ta có một hình khối 3D được tạo bằng các biến đổi. Container cha của các mặt khối có `transform-style: preserve-3d` được đặt theo mặc định, vì vậy nó được biến đổi trong không gian 3D và bạn có thể thấy nó như mong muốn.

Chúng ta cũng cung cấp một hộp kiểm cho phép bạn chuyển đổi giữa điều này và `transform-style: flat`. Trong trạng thái thay thế, tất cả các mặt khối được làm phẳng trên mặt phẳng của cha, và bạn có thể không thấy chúng tùy thuộc vào trình duyệt bạn đang dùng.

#### HTML

```html
<section id="example-element">
  <div class="face front">1</div>
  <div class="face back">2</div>
  <div class="face right">3</div>
  <div class="face left">4</div>
  <div class="face top">5</div>
  <div class="face bottom">6</div>
</section>

<div class="checkbox">
  <label for="preserve"><code>preserve-3d</code></label>
  <input type="checkbox" id="preserve" checked />
</div>
```

#### CSS

```css
#example-element {
  margin: 50px;
  width: 100px;
  height: 100px;
  transform-style: preserve-3d;
  transform: rotate3d(1, 1, 1, 30deg);
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
  background: rgb(90 90 90 / 70%);
  transform: translateZ(50px);
}

.back {
  background: rgb(0 210 0 / 70%);
  transform: rotateY(180deg) translateZ(50px);
}

.right {
  background: rgb(210 0 0 / 70%);
  transform: rotateY(90deg) translateZ(50px);
}

.left {
  background: rgb(0 0 210 / 70%);
  transform: rotateY(-90deg) translateZ(50px);
}

.top {
  background: rgb(210 210 0 / 70%);
  transform: rotateX(90deg) translateZ(50px);
}

.bottom {
  background: rgb(210 0 210 / 70%);
  transform: rotateX(-90deg) translateZ(50px);
}
```

#### JavaScript

```js
const cube = document.getElementById("example-element");
const checkbox = document.getElementById("preserve");

checkbox.addEventListener("change", () => {
  cube.style.transformStyle = checkbox.checked ? "preserve-3d" : "flat";
});
```

#### Kết quả

{{EmbedLiveSample('Transform_style_demonstration', '100%', 260)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using)
