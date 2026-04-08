---
title: CSS animations
short-title: Animations
slug: Web/CSS/Guides/Animations
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-animations-2/
  - https://drafts.csswg.org/css-animations/
sidebar: cssref
---

Module **CSS animations** cho phép bạn tạo animation cho các giá trị thuộc tính CSS, chẳng hạn như background-position và transform, theo thời gian bằng cách sử dụng keyframe. Mỗi keyframe mô tả cách phần tử được tạo animation sẽ hiển thị tại một thời điểm nhất định trong chuỗi animation. Bạn có thể sử dụng các thuộc tính trong module animations để kiểm soát thời lượng, số lần lặp, thời gian trì hoãn bắt đầu và các khía cạnh khác của animation.

## Animations trong thực tế

Để xem animation trong hộp bên dưới, hãy nhấp vào hộp kiểm 'Play the animation' hoặc di chuyển con trỏ qua hộp. Khi animation đang hoạt động, đám mây ở trên cùng thay đổi hình dạng, bông tuyết rơi xuống và mức tuyết ở phía dưới dâng lên. Để tạm dừng animation, bỏ chọn hộp kiểm hoặc di chuyển con trỏ ra khỏi hộp.

```html hidden live-sample___animation
<!-- See aria-label: https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label -->
<input
  type="checkbox"
  id="animate"
  aria-label="Toggle the play state of the animation" />
<label for="animate">the animation</label>
<div class="root">
  <i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i
  ><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i
  ><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i
  ><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i
  ><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i>
  <div class="cloud"></div>
  <div class="ground"></div>
</div>
```

```css hidden live-sample___animation
i {
  display: inline-block;
  height: 16px;
  width: 16px;
  border-radius: 50%;
  animation: falling 3s linear 0s infinite backwards;
  /* Snowflakes are made with CSS linear gradients (https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Images/Using_gradients) */
  background-image:
    linear-gradient(180deg, transparent 40%, white 40% 60%, transparent 60%),
    linear-gradient(90deg, transparent 40%, white 40% 60%, transparent 60%),
    linear-gradient(45deg, transparent 43%, white 43% 57%, transparent 57%),
    linear-gradient(135deg, transparent 43%, white 43% 57%, transparent 57%);
}
i:nth-of-type(4n) {
  /* Using tree structural pseudo-classes to create randomness - https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Selectors/:nth-of-type */
  height: 30px;
  width: 30px;
  transform-origin: right -30px;
}
i:nth-of-type(4n + 1) {
  height: 24px;
  width: 24px;
  transform-origin: left 30px;
}
i:nth-of-type(4n + 2) {
  height: 10px;
  width: 10px;
  transform-origin: -30px 0;
}
i:nth-of-type(4n + 3) {
  height: 40px;
  width: 40px;
  transform-origin: -50px 0;
}
i:nth-of-type(4n) {
  animation-duration: 5.3s;
  animation-iteration-count: 12;
  transform-origin: -10px -20px;
}
i:nth-of-type(4n + 1) {
  animation-duration: 3.1s;
  animation-iteration-count: 20;
  transform-origin: 10px -20px;
}
i:nth-of-type(4n + 2) {
  animation-duration: 1.7s;
  animation-iteration-count: 35;
  transform-origin: right -20px;
}
i:nth-of-type(3n) {
  animation-delay: 2.3s;
}
i:nth-of-type(3n + 1) {
  animation-delay: 1.5s;
}
i:nth-of-type(3n + 2) {
  animation-delay: 3.4s;
}
i:nth-of-type(5n) {
  animation-timing-function: ease-in-out;
}
i:nth-of-type(5n + 1) {
  animation-timing-function: ease-out;
}
i:nth-of-type(5n + 2) {
  animation-timing-function: ease;
}
i:nth-of-type(5n + 3) {
  animation-timing-function: ease-in;
}
i:nth-of-type(5n + 4) {
  animation-timing-function: linear;
}
i:nth-of-type(11n) {
  animation-timing-function: cubic-bezier(0.2, 0.3, 0.8, 0.9);
}
i:nth-of-type(7n) {
  opacity: 0.5;
}
i:nth-of-type(7n + 2) {
  opacity: 0.3;
}
i:nth-of-type(7n + 4) {
  opacity: 0.7;
}
i:nth-of-type(7n + 6) {
  opacity: 0.6;
  animation-timing-function: ease-in;
  transform-origin: left 10px;
}
i:nth-of-type(7n + 1) {
  opacity: 0.8;
}

.root {
  height: 580px;
  background-color: skyblue;
  border: 1px solid darkgrey;
  position: relative;
  overflow: hidden;
}
.ground,
.cloud {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  background-repeat: no-repeat;
}
.cloud {
  width: 100%;
  height: 150px;
  background: white;
  border-radius: 0 0 90px 33% / 0 0 45px 50px;
  box-shadow:
    5px 15px 15px white,
    -5px 15px 15px white,
    0 20px 20px rgb(125 125 125 / 0.5);
  animation:
    clouds ease 5s alternate infinite 0.2s,
    wind ease-out 4s alternate infinite;
}
.ground {
  bottom: 0;
  background-image: linear-gradient(to top, white 97%, 99%, #bbbbbb 100%);
  background-position: center 580px;
  animation: snowfall linear 300s forwards;
  border: 1px solid grey;
  /* Put the ground into a 3D rendering context (because the snow flakes are in a 3d rendering context) */
  transform: translate3d(0, 0, 0);
}

@keyframes snowfall {
  from {
    background-position: center 580px;
  }
  to {
    background-position: center 280px;
  }
}

@keyframes clouds {
  from {
    border-radius: 0 0 90px 33% / 0 0 45px 50px;
  }
  to {
    border-radius: 0 0 40px 50% / 0 0 55px 80px;
  }
}

@keyframes wind {
  from {
    height: 150px;
  }
  to {
    height: 100px;
  }
}

@keyframes falling {
  from {
    transform: translate(0, -50px) rotate(0deg) scale(0.9, 0.9);
  }
  to {
    transform: translate(30px, 600px) rotate(360deg) scale(1.1, 1.1);
  }
}

/* By default, the animations are paused. */
i,
div[class] {
  animation-play-state: paused;
}
/* When the div is hovered, the animation plays. Also,
when the input is checked, the animation coming after the checked checkbox plays */
div:hover *,
input:checked ~ div * {
  animation-play-state: running;
}

/* Change the content of the label that comes right after the input. Included aria-label on the label to improve accessibility. */
input + label::before {
  content: "Play ";
}
input:checked + label::before {
  content: "Pause ";
}
```

