---
title: "SVGFEMergeNodeElement: thuộc tính in1"
short-title: in1
slug: Web/API/SVGFEMergeNodeElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFEMergeNodeElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFEMergeNodeElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feMergeNode")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `in` của phần tử `feMergeNode`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="mergeFilter">
      <!-- Merges two inputs -->
      <feMerge>
        <feMergeNode in="SourceGraphic" />
        <feMergeNode in="BackgroundImage" />
      </feMerge>
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="lightblue"
    filter="url(#mergeFilter)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in` của phần tử `feMergeNode`.

```js
// Select the first feMergeNode element
const mergeNode = document.querySelector("feMergeNode");
console.log(mergeNode.in1.baseVal); // Output: "SourceGraphic"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
