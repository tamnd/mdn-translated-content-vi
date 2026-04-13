---
title: "SVGFEComponentTransferElement: y property"
short-title: y
slug: Web/API/SVGFEComponentTransferElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFEComponentTransferElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFEComponentTransferElement")}} mô tả tọa độ dọc của vị trí primitive bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh giá trị thuộc tính bộ lọc primitive {{SVGAttr("y")}} của phần tử {{SVGElement("feComponentTransfer")}}. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng xác định khoảng cách từ gốc bộ lọc dọc theo trục y. Nếu thuộc tính `y` là giá trị phần trăm, giá trị thuộc tính là tương đối so với chiều cao của vùng bộ lọc theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feComponentTransfer = document.querySelector("feComponentTransfer");
const topPosition = feComponentTransfer.y;
console.log(topPosition.baseVal.value); // giá trị `y`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEComponentTransferElement.x")}}
- {{SVGElement("feFuncR")}}, {{SVGElement("feFuncG")}}, {{SVGElement("feFuncB")}}, {{SVGElement("feFuncA")}}
