---
title: "SVGSVGElement: thuộc tính preserveAspectRatio"
short-title: preserveAspectRatio
slug: Web/API/SVGSVGElement/preserveAspectRatio
page-type: web-api-instance-property
browser-compat: api.SVGSVGElement.preserveAspectRatio
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`preserveAspectRatio`** của giao diện {{domxref("SVGSVGElement")}} phản ánh thuộc tính {{SVGAttr("preserveAspectRatio")}} của phần tử đã cho. Nó xác định cách nội dung của phần tử SVG nên được thu phóng để vừa với không gian đã cho, đồng thời duy trì tỉ lệ khung hình.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedPreserveAspectRatio")}}.

## Ví dụ

Với SVG sau, chúng ta có thể sử dụng thuộc tính `preserveAspectRatio` để lấy hành vi thu phóng cho phần tử SVG:

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 200 200"
  preserveAspectRatio="xMidYMid meet">
  <circle cx="100" cy="100" r="50" fill="blue" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `preserveAspectRatio`:

```js
const svgElement = document.querySelector("svg");

console.log(svgElement.preserveAspectRatio.baseVal); // output: SVGPreserveAspectRatio {align: 1, meetOrSlice: 1}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("preserveAspectRatio")}}
