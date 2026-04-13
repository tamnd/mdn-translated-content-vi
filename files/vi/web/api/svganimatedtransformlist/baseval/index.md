---
title: Thuộc tính SVGAnimatedTransformList.baseVal
short-title: baseVal
slug: Web/API/SVGAnimatedTransformList/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedTransformList.baseVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`baseVal`** của giao diện {{domxref("SVGAnimatedTransformList")}} đại diện cho giá trị không hoạt hình của thuộc tính `transform` của một phần tử SVG.

Thuộc tính này phản ánh thuộc tính {{SVGAttr("transform")}} của phần tử SVG, thuộc tính {{SVGAttr("gradientTransform")}} của phần tử {{SVGElement("linearGradient")}} hoặc {{SVGElement("radialGradient")}}, hoặc thuộc tính {{SVGAttr("patternTransform")}} của phần tử {{SVGElement("pattern")}} dưới dạng {{ domxref("SVGTransformList") }} chỉ đọc, cung cấp quyền truy cập vào {{ domxref("SVGTransform") }} tĩnh cho mỗi hàm biến đổi được đặt trên phần tử SVG.

## Giá trị

Một đối tượng {{domxref("SVGTransformList")}} đại diện cho giá trị hiện tại, không hoạt hình của thuộc tính `transform`.

## Ví dụ

```js
// Lấy phần tử hình chữ nhật
const rect = document.querySelector("rect");

// Truy cập danh sách biến đổi không hoạt hình của phần tử
const baseTransforms = rect.transform.baseVal;

// Ghi các biến đổi cơ sở ra console
console.dir(baseTransforms);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransformList")}}
- {{domxref("SVGTransform")}}
