---
title: "SVGPolylineElement: thuộc tính points"
short-title: points
slug: Web/API/SVGPolylineElement/points
page-type: web-api-instance-property
browser-compat: api.SVGPolylineElement.points
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`points`** của giao diện {{domxref("SVGPolylineElement")}} phản ánh giá trị cơ sở (tức là tĩnh) của thuộc tính {{SVGAttr("points")}} của phần tử. Các thay đổi thông qua đối tượng {{DOMxRef("SVGPointList")}} được phản ánh trong thuộc tính {{SVGAttr("points")}} và ngược lại.

## Giá trị

Một đối tượng {{DOMxRef("SVGPointList")}}.

## Ví dụ

### Truy cập thuộc tính `points`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <polyline
    id="myPolyline"
    points="100,10 150,50 100,90 50,50"
    fill="none"
    stroke="blue"
    stroke-width="4" />
</svg>
```

```js
const polylineElement = document.getElementById("myPolyline");

// Truy cập thuộc tính points
console.dir(polylineElement.points); // Đầu ra: đối tượng SVGPointList chứa các điểm (100,10), (150,50), (100,90), (50,50)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
