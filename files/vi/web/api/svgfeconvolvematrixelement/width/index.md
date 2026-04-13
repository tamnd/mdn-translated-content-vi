---
title: "SVGFEConvolveMatrixElement: width property"
short-title: width
slug: Web/API/SVGFEConvolveMatrixElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFEConvolveMatrixElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFEConvolveMatrixElement")}} mô tả kích thước theo chiều ngang của một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính lọc {{SVGAttr("width")}} của phần tử {{SVGElement("feConvolveMatrix")}}. Bộ lọc `<feConvolveMatrix>` áp dụng hiệu ứng tích chập ma trận, kết hợp các điểm ảnh trong ảnh đầu vào với các điểm ảnh lân cận để tạo ra các hiệu ứng tích chập như làm mờ, phát hiện cạnh, làm sắc nét, dập nổi hoặc vát mép. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều rộng của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feConvolveMatrix = document.querySelector("feConvolveMatrix");
const horizontalSize = feConvolveMatrix.width;
console.log(horizontalSize.baseVal.value); // the `width` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEConvolveMatrixElement.height")}}
- [CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects) module
- SVG {{SVGElement("filter")}} element, SVG {{SVGAttr("filter")}} attribute in [SVG](/en-US/docs/Web/SVG)
- [Applying SVG effects to HTML content](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
