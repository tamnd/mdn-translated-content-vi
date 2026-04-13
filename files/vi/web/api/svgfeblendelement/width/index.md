---
title: "SVGFEBlendElement: width property"
short-title: width
slug: Web/API/SVGFEBlendElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFEBlendElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFEBlendElement")}} mô tả kích thước ngang của một SVG filter primitive dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính filter primitive {{SVGAttr("width")}} của phần tử {{SVGElement("feBlend")}}. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều rộng của vùng filter. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài trong đơn vị hệ tọa độ người dùng.

SVG filter `<feBlend>` pha trộn hai ảnh đầu vào với nhau bằng các [chế độ pha trộn](/en-US/docs/Web/CSS/Reference/Values/blend-mode) phổ biến trong phần mềm xử lý ảnh.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feBlend = document.querySelector("feBlend");
const horizontalSize = feBlend.width;
console.log(horizontalSize.baseVal.value); // the `width` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEBlendElement.height")}}
- Kiểu dữ liệu CSS {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}
