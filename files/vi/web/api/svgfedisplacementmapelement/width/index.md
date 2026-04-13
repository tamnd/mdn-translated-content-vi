---
title: "SVGFEDisplacementMapElement: width property"
short-title: width
slug: Web/API/SVGFEDisplacementMapElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFEDisplacementMapElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFEDisplacementMapElement")}} mô tả kích thước theo chiều ngang của một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("feDisplacementMap")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều rộng của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feDisplacementMap = document.querySelector("feDisplacementMap");
const horizontalSize = feDisplacementMap.width;
console.log(horizontalSize.baseVal.value); // the `width` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEDisplacementMapElement.height")}}
- {{domxref("SVGFEImageElement")}} API and {{SVGElement("feImage")}} element
- {{domxref("SVGFETurbulenceElement")}} API and {{SVGElement("feTurbulence")}} element
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
