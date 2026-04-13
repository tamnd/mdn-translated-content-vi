---
title: "SVGMaskElement: height property"
short-title: height
slug: Web/API/SVGMaskElement/height
page-type: web-api-instance-property
browser-compat: api.SVGMaskElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGMaskElement")}} trả về một đối tượng {{domxref("SVGAnimatedLength")}} chứa giá trị của thuộc tính {{SVGattr("height")}} của {{SVGElement("mask")}}.

> [!NOTE]
> Mặc dù thuộc tính này là chỉ đọc, nhưng nó chỉ là một bộ chứa cho hai giá trị bạn có thể sửa đổi, {{domxref("SVGAnimatedLength.baseVal", "baseVal")}} và {{domxref("SVGAnimatedLength.animVal", "animVal")}}.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedLength")}}. Thuộc tính `baseVal` của đối tượng này trả về một {{domxref("SVGLength")}}, giá trị của nó trả về giá trị `height`.

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
  <svg viewBox="-10 -10 120 120" width="100" height="100">
    <mask id="mask" x="0" maskUnits="objectBoundingBox">
      <!-- Mọi thứ dưới pixel trắng sẽ hiển thị -->
      <rect x="0" y="0" width="100" height="100" fill="white" />

      <!-- Mọi thứ dưới pixel đen sẽ ẩn -->
      <path
        d="M10,35 A20,20,0,0,1,50,35 A20,20,0,0,1,90,35 Q90,65,50,95 Q10,65,10,35 Z"
        fill="black" />
      <animate
        attributeName="height"
        values="144;0;144"
        dur="5s"
        repeatCount="indefinite" />
    </mask>

    <polygon points="-10,110 110,110 110,-10" fill="orange" />

    <!-- với mặt nạ này, chúng ta "đục" một lỗ hình trái tim vào hình tròn -->
    <circle cx="50" cy="50" r="50" mask="url(#mask)" />
  </svg>
</div>
<pre id="log"></pre>
```

```js
const mask = document.getElementById("mask");

function displayLog() {
  const animValue = mask.height.animVal.value;
  const baseValue = mask.height.baseVal.value;
  log.textContent = `The 'height.animVal' is ${animValue}.\n`;
  log.textContent += `The 'height.baseVal' is ${baseValue}.`;
  requestAnimationFrame(displayLog);
}
displayLog();
```

{{EmbedLiveSample('Example', 100, 160)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
