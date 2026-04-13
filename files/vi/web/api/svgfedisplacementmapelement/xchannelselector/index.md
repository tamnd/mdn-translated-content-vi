---
title: "SVGFEDisplacementMapElement: xChannelSelector property"
short-title: xChannelSelector
slug: Web/API/SVGFEDisplacementMapElement/xChannelSelector
page-type: web-api-instance-property
browser-compat: api.SVGFEDisplacementMapElement.xChannelSelector
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`xChannelSelector`** của giao diện {{domxref("SVGFEDisplacementMapElement")}} phản ánh thuộc tính {{SVGAttr("xChannelSelector")}} của phần tử {{SVGElement("feDisplacementMap")}} đã cho. Nhận một trong các hằng số `SVG_CHANNEL_*` được định nghĩa trên giao diện này.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `xChannelSelector`

Trong ví dụ này, phần tử {{SVGElement("feDisplacementMap")}} được định nghĩa trong {{SVGElement("filter")}} có thuộc tính `xChannelSelector`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="displacementFilter">
      <!-- Displacement Map with xChannelSelector set to Red Channel -->
      <feDisplacementMap in="SourceGraphic" scale="20" xChannelSelector="R">
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
    filter="url(#displacementFilter)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `xChannelSelector` và lấy giá trị của nó:

```js
const displacementMap = document.querySelector("feDisplacementMap");

console.log(displacementMap.xChannelSelector.baseVal); // Output: 1 (SVG_CHANNEL_R)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedEnumeration")}}
