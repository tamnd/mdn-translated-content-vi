---
title: "SVGRectElement: x property"
short-title: x
slug: Web/API/SVGRectElement/x
page-type: web-api-instance-property
browser-compat: api.SVGRectElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGRectElement")}} mô tả tọa độ ngang của vị trí hình chữ nhật SVG dưới dạng {{domxref("SVGAnimatedLength")}}. `<coordinate>` là độ dài trong hệ tọa độ người dùng, xác định khoảng cách từ gốc tọa độ đến vị trí dọc theo trục x. Cú pháp của nó giống với cú pháp của [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length).

Thuộc tính này phản ánh giá trị thuộc tính hình học {{SVGAttr("x")}} của phần tử {{SVGElement("rect")}}. Thuộc tính CSS {{cssxref("x")}} được ưu tiên hơn thuộc tính hình học `x` của SVG, vì vậy giá trị có thể không phản ánh diện mạo của phần tử. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const rectangle = document.querySelector("rect");
const leftPosition = rectangle.x;
console.log(leftPosition.baseVal.value); // giá trị `x`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMXref("DOMRect.x")}}
- {{domxref("SVGRectElement.y")}}
