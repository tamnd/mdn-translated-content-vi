---
title: "SVGFEMorphologyElement: operator property"
short-title: operator
slug: Web/API/SVGFEMorphologyElement/operator
page-type: web-api-instance-property
browser-compat: api.SVGFEMorphologyElement.operator
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`operator`** của giao diện {{domxref("SVGFEMorphologyElement")}} phản ánh thuộc tính {{SVGAttr("operator")}} của phần tử {{SVGElement("feMorphology")}} đã cho. Nhận một trong các hằng số `SVG_MORPHOLOGY_OPERATOR_*` được định nghĩa trên giao diện này.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `operator`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="morphologyFilter">
      <!-- Applies a morphology filter with the "dilate" operator -->
      <feMorphology in="SourceGraphic" operator="dilate" radius="3" />
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

```js
// Select the feMorphology element
const morphologyNode = document.querySelector("feMorphology");

// Access the 'operator' property
const operatorEnum = morphologyNode.operator.baseVal;

console.log(operatorEnum); // Output: 2 (SVG_MORPHOLOGY_OPERATOR_DILATE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedEnumeration")}}
