---
title: "SVGFEComponentTransferElement: height property"
short-title: height
slug: Web/API/SVGFEComponentTransferElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFEComponentTransferElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFEComponentTransferElement")}} mô tả kích thước theo chiều dọc của primitive bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính bộ lọc primitive {{SVGAttr("height")}} của phần tử {{SVGElement("feComponentTransfer")}}. Bộ lọc `<feComponentTransfer>` thực hiện ánh xạ lại màu sắc và độ trong suốt alpha theo từng kênh, cho phép điều chỉnh độ sáng, độ tương phản, cân bằng màu và ngưỡng.

Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối so với chiều cao của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feComponentTransfer = document.querySelector("feComponentTransfer");
const verticalSize = feComponentTransfer.height;
console.log(verticalSize.baseVal.value); // giá trị `height`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEComponentTransferElement.width")}}
- {{SVGElement("feFuncR")}}, {{SVGElement("feFuncG")}}, {{SVGElement("feFuncB")}}, {{SVGElement("feFuncA")}}
