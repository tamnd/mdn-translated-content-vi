---
title: "SVGFEFloodElement: thuộc tính x"
short-title: x
slug: Web/API/SVGFEFloodElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEFloodElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEFloodElement")}} mô tả tọa độ ngang của vị trí của một filter primitive SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("feFlood")}}, phần tử lấp đầy vùng con của filter SVG bằng màu sắc và độ trong suốt được định nghĩa bởi {{SVGAttr("flood-color")}} và {{SVGAttr("flood-opacity")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là một độ dài trong hệ tọa độ người dùng là khoảng cách đã cho từ gốc của hệ tọa độ người dùng dọc theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính là tương đối so với chiều rộng của vùng filter trong đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feFlood = document.querySelector("feFlood");
const leftPosition = feFlood.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEFloodElement.y")}}
- [SVG filter tutorial](/en-US/docs/Web/SVG/Guides/SVG_filters)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
