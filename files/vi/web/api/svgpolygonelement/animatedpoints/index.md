---
title: "SVGPolygonElement: thuộc tính animatedPoints"
short-title: animatedPoints
slug: Web/API/SVGPolygonElement/animatedPoints
page-type: web-api-instance-property
browser-compat: api.SVGPolygonElement.animatedPoints
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`animatedPoints`** của giao diện {{domxref("SVGPolygonElement")}} phản ánh giá trị hoạt hình của thuộc tính {{SVGAttr("points")}} của phần tử. Nếu thuộc tính {{SVGAttr("points")}} không đang được hoạt hình, nó chứa giá trị tương tự như thuộc tính `points`.

## Giá trị

Một đối tượng {{DOMxRef("SVGPointList")}}.

## Ví dụ

### Truy cập thuộc tính `animatedPoints`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <polygon id="myPolygon" points="100,10 150,50 100,90 50,50" fill="blue">
    <animate
      attributeName="points"
      values="100,10 150,50 100,90 50,50; 150,10 200,50 150,90 100,50"
      dur="2s"
      repeatCount="indefinite" />
  </polygon>
</svg>
```

```js
const polygonElement = document.getElementById("myPolygon");

// Truy cập thuộc tính animatedPoints
console.dir(polygonElement.animatedPoints); // Đầu ra: đối tượng SVGPointList
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
