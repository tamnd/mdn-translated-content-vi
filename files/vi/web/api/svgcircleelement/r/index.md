---
title: "SVGCircleElement: thuộc tính r"
short-title: r
slug: Web/API/SVGCircleElement/r
page-type: web-api-instance-property
browser-compat: api.SVGCircleElement.r
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`r`** của giao diện {{domxref("SVGCircleElement")}} phản ánh thuộc tính {{SVGAttr("r")}} của phần tử {{SVGElement("circle")}} và qua đó xác định bán kính của hình tròn.

Nếu không được chỉ định, hiệu ứng sẽ như thể giá trị được đặt thành `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}} đại diện cho bán kính của hình tròn.

## Ví dụ

### SVG

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 100 100"
  width="200"
  height="200">
  <circle r="50" fill="gold" id="circle" />
</svg>
```

### JavaScript

```js
const circle = document.getElementById("circle");
console.log(circle.r);
```

{{EmbedLiveSample("Examples", "200", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGCircleElement.cx")}}
- {{domxref("SVGCircleElement.cy")}}
