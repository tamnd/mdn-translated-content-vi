---
title: "SVGFEMorphologyElement: in1 property"
short-title: in1
slug: Web/API/SVGFEMorphologyElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFEMorphologyElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFEMorphologyElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feMorphology")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `in` của phần tử `feMorphology`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="morphologyFilter">
      <!-- Applies a morphology filter to the SourceGraphic -->
      <feMorphology in="SourceGraphic" operator="dilate" radius="2" />
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="lightblue"
    filter="url(#morphologyFilter)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in` của phần tử `feMorphology`.

```js
// Select the feMorphology element
const morphologyNode = document.querySelector("feMorphology");
console.log(morphologyNode.in1.baseVal); // Output: "SourceGraphic"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
