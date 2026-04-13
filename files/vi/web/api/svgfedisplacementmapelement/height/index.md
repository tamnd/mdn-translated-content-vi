---
title: "SVGFEDisplacementMapElement: height property"
short-title: height
slug: Web/API/SVGFEDisplacementMapElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFEDisplacementMapElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFEDisplacementMapElement")}} mô tả kích thước theo chiều dọc của một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("feDisplacementMap")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều cao của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feDisplacementMap = document.querySelector("feDisplacementMap");
const verticalSize = feDisplacementMap.height;
console.log(verticalSize.baseVal.value); // the `height` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEDisplacementMapElement.width")}}
- {{domxref("SVGFEImageElement")}} API and {{SVGElement("feImage")}} element
- {{domxref("SVGFETurbulenceElement")}} API and {{SVGElement("feTurbulence")}} element
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
