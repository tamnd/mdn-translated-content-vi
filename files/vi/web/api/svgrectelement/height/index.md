---
title: "SVGRectElement: height property"
short-title: height
slug: Web/API/SVGRectElement/height
page-type: web-api-instance-property
browser-compat: api.SVGRectElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGRectElement")}} mô tả kích thước theo chiều dọc của hình chữ nhật SVG dưới dạng {{domxref("SVGAnimatedLength")}}. Độ dài tính theo đơn vị hệ tọa độ người dùng dọc theo trục y. Cú pháp của nó giống với cú pháp của [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length).

Thuộc tính này phản ánh thuộc tính trình bày {{SVGAttr("height")}} của phần tử {{SVGElement("rect")}}. Thuộc tính CSS {{cssxref("height")}} được ưu tiên hơn thuộc tính trình bày `height` của SVG, vì vậy giá trị có thể không phản ánh kích thước thực tế của phần tử. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const rectangle = document.querySelector("rect");
const rectHeight = rectangle.height;
console.log(rectHeight.baseVal.value); // giá trị `height`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMXref("DOMRect.height")}}
- {{domxref("SVGRectElement.width")}}
