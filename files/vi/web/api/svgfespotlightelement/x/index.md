---
title: "SVGFESpotLightElement: x property"
short-title: x
slug: Web/API/SVGFESpotLightElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFESpotLightElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFESpotLightElement")}} mô tả tọa độ ngang của vị trí của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedNumber")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("feSpotLight")}}, có thể được sử dụng để xác định nguồn sáng trong hiệu ứng spotlight. Thuộc tính là [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

```js
const feSpotLight = document.querySelector("feSpotLight");
const leftPosition = feSpotLight.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFESpotLightElement.y")}}
- {{domxref("SVGFESpotLightElement.z")}}
- {{domxref("SVGFEDistantLightElement")}}
- {{domxref("SVGFEPointLightElement")}}
