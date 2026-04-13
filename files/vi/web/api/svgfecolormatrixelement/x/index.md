---
title: "SVGFEColorMatrixElement: x property"
short-title: x
slug: Web/API/SVGFEColorMatrixElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEColorMatrixElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEColorMatrixElement")}} mô tả tọa độ ngang của vị trí của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh giá trị thuộc tính filter primitive {{SVGAttr("x")}} của phần tử {{SVGElement("feColorMatrix")}}. Filter `<feColorMatrix>` áp dụng phép biến đổi ma trận trên các giá trị màu {{glossary("RGB")}} và {{glossary("alpha")}}. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feColorMatrix = document.querySelector("feColorMatrix");
const leftPosition = feColorMatrix.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEColorMatrixElement.y")}}
- Kiểu dữ liệu CSS {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}
- [Hiệu ứng CSS filter](/en-US/docs/Web/CSS/Guides/Filter_effects)
- Phần tử SVG {{SVGElement("filter")}}, thuộc tính SVG {{SVGAttr("filter")}} trong [SVG](/en-US/docs/Web/SVG)
- [Áp dụng hiệu ứng SVG vào nội dung HTML](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
