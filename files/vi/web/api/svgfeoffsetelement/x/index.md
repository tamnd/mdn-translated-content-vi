---
title: "SVGFEOffsetElement: x property"
short-title: x
slug: Web/API/SVGFEOffsetElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEOffsetElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEOffsetElement")}} mô tả tọa độ ngang của vị trí của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("feOffset")}}, phần tử này dịch chuyển ảnh đầu vào so với vị trí hiện tại của nó. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feOffset = document.querySelector("feOffset");
const leftPosition = feOffset.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEOffsetElement.y")}}
