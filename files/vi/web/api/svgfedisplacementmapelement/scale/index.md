---
title: "SVGFEDisplacementMapElement: scale property"
short-title: scale
slug: Web/API/SVGFEDisplacementMapElement/scale
page-type: web-api-instance-property
browser-compat: api.SVGFEDisplacementMapElement.scale
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`scale`** của giao diện {{domxref("SVGFEDisplacementMapElement")}} phản ánh thuộc tính {{SVGAttr("scale")}} của phần tử {{SVGElement("feDisplacementMap")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `scale`

Trong ví dụ này, phần tử {{SVGElement("feDisplacementMap")}} được định nghĩa trong {{SVGElement("filter")}} có thuộc tính `scale`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="filter1">
      <!-- Displacement Map -->
      <feDisplacementMap in="SourceGraphic" scale="20">
        <feFuncR type="table" tableValues="0 1" />
      </feDisplacementMap>
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="red"
    filter="url(#filter1)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `scale` và lấy giá trị của nó:

```js
const displacementMap = document.querySelector("feDisplacementMap");

console.log(displacementMap.scale.baseVal); // Output: 20
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
