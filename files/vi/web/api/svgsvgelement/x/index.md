---
title: "SVGSVGElement: thuộc tính x"
short-title: x
slug: Web/API/SVGSVGElement/x
page-type: web-api-instance-property
browser-compat: api.SVGSVGElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGSVGElement")}} mô tả tọa độ nằm ngang của vị trí SVG đó dưới dạng {{domxref("SVGAnimatedLength")}}. Khi một {{SVGElement("svg")}} được lồng trong một `<svg>` khác, tọa độ nằm ngang là một độ dài trong hệ tọa độ người dùng, là khoảng cách từ gốc của hệ tọa độ người dùng dọc theo trục x. Cú pháp của nó giống với [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length).

Nó phản ánh thuộc tính hình học {{SVGAttr("x")}} của phần tử {{SVGElement("svg")}}. Giá trị mặc định là `0`. Thuộc tính `x` không có hiệu lực trên các phần tử `<svg>` ngoài cùng; chỉ có hiệu lực trên các phần tử được lồng. Thuộc tính CSS {{cssxref("x")}} có độ ưu tiên cao hơn thuộc tính `x` của phần tử `<svg>`, vì vậy giá trị có thể không phản ánh giao diện của phần tử.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const svg = document.querySelector("svg");
const leftPosition = svg.x;
console.dir(leftPosition.baseVal.value); // giá trị `x`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.y")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
