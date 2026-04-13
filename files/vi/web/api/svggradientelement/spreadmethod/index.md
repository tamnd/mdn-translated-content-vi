---
title: "SVGGradientElement: spreadMethod property"
short-title: spreadMethod
slug: Web/API/SVGGradientElement/spreadMethod
page-type: web-api-instance-property
browser-compat: api.SVGGradientElement.spreadMethod
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`spreadMethod`** của giao diện {{domxref("SVGGradientElement")}} phản ánh thuộc tính {{SVGAttr("spreadMethod")}} của phần tử đã cho. Nó nhận một trong các hằng số `SVG_SPREADMETHOD_*` được định nghĩa trên giao diện này.

## Giá trị

Một {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `spreadMethod`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <defs>
    <linearGradient id="gradient2" spreadMethod="reflect">
      <stop offset="0%" stop-color="red" />
      <stop offset="50%" stop-color="yellow" />
      <stop offset="100%" stop-color="blue" />
    </linearGradient>
  </defs>
  <rect x="10" y="10" width="180" height="180" fill="url(#gradient2)" />
</svg>
```

```js
const gradient = document.getElementById("gradient2");
console.log(gradient.spreadMethod.baseVal); // Output: 2 (SVG_SPREADMETHOD_REFLECT)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
