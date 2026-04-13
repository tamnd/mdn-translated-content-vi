---
title: "SVGFEImageElement: y property"
short-title: y
slug: Web/API/SVGFEImageElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFEImageElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFEImageElement")}} mô tả tọa độ dọc của vị trí bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("feImage")}}, phần tử này tải dữ liệu hình ảnh từ nguồn bên ngoài và cung cấp dữ liệu pixel làm đầu ra. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng, bằng khoảng cách từ gốc của bộ lọc theo trục y. Nếu thuộc tính `y` là giá trị phần trăm, giá trị thuộc tính tương đối so với chiều cao của vùng bộ lọc theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feImage = document.querySelector("feImage");
const topPosition = feImage.y;
console.log(topPosition.baseVal.value); // giá trị `y`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEImageElement.x")}}
- [SVG tutorial: Filter effects](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
- [SVG Filter primitive attributes](/en-US/docs/Web/SVG/Reference/Attribute#filters_attributes)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
