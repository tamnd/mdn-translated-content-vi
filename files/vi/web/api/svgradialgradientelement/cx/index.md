---
title: "SVGRadialGradientElement: cx property"
short-title: cx
slug: Web/API/SVGRadialGradientElement/cx
page-type: web-api-instance-property
browser-compat: api.SVGRadialGradientElement.cx
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`cx`** của giao diện {{domxref("SVGRadialGradientElement")}} mô tả tọa độ trục x của tâm gradient hướng tâm dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị tính toán của thuộc tính {{SVGAttr("cx")}} trên phần tử {{SVGElement("radialGradient")}}.

Giá trị thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là tọa độ x của tâm gradient hướng tâm trong hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Với SVG sau:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="gradient1" cx="50" cy="75" r="30">
      <stop offset="0%" stop-color="blue" />
      <stop offset="100%" stop-color="white" />
    </radialGradient>
    <radialGradient id="gradient2" cx="25%" cy="50%" r="10%">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="yellow" />
    </radialGradient>
  </defs>
  <rect x="0" y="0" width="200" height="100" fill="url(#gradient1)" />
  <rect x="0" y="100" width="200" height="100" fill="url(#gradient2)" />
</svg>
```

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `cx`:

```js
const radialGradients = document.querySelectorAll("radialGradient");
const cxGradient1 = radialGradients[0].cx;
const cxGradient2 = radialGradients[1].cx;

console.dir(cxGradient1.baseVal.value); // output: 50
console.dir(cxGradient2.baseVal.value); // output: 50 (25% của 200)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGRadialGradientElement.cy")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
