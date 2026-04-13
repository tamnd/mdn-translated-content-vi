---
title: "SVGFESpecularLightingElement: width property"
short-title: width
slug: Web/API/SVGFESpecularLightingElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFESpecularLightingElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFESpecularLightingElement")}} mô tả kích thước ngang của một bộ lọc SVG nguyên thủy dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("feSpecularLighting")}}, phần tử chiếu sáng đồ họa nguồn sử dụng kênh alpha như một bản đồ va chạm. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều rộng vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feSpecularLighting = document.querySelector("feSpecularLighting");
const horizontalSize = feSpecularLighting.width;
console.log(horizontalSize.baseVal.value); // giá trị `width`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFESpecularLightingElement.height")}}
- {{domxref("SVGFEDiffuseLightingElement")}}
- Thuộc tính CSS {{cssxref("lighting-color")}}
