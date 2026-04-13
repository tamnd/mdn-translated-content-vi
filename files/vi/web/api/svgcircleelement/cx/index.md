---
title: "SVGCircleElement: thuộc tính cx"
short-title: cx
slug: Web/API/SVGCircleElement/cx
page-type: web-api-instance-property
browser-compat: api.SVGCircleElement.cx
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`cx`** của giao diện {{domxref("SVGCircleElement")}} phản ánh thuộc tính {{SVGAttr("cx")}} của phần tử {{SVGElement("circle")}} và qua đó xác định tọa độ x của tâm hình tròn.

Nếu không được chỉ định, hiệu ứng sẽ như thể giá trị được đặt thành `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}} đại diện cho tọa độ x của tâm hình tròn.

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
console.log(circle.cx);
```

{{EmbedLiveSample("Examples", "200", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGCircleElement.cy")}}
- {{domxref("SVGCircleElement.r")}}
