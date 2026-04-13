---
title: "SVGAnimatedLength: thuộc tính animVal"
short-title: animVal
slug: Web/API/SVGAnimatedLength/animVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedLength.animVal
---

{{APIRef("SVG")}}

Thuộc tính **`animVal`** của giao diện {{domxref("SVGAnimatedLength")}} chứa giá trị hiện tại của một kiểu liệt kê SVG. Nếu không có hoạt hình, nó có giá trị tương tự như {{domxref("SVGAnimatedLength.baseVal", "baseVal")}}.

## Giá trị

Một {{domxref("SVGLength")}} chứa giá trị hiện tại của kiểu liệt kê.

## Ví dụ

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 100 100"
  width="200"
  height="200">
  <circle cx="50" cy="50" r="20" fill="gold" id="circle">
    <animate
      attributeName="r"
      values="20;25;10;20"
      dur="8s"
      repeatCount="indefinite" />
  </circle>
</svg>
<pre id="log"></pre>
```

```js
const circle = document.getElementById("circle");
const log = document.getElementById("log");

function displayLog() {
  const animValue = circle.r.animVal.value;
  const baseValue = circle.r.baseVal.value;
  log.textContent = `'circle.r.animVal' là ${animValue}.\n`;
  log.textContent += `'circle.r.baseVal' là ${baseValue}.`;
  requestAnimationFrame(displayLog);
}
displayLog();
```

{{EmbedLiveSample("Examples", "280", "260")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedLength.baseVal")}}
