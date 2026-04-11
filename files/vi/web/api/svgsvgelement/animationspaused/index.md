---
title: "SVGSVGElement: phương thức animationsPaused()"
short-title: animationsPaused()
slug: Web/API/SVGSVGElement/animationsPaused
page-type: web-api-instance-method
browser-compat: api.SVGSVGElement.animationsPaused
---

{{APIRef("SVG")}}

Phương thức `animationsPaused()` của giao diện {{domxref("SVGSVGElement")}} kiểm tra xem các hoạt hình trong mảnh tài liệu SVG có đang tạm dừng hay không.

## Cú pháp

```js-nolint
animationsPaused()
```

### Tham số

Không có.

### Giá trị trả về

Một boolean. `true` nếu mảnh tài liệu SVG này đang ở trạng thái tạm dừng.

## Ví dụ

### Kiểm tra xem hoạt hình có đang tạm dừng không

```html
<svg id="exampleSVG" width="200" height="100">
  <circle cx="50" cy="50" r="30" fill="blue">
    <animate
      attributeName="cx"
      from="50"
      to="150"
      dur="2s"
      repeatCount="indefinite" />
  </circle>
</svg>

<button id="pauseBtn">Tạm dừng/Tiếp tục hoạt hình</button>
<pre id="status"></pre>
```

```js
const svgElement = document.getElementById("exampleSVG");
const pauseButton = document.getElementById("pauseBtn");
const statusDisplay = document.getElementById("status");

function updateStatus() {
  const isPaused = svgElement.animationsPaused();
  statusDisplay.textContent = `Animations paused: ${isPaused}`;
}

pauseButton.addEventListener("click", () => {
  if (svgElement.animationsPaused()) {
    svgElement.unpauseAnimations();
  } else {
    svgElement.pauseAnimations();
  }
  updateStatus();
});

// Khởi tạo hiển thị trạng thái
updateStatus();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.pauseAnimations()")}}
- {{domxref("SVGSVGElement.unpauseAnimations()")}}
