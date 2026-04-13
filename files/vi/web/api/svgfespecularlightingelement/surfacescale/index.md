---
title: "SVGFESpecularLightingElement: surfaceScale property"
short-title: surfaceScale
slug: Web/API/SVGFESpecularLightingElement/surfaceScale
page-type: web-api-instance-property
browser-compat: api.SVGFESpecularLightingElement.surfaceScale
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`surfaceScale`** của giao diện {{domxref("SVGFESpecularLightingElement")}} phản ánh thuộc tính {{SVGAttr("surfaceScale")}} của phần tử {{SVGElement("feSpecularLighting")}} tương ứng.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `surfaceScale`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="specularLightingFilter">
      <!-- Thêm chiếu sáng phản chiếu với tỷ lệ bề mặt -->
      <feSpecularLighting
        in="SourceGraphic"
        specularExponent="20"
        lighting-color="hotpink"
        surfaceScale="3">
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

// Truy cập thuộc tính surfaceScale
console.log(specularLightingElement.surfaceScale.baseVal); // Kết quả: 3
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
