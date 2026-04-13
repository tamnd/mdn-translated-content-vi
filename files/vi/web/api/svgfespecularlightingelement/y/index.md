---
title: "SVGFESpecularLightingElement: y property"
short-title: y
slug: Web/API/SVGFESpecularLightingElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFESpecularLightingElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFESpecularLightingElement")}} mô tả tọa độ dọc của vị trí của một bộ lọc SVG nguyên thủy dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("feSpecularLighting")}}, phần tử chiếu sáng đồ họa nguồn sử dụng kênh alpha như một bản đồ va chạm. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng, là khoảng cách đã cho tính từ gốc tọa độ của bộ lọc theo trục y. Nếu thuộc tính `y` là giá trị phần trăm, giá trị thuộc tính tương đối với chiều cao của vùng bộ lọc tính theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feSpecularLighting = document.querySelector("feSpecularLighting");
const topPosition = feSpecularLighting.y;
console.log(topPosition.baseVal.value); // giá trị `y`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFESpecularLightingElement.x")}}
- Kiểu dữ liệu CSS {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}
