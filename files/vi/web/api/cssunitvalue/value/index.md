---
title: "CSSUnitValue: value property"
short-title: value
slug: Web/API/CSSUnitValue/value
page-type: web-api-instance-property
browser-compat: api.CSSUnitValue.value
---

{{APIRef("CSS Typed Object Model API")}}

Thuộc tính **`CSSUnitValue.value`** của giao diện
{{domxref("CSSUnitValue")}} trả về double cho biết số đơn vị.

## Giá trị

Một double.

## Ví dụ

Ví dụ sau tạo {{domxref('CSSPositionValue')}} từ các
hàm khởi tạo `CSSUnitValue`, sau đó truy vấn
`CSSUnitValue.value`.

```js
const pos = new CSSPositionValue(
  new CSSUnitValue(5, "px"),
  new CSSUnitValue(10, "px"),
);

console.log(pos.x.value); // 5
console.log(pos.y.value); // 10
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('CSSUnitValue.unit')}}
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
