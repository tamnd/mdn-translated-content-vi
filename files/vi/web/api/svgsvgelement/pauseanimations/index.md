---
title: "SVGSVGElement: phương thức pauseAnimations()"
short-title: pauseAnimations()
slug: Web/API/SVGSVGElement/pauseAnimations
page-type: web-api-instance-method
browser-compat: api.SVGSVGElement.pauseAnimations
---

{{APIRef("SVG")}}

Phương thức `pauseAnimations()` của giao diện {{domxref("SVGSVGElement")}} tạm dừng tất cả các hoạt hình đang chạy hiện tại được xác định trong mảnh tài liệu SVG tương ứng với phần tử {{SVGElement("svg")}} này, khiến đồng hồ hoạt hình tương ứng với mảnh tài liệu này đứng yên cho đến khi được tiếp tục.

## Cú pháp

```js-nolint
pauseAnimations()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Tạm dừng hoạt hình

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
<pre id="status"></pre>
```

```js
const svgElement = document.getElementById("exampleSVG");
const pauseButton = document.getElementById("pauseBtn");
const statusDisplay = document.getElementById("status");

pauseButton.addEventListener("click", () => {
  svgElement.pauseAnimations();
  statusDisplay.textContent = "Animations paused.";
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.unpauseAnimations()")}}
