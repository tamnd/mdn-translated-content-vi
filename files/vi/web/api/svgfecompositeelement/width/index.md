---
title: "SVGFECompositeElement: width property"
short-title: width
slug: Web/API/SVGFECompositeElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFECompositeElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFECompositeElement")}} mô tả kích thước theo chiều ngang của một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính lọc {{SVGAttr("width")}} của phần tử {{SVGElement("feComposite")}}. Phần tử lọc SVG `<feComposite>` kết hợp hai ảnh đầu vào bằng thao tác kết hợp Porter-Duff. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều rộng của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feComposite = document.querySelector("feComposite");
const horizontalSize = feComposite.width;
console.log(horizontalSize.baseVal.value); // the `width` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFECompositeElement.height")}}
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
