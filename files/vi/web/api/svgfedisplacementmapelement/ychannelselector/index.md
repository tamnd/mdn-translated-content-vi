---
title: "SVGFEDisplacementMapElement: yChannelSelector property"
short-title: yChannelSelector
slug: Web/API/SVGFEDisplacementMapElement/yChannelSelector
page-type: web-api-instance-property
browser-compat: api.SVGFEDisplacementMapElement.yChannelSelector
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`yChannelSelector`** của giao diện {{domxref("SVGFEDisplacementMapElement")}} phản ánh thuộc tính {{SVGAttr("yChannelSelector")}} của phần tử {{SVGElement("feDisplacementMap")}} đã cho. Nhận một trong các hằng số `SVG_CHANNEL_*` được định nghĩa trên giao diện này.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `yChannelSelector`

Trong ví dụ này, phần tử {{SVGElement("feDisplacementMap")}} được định nghĩa trong {{SVGElement("filter")}} có thuộc tính `yChannelSelector`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="displacementFilter">
      <!-- Displacement Map with yChannelSelector set to Red Channel -->
      <feDisplacementMap in="SourceGraphic" scale="20" yChannelSelector="G">
        <feFuncR type="table" tableValues="0 1" />
      </feDisplacementMap>
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="green"
    filter="url(#displacementFilter)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `yChannelSelector` và lấy giá trị của nó:

```js
const displacementMap = document.querySelector("feDisplacementMap");

console.log(displacementMap.yChannelSelector.baseVal); // Output: 2 (SVG_CHANNEL_G)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedEnumeration")}}
