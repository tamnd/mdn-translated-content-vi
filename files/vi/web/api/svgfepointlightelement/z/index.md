---
title: "SVGFEPointLightElement: thuộc tính z"
short-title: z
slug: Web/API/SVGFEPointLightElement/z
page-type: web-api-instance-property
browser-compat: api.SVGFEPointLightElement.z
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`z`** của giao diện {{domxref("SVGFEPointLightElement")}} mô tả giá trị trục z của vị trí của bộ lọc SVG dưới dạng {{domxref("SVGAnimatedNumber")}}. Trục Z dương hướng ra phía người xem nội dung.

Nó phản ánh thuộc tính {{SVGAttr("z")}} của phần tử {{SVGElement("fePointLight")}}, có thể được sử dụng để xác định nguồn sáng trong hiệu ứng đèn điểm. Thuộc tính là [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

```js
const fePointLight = document.querySelector("fePointLight");
const zVal = fePointLight.z;
console.log(zVal.baseVal.value); // the `z` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEPointLightElement.x")}}
- {{domxref("SVGFEPointLightElement.y")}}
- {{domxref("SVGFEDistantLightElement")}}
- {{domxref("SVGFESpotLightElement")}}
