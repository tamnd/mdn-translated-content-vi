---
title: "SVGMarkerElement: refY property"
short-title: refY
slug: Web/API/SVGMarkerElement/refY
page-type: web-api-instance-property
browser-compat: api.SVGMarkerElement.refY
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`refY`** của giao diện {{domxref("SVGMarkerElement")}} trả về một đối tượng {{domxref("SVGAnimatedLength")}} chứa giá trị của thuộc tính {{SVGattr("refY")}} của phần tử {{SVGElement("marker")}}.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedLength")}}. Thuộc tính `baseVal` của đối tượng này trả về một {{domxref("SVGLength")}}, giá trị của nó trả về `refY`.

## Ví dụ

Thuộc tính `markerWidth` trả về một {{domxref("SVGAnimatedLength")}} chứa một {{domxref("SVGLength")}} với giá trị của thuộc tính {{SVGattr("refY")}}.

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
      orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>
  </defs>
</svg>
```

```js
let marker = document.getElementById("arrow");
console.log(marker.refY.baseVal.value); // 5
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
