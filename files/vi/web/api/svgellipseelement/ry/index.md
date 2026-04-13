---
title: "SVGEllipseElement: ry property"
short-title: ry
slug: Web/API/SVGEllipseElement/ry
page-type: web-api-instance-property
browser-compat: api.SVGEllipseElement.ry
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`ry`** của giao diện {{domxref("SVGEllipseElement")}} mô tả bán kính trục y của hình elip dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị tính toán của thuộc tính {{SVGAttr("ry")}} trên phần tử {{SVGElement("ellipse")}}.

Giá trị thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là bán kính của hình elip dọc theo trục y trong hệ tọa độ người dùng.

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

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `ry`:

```js
const ellipses = document.querySelectorAll("ellipse");
const ryPos0 = ellipses[0].ry;
const ryPos1 = ellipses[1].ry;

console.dir(ryPos0.baseVal.value); // output: 20
console.dir(ryPos1.baseVal.value); // output: 10 (5% của 200)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGEllipseElement.rx")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
