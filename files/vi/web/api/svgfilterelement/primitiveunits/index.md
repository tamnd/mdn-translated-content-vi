---
title: "SVGFilterElement: primitiveUnits property"
short-title: primitiveUnits
slug: Web/API/SVGFilterElement/primitiveUnits
page-type: web-api-instance-property
browser-compat: api.SVGFilterElement.primitiveUnits
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`primitiveUnits`** của giao diện {{domxref("SVGFilterElement")}} phản ánh thuộc tính {{SVGAttr("primitiveUnits")}} của phần tử {{SVGElement("filter")}} đã cho. Nó nhận một trong các hằng số `SVG_UNIT_TYPE_*` được định nghĩa trong {{domxref("SVGUnitTypes")}}.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `primitiveUnits`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <defs>
    <filter
      id="myFilter"
      primitiveUnits="userSpaceOnUse"
      x="0"
      y="0"
      width="200%"
      height="200%">
      <feGaussianBlur in="SourceGraphic" stdDeviation="15" result="blurred" />
    </filter>
  </defs>
  <rect
    width="200"
    height="200"
    stroke="green"
    stroke-width="10"
    fill="lime"
    filter="url(#myFilter)" />
</svg>
```

```js
const filterElement = document.querySelector("filter");

// Access the primitiveUnits property
console.log(filterElement.primitiveUnits.baseVal); // Output: 1 (SVG_UNIT_TYPE_USERSPACEONUSE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFilterElement.filterUnits")}}
