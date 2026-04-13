---
title: "SVGFEFloodElement: thuộc tính width"
short-title: width
slug: Web/API/SVGFEFloodElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFEFloodElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFEFloodElement")}} mô tả kích thước ngang của một filter primitive SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("feFlood")}}, phần tử lấp đầy vùng con của filter SVG bằng màu sắc và độ trong suốt được định nghĩa bởi {{SVGAttr("flood-color")}} và {{SVGAttr("flood-opacity")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) so với chiều rộng của vùng filter. Giá trị mặc định là `100%`. Giá trị thuộc tính là một độ dài trong đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feFlood = document.querySelector("feFlood");
const horizontalSize = feFlood.width;
console.log(horizontalSize.baseVal.value); // the `width` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEFloodElement.height")}}
- [SVG filter tutorial](/en-US/docs/Web/SVG/Guides/SVG_filters)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
