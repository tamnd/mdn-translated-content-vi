---
title: "SVGFEDisplacementMapElement: in1 property"
short-title: in1
slug: Web/API/SVGFEDisplacementMapElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFEDisplacementMapElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFEDisplacementMapElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feDisplacementMap")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

Trong ví dụ này, hai phần tử {{SVGElement("feDisplacementMap")}} được định nghĩa trong một bộ lọc, mỗi phần tử có thuộc tính `in` khác nhau.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="filter1">
      <!-- First Displacement Map -->
      <feDisplacementMap in="SourceGraphic" scale="20">
        <feFuncR type="table" tableValues="0 1" />
      </feDisplacementMap>

      <!-- Second Displacement Map -->
      <feDisplacementMap in="BackgroundImage" scale="30">
        <feFuncR type="table" tableValues="0.5 1" />
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
  <circle cx="100" cy="100" r="50" fill="blue" filter="url(#filter1)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in`:

```js
const displacementMaps = document.querySelectorAll("feDisplacementMap");

console.log(displacementMaps[0].getAttribute("in")); // Output: "SourceGraphic"
console.log(displacementMaps[1].getAttribute("in")); // Output: "BackgroundImage"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
