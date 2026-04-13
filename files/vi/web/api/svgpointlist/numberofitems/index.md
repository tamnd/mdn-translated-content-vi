---
title: "SVGPointList: numberOfItems property"
short-title: numberOfItems
slug: Web/API/SVGPointList/numberOfItems
page-type: web-api-instance-property
browser-compat: api.SVGPointList.numberOfItems
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`numberOfItems`** của giao diện {{domxref("SVGPointList")}} trả về số lượng phần tử trong danh sách.

## Giá trị

Số lượng phần tử trong danh sách.

## Ví dụ

Ví dụ sau cho thấy SVG chứa {{SVGElement("polyline")}} với năm cặp tọa độ. Thuộc tính `numberOfItems` trả về `5`.

```html
<svg id="svg" viewBox="-10 -10 120 120" xmlns="http://www.w3.org/2000/svg">
  <polyline
    id="example"
    stroke="black"
    fill="none"
    points="50,0 21,90 98,35 2,35 79,90" />
</svg>
```

```js
let example = document.getElementById("example");
console.log(example.points.numberOfItems); // 5
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
