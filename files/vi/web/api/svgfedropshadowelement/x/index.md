---
title: "SVGFEDropShadowElement: x property"
short-title: x
slug: Web/API/SVGFEDropShadowElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFEDropShadowElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFEDropShadowElement")}} mô tả tọa độ ngang của vị trí của một bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("feDropShadow")}}, tạo ra bóng của hình ảnh đầu vào. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng bằng khoảng cách đã cho từ gốc của hệ tọa độ người dùng dọc theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính sẽ tương đối so với chiều rộng của vùng bộ lọc theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feDropShadow = document.querySelector("feDropShadow");
const leftPosition = feDropShadow.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEDropShadowElement.y")}}
- CSS {{cssxref("filter-function/drop-shadow", "drop-shadow()")}} function
- CSS {{cssxref("box-shadow")}} property
- CSS {{cssxref("text-shadow")}} property
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
