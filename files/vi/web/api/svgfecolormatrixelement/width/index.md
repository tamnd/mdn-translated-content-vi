---
title: "SVGFEColorMatrixElement: width property"
short-title: width
slug: Web/API/SVGFEColorMatrixElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFEColorMatrixElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFEColorMatrixElement")}} mô tả kích thước ngang của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính filter primitive {{SVGAttr("width")}} của phần tử {{SVGElement("feColorMatrix")}}. Filter `<feColorMatrix>` áp dụng phép biến đổi ma trận trên các giá trị màu {{glossary("RGB")}} và {{glossary("alpha")}}. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều rộng của vùng filter. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài trong đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feColorMatrix = document.querySelector("feColorMatrix");
const horizontalSize = feColorMatrix.width;
console.log(horizontalSize.baseVal.value); // the `width` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEColorMatrixElement.height")}}
- Kiểu dữ liệu CSS {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}
- [Hiệu ứng CSS filter](/en-US/docs/Web/CSS/Guides/Filter_effects)
- Phần tử SVG {{SVGElement("filter")}}, thuộc tính SVG {{SVGAttr("filter")}} trong [SVG](/en-US/docs/Web/SVG)
- [Áp dụng hiệu ứng SVG vào nội dung HTML](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
