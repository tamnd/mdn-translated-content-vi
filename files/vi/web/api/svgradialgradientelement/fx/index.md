---
title: "SVGRadialGradientElement: fx property"
short-title: fx
slug: Web/API/SVGRadialGradientElement/fx
page-type: web-api-instance-property
browser-compat: api.SVGRadialGradientElement.fx
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`fx`** của giao diện {{domxref("SVGRadialGradientElement")}} mô tả tọa độ trục x của tiêu điểm gradient hướng tâm dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị tính toán của thuộc tính {{SVGAttr("fx")}} trên phần tử {{SVGElement("radialGradient")}}.

Giá trị thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là tọa độ x của tiêu điểm gradient hướng tâm trong hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Với SVG sau:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="gradient1" cx="50" cy="75" fx="30" fy="60" r="30">
      <stop offset="0%" stop-color="blue" />
      <stop offset="100%" stop-color="white" />
    </radialGradient>
    <radialGradient id="gradient2" cx="25%" cy="50%" fx="10%" fy="40%" r="10%">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="yellow" />
    </radialGradient>
  </defs>
  <rect x="0" y="0" width="200" height="100" fill="url(#gradient1)" />
  <rect x="0" y="100" width="200" height="100" fill="url(#gradient2)" />
</svg>
```

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `fx`:

```js
const radialGradients = document.querySelectorAll("radialGradient");
const fxGradient1 = radialGradients[0].fx;
const fxGradient2 = radialGradients[1].fx;

console.dir(fxGradient1.baseVal.value); // output: 30
console.dir(fxGradient2.baseVal.value); // output: 20 (10% của 200)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGRadialGradientElement.fy")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
