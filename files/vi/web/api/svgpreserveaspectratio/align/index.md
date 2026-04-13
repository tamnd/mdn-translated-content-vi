---
title: "SVGPreserveAspectRatio: thuộc tính align"
short-title: align
slug: Web/API/SVGPreserveAspectRatio/align
page-type: web-api-instance-property
browser-compat: api.SVGPreserveAspectRatio.align
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`align`** của giao diện {{domxref("SVGPreserveAspectRatio")}} phản ánh kiểu của giá trị căn chỉnh được chỉ định bởi một trong các hằng số `SVG_PRESERVEASPECTRATIO_*` được định nghĩa trên giao diện này.

## Giá trị

Một trong các giá trị sau:

- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_UNKNOWN` (0)
- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_NONE` (1)
- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_XMINYMIN` (2)
- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_XMIDYMIN` (3)
- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_XMAXYMIN` (4)
- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_XMINYMID` (5)
- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_XMIDYMID` (6)
- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_XMAXYMID` (7)
- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_XMINYMAX` (8)
- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_XMIDYMAX` (9)
- `SVGPreserveAspectRatio.SVG_PRESERVEASPECTRATIO_XMAXYMAX` (10)

## Ví dụ

### Truy cập thuộc tính `align`

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  width="400"
  height="200"
  preserveAspectRatio="xMidYMid meet">
  <circle cx="100" cy="100" r="50" fill="blue" />
</svg>
```

```js
const svgElement = document.querySelector("svg");

// Truy cập thuộc tính align
console.log(svgElement.preserveAspectRatio.baseVal.align); // Đầu ra: 6 (SVG_PRESERVEASPECTRATIO_XMIDYMID)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
