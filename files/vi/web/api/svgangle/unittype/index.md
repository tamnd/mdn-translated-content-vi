---
title: "SVGAngle: unitType property"
short-title: unitType
slug: Web/API/SVGAngle/unitType
page-type: web-api-instance-property
browser-compat: api.SVGAngle.unitType
---

{{APIRef("SVG")}}

Thuộc tính **`unitType`** của giao diện {{domxref("SVGAngle")}} là một trong các [hằng số loại đơn vị](/en-US/docs/Web/API/SVGAngle#static_properties) và đại diện cho đơn vị mà giá trị góc này được biểu thị.

## Giá trị

Một số đại diện cho giá trị số của hằng số.

## Ví dụ

Đây là ví dụ về cách truy cập thuộc tính `unitType`:

```js
// Lấy đối tượng SVGAngle
const svg = document.querySelector("svg");
const angle = svg.createSVGAngle();

// Đặt giá trị góc
angle.newValueSpecifiedUnits(SVGAngle.SVG_ANGLETYPE_DEG, 45);

// Kiểm tra loại đơn vị
console.log(angle.unitType); // Output: 2 (SVG_ANGLETYPE_DEG)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedAngle")}}
