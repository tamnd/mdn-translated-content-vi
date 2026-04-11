---
title: "SVGFECompositeElement: height property"
short-title: height
slug: Web/API/SVGFECompositeElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFECompositeElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFECompositeElement")}} mô tả kích thước theo chiều dọc của một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính lọc {{SVGAttr("height")}} của phần tử {{SVGElement("feComposite")}}. Phần tử lọc SVG `<feComposite>` kết hợp hai ảnh đầu vào bằng thao tác kết hợp Porter-Duff. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều cao của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feComposite = document.querySelector("feComposite");
const verticalSize = feComposite.height;
console.log(verticalSize.baseVal.value); // the `height` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFECompositeElement.width")}}
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
