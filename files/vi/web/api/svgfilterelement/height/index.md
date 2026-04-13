---
title: "SVGFilterElement: height property"
short-title: height
slug: Web/API/SVGFilterElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFilterElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFilterElement")}} mô tả kích thước theo chiều dọc của bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("filter")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối so với chiều cao của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const filter = document.querySelector("filter");
const verticalSize = filter.height;
console.log(verticalSize.baseVal.value); // giá trị `height`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [SVG tutorial: Filter effects](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
- [SVG filter primitive attributes](/en-US/docs/Web/SVG/Reference/Attribute#filters_attributes)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
