---
title: "SVGFESpecularLightingElement: specularExponent property"
short-title: specularExponent
slug: Web/API/SVGFESpecularLightingElement/specularExponent
page-type: web-api-instance-property
browser-compat: api.SVGFESpecularLightingElement.specularExponent
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`specularExponent`** của giao diện {{domxref("SVGFESpecularLightingElement")}} phản ánh thuộc tính {{SVGAttr("specularExponent")}} của phần tử {{SVGElement("feSpecularLighting")}} tương ứng.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `specularExponent`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="specularLightingFilter">
      <!-- Thêm chiếu sáng phản chiếu với số mũ được chỉ định -->
      <feSpecularLighting
        in="SourceGraphic"
        specularExponent="40"
        lighting-color="hotpink">
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

```js
// Chọn phần tử feSpecularLighting
const specularLightingElement = document.querySelector("feSpecularLighting");

// Truy cập thuộc tính specularExponent
console.log(specularLightingElement.specularExponent.baseVal); // Kết quả: 40
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
