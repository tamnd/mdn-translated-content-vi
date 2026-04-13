---
title: "SVGFESpecularLightingElement: x property"
short-title: x
slug: Web/API/SVGFESpecularLightingElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFESpecularLightingElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFESpecularLightingElement")}} mô tả tọa độ ngang của vị trí của một bộ lọc SVG nguyên thủy dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("feSpecularLighting")}}, phần tử chiếu sáng đồ họa nguồn sử dụng kênh alpha như một bản đồ va chạm. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng, là khoảng cách đã cho tính từ gốc tọa độ theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính tương đối với chiều rộng của vùng bộ lọc tính theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feSpecularLighting = document.querySelector("feSpecularLighting");
const leftPosition = feSpecularLighting.x;
console.log(leftPosition.baseVal.value); // giá trị `x`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFESpecularLightingElement.y")}}
- {{domxref("SVGFEDiffuseLightingElement")}}
- Thuộc tính CSS {{cssxref("lighting-color")}}
