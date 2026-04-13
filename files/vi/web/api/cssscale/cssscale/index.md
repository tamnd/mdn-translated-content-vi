---
title: "CSSScale: CSSScale() constructor"
short-title: CSSScale()
slug: Web/API/CSSScale/CSSScale
page-type: web-api-constructor
browser-compat: api.CSSScale.CSSScale
---

{{APIRef("CSS Typed OM")}}

Hàm khởi tạo **`CSSScale()`** tạo một đối tượng {{domxref("CSSScale")}} mới đại diện cho các giá trị {{cssxref("transform-function/scale", "scale()")}} và {{cssxref("transform-function/scale3d", "scale3d()")}} của thuộc tính {{CSSXref('transform')}} riêng lẻ trong CSS.

## Cú pháp

```js-nolint
new CSSScale(x, y)
new CSSScale(x, y, z)
```

### Tham số

- {{domxref('CSSScale.x','x')}}
  - : Giá trị cho trục x của đối tượng {{domxref('CSSScale')}} được tạo. Phải là một số (sẽ được bọc trong {{domxref("CSSUnitValue")}} với `unit: "number"`) hoặc một {{domxref("CSSNumericValue")}}.
- {{domxref('CSSScale.y','y')}}
  - : Giá trị cho trục y của đối tượng {{domxref('CSSScale')}} được tạo. Phải là một số (sẽ được bọc trong {{domxref("CSSUnitValue")}} với `unit: "number"`) hoặc một {{domxref("CSSNumericValue")}}.
- {{domxref('CSSScale.z','z')}} {{optional_inline}}
  - : Giá trị cho trục z của đối tượng {{domxref('CSSScale')}} được tạo. Phải là một số (sẽ được bọc trong {{domxref("CSSUnitValue")}} với `unit: "number"`) hoặc một {{domxref("CSSNumericValue")}}. Nếu truyền vào một giá trị, thuộc tính `is2D` sẽ được đặt thành false.

## Ví dụ

Sẽ cập nhật sau.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
