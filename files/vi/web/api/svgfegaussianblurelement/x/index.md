---
title: "SVGFEGaussianBlurElement: x property"
short-title: x
slug: Web/API/SVGFEGaussianBlurElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEGaussianBlurElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEGaussianBlurElement")}} mô tả tọa độ ngang của vị trí một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("feGaussianBlur")}}, phần tử này làm mờ ảnh đầu vào. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). Giá trị `<coordinate>` là độ dài trong hệ tọa độ người dùng, là khoảng cách đã cho từ gốc của hệ tọa độ người dùng dọc theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính tương đối với chiều rộng của vùng bộ lọc theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feGaussianBlur = document.querySelector("feGaussianBlur");
const leftPosition = feGaussianBlur.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEGaussianBlurElement.y")}}
- [SVG filter tutorial](/en-US/docs/Web/SVG/Guides/SVG_filters)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("filter-function/blur", "blur()")}} function
- [CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects) module- CSS {{cssxref("mix-blend-mode")}} property
