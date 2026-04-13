---
title: "SVGFESpotLightElement: specularExponent property"
short-title: specularExponent
slug: Web/API/SVGFESpotLightElement/specularExponent
page-type: web-api-instance-property
browser-compat: api.SVGFESpotLightElement.specularExponent
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`specularExponent`** của giao diện {{domxref("SVGFESpotLightElement")}} phản ánh thuộc tính {{SVGAttr("specularExponent")}} của phần tử {{SVGElement("feSpotLight")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `specularExponent` của phần tử `<feSpotLight>`

Trong ví dụ này, chúng ta truy cập giá trị số mũ điều khiển tiêu cự của nguồn sáng của phần tử filter `<feSpotLight>` bằng cách sử dụng thuộc tính chỉ đọc `specularExponent` của giao diện `SVGFESpotLightElement`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="specularLightingFilter">
      <!-- Apply a specular light effect to the SourceGraphic -->
      <feSpecularLighting
        in="SourceGraphic"
        specularExponent="40"
        lighting-color="hotpink"
        surfaceScale="5">
        <feSpotLight
          x="100"
          y="100"
          z="50"
          pointsAtX="100"
          pointsAtY="100"
          specularExponent="40" />
      </feSpecularLighting>
    </filter>
  </defs>
  <circle
    cx="100"
    cy="100"
    r="50"
    fill="lightblue"
    filter="url(#specularLightingFilter)" />
</svg>
```

```js
// Select the feSpotLight element
const spotLightElement = document.querySelector("feSpotLight");

// Access the specularExponent property
console.log(spotLightElement.specularExponent.baseVal); // Output: 40
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