{{EmbedLiveSample("animation", "", "610px")}}

Animation mẫu này sử dụng {{cssxref("animation-iteration-count")}} để làm cho các bông tuyết rơi lặp đi lặp lại, {{cssxref("animation-direction")}} để làm cho đám mây di chuyển qua lại, {{cssxref("animation-fill-mode")}} để nâng mức tuyết lên theo chuyển động của đám mây, và {{cssxref("animation-play-state")}} để tạm dừng animation.

Nhấp vào "Play" trong ví dụ trên để xem hoặc chỉnh sửa code cho animation trong MDN Playground.

## Tham chiếu

### Thuộc tính

- {{cssxref("animation")}} shorthand
- {{cssxref("animation-composition")}}
- {{cssxref("animation-delay")}}
- {{cssxref("animation-direction")}}
- {{cssxref("animation-duration")}}
- {{cssxref("animation-fill-mode")}}
- {{cssxref("animation-iteration-count")}}
- {{cssxref("animation-name")}}
- {{cssxref("animation-play-state")}}
- {{cssxref("animation-timeline")}}
- {{cssxref("animation-timing-function")}}

Module CSS animations cấp độ 2 cũng giới thiệu các thuộc tính `animation-trigger`, `animation-trigger-exit-range`, `animation-trigger-exit-range-end`, `animation-trigger-exit-range-start`, `animation-trigger-range`, `animation-trigger-range-end`, `animation-trigger-range-start`, `animation-trigger-timeline`, và `animation-trigger-type`. Hiện tại, không có trình duyệt nào hỗ trợ các tính năng này.

### At-rule và descriptor

- {{cssxref("@keyframes")}}
- [`<keyframe-selector>`](/en-US/docs/Web/CSS/Reference/Selectors/Keyframe_selectors)

### Sự kiện

Tất cả các animation, kể cả những animation có thời lượng 0 giây, đều kích hoạt các sự kiện animation.

- {{domxref("Element/animationstart_event", "animationstart")}}
- {{domxref("Element/animationend_event", "animationend")}}
- {{domxref("Element/animationcancel_event", "animationcancel")}}
- {{domxref("Element/animationiteration_event", "animationiteration")}}

### Interface

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationEvent")}}
- {{domxref("CSSAnimation")}}
- {{domxref("CSSKeyframeRule")}}
- {{domxref("CSSKeyframesRule")}}

## Hướng dẫn

- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
  - : Hướng dẫn từng bước về cách tạo animation bằng CSS. Bài viết này mô tả các thuộc tính CSS và at-rule liên quan đến animation và cách chúng tương tác với nhau.
- [Animatable CSS properties](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties)
  - : Tổng quan về cách các thuộc tính CSS khác nhau có thể được tạo animation, bao gồm các kiểu animation và phương thức interpolation của chúng.
- [Using the Web Animations API](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API)
  - : Các yêu cầu animation phổ biến có thể được giải quyết chỉ với vài dòng JavaScript.

## Khái niệm liên quan

- Thuộc tính CSS {{cssxref("will-change")}}
- Kiểu dữ liệu {{cssxref("easing-function")}}
- Media query [`prefers-reduced-motion`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion)
- Thuật ngữ {{glossary("Bezier curve")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations).
- Các thuộc tính trong module CSS [transitions](/en-US/docs/Web/CSS/Guides/Transitions) để kích hoạt animation dựa trên hành động người dùng.
- Thuộc tính {{cssxref("interpolate-size")}} và hàm {{cssxref("calc-size()")}} để cho phép animation đến và từ [intrinsic size values](/en-US/docs/Glossary/Intrinsic_Size).
- Phần tử HTML {{htmlelement("canvas")}} cùng với [canvas API](/en-US/docs/Web/API/Canvas_API) và [WebGL API](/en-US/docs/Web/API/WebGL_API) để vẽ đồ họa và animation.
- Interface {{domxref("SVGAnimationElement")}} cho tất cả các interface phần tử liên quan đến animation, bao gồm {{domxref("SVGAnimateElement")}}, {{domxref("SVGSetElement")}}, {{domxref("SVGAnimateColorElement")}}, {{domxref("SVGAnimateMotionElement")}}, và {{domxref("SVGAnimateTransformElement")}}.
