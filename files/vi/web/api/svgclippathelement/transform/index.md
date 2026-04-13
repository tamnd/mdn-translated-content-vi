---
title: "SVGClipPathElement: thuộc tính transform"
short-title: transform
slug: Web/API/SVGClipPathElement/transform
page-type: web-api-instance-property
browser-compat: api.SVGClipPathElement.transform
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`transform`** của giao diện {{domxref("SVGClipPathElement")}} phản ánh thuộc tính {{SVGAttr("transform")}} của phần tử {{SVGElement("clipPath")}}, tức là danh sách các phép biến đổi được áp dụng cho phần tử.

## Giá trị

Một {{domxref("SVGTransformList")}}.

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
    <clipPath
      id="clip1"
      clipPathUnits="objectBoundingBox"
      transform="skewX(40) scale(1 0.5)">
      <circle cx=".5" cy=".5" r=".35" />
    </clipPath>

    <rect id="r1" x="0" y="0" width="100" height="100" />

    <use clip-path="url(#clip1)" href="#r1" fill="lightblue" />
  </svg>
</div>
<pre id="log"></pre>
```

```js
const translateType = [
  "unknown",
  "matrix()",
  "translate()",
  "scale()",
  "rotate()",
  "skewx()",
  "skewy()",
];

const clipPath1 = document.getElementById("clip1");

const log = document.getElementById("log");

let result = "Các phép biến đổi sau đã được áp dụng:\n";
for (const transform of clipPath1.transform.baseVal) {
  result += `- Phép biến đổi kiểu '${translateType[transform.type]}' đã được tìm thấy.\n`;
}

log.textContent = result;
```

{{EmbedLiveSample("Examples", "280", "280")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("clipPathUnits")}}
- {{SVGElement("clipPath")}}
