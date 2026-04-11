---
title: "SVGMarkerElement: viewBox property"
short-title: viewBox
slug: Web/API/SVGMarkerElement/viewBox
page-type: web-api-instance-property
browser-compat: api.SVGMarkerElement.viewBox
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`viewBox`** của giao diện {{domxref("SVGMarkerElement")}} trả về một đối tượng {{domxref("SVGAnimatedRect")}} chứa các giá trị được đặt bởi thuộc tính {{SVGattr("viewBox")}} trên phần tử {{SVGElement("marker")}}.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedRect")}}. Thuộc tính `baseVal` của đối tượng này trả về một đối tượng {{domxref("SVGRect")}}, từ đó có thể lấy tọa độ `x` và `y`, cũng như `width` và `height` của thuộc tính {{SVGattr("viewBox")}} của phần tử {{SVGElement("marker")}}.

## Ví dụ

Ví dụ này minh hoạ cách trả về giá trị `width` được đặt cho thuộc tính {{SVGattr("viewBox")}} của phần tử {{SVGElement("marker")}}.

```html
<svg id="svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker
      id="arrow"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      preserveAspectRatio="xMidYMid meet"
      markerWidth="6"
      markerHeight="6"
      orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>
  </defs>
</svg>
```

```js
const marker = document.getElementById("arrow");
console.log(marker.viewBox.baseVal.width); // 10
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
