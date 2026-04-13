---
title: "SVGFESpotLightElement: z property"
short-title: z
slug: Web/API/SVGFESpotLightElement/z
page-type: web-api-instance-property
browser-compat: api.SVGFESpotLightElement.z
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`z`** của giao diện {{domxref("SVGFESpotLightElement")}} mô tả giá trị trục Z của vị trí của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedNumber")}}. Trục Z dương hướng về phía người xem nội dung.

Nó phản ánh thuộc tính {{SVGAttr("z")}} của phần tử {{SVGElement("feSpotLight")}}, có thể được sử dụng để xác định nguồn sáng trong hiệu ứng spotlight. Thuộc tính là [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

```js
const feSpotLight = document.querySelector("feSpotLight");
const zVal = feSpotLight.z;
console.log(zVal.baseVal.value); // the `z` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFESpotLightElement.x")}}
- {{domxref("SVGFESpotLightElement.y")}}
- {{domxref("SVGFEDistantLightElement")}}
- {{domxref("SVGFEPointLightElement")}}
