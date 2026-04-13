---
title: "SVGFESpecularLightingElement: in1 property"
short-title: in1
slug: Web/API/SVGFESpecularLightingElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFESpecularLightingElement.in1
---

{{APIRef("SVG")}}

Thuộc tính **`in1`** chỉ đọc của giao diện {{domxref("SVGFESpecularLightingElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feSpecularLighting")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `in` của phần tử `feSpecularLighting`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="specularLightingFilter">
      <!-- Adds specular lighting effect to the SourceGraphic -->
      <feSpecularLighting
        in="SourceGraphic"
        specularExponent="20"
        lighting-color="hotpink"
        surfaceScale="2">
        <fePointLight x="50" y="50" z="30" />
      </feSpecularLighting>
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="lightblue"
    filter="url(#specularLightingFilter)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in` của phần tử `feSpecularLighting`.

```js
// Select the feSpecularLighting element
const specularLightingElement = document.querySelector("feSpecularLighting");

// Access the in1 property
console.log(specularLightingElement.in1.baseVal); // Output: "SourceGraphic"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
