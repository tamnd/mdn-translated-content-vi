---
title: animation-play-state
slug: Web/CSS/Reference/Properties/animation-play-state
page-type: css-property
browser-compat: css.properties.animation-play-state
sidebar: cssref
---

Thuộc tính **`animation-play-state`** trong [CSS](/en-US/docs/Web/CSS) đặt trạng thái hoạt ảnh đang chạy hay đang tạm dừng.

Tiếp tục một hoạt ảnh đang tạm dừng sẽ bắt đầu lại từ vị trí nó đã dừng, thay vì bắt đầu lại từ đầu chuỗi hoạt ảnh.

{{InteractiveExample("CSS Demo: animation-play-state")}}

```css interactive-example-choice
animation-play-state: paused;
```

```css interactive-example-choice
animation-play-state: running;
```

```html interactive-example
<section class="flex-column" id="default-example">
  <div class="animating" id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  background-color: #1766aa;
  color: white;
  margin: auto;
  margin-left: 0;
  border: 5px solid #333333;
  width: 150px;
  height: 150px;
  border-radius: 50%;
}

.animating {
  animation-name: slide;
  animation-duration: 3s;
  animation-timing-function: ease-in;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

@keyframes slide {
  from {
    background-color: orange;
    color: black;
    margin-left: 0;
  }
  to {
    background-color: orange;
    color: black;
    margin-left: 80%;
  }
}
```

## Cú pháp

```css
/* Một hoạt ảnh */
animation-play-state: running;
animation-play-state: paused;

/* Nhiều hoạt ảnh */
animation-play-state: paused, running, running;

/* Giá trị toàn cục */
animation-play-state: inherit;
animation-play-state: initial;
animation-play-state: revert;
animation-play-state: revert-layer;
animation-play-state: unset;
```

### Giá trị

- `running`
  - : **Hoạt ảnh** đang **chạy**.
- `paused`
  - : **Hoạt ảnh** đang **tạm dừng**.

> [!NOTE]
> Khi bạn chỉ định nhiều giá trị phân cách bằng dấu phẩy trên một thuộc tính `animation-*`, chúng được áp dụng cho các hoạt ảnh theo thứ tự xuất hiện của {{cssxref("animation-name")}}. Đối với các trường hợp số lượng hoạt ảnh và giá trị thuộc tính `animation-*` không khớp, hãy xem [Đặt nhiều giá trị thuộc tính hoạt ảnh](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tạm dừng hoạt ảnh

Hoạt ảnh này đang tạm dừng, nhưng chạy khi bạn di chuột qua nó.

#### HTML

```html
<div class="box"></div>
```

#### CSS

```css
.box {
  background-color: rebeccapurple;
  border-radius: 10px;
  width: 100px;
  height: 100px;
  animation-name: rotate;
  animation-duration: 0.7s;
  animation-iteration-count: infinite;
  animation-play-state: paused;
}

.box:hover {
  animation-play-state: running;
}

@keyframes rotate {
  0% {
    transform: rotate(0);
  }
  100% {
    transform: rotate(360deg);
  }
}
```

#### Kết quả

Di chuột qua hình chữ nhật để phát hoạt ảnh.

{{EmbedLiveSample("Pausing an animation","100%","250")}}

Xem [hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using)
- API JavaScript {{domxref("AnimationEvent")}}
- Các thuộc tính hoạt ảnh liên quan khác: {{cssxref("animation")}}, {{cssxref("animation-composition")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}}, {{cssxref("animation-timeline")}}, {{cssxref("animation-timing-function")}}
