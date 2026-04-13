---
title: "SVGFESpecularLightingElement: height property"
short-title: height
slug: Web/API/SVGFESpecularLightingElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFESpecularLightingElement.height
---

{{APIRef("SVG")}}

Thuộc tính **`height`** chỉ đọc của giao diện {{domxref("SVGFESpecularLightingElement")}} mô tả kích thước dọc của một phần tử bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("feSpecularLighting")}}, phần tử này chiếu sáng đồ họa nguồn bằng cách dùng kênh alpha làm bản đồ nổi. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối so với chiều cao của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feSpecularLighting = document.querySelector("feSpecularLighting");
const verticalSize = feSpecularLighting.height;
console.log(verticalSize.baseVal.value); // the `height` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFESpecularLightingElement.width")}}
- {{domxref("SVGFEDiffuseLightingElement")}}
- CSS {{cssxref("lighting-color")}} property
