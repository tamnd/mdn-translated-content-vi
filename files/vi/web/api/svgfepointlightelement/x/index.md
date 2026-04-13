---
title: "SVGFEPointLightElement: thuộc tính x"
short-title: x
slug: Web/API/SVGFEPointLightElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEPointLightElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEPointLightElement")}} mô tả tọa độ ngang của vị trí của bộ lọc SVG dưới dạng {{domxref("SVGAnimatedNumber")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("fePointLight")}}, có thể được sử dụng để xác định nguồn sáng trong hiệu ứng đèn điểm. Thuộc tính là [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

```js
const fePointLight = document.querySelector("fePointLight");
const leftPosition = fePointLight.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEPointLightElement.y")}}
- {{domxref("SVGFEPointLightElement.z")}}
- {{domxref("SVGFEDistantLightElement")}}
- {{domxref("SVGFESpotLightElement")}}
