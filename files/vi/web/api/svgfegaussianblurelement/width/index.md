---
title: "SVGFEGaussianBlurElement: width property"
short-title: width
slug: Web/API/SVGFEGaussianBlurElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFEGaussianBlurElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFEGaussianBlurElement")}} mô tả kích thước theo chiều ngang của một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("feGaussianBlur")}}, phần tử này làm mờ ảnh đầu vào. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều rộng của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feGaussianBlur = document.querySelector("feGaussianBlur");
const horizontalSize = feGaussianBlur.width;
console.log(horizontalSize.baseVal.value); // the `width` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEGaussianBlurElement.height")}}
- [SVG filter tutorial](/en-US/docs/Web/SVG/Guides/SVG_filters)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("filter-function/blur", "blur()")}} function
- [CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects) module- CSS {{cssxref("mix-blend-mode")}} property
