---
title: CSSUnitValue
slug: Web/API/CSSUnitValue
page-type: web-api-interface
browser-compat: api.CSSUnitValue
---

{{APIRef("CSS Typed Object Model API")}}

Giao diện **`CSSUnitValue`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model#css_typed_object_model) đại diện cho các giá trị chứa một loại đơn vị duy nhất. Ví dụ, "42px" sẽ được đại diện bởi `CSSNumericValue`.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("CSSUnitValue.CSSUnitValue", "CSSUnitValue()")}}
  - : Tạo một đối tượng `CSSUnitValue` mới.

## Thuộc tính phiên bản

- {{domxref('CSSUnitValue.value')}}
  - : Trả về double cho biết số đơn vị.
- {{domxref('CSSUnitValue.unit')}}
  - : Trả về chuỗi cho biết loại đơn vị.

## Phương thức tĩnh

_Giao diện cũng có thể kế thừa các phương thức từ giao diện cha, {{domxref("CSSNumericValue")}}._

## Phương thức phiên bản

_Giao diện cũng có thể kế thừa các phương thức từ giao diện cha, {{domxref("CSSNumericValue")}}._

## Ví dụ

Ví dụ sau đây cho thấy phương thức tạo {{domxref('CSSPositionValue')}} từ các hàm khởi tạo `CSSUnitValue` riêng lẻ.

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
