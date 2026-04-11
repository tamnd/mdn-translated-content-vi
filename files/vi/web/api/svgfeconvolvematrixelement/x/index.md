---
title: "SVGFEConvolveMatrixElement: x property"
short-title: x
slug: Web/API/SVGFEConvolveMatrixElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEConvolveMatrixElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEConvolveMatrixElement")}} mô tả tọa độ ngang của vị trí một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh giá trị thuộc tính lọc {{SVGAttr("x")}} của phần tử {{SVGElement("feConvolveMatrix")}}. Bộ lọc `<feConvolveMatrix>` áp dụng hiệu ứng tích chập ma trận, kết hợp các điểm ảnh trong ảnh đầu vào với các điểm ảnh lân cận để tạo ra các hiệu ứng tích chập như làm mờ, phát hiện cạnh, làm sắc nét, dập nổi hoặc vát mép. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng biểu thị khoảng cách tính từ gốc tọa độ của hệ tọa độ người dùng theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính tương đối với chiều rộng của vùng bộ lọc tính theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feConvolveMatrix = document.querySelector("feConvolveMatrix");
const leftPosition = feConvolveMatrix.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEConvolveMatrixElement.y")}}
- [CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects) module
- SVG {{SVGElement("filter")}} element, SVG {{SVGAttr("filter")}} attribute in [SVG](/en-US/docs/Web/SVG)
- [Applying SVG effects to HTML content](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
