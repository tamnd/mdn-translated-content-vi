---
title: "SVGFEFloodElement: thuộc tính y"
short-title: y
slug: Web/API/SVGFEFloodElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFEFloodElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFEFloodElement")}} mô tả tọa độ dọc của vị trí của một filter primitive SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("feFlood")}}, phần tử lấp đầy vùng con của filter SVG bằng màu sắc và độ trong suốt được định nghĩa bởi {{SVGAttr("flood-color")}} và {{SVGAttr("flood-opacity")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là một độ dài trong hệ tọa độ người dùng là khoảng cách đã cho từ gốc của filter dọc theo trục y. Nếu thuộc tính `y` là giá trị phần trăm, giá trị thuộc tính là tương đối so với chiều cao của vùng filter trong đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feFlood = document.querySelector("feFlood");
const topPosition = feFlood.y;
console.log(topPosition.baseVal.value); // the `y` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEFloodElement.x")}}
- [SVG filter tutorial](/en-US/docs/Web/SVG/Guides/SVG_filters)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
