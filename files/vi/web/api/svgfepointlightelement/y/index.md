---
title: "SVGFEPointLightElement: thuộc tính y"
short-title: y
slug: Web/API/SVGFEPointLightElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFEPointLightElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFEPointLightElement")}} mô tả tọa độ dọc của vị trí của bộ lọc SVG dưới dạng {{domxref("SVGAnimatedNumber")}}.

Nó phản ánh thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("fePointLight")}}, có thể được sử dụng để xác định nguồn sáng trong hiệu ứng đèn điểm. Thuộc tính là [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

```js
const fePointLight = document.querySelector("fePointLight");
const topPosition = fePointLight.y;
console.log(topPosition.baseVal.value); // the `y` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEPointLightElement.x")}}
- {{domxref("SVGFEPointLightElement.z")}}
- {{domxref("SVGFEDistantLightElement")}}
- {{domxref("SVGFESpotLightElement")}}
