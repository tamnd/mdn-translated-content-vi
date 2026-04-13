---
title: "SVGFEMergeElement: thuộc tính width"
short-title: width
slug: Web/API/SVGFEMergeElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFEMergeElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFEMergeElement")}} mô tả kích thước ngang của một filter primitive SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("feMerge")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) so với chiều rộng của vùng filter. Giá trị mặc định là `100%`. Giá trị thuộc tính là một độ dài trong đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feMerge = document.querySelector("feMerge");
const horizontalSize = feMerge.width;
console.log(horizontalSize.baseVal.value); // the `width` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEMergeElement.height")}}
