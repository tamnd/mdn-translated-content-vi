---
title: "SVGFECompositeElement: x property"
short-title: x
slug: Web/API/SVGFECompositeElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFECompositeElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFECompositeElement")}} mô tả tọa độ ngang của vị trí một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh giá trị thuộc tính lọc {{SVGAttr("x")}} của phần tử {{SVGElement("feComposite")}}. Phần tử lọc SVG `<feComposite>` kết hợp hai ảnh đầu vào bằng thao tác kết hợp Porter-Duff. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng biểu thị khoảng cách tính từ gốc tọa độ của hệ tọa độ người dùng theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính tương đối với chiều rộng của vùng bộ lọc tính theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feComposite = document.querySelector("feComposite");
const leftPosition = feComposite.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFECompositeElement.y")}}
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
