---
title: "SVGAnimatedLength: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedLength/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedLength.baseVal
---

{{APIRef("SVG")}}

Thuộc tính **`baseVal`** của giao diện {{domxref("SVGAnimatedLength")}} chứa giá trị ban đầu của một kiểu liệt kê SVG.

## Giá trị

Một {{domxref("SVGLength")}} chứa giá trị ban đầu của độ dài.

## Ví dụ

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 100 100"
  width="200"
  height="200">
  <circle cx="50" cy="50" r="20px" fill="gold" id="circle"></circle>
</svg>
<pre id="log"></pre>
```

```js
const unit = [
  "unknown",
  "",
  "%",
  "em",
  "ex",
  "px",
  "cm",
  "mm",
  "in",
  "pt",
  "pc",
];
const circle = document.getElementById("circle");
const log = document.getElementById("log");
const baseValue = circle.r.baseVal.value;
const baseUnit = unit[circle.r.baseVal.unitType];

log.textContent = `'circle.r.baseVal' là ${baseValue} (trong ${baseUnit}).`;
```

{{EmbedLiveSample("Examples", "280", "260")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedLength.animVal")}}
