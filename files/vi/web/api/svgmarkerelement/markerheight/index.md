---
title: "SVGMarkerElement: markerHeight property"
short-title: markerHeight
slug: Web/API/SVGMarkerElement/markerHeight
page-type: web-api-instance-property
browser-compat: api.SVGMarkerElement.markerHeight
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`markerHeight`** của giao diện {{domxref("SVGMarkerElement")}} trả về một đối tượng {{domxref("SVGAnimatedLength")}} chứa chiều cao của khung nhìn {{SVGElement("marker")}} được định nghĩa bởi thuộc tính {{SVGattr("markerHeight")}}.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedLength")}}. Thuộc tính `baseVal` của đối tượng này trả về một {{domxref("SVGLength")}}, giá trị của nó trả về `height`.

## Ví dụ

Thuộc tính `markerHeight` trả về một {{domxref("SVGAnimatedLength")}} chứa một {{domxref("SVGLength")}} với giá trị của thuộc tính {{SVGattr("markerHeight")}}.

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
console.log(marker.markerHeight.baseVal.value); // 6
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
