---
title: "SVGFEDropShadowElement: height property"
short-title: height
slug: Web/API/SVGFEDropShadowElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFEDropShadowElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFEDropShadowElement")}} mô tả kích thước dọc của một bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính bộ lọc {{SVGAttr("height")}}. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối so với chiều cao của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feDropShadow = document.querySelector("feDropShadow");
const verticalSize = feDropShadow.height;
console.log(verticalSize.baseVal.value); // the `height` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEDropShadowElement.width")}}
- CSS {{cssxref("filter-function/drop-shadow", "drop-shadow()")}} function
- CSS {{cssxref("box-shadow")}} property
- CSS {{cssxref("text-shadow")}} property
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
