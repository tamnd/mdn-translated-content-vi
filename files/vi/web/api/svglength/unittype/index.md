---
title: "SVGLength: unitType property"
short-title: unitType
slug: Web/API/SVGLength/unitType
page-type: web-api-instance-property
browser-compat: api.SVGLength.unitType
---

{{APIRef("SVG")}}

Thuộc tính **`unitType`** của giao diện {{domxref("SVGLength")}} đại diện cho kiểu của giá trị được chỉ định bởi một trong các hằng số `SVG_LENGTHTYPE_*` được định nghĩa trên giao diện này.

## Giá trị

Một trong các giá trị sau:

- `SVGLength.SVG_LENGTHTYPE_UNKNOWN` (0)
- `SVGLength.SVG_LENGTHTYPE_NUMBER` (1)
- `SVGLength.SVG_LENGTHTYPE_PERCENTAGE` (2)
- `SVGLength.SVG_LENGTHTYPE_EMS` (3)
- `SVGLength.SVG_LENGTHTYPE_EXS` (4)
- `SVGLength.SVG_LENGTHTYPE_PX` (5)
- `SVGLength.SVG_LENGTHTYPE_CM` (6)
- `SVGLength.SVG_LENGTHTYPE_MM` (7)
- `SVGLength.SVG_LENGTHTYPE_IN` (8)
- `SVGLength.SVG_LENGTHTYPE_PT` (9)
- `SVGLength.SVG_LENGTHTYPE_PC` (10)

## Ví dụ

Đây là ví dụ về cách truy cập thuộc tính `unitType`:

```js
// Lấy đối tượng SVGLength
const svg = document.querySelector("svg");

// Giả sử `length` là một thực thể của SVGLength
const length = svg.createSVGLength();

// Đặt giá trị độ dài
length.newValueSpecifiedUnits(SVGLength.SVG_LENGTHTYPE_PERCENTAGE, 20);

// Kiểm tra loại đơn vị
console.log(length.unitType); // Output: 2 (SVG_LENGTHTYPE_PERCENTAGE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedLength")}}
