---
title: "SVGFEComponentTransferElement: x property"
short-title: x
slug: Web/API/SVGFEComponentTransferElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEComponentTransferElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEComponentTransferElement")}} mô tả tọa độ ngang của vị trí primitive bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh giá trị thuộc tính bộ lọc primitive {{SVGAttr("x")}} của phần tử {{SVGElement("feComponentTransfer")}}. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng xác định khoảng cách từ gốc tọa độ dọc theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính là tương đối so với chiều rộng của vùng bộ lọc theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feComponentTransfer = document.querySelector("feComponentTransfer");
const leftPosition = feComponentTransfer.x;
console.log(leftPosition.baseVal.value); // giá trị `x`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEComponentTransferElement.y")}}
- {{SVGElement("feFuncR")}}, {{SVGElement("feFuncG")}}, {{SVGElement("feFuncB")}}, {{SVGElement("feFuncA")}}
