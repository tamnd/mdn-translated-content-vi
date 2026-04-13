---
title: "SVGAnimatedNumberList: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedNumberList/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedNumberList.baseVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`baseVal`** của giao diện {{domxref("SVGAnimatedNumberList")}} đại diện cho giá trị cơ sở (không hoạt hình) của một thuộc tính có thể hoạt hình chấp nhận danh sách các giá trị [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number).

Thuộc tính này phản ánh thuộc tính [`viewBox`](/en-US/docs/Web/SVG/Reference/Attribute/viewBox) của phần tử [`<svg>`](/en-US/docs/Web/SVG/Reference/Element/svg), thuộc tính [`values`](/en-US/docs/Web/SVG/Reference/Attribute/values#fecolormatrix) của phần tử [`feColorMatrix`](/en-US/docs/Web/SVG/Reference/Element/feColorMatrix) và thuộc tính {{SVGAttr("points")}} của phần tử {{SVGElement("rect")}}, {{SVGElement("polygon")}}, hoặc {{SVGElement("polyline")}} dưới dạng {{domxref("SVGNumberList")}} chỉ đọc, cung cấp quyền truy cập vào danh sách tĩnh các điểm được xác định bởi thuộc tính {{SVGAttr("points")}}.

## Giá trị

Một đối tượng {{domxref("SVGNumberList")}} đại diện cho giá trị cơ sở của thuộc tính. Danh sách chứa một hoặc nhiều số tương ứng với các giá trị số riêng lẻ được chỉ định trong thuộc tính.

## Ví dụ

```js
const rect = document.querySelector("rect");

// Đặt thuộc tính 'points' có thể hoạt hình với các giá trị số
rect.setAttribute("points", "10,10 20,10 20,20 10,20");

// Truy cập đối tượng SVGAnimatedNumberList
const points = rect.points;

// Sửa đổi giá trị cơ sở
points.baseVal = [10, 15, 25, 30];

// Xác minh giá trị thuộc tính được phản chiếu
console.log(rect.getAttribute("points")); // Đầu ra: "10,15 25,30"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
