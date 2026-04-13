---
title: "SVGFEOffsetElement: height property"
short-title: height
slug: Web/API/SVGFEOffsetElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFEOffsetElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFEOffsetElement")}} mô tả kích thước dọc của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("feOffset")}}, phần tử này dịch chuyển ảnh đầu vào so với vị trí hiện tại của nó. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều cao của vùng filter. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài trong đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feOffset = document.querySelector("feOffset");
const verticalSize = feOffset.height;
console.log(verticalSize.baseVal.value); // the `height` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEOffsetElement.width")}}
