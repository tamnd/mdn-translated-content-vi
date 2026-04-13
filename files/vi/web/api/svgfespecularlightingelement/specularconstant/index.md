---
title: "SVGFESpecularLightingElement: specularConstant property"
short-title: specularConstant
slug: Web/API/SVGFESpecularLightingElement/specularConstant
page-type: web-api-instance-property
browser-compat: api.SVGFESpecularLightingElement.specularConstant
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`specularConstant`** của giao diện {{domxref("SVGFESpecularLightingElement")}} phản ánh thuộc tính {{SVGAttr("specularConstant")}} của phần tử {{SVGElement("feSpecularLighting")}} tương ứng.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `specularConstant`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="specularLightingFilter">
      <!-- Áp dụng chiếu sáng phản chiếu với hằng số phản chiếu -->
      <feSpecularLighting
        in="SourceGraphic"
        specularConstant="0.5"
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

// Truy cập thuộc tính specularConstant
console.log(specularLightingElement.specularConstant.baseVal); // Kết quả: 0.5
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
