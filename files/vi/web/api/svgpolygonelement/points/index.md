---
title: "SVGPolygonElement: thuộc tính points"
short-title: points
slug: Web/API/SVGPolygonElement/points
page-type: web-api-instance-property
browser-compat: api.SVGPolygonElement.points
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`points`** của giao diện {{domxref("SVGPolygonElement")}} phản ánh giá trị cơ sở (tức là tĩnh) của thuộc tính {{SVGAttr("points")}} của phần tử. Các thay đổi thông qua đối tượng {{DOMxRef("SVGPointList")}} được phản ánh trong thuộc tính {{SVGAttr("points")}} và ngược lại.

## Giá trị

Một đối tượng {{DOMxRef("SVGPointList")}}.

## Ví dụ

### Truy cập thuộc tính `points`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <polygon id="myPolygon" points="100,10 150,50 100,90 50,50" fill="blue" />
</svg>
```

```js
const polygonElement = document.getElementById("myPolygon");

// Truy cập thuộc tính points
console.dir(polygonElement.points); // Đầu ra: đối tượng SVGPointList chứa các điểm (100,10), (150,50), (100,90), (50,50)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
