---
title: "SVGFEMorphologyElement: radiusY property"
short-title: radiusY
slug: Web/API/SVGFEMorphologyElement/radiusY
page-type: web-api-instance-property
browser-compat: api.SVGFEMorphologyElement.radiusY
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`radiusY`** của giao diện {{domxref("SVGFEMorphologyElement")}} phản ánh thành phần Y của thuộc tính {{SVGAttr("radius")}} của phần tử {{SVGElement("feMorphology")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `radiusY`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="morphologyFilter">
      <!-- Applies a morphology filter with a specific radius -->
      <feMorphology in="SourceGraphic" operator="dilate" radius="5 3" />
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="lightblue"
    filter="url(#morphologyFilter)" />
</svg>
```

```js
// Select the feMorphology element
const morphologyNode = document.querySelector("feMorphology");

// Access the radiusY property
const radiusY = morphologyNode.radiusY.baseVal;

console.log(`The Y radius is: ${radiusY}`); // Output: 3
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
