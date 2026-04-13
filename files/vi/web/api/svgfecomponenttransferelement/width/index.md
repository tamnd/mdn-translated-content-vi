---
title: "SVGFEComponentTransferElement: width property"
short-title: width
slug: Web/API/SVGFEComponentTransferElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFEComponentTransferElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFEComponentTransferElement")}} mô tả kích thước theo chiều ngang của primitive bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính bộ lọc primitive {{SVGAttr("width")}} của phần tử {{SVGElement("feComponentTransfer")}}. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối so với chiều rộng của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feComponentTransfer = document.querySelector("feComponentTransfer");
const horizontalSize = feComponentTransfer.width;
console.log(horizontalSize.baseVal.value); // giá trị `width`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEComponentTransferElement.height")}}
- Các phần tử {{SVGElement("feFuncR")}}, {{SVGElement("feFuncG")}}, {{SVGElement("feFuncB")}}, {{SVGElement("feFuncA")}}
