---
title: "SVGSVGElement: thuộc tính y"
short-title: y
slug: Web/API/SVGSVGElement/y
page-type: web-api-instance-property
browser-compat: api.SVGSVGElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGSVGElement")}} mô tả tọa độ thẳng đứng của vị trí SVG đó dưới dạng {{domxref("SVGAnimatedLength")}}. Khi một {{SVGElement("svg")}} được lồng trong một `<svg>` khác, tọa độ thẳng đứng là một độ dài trong hệ tọa độ người dùng, là khoảng cách từ gốc của hệ tọa độ người dùng dọc theo trục y. Cú pháp của nó giống với [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length).

Nó phản ánh thuộc tính hình học {{SVGAttr("y")}} của phần tử {{SVGElement("svg")}}. Giá trị mặc định là `0`. Thuộc tính `y` không có hiệu lực trên các phần tử `<svg>` ngoài cùng; chỉ có hiệu lực trên các phần tử được lồng. Thuộc tính CSS {{cssxref("y")}} có độ ưu tiên cao hơn thuộc tính `y` của phần tử `<svg>`, vì vậy giá trị có thể không phản ánh giao diện của phần tử.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const svg = document.querySelector("svg");
const topPosition = svg.y;
console.dir(leftPosition.baseVal.value); // giá trị `y`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.x")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
