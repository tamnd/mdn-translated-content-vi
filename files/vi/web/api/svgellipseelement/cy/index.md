---
title: "SVGEllipseElement: cy property"
short-title: cy
slug: Web/API/SVGEllipseElement/cy
page-type: web-api-instance-property
browser-compat: api.SVGEllipseElement.cy
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`cy`** của giao diện {{domxref("SVGEllipseElement")}} mô tả tọa độ trục y của tâm hình elip dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị tính toán của thuộc tính {{SVGAttr("cy")}} trên phần tử {{SVGElement("ellipse")}}.

Giá trị thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là tọa độ y của tâm hình elip trong hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Cho SVG sau:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <ellipse cx="50" cy="75" rx="30" ry="20" fill="blue" />
  <ellipse cx="25%" cy="50%" rx="10%" ry="5%" fill="red" />
</svg>
```

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `cy`:

```js
const ellipses = document.querySelectorAll("ellipse");
const cyPos0 = ellipses[0].cy;
const cyPos1 = ellipses[1].cy;

console.dir(cyPos0.baseVal.value); // output: 75
console.dir(cyPos1.baseVal.value); // output: 100 (50% chiều cao viewBox, 200)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGEllipseElement.cx")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
