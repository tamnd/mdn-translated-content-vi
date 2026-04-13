---
title: "SVGRadialGradientElement: fr property"
short-title: fr
slug: Web/API/SVGRadialGradientElement/fr
page-type: web-api-instance-property
browser-compat: api.SVGRadialGradientElement.fr
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`fr`** của giao diện {{domxref("SVGRadialGradientElement")}} mô tả bán kính của vòng tròn tiêu điểm của gradient hướng tâm dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị tính toán của thuộc tính {{SVGAttr("fr")}} trên phần tử {{SVGElement("radialGradient")}}.

Giá trị thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là bán kính của tiêu điểm gradient hướng tâm trong hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Với SVG sau, có hai gradient giống nhau được khai báo với các loại đơn vị khác nhau:

```html
<svg viewBox="0 0 200 100" width="200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="gradient1" r="20%" fr="0.5">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="yellow" />
    </radialGradient>
    <radialGradient id="gradient2" r="20%" fr="50%">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="yellow" />
    </radialGradient>
  </defs>
  <rect x="0" y="0" width="100" height="100" fill="url(#gradient1)" />
  <rect x="100" y="0" width="100" height="100" fill="url(#gradient2)" />
</svg>
```

Chúng ta có thể truy cập loại đơn vị, giá trị và giá trị theo đơn vị được chỉ định của thuộc tính `fr`:

```js
const radialGradients = document.querySelectorAll("radialGradient");
const frGradient1 = radialGradients[0].fr;
const frGradient2 = radialGradients[1].fr;

console.log(frGradient1.baseVal.unitType); // 1 (SVGLength.SVG_LENGTHTYPE_NUMBER)
console.log(frGradient1.baseVal.value); // 0.5
console.log(frGradient1.baseVal.valueInSpecifiedUnits); // 0.5

console.log(frGradient2.baseVal.unitType); // 2 (SVGLength.SVG_LENGTHTYPE_PERCENTAGE)
console.log(frGradient2.baseVal.value); // 79.05693817138672
console.log(frGradient2.baseVal.valueInSpecifiedUnits); // 50
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGRadialGradientElement.fx")}}
- {{domxref("SVGLength.unitType")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
