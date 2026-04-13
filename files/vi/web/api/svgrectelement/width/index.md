---
title: "SVGRectElement: width property"
short-title: width
slug: Web/API/SVGRectElement/width
page-type: web-api-instance-property
browser-compat: api.SVGRectElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGRectElement")}} mô tả kích thước theo chiều ngang của hình chữ nhật SVG dưới dạng {{domxref("SVGAnimatedLength")}}. Độ dài tính theo đơn vị hệ tọa độ người dùng dọc theo trục x. Cú pháp của nó giống với cú pháp của [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length).

Thuộc tính này phản ánh thuộc tính trình bày {{SVGAttr("width")}} của phần tử {{SVGElement("rect")}}. Thuộc tính CSS {{cssxref("width")}} được ưu tiên hơn thuộc tính trình bày `width` của SVG, vì vậy giá trị có thể không phản ánh kích thước thực tế của phần tử. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const rectangle = document.querySelector("rect");
const rectWidth = rectangle.width;
console.log(rectWidth.baseVal.value); // giá trị `width`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMXref("DOMRect.width")}}
- {{domxref("SVGRectElement.height")}}
