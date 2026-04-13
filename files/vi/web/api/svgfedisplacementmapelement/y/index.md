---
title: "SVGFEDisplacementMapElement: y property"
short-title: y
slug: Web/API/SVGFEDisplacementMapElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFEDisplacementMapElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFEDisplacementMapElement")}} mô tả tọa độ dọc của vị trí một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("feDisplacementMap")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). Giá trị `<coordinate>` là độ dài trong hệ tọa độ người dùng, là khoảng cách đã cho từ gốc của bộ lọc dọc theo trục y. Nếu thuộc tính `y` là giá trị phần trăm, giá trị thuộc tính tương đối với chiều cao của vùng bộ lọc theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feDisplacementMap = document.querySelector("feDisplacementMap");
const topPosition = feDisplacementMap.y;
console.log(topPosition.baseVal.value); // the `y` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEDisplacementMapElement.x")}}
- {{domxref("SVGFEImageElement")}} API and {{SVGElement("feImage")}} element
- {{domxref("SVGFETurbulenceElement")}} API and {{SVGElement("feTurbulence")}} element
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
