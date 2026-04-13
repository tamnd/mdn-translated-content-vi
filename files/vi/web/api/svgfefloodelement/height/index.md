---
title: "SVGFEFloodElement: thuộc tính height"
short-title: height
slug: Web/API/SVGFEFloodElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFEFloodElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFEFloodElement")}} mô tả kích thước dọc của một filter primitive SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("feFlood")}}, phần tử lấp đầy vùng con của filter SVG bằng màu sắc và độ trong suốt được định nghĩa bởi {{SVGAttr("flood-color")}} và {{SVGAttr("flood-opacity")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) so với chiều cao của vùng filter. Giá trị mặc định là `100%`. Giá trị thuộc tính là một độ dài trong đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feFlood = document.querySelector("feFlood");
const verticalSize = feFlood.height;
console.log(verticalSize.baseVal.value); // the `height` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEFloodElement.width")}}
- [SVG filter tutorial](/en-US/docs/Web/SVG/Guides/SVG_filters)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
