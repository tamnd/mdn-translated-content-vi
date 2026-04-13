---
title: "SVGFEMergeElement: thuộc tính height"
short-title: height
slug: Web/API/SVGFEMergeElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFEMergeElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFEMergeElement")}} mô tả kích thước dọc của một filter primitive SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("feMerge")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) so với chiều cao của vùng filter. Giá trị mặc định là `100%`. Giá trị thuộc tính là một độ dài trong đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feMerge = document.querySelector("feMerge");
const verticalSize = feMerge.height;
console.log(verticalSize.baseVal.value); // the `height` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEMergeElement.width")}}
