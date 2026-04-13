---
title: "SVGRectElement: y property"
short-title: y
slug: Web/API/SVGRectElement/y
page-type: web-api-instance-property
browser-compat: api.SVGRectElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGRectElement")}} mô tả tọa độ dọc của vị trí hình chữ nhật SVG dưới dạng {{domxref("SVGAnimatedLength")}}. `<coordinate>` là độ dài trong hệ tọa độ người dùng, xác định khoảng cách từ gốc tọa độ đến vị trí dọc theo trục y. Cú pháp của nó giống với cú pháp của [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length).

Thuộc tính này phản ánh giá trị thuộc tính hình học {{SVGAttr("y")}} của phần tử {{SVGElement("rect")}}. Thuộc tính CSS {{cssxref("y")}} được ưu tiên hơn thuộc tính `y` của SVG, vì vậy giá trị có thể không phản ánh diện mạo của phần tử. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const rectangle = document.querySelector("rect");
const topPosition = rectangle.y;
console.log(topPosition.baseVal.value); // giá trị `y`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMXref("DOMRect.y")}}
- {{domxref("SVGRectElement.x")}}
