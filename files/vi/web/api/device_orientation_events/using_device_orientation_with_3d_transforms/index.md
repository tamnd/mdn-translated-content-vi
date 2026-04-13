---
title: Sử dụng định hướng thiết bị với biến đổi 3D
slug: Web/API/Device_orientation_events/Using_device_orientation_with_3D_transforms
page-type: guide
---

{{DefaultAPISidebar("Device Orientation Events")}}

Hướng dẫn này mô tả cách sử dụng dữ liệu định hướng thiết bị với các biến đổi CSS 3D để tạo ra hiệu ứng tương tác.

## Kết hợp định hướng với CSS 3D

Dữ liệu định hướng từ {{domxref("Window/deviceorientation_event", "deviceorientation")}} có thể ánh xạ trực tiếp đến các phép xoay CSS. Dữ liệu định hướng (alpha, beta, gamma) tương ứng với các phép xoay quanh trục z, x, y.

```js
const element = document.getElementById("3d-element");

window.addEventListener("deviceorientation", (event) => {
  const { alpha, beta, gamma } = event;

  // Tạo biến đổi xoay CSS từ dữ liệu định hướng
  element.style.transform = `rotateX(${beta}deg) rotateY(${gamma}deg) rotateZ(${alpha}deg)`;
});
```

## Ví dụ thực tế: Quả cầu xoay

```html
<div id="container">
  <div id="ball">
    <div class="face front">Front</div>
    <div class="face back">Back</div>
    <div class="face left">Left</div>
    <div class="face right">Right</div>
    <div class="face top">Top</div>
    <div class="face bottom">Bottom</div>
  </div>
</div>
```

```css
#container {
  perspective: 400px;
  width: 200px;
  height: 200px;
  margin: 100px auto;
}

#ball {
  width: 200px;
  height: 200px;
  position: relative;
  transform-style: preserve-3d;
  transition: transform 0.05s linear;
}

.face {
  position: absolute;
  width: 200px;
  height: 200px;
  border: 2px solid #999;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  opacity: 0.8;
}

.front {
  background: rgba(255, 0, 0, 0.5);
  transform: translateZ(100px);
}
.back {
  background: rgba(0, 255, 0, 0.5);
  transform: rotateY(180deg) translateZ(100px);
}
.left {
  background: rgba(0, 0, 255, 0.5);
  transform: rotateY(-90deg) translateZ(100px);
}
.right {
  background: rgba(255, 255, 0, 0.5);
  transform: rotateY(90deg) translateZ(100px);
}
.top {
  background: rgba(0, 255, 255, 0.5);
  transform: rotateX(90deg) translateZ(100px);
}
.bottom {
  background: rgba(255, 0, 255, 0.5);
  transform: rotateX(-90deg) translateZ(100px);
}
```

```js
const ball = document.getElementById("ball");

window.addEventListener("deviceorientation", (event) => {
  const beta = event.beta || 0;
  const gamma = event.gamma || 0;

  ball.style.transform = `rotateX(${beta}deg) rotateY(${gamma}deg)`;
});
```

## Chế độ xem song song (Parallax)

Hiệu ứng song song tạo ra ảo giác chiều sâu bằng cách di chuyển các lớp nền ở tốc độ khác nhau:

```js
const layers = document.querySelectorAll(".parallax-layer");

window.addEventListener("deviceorientation", (event) => {
  const gamma = event.gamma || 0; // -90 đến 90
  const beta = event.beta || 0; // -180 đến 180

  layers.forEach((layer, index) => {
    const depth = (index + 1) * 0.1;
    const xShift = gamma * depth;
    const yShift = beta * depth;
    layer.style.transform = `translate(${xShift}px, ${yShift}px)`;
  });
});
```

## Lưu ý về hiệu suất

- Sử dụng `requestAnimationFrame` thay vì cập nhật trực tiếp trong trình xử lý sự kiện để cải thiện hiệu suất.
- Xem xét sử dụng `transition` CSS để làm mượt hoạt động.
- Giới hạn phạm vi xoay để tránh trải nghiệm người dùng kỳ lạ.

```js
let ticking = false;
let latestOrientation = { beta: 0, gamma: 0 };

window.addEventListener("deviceorientation", (event) => {
  latestOrientation = { beta: event.beta, gamma: event.gamma };

  if (!ticking) {
    requestAnimationFrame(() => {
      updateTransform(latestOrientation);
      ticking = false;
    });
    ticking = true;
  }
});

function updateTransform({ beta, gamma }) {
  const element = document.getElementById("3d-element");
  element.style.transform = `rotateX(${beta}deg) rotateY(${gamma}deg)`;
}
```

## Xem thêm

- [Device orientation events](/en-US/docs/Web/API/Device_orientation_events)
- [CSS Transform](/en-US/docs/Web/CSS/transform)
- [CSS perspective](/en-US/docs/Web/CSS/perspective)
