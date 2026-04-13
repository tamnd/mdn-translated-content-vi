---
title: "SVGFilterElement: width property"
short-title: width
slug: Web/API/SVGFilterElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFilterElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFilterElement")}} mô tả kích thước theo chiều ngang của bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("filter")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối so với chiều rộng của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const filter = document.querySelector("filter");
const horizontalSize = filter.width;
console.log(horizontalSize.baseVal.value); // giá trị `width`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [SVG tutorial: Filter effects](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
- [SVG Filter primitive attributes](/en-US/docs/Web/SVG/Reference/Attribute#filters_attributes)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
