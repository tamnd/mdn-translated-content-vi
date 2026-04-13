---
title: "SVGCircleElement: thuộc tính cy"
short-title: cy
slug: Web/API/SVGCircleElement/cy
page-type: web-api-instance-property
browser-compat: api.SVGCircleElement.cy
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`cy`** của giao diện {{domxref("SVGCircleElement")}} phản ánh thuộc tính {{SVGAttr("cy")}} của phần tử {{SVGElement("circle")}} và qua đó xác định tọa độ y của tâm hình tròn.

Nếu không được chỉ định, hiệu ứng sẽ như thể giá trị được đặt thành `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}} đại diện cho tọa độ y của tâm hình tròn.

## Ví dụ

### SVG

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 100 100"
  width="200"
  height="200">
  <circle cx="50" cy="50" r="50" fill="gold" id="circle" />
</svg>
```

### JavaScript

```js
const circle = document.getElementById("circle");
console.log(circle.cy);
```

{{EmbedLiveSample("Examples", "200", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGCircleElement.cx")}}
- {{domxref("SVGCircleElement.r")}}
