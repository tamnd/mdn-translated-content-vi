---
title: "SVGFEOffsetElement: width property"
short-title: width
slug: Web/API/SVGFEOffsetElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFEOffsetElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFEOffsetElement")}} mô tả kích thước ngang của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("feOffset")}}, phần tử này dịch chuyển ảnh đầu vào so với vị trí hiện tại của nó. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều rộng của vùng filter. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài trong đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feOffset = document.querySelector("feOffset");
const horizontalSize = feOffset.width;
console.log(horizontalSize.baseVal.value); // the `width` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEOffsetElement.height")}}
