---
title: "SVGPreserveAspectRatio: thuộc tính meetOrSlice"
short-title: meetOrSlice
slug: Web/API/SVGPreserveAspectRatio/meetOrSlice
page-type: web-api-instance-property
browser-compat: api.SVGPreserveAspectRatio.meetOrSlice
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`meetOrSlice`** của giao diện {{domxref("SVGPreserveAspectRatio")}} phản ánh kiểu của giá trị meet-or-slice được chỉ định bởi một trong các hằng số `SVG_MEETORSLICE_*` được định nghĩa trên giao diện này.

## Giá trị

Một trong các giá trị sau:

- `SVGPreserveAspectRatio.SVG_MEETORSLICE_UNKNOWN` (0)
- `SVGPreserveAspectRatio.SVG_MEETORSLICE_MEET` (1)
- `SVGPreserveAspectRatio.SVG_MEETORSLICE_SLICE` (2)

## Ví dụ

### Truy cập thuộc tính `meetOrSlice`

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  width="400"
  height="200"
  preserveAspectRatio="xMidYMid slice">
  <circle cx="100" cy="100" r="50" fill="blue" />
</svg>
```

```js
const svgElement = document.querySelector("svg");

// Truy cập thuộc tính meetOrSlice
console.log(svgElement.preserveAspectRatio.baseVal.meetOrSlice); // Đầu ra: 2 (SVG_MEETORSLICE_SLICE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
