---
title: "SVGLinearGradientElement: x1 property"
short-title: x1
slug: Web/API/SVGLinearGradientElement/x1
page-type: web-api-instance-property
browser-compat: api.SVGLinearGradientElement.x1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x1`** của giao diện {{domxref("SVGLinearGradientElement")}} mô tả tọa độ trục x của điểm bắt đầu của gradient dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị tính toán của thuộc tính {{SVGAttr("x1")}} trên phần tử {{SVGElement("linearGradient")}}.

Giá trị thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là tọa độ x của điểm bắt đầu của gradient trong hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Cho SVG sau:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="gradient1" x1="50%" y1="0%" x2="50%" y2="100%">
      <stop offset="0%" stop-color="blue" />
      <stop offset="100%" stop-color="white" />
    </linearGradient>
    <linearGradient id="gradient2" x1="25%" y1="0%" x2="75%" y2="100%">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="yellow" />
    </linearGradient>
  </defs>
  <rect x="0" y="0" width="200" height="100" fill="url(#gradient1)" />
  <rect x="0" y="100" width="200" height="100" fill="url(#gradient2)" />
</svg>
```

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `x1`:

```js
const linearGradients = document.querySelectorAll("linearGradient");
const x1Gradient1 = linearGradients[0].x1;
const x1Gradient2 = linearGradients[1].x1;

console.dir(x1Gradient1.baseVal.value); // output: 100 (50% của 200)
console.dir(x1Gradient2.baseVal.value); // output: 50 (25% của 200)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGLinearGradientElement.x2")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
