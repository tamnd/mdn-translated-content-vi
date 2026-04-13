---
title: "SVGMaskElement: maskUnits property"
short-title: maskUnits
slug: Web/API/SVGMaskElement/maskUnits
page-type: web-api-instance-property
browser-compat: api.SVGMaskElement.maskUnits
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`maskUnits`** của giao diện {{domxref("SVGMaskElement")}} phản ánh thuộc tính {{SVGAttr("maskUnits")}} của phần tử {{SVGElement("mask")}}, định nghĩa hệ tọa độ được sử dụng cho mặt nạ của phần tử.

> [!NOTE]
> Mặc dù thuộc tính này là chỉ đọc, nhưng nó chỉ là một bộ chứa cho hai giá trị bạn có thể sửa đổi, {{domxref("SVGAnimatedEnumeration.baseVal", "baseVal")}} và {{domxref("SVGAnimatedEnumeration.animVal", "animVal")}}.

## Giá trị

Một {{domxref("SVGAnimatedEnumeration")}} đại diện cho hệ tọa độ. Các giá trị khả dụng được định nghĩa trong giao diện {{domxref("SVGUnitTypes")}}:

- `0` (`SVG_UNIT_TYPE_UNKNOWN`)
  - : Kiểu không phải là một trong các kiểu được định nghĩa sẵn.
- `1` (`SVG_UNIT_TYPE_USERSPACEONUSE`)
  - : Tương ứng với giá trị `userSpaceOnUse` cho thuộc tính {{SVGAttr("maskUnits")}}, nghĩa là tất cả tọa độ bên trong phần tử đều tham chiếu đến hệ tọa độ người dùng được xác định khi mặt nạ được tạo. Đây là giá trị mặc định.
- `2` (`SVG_UNIT_TYPE_OBJECTBOUNDINGBOX`)
  - : Tương ứng với giá trị `objectBoundingBox` cho thuộc tính, nghĩa là tất cả tọa độ bên trong phần tử đều tương đối so với hộp giới hạn của phần tử mà mặt nạ được áp dụng. Điều này có nghĩa là gốc của hệ tọa độ là góc trên bên trái của hộp giới hạn đối tượng, và chiều rộng cùng chiều cao của hộp giới hạn đối tượng được coi là có độ dài là 1 đơn vị.

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
  <svg
    viewBox="0 0 100 100"
    height="200"
    width="200"
    xmlns="http://www.w3.org/2000/svg">
    <mask
      id="mask1"
      maskUnits="userSpaceOnUse"
      x="20%"
      y="20%"
      width="60%"
      height="60%">
      <rect fill="black" x="0" y="0" width="100%" height="100%" />
      <circle fill="white" cx="50" cy="50" r="35" />
    </mask>

    <mask
      id="mask2"
      maskUnits="objectBoundingBox"
      x="20%"
      y="20%"
      width="60%"
      height="60%">
      <rect fill="black" x="0" y="0" width="100%" height="100%" />
      <circle fill="white" cx="50" cy="50" r="35" />
      <animate
        attributeName="maskUnits"
        values="objectBoundingBox;userSpaceOnUse"
        dur="1s"
        repeatCount="indefinite" />
    </mask>

    <!-- Một số hình chữ nhật tham chiếu để thể hiện mặt nạ -->
    <rect id="r1" x="0" y="0" width="45" height="45" />
    <rect id="r2" x="0" y="55" width="45" height="45" />
    <rect id="r3" x="55" y="55" width="45" height="45" />
    <rect id="r4" x="55" y="0" width="45" height="45" />

    <!-- Ba hình chữ nhật đầu được che với useSpaceOnUse -->
    <use mask="url(#mask1)" href="#r1" fill="blue" />
    <use mask="url(#mask1)" href="#r2" fill="green" />
    <use mask="url(#mask1)" href="#r3" fill="yellow" />

    <!-- Hình chữ nhật cuối được che với objectBoundingBox -->
    <use mask="url(#mask2)" href="#r4" fill="lightblue" />
  </svg>
</div>
<pre id="log"></pre>
```

```js
const unitType = ["unknown", "userSpaceOnUse", "objectBoundingBox"];

const mask = document.getElementById("mask2");
const log = document.getElementById("log");

function displayLog() {
  const baseValue = unitType[mask.maskUnits.baseVal];
  const animValue = unitType[mask.maskUnits.animVal];
  log.textContent = `The top-right 'maskUnits.baseVal' coord system : ${baseValue}\n`;
  log.textContent += `The top-right 'maskUnits.animVal' coord system : ${animValue}`;
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

- {{SVGAttr("maskUnits")}}
- {{SVGElement("mask")}}
