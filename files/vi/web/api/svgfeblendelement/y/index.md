---
title: "SVGFEBlendElement: y property"
short-title: y
slug: Web/API/SVGFEBlendElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFEBlendElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFEBlendElement")}} mô tả tọa độ dọc của vị trí của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh giá trị thuộc tính filter primitive {{SVGAttr("y")}} của phần tử {{SVGElement("feBlend")}}.
SVG filter `<feBlend>` pha trộn hai ảnh đầu vào với nhau bằng các [chế độ pha trộn](/en-US/docs/Web/CSS/Reference/Values/blend-mode) phổ biến trong phần mềm xử lý ảnh.

Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feBlend = document.querySelector("feBlend");
const topPosition = feBlend.y;
console.log(topPosition.baseVal.value); // the `y` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEBlendElement.x")}}
- Kiểu dữ liệu CSS {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}
