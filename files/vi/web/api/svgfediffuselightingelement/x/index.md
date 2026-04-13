---
title: "SVGFEDiffuseLightingElement: x property"
short-title: x
slug: Web/API/SVGFEDiffuseLightingElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEDiffuseLightingElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEDiffuseLightingElement")}} mô tả tọa độ ngang của vị trí một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("feDiffuseLighting")}}. Bộ lọc chiếu sáng ảnh bằng cách sử dụng kênh alpha làm bản đồ độ nổi. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). Giá trị `<coordinate>` là độ dài trong hệ tọa độ người dùng, là khoảng cách đã cho từ gốc của hệ tọa độ người dùng dọc theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính tương đối với chiều rộng của vùng bộ lọc theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feDiffuseLighting = document.querySelector("feDiffuseLighting");
const leftPosition = feDiffuseLighting.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEDiffuseLightingElement.y")}}
- {{domxref("SVGFESpecularLightingElement")}}
- {{SVGElement("feSpecularLighting")}}
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
