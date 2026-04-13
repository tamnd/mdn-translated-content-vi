---
title: "SVGSVGElement: phương thức unpauseAnimations()"
short-title: unpauseAnimations()
slug: Web/API/SVGSVGElement/unpauseAnimations
page-type: web-api-instance-method
browser-compat: api.SVGSVGElement.unpauseAnimations
---

{{APIRef("SVG")}}

Phương thức `unpauseAnimations()` của giao diện {{domxref("SVGSVGElement")}} tiếp tục các hoạt hình đang chạy hiện tại được xác định trong mảnh tài liệu SVG, khiến đồng hồ hoạt hình tiếp tục từ thời điểm nó bị tạm dừng.

## Cú pháp

```js-nolint
unpauseAnimations()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Tiếp tục hoạt hình

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

<button id="pauseBtn">Tạm dừng hoạt hình</button>
<button id="resumeBtn">Tiếp tục hoạt hình</button>
<pre id="status"></pre>
```

```js
const svgElement = document.getElementById("exampleSVG");
const pauseButton = document.getElementById("pauseBtn");
const resumeButton = document.getElementById("resumeBtn");
const statusDisplay = document.getElementById("status");

pauseButton.addEventListener("click", () => {
  svgElement.pauseAnimations();
  statusDisplay.textContent = "Animations paused.";
});

resumeButton.addEventListener("click", () => {
  svgElement.unpauseAnimations();
  statusDisplay.textContent = "Animations resumed.";
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.pauseAnimations()")}}
