---
title: "SVGFEDiffuseLightingElement: height property"
short-title: height
slug: Web/API/SVGFEDiffuseLightingElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFEDiffuseLightingElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFEDiffuseLightingElement")}} mô tả kích thước theo chiều dọc của một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("feDiffuseLighting")}}. Bộ lọc chiếu sáng ảnh bằng cách sử dụng kênh alpha làm bản đồ độ nổi. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều cao của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feDiffuseLighting = document.querySelector("feDiffuseLighting");
const verticalSize = feDiffuseLighting.height;
console.log(verticalSize.baseVal.value); // the `height` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEDiffuseLightingElement.width")}}
- {{domxref("SVGFESpecularLightingElement")}}
- {{SVGElement("feSpecularLighting")}}
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
