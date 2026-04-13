---
title: "SVGFEBlendElement: height property"
short-title: height
slug: Web/API/SVGFEBlendElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFEBlendElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFEBlendElement")}} mô tả kích thước dọc của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính filter primitive {{SVGAttr("height")}} của phần tử {{SVGElement("feBlend")}}. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều cao của vùng filter. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài trong đơn vị hệ tọa độ người dùng.

SVG filter `<feBlend>` pha trộn hai ảnh đầu vào với nhau bằng các [chế độ pha trộn](/en-US/docs/Web/CSS/Reference/Values/blend-mode) phổ biến trong phần mềm xử lý ảnh.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feBlend = document.querySelector("feBlend");
const verticalSize = feBlend.height;
console.log(verticalSize.baseVal.value); // the `height` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEBlendElement.width")}}
- Kiểu dữ liệu CSS {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}
