---
title: "SVGMarkerElement: orientAngle property"
short-title: orientAngle
slug: Web/API/SVGMarkerElement/orientAngle
page-type: web-api-instance-property
browser-compat: api.SVGMarkerElement.orientAngle
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`orientAngle`** của giao diện {{domxref("SVGMarkerElement")}} trả về một đối tượng {{domxref("SVGAnimatedAngle")}} chứa góc của thuộc tính {{SVGattr("orient")}}.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedAngle")}}. Thuộc tính `baseVal` của đối tượng này trả về một {{domxref("SVGAngle")}}, giá trị của nó trả về `angle`.

## Ví dụ

Thuộc tính `orientAngle` trả về một {{domxref("SVGAnimatedAngle")}} chứa một {{domxref("SVGAngle")}} với góc được đặt bởi thuộc tính {{SVGattr("orient")}} dưới dạng một số biểu thị số độ mà điểm đánh dấu được xoay.

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
      orient=".5turn">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>
  </defs>
</svg>
```

```js
let marker = document.getElementById("arrow");
console.log(marker.orientAngle.baseVal.value); // 180 as .5turn is 180deg.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
