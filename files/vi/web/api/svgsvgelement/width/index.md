---
title: "SVGSVGElement: thuộc tính width"
short-title: width
slug: Web/API/SVGSVGElement/width
page-type: web-api-instance-property
browser-compat: api.SVGSVGElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGSVGElement")}} mô tả kích thước nằm ngang của phần tử dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("svg")}}, có thể không phải là chiều rộng kết xuất của SVG.

Thuộc tính CSS {{cssxref("width")}} có độ ưu tiên cao hơn thuộc tính `width` của phần tử `<svg>`, vì vậy giá trị có thể không phản ánh giao diện của phần tử. Nếu cả thuộc tính {{SVGAttr("viewBox")}} và `width` đều bị bỏ qua, thuộc tính `width` phản ánh chiều rộng thực tế.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const svg = document.querySelector("svg");
const inlineSize = svg.width;
console.dir(inlineSize.baseVal.value); // giá trị `width`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.viewBox")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
