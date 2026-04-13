---
title: "SVGAnimatedEnumeration: thuộc tính animVal"
short-title: animVal
slug: Web/API/SVGAnimatedEnumeration/animVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedEnumeration.animVal
---

{{APIRef("SVG")}}

Thuộc tính **`animVal`** của giao diện {{domxref("SVGAnimatedEnumeration")}} chứa giá trị hiện tại của một kiểu liệt kê SVG. Nếu không có hoạt hình, nó có giá trị tương tự như {{domxref("SVGAnimatedEnumeration.baseVal", "baseVal")}}.

## Giá trị

Một số nguyên chứa giá trị hiện tại của kiểu liệt kê.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<div>
  <svg viewBox="0 0 100 100" width="200" height="200">
    <clipPath id="clip1" clipPathUnits="userSpaceOnUse">
      <animate
        attributeName="clipPathUnits"
        values="userSpaceOnUse;objectBoundingBox;userSpaceOnUse"
        dur="2s"
        repeatCount="indefinite" />
      <circle cx="50" cy="50" r="25" />
    </clipPath>

    <rect id="r1" x="0" y="0" width="50" height="100" />

    <use clip-path="url(#clip1)" href="#r1" fill="lightblue" />
  </svg>
</div>
<pre id="log"></pre>
```

```js
const clipPath1 = document.getElementById("clip1");
const log = document.getElementById("log");

function displayLog() {
  const animValue = clipPath1.clipPathUnits.animVal;
  const baseValue = clipPath1.clipPathUnits.baseVal;
  log.textContent = `'clipPathUnits.animVal' là ${animValue}.\n`;
  log.textContent += `'clipPathUnits.baseVal' là ${baseValue}.`;
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

- {{domxref("SVGAnimatedEnumeration.baseVal")}}
