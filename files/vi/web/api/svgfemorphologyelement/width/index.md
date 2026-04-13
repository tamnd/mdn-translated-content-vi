---
title: "SVGFEMorphologyElement: width property"
short-title: width
slug: Web/API/SVGFEMorphologyElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFEMorphologyElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFEMorphologyElement")}} mô tả kích thước theo chiều ngang của một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("feMorphology")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều rộng của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feMorphology = document.querySelector("feMorphology");
const horizontalSize = feMorphology.width;
console.log(horizontalSize.baseVal.value); // the `width` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEMorphologyElement.height")}}
