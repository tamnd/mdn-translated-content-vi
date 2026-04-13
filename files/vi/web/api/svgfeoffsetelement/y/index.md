---
title: "SVGFEOffsetElement: y property"
short-title: y
slug: Web/API/SVGFEOffsetElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFEOffsetElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFEOffsetElement")}} mô tả tọa độ dọc của vị trí của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("feOffset")}}, phần tử này dịch chuyển ảnh đầu vào so với vị trí hiện tại của nó. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feOffset = document.querySelector("feOffset");
const topPosition = feOffset.y;
console.log(topPosition.baseVal.value); // the `y` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEOffsetElement.x")}}
- Kiểu dữ liệu CSS {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}
