---
title: "CSSUnitValue: CSSUnitValue() constructor"
short-title: CSSUnitValue()
slug: Web/API/CSSUnitValue/CSSUnitValue
page-type: web-api-constructor
browser-compat: api.CSSUnitValue.CSSUnitValue
---

{{APIRef("CSS Typed Object Model API")}}

Hàm khởi tạo **`CSSUnitValue()`** tạo
một đối tượng {{domxref("CSSUnitValue")}} mới trả về {{domxref('CSSUnitValue')}} mới
đại diện cho các giá trị chứa một loại đơn vị duy nhất. Ví dụ, "42px"
sẽ được đại diện bởi `CSSNumericValue`.

## Cú pháp

```js-nolint
new CSSUnitValue(value, unit)
```

### Tham số

- `value`
  - : Double cho biết số đơn vị.
- `unit`
  - : Chuỗi cho biết loại đơn vị.

## Ví dụ

Ví dụ sau đây cho thấy phương thức tạo {{domxref('CSSPositionValue')}} từ
các hàm khởi tạo `CSSUnitValue` riêng lẻ.

```js
let pos = new CSSPositionValue(
  new CSSUnitValue(5, "px"),
  new CSSUnitValue(10, "px"),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('CSSUnitValue.unit')}}
- {{domxref('CSSUnitValue.value')}}
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
