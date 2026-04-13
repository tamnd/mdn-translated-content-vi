---
title: Thuộc tính SVGAnimatedTransformList.animVal
short-title: animVal
slug: Web/API/SVGAnimatedTransformList/animVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedTransformList.animVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`animVal`** của giao diện {{domxref("SVGAnimatedTransformList")}} đại diện cho giá trị hoạt hình của thuộc tính `transform` của một phần tử SVG.

Thuộc tính này phản ánh thuộc tính {{SVGAttr("transform")}} của phần tử SVG, thuộc tính {{SVGAttr("gradientTransform")}} của phần tử {{SVGElement("linearGradient")}} hoặc {{SVGElement("radialGradient")}}, hoặc thuộc tính {{SVGAttr("patternTransform")}} của phần tử {{SVGElement("pattern")}} dưới dạng {{ domxref("SVGTransformList") }} chỉ đọc, cung cấp quyền truy cập vào {{ domxref("SVGTransform") }} được cập nhật động cho mỗi hàm biến đổi trong quá trình hoạt hình. Nếu không có hoạt hình nào đang hoạt động, thuộc tính này sẽ trả về giá trị tương tự như `baseVal`.

## Giá trị

Một đối tượng {{domxref("SVGTransformList")}} phản ánh giá trị hoạt hình hiện tại của thuộc tính `transform`.

## Ví dụ

```js
// Lấy phần tử hình chữ nhật
const rect = document.querySelector("rect");

// Truy cập danh sách biến đổi hoạt hình (nếu có)
const animTransforms = rect.transform.animVal;

// Ghi các biến đổi hoạt hình ra console
console.dir(animTransforms);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransformList")}}
- {{domxref("SVGTransform")}}
