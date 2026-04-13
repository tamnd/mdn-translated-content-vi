---
title: "SVGFESpotLightElement: pointsAtZ property"
short-title: pointsAtZ
slug: Web/API/SVGFESpotLightElement/pointsAtZ
page-type: web-api-instance-property
browser-compat: api.SVGFESpotLightElement.pointsAtZ
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`pointsAtZ`** của giao diện {{domxref("SVGFESpotLightElement")}} phản ánh thuộc tính {{SVGAttr("pointsAtZ")}} của phần tử {{SVGElement("feSpotLight")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `pointsAtZ` của phần tử `<feSpotLight>`

Trong ví dụ này, chúng ta truy cập vị trí `z` của nguồn sáng được tạo bởi phần tử SVG filter `<feSpotLight>` trong hệ tọa độ SVG bằng cách sử dụng thuộc tính chỉ đọc `pointsAtZ` của giao diện `SVGFESpotLightElement`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="specularLightingFilter">
      <!-- Apply a specular light effect to the SourceGraphic -->
      <feSpecularLighting
        in="SourceGraphic"
        specularExponent="20"
        lighting-color="hotpink"
        surfaceScale="30">
        <feSpotLight
          x="10"
          y="50"
          z="150"
          pointsAtX="150"
          pointsAtY="100"
          pointsAtZ="0"
          specularExponent="20" />
      </feSpecularLighting>
    </filter>
  </defs>

  <!-- A circle to display the effect of the lighting -->
  <circle cx="100" cy="100" r="50" filter="url(#specularLightingFilter)" />
</svg>
```

```js
// Select the feSpotLight element
const spotLightElement = document.querySelector("feSpotLight");
console.log(spotLightElement.pointsAtZ.baseVal); // Output: 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
