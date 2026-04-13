---
title: "SVGLinearGradientElement: x2 property"
short-title: x2
slug: Web/API/SVGLinearGradientElement/x2
page-type: web-api-instance-property
browser-compat: api.SVGLinearGradientElement.x2
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x2`** của giao diện {{domxref("SVGLinearGradientElement")}} mô tả tọa độ trục x của điểm kết thúc của gradient dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị tính toán của thuộc tính {{SVGAttr("x2")}} trên phần tử {{SVGElement("linearGradient")}}.

Giá trị thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là tọa độ x của điểm kết thúc của gradient trong hệ tọa độ người dùng.

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

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `x2`:

```js
const linearGradients = document.querySelectorAll("linearGradient");
const x2Gradient1 = linearGradients[0].x2;
const x2Gradient2 = linearGradients[1].x2;

console.dir(x2Gradient1.baseVal.value); // output: 100 (50% của 200)
console.dir(x2Gradient2.baseVal.value); // output: 150 (75% của 200)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGLinearGradientElement.x1")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
