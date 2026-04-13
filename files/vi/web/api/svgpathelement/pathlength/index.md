---
title: "SVGPathElement: pathLength property"
short-title: pathLength
slug: Web/API/SVGPathElement/pathLength
page-type: web-api-instance-property
browser-compat: api.SVGPathElement.pathLength
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`pathLength`** của giao diện {{domxref("SVGPathElement")}} phản ánh thuộc tính {{SVGAttr("pathLength")}} của phần tử {{SVGelement("path")}} đã cho.

## Giá trị

Một {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `pathLength`

```html
<svg width="200" height="100">
  <path id="myPath" d="M 0,30 h100" pathLength="50" />
</svg>
```

```js
const pathElement = document.getElementById("myPath");

// Truy cập thuộc tính pathLength
const animatedNumber = pathElement.pathLength;

// Giá trị cơ sở của thuộc tính pathLength
console.log(animatedNumber.baseVal); // Output: 100
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGGeometryElement.pathLength")}}
- {{SVGAttr("pathLength")}}
- {{domxref("SVGAnimatedLength")}}
