---
title: "SVGSVGElement: thuộc tính height"
short-title: height
slug: Web/API/SVGSVGElement/height
page-type: web-api-instance-property
browser-compat: api.SVGSVGElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGSVGElement")}} mô tả kích thước thẳng đứng của phần tử dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("svg")}}, có thể không phải là chiều cao kết xuất của SVG.

Thuộc tính CSS {{cssxref("height")}} có độ ưu tiên cao hơn thuộc tính `height` của phần tử `<svg>`, vì vậy giá trị có thể không phản ánh giao diện của phần tử. Nếu cả thuộc tính {{SVGAttr("viewBox")}} và `height` đều bị bỏ qua, thuộc tính `height` phản ánh chiều cao thực tế.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const svg = document.querySelector("svg");
const verticalSize = svg.height;
console.dir(verticalSize.baseVal.value); // giá trị `height`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.viewBox")}}
- {{domxref("SVGSVGElement.width")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
