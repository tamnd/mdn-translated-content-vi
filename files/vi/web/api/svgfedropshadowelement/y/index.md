---
title: "SVGFEDropShadowElement: y property"
short-title: y
slug: Web/API/SVGFEDropShadowElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFEDropShadowElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFEDropShadowElement")}} mô tả tọa độ dọc của vị trí của một bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("feDropShadow")}}, tạo ra bóng của hình ảnh đầu vào. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng bằng khoảng cách đã cho từ gốc của bộ lọc dọc theo trục y. Nếu thuộc tính `y` là giá trị phần trăm, giá trị thuộc tính là tương đối so với chiều cao của vùng bộ lọc theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feDropShadow = document.querySelector("feDropShadow");
const topPosition = feDropShadow.y;
console.log(topPosition.baseVal.value); // the `y` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEDropShadowElement.x")}}
- CSS {{cssxref("filter-function/drop-shadow", "drop-shadow()")}} function
- CSS {{cssxref("box-shadow")}} property
- CSS {{cssxref("text-shadow")}} property
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
