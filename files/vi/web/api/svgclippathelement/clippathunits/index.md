---
title: "SVGClipPathElement: thuộc tính clipPathUnits"
short-title: clipPathUnits
slug: Web/API/SVGClipPathElement/clipPathUnits
page-type: web-api-instance-property
browser-compat: api.SVGClipPathElement.clipPathUnits
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`clipPathUnits`** của giao diện {{domxref("SVGClipPathElement")}} phản ánh thuộc tính {{SVGAttr("clipPathUnits")}} của phần tử {{SVGElement("clipPath")}}, định nghĩa hệ tọa độ sẽ được sử dụng cho nội dung của phần tử.

> [!NOTE]
> Mặc dù thuộc tính này là chỉ đọc, nhưng nó chỉ là một container cho hai giá trị bạn có thể sửa đổi, {{domxref("SVGAnimatedEnumeration.baseVal", "baseVal")}} và {{domxref("SVGAnimatedEnumeration.animVal", "animVal")}}.

## Giá trị

Một {{domxref("SVGAnimatedEnumeration")}} đại diện cho hệ tọa độ. Các giá trị có thể được định nghĩa trong giao diện {{domxref("SVGUnitTypes")}}:

- `0` (`SVG_UNIT_TYPE_UNKNOWN`)
  - : Kiểu không phải là một trong các kiểu được xác định trước.
- `1` (`SVG_UNIT_TYPE_USERSPACEONUSE`)
  - : Tương ứng với giá trị `userSpaceOnUse` cho thuộc tính {{SVGAttr("clipPathUnits")}} và có nghĩa là tất cả tọa độ bên trong phần tử đều tham chiếu đến hệ tọa độ người dùng được xác định khi đường cắt được tạo. Đây là giá trị mặc định.
- `2` (`SVG_UNIT_TYPE_OBJECTBOUNDINGBOX`)
  - : Tương ứng với giá trị `objectBoundingBox` cho thuộc tính và có nghĩa là tất cả tọa độ bên trong phần tử đều tương đối so với hộp giới hạn của phần tử mà đường cắt được áp dụng. Điều này có nghĩa là gốc của hệ tọa độ là góc trên bên trái của hộp giới hạn đối tượng và chiều rộng và chiều cao của hộp giới hạn đối tượng được coi là có độ dài là 1 đơn vị giá trị.

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
      <circle cx="50" cy="50" r="35" />
    </clipPath>

    <clipPath id="clip2" clipPathUnits="objectBoundingBox">
      <circle cx=".5" cy=".5" r=".35" />
    </clipPath>

    <!-- Một số hình chữ nhật tham chiếu để cụ thể hóa đường cắt -->
    <rect id="r1" x="0" y="0" width="45" height="45" />
    <rect id="r2" x="0" y="55" width="45" height="45" />
    <rect id="r3" x="55" y="55" width="45" height="45" />
    <rect id="r4" x="55" y="0" width="45" height="45" />

    <!-- 3 hình chữ nhật đầu tiên được cắt với đơn vị userSpaceOnUse -->
    <use clip-path="url(#clip1)" href="#r1" fill="red" />
    <use clip-path="url(#clip1)" href="#r2" fill="blue" />
    <use clip-path="url(#clip1)" href="#r3" fill="yellow" />

    <!-- Hình chữ nhật cuối được cắt với đơn vị objectBoundingBox -->
    <use clip-path="url(#clip2)" href="#r4" fill="green" />
  </svg>
</div>
<pre id="log"></pre>
```

```js
const clipPath1 = document.getElementById("clip1");
const clipPath2 = document.getElementById("clip2");

const log = document.getElementById("log");

log.textContent = `clipPath được dùng ba lần có giá trị 'clipPathUnits' là ${clipPath1.clipPathUnits.baseVal}
clipPath được dùng ba lần có giá trị 'clipPathUnits' là ${clipPath2.clipPathUnits.baseVal}`;
```

{{EmbedLiveSample("Examples", "280", "260")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("clipPathUnits")}}
- {{SVGElement("clipPath")}}
