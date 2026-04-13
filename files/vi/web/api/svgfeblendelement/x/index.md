---
title: "SVGFEBlendElement: x property"
short-title: x
slug: Web/API/SVGFEBlendElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEBlendElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEBlendElement")}} mô tả tọa độ ngang của vị trí của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh giá trị thuộc tính filter primitive {{SVGAttr("x")}} của phần tử {{SVGElement("feBlend")}}. SVG filter `<feBlend>` pha trộn hai ảnh đầu vào với nhau bằng các [chế độ pha trộn](/en-US/docs/Web/CSS/Reference/Values/blend-mode) phổ biến trong phần mềm xử lý ảnh.

Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feBlend = document.querySelector("feBlend");
const leftPosition = feBlend.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEBlendElement.y")}}
- Kiểu dữ liệu CSS {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}
