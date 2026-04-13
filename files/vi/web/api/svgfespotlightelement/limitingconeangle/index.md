---
title: "SVGFESpotLightElement: limitingConeAngle property"
short-title: limitingConeAngle
slug: Web/API/SVGFESpotLightElement/limitingConeAngle
page-type: web-api-instance-property
browser-compat: api.SVGFESpotLightElement.limitingConeAngle
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`limitingConeAngle`** của giao diện {{domxref("SVGFESpotLightElement")}} phản ánh thuộc tính {{SVGAttr("limitingConeAngle")}} của phần tử {{SVGElement("feSpotLight")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `limitingConeAngle` của phần tử `<feSpotLight>`

Trong ví dụ này, chúng ta truy cập góc tính bằng độ giữa trục đèn spotlight (tức là trục giữa nguồn sáng và điểm mà nó chiếu vào) và nón đèn spotlight, bằng cách sử dụng thuộc tính chỉ đọc `limitingConeAngle` của giao diện `SVGFESpotLightElement`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="specularLightingFilter">
      <!-- Apply a specular light effect to the SourceGraphic -->
      <feSpecularLighting
        in="SourceGraphic"
        specularExponent="40"
        lighting-color="lime"
        surfaceScale="5">
        <feSpotLight
          x="100"
          y="100"
          z="50"
          pointsAtX="100"
          pointsAtY="100"
          limitingConeAngle="30"
          specularExponent="40" />
      </feSpecularLighting>
    </filter>
  </defs>

  <!-- A circle to display the effect of the lighting -->
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

// Access the limitingConeAngle property
console.log(spotLightElement.limitingConeAngle.baseVal); // Output: 30
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
