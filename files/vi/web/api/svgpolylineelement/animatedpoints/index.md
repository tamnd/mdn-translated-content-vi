---
title: "SVGPolylineElement: thuộc tính animatedPoints"
short-title: animatedPoints
slug: Web/API/SVGPolylineElement/animatedPoints
page-type: web-api-instance-property
browser-compat: api.SVGPolylineElement.animatedPoints
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`animatedPoints`** của giao diện {{domxref("SVGPolylineElement")}} phản ánh giá trị hoạt hình của thuộc tính {{SVGAttr("points")}} của phần tử. Nếu thuộc tính {{SVGAttr("points")}} không đang được hoạt hình, nó chứa giá trị tương tự như thuộc tính `points`.

## Giá trị

Một đối tượng {{DOMxRef("SVGPointList")}}.

## Ví dụ

### Truy cập thuộc tính `animatedPoints`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <polyline
    id="myPolyline"
    points="100,10 150,50 100,90 50,50"
    fill="none"
    stroke="blue"
    stroke-width="4">
    <animate
      attributeName="points"
      values="100,10 150,50 100,90 50,50; 150,10 200,50 150,90 100,50"
      dur="2s"
      repeatCount="indefinite" />
  </polyline>
</svg>
```

```js
const polylineElement = document.getElementById("myPolyline");

// Truy cập thuộc tính animatedPoints
console.dir(polylineElement.animatedPoints); // Đầu ra: đối tượng SVGPointList
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
