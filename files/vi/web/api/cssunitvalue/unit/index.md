---
title: "CSSUnitValue: unit property"
short-title: unit
slug: Web/API/CSSUnitValue/unit
page-type: web-api-instance-property
browser-compat: api.CSSUnitValue.unit
---

{{APIRef("CSS Typed Object Model API")}}

Thuộc tính chỉ đọc **`CSSUnitValue.unit`**
của giao diện {{domxref("CSSUnitValue")}} trả về chuỗi
cho biết loại đơn vị.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau tạo {{domxref('CSSPositionValue')}} từ các
hàm khởi tạo `CSSUnitValue`, sau đó truy vấn
`CSSUnitValue.unit`.

```js
const pos = new CSSPositionValue(
  new CSSUnitValue(5, "px"),
  new CSSUnitValue(10, "em"),
);

console.log(pos.x.unit); // "px"
console.log(pos.y.unit); // "em"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('CSSUnitValue.value')}}
- [Dimensions in CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#dimensions)
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
