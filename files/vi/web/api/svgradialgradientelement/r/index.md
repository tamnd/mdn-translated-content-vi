---
title: "SVGRadialGradientElement: r property"
short-title: r
slug: Web/API/SVGRadialGradientElement/r
page-type: web-api-instance-property
browser-compat: api.SVGRadialGradientElement.r
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`r`** của giao diện {{domxref("SVGRadialGradientElement")}} mô tả bán kính của gradient hướng tâm dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị tính toán của thuộc tính {{SVGAttr("r")}} trên phần tử {{SVGElement("radialGradient")}}.

Giá trị thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là bán kính của gradient hướng tâm trong hệ tọa độ người dùng.

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

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `r`:

```js
const radialGradients = document.querySelectorAll("radialGradient");
const rGradient1 = radialGradients[0].r;
const rGradient2 = radialGradients[1].r;

console.dir(rGradient1.baseVal.value); // output: 30
console.dir(rGradient2.baseVal.value); // output: 20 (10% của 200)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("r")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
