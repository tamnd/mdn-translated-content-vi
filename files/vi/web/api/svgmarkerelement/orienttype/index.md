---
title: "SVGMarkerElement: orientType property"
short-title: orientType
slug: Web/API/SVGMarkerElement/orientType
page-type: web-api-instance-property
browser-compat: api.SVGMarkerElement.orientType
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`orientType`** của giao diện {{domxref("SVGMarkerElement")}} trả về một đối tượng {{domxref("SVGAnimatedEnumeration")}} cho biết thuộc tính {{SVGattr("orient")}} là `auto`, một giá trị góc, hay thứ gì khác.

Thứ gì khác ở đây có thể là từ khóa `auto-start-reverse`, tuy nhiên đặc tả để ngỏ cho khả năng có các giá trị khác. Các giá trị không được hỗ trợ thường sẽ bị loại bỏ bởi trình phân tích cú pháp, để giá trị về mặc định là `auto`.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}. Chứa một trong các giá trị sau:

- `0`
  - : `SVG_MARKER_ORIENT_UNKNOWN` nghĩa là thuộc tính {{SVGattr("orient")}} có giá trị khác với `auto` hoặc một góc.
- `1`
  - : `SVG_MARKERUNITS_ORIENT_AUTO` nghĩa là thuộc tính {{SVGattr("orient")}} có giá trị từ khóa `auto`.
- `2`
  - : `SVG_MARKERUNITS_ORIENT_ANGLE` nghĩa là thuộc tính {{SVGattr("orient")}} có giá trị {{cssxref("angle")}} hoặc {{cssxref("number")}} chỉ định góc.

## Ví dụ

Thuộc tính `orientType` trả về một đối tượng {{domxref("SVGAnimatedEnumeration")}}. Vì giá trị của thuộc tính {{SVGattr("orient")}} là một góc, nên trả về `SVGAnimatedEnumeration.baseVal` là `2`.

```html
<svg id="svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker
      id="arrow"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      markerWidth="6"
      markerHeight="6"
      orient=".63deg">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>
  </defs>
</svg>
```

```js
let marker = document.getElementById("arrow");
console.log(marker.orientType.baseVal); // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
