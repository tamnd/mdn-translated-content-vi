---
title: "SVGFEMergeElement: thuộc tính x"
short-title: x
slug: Web/API/SVGFEMergeElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEMergeElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEMergeElement")}} mô tả tọa độ ngang của vị trí của một filter primitive SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("feMerge")}}. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là một độ dài trong hệ tọa độ người dùng là khoảng cách đã cho từ gốc của hệ tọa độ người dùng dọc theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính là tương đối so với chiều rộng của vùng filter trong đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feMerge = document.querySelector("feMerge");
const leftPosition = feMerge.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEMergeElement.y")}}
