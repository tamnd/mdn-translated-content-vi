---
title: "SVGMarkerElement: markerUnits property"
short-title: markerUnits
slug: Web/API/SVGMarkerElement/markerUnits
page-type: web-api-instance-property
browser-compat: api.SVGMarkerElement.markerUnits
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`markerUnits`** của giao diện {{domxref("SVGMarkerElement")}} trả về một đối tượng {{domxref("SVGAnimatedEnumeration")}}. Đối tượng này trả về một số nguyên biểu thị các giá trị từ khóa mà thuộc tính {{SVGattr("markerUnits")}} chấp nhận.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}. Thuộc tính `baseVal` của đối tượng này chứa một trong các giá trị sau:

- `0`
  - : `SVG_MARKERUNITS_UNKNOWN` nghĩa là thuộc tính {{SVGattr("markerUnits")}} có giá trị khác với hai từ khóa được xác định trước.
- `1`
  - : `SVG_MARKERUNITS_USERSPACEONUSE` nghĩa là thuộc tính {{SVGattr("markerUnits")}} có giá trị từ khóa `userSpaceOnUse`.
- `2`
  - : `SVG_MARKERUNITS_STROKEWIDTH` nghĩa là thuộc tính {{SVGattr("markerUnits")}} có giá trị từ khóa `strokeWidth`.

## Ví dụ

Thuộc tính `markerUnits` trả về một đối tượng {{domxref("SVGAnimatedEnumeration")}} chứa giá trị của thuộc tính {{SVGattr("markerUnits")}}.

```html
<svg id="svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker
      id="arrow"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      markerWidth="6"
      markerHeight="6"
      orient="auto-start-reverse"
      markerUnits="strokeWidth">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>
  </defs>
</svg>
```

```js
let marker = document.getElementById("arrow");
console.log(marker.markerUnits.baseVal); // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
