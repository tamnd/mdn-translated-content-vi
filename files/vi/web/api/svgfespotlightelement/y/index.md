---
title: "SVGFESpotLightElement: y property"
short-title: y
slug: Web/API/SVGFESpotLightElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFESpotLightElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFESpotLightElement")}} mô tả tọa độ dọc của vị trí của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedNumber")}}.

Nó phản ánh thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("feSpotLight")}}, có thể được sử dụng để xác định nguồn sáng trong hiệu ứng spotlight. Thuộc tính là [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

```js
const feSpotLight = document.querySelector("feSpotLight");
const topPosition = feSpotLight.y;
console.log(topPosition.baseVal.value); // the `y` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFESpotLightElement.x")}}
- {{domxref("SVGFESpotLightElement.z")}}
- {{domxref("SVGFEDistantLightElement")}}
- {{domxref("SVGFEPointLightElement")}}
