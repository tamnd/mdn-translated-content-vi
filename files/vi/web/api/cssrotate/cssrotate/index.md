---
title: "CSSRotate: hàm khởi tạo CSSRotate()"
short-title: CSSRotate()
slug: Web/API/CSSRotate/CSSRotate
page-type: web-api-constructor
browser-compat: api.CSSRotate.CSSRotate
---

{{APIRef("CSS Typed OM")}}

Hàm khởi tạo **`CSSRotate()`** tạo một đối tượng {{domxref("CSSRotate")}} mới đại diện cho giá trị {{cssxref("transform-function/rotate", "rotate()")}} của thuộc tính {{CSSXref('transform')}} riêng lẻ trong CSS.

## Cú pháp

```js-nolint
new CSSRotate(x, y, z, angle)
```

### Tham số

- {{domxref('CSSRotate.x','x')}}
  - : Giá trị cho trục x của đối tượng {{domxref('CSSRotate')}} được tạo. Phải là một số (được bọc vào {{domxref("CSSUnitValue")}} với `unit: "number"`) hoặc một {{domxref("CSSNumericValue")}}.
- {{domxref('CSSRotate.y','y')}}
  - : Giá trị cho trục y của đối tượng {{domxref('CSSRotate')}} được tạo. Phải là một số (được bọc vào {{domxref("CSSUnitValue")}} với `unit: "number"`) hoặc một {{domxref("CSSNumericValue")}}.
- {{domxref('CSSRotate.z','z')}}
  - : Giá trị cho trục z của đối tượng {{domxref('CSSRotate')}} được tạo. Phải là một số (được bọc vào {{domxref("CSSUnitValue")}} với `unit: "number"`) hoặc một {{domxref("CSSNumericValue")}}.
- {{domxref('CSSRotate.angle','angle')}}
  - : Giá trị cho góc của đối tượng {{domxref('CSSRotate')}} được tạo. Phải là một {{domxref('CSSNumericValue')}}.

### Ngoại lệ

- [`TypeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError)
  - : Được ném ra nếu giá trị của `CSSRotate.angle` không phải là giá trị [\<angle>](/en-US/docs/Web/CSS/Reference/Values/angle) hoặc `CSSRotate.x`, `CSSRotate.y`, `CSSRotate.z` không phải là giá trị [\<number>](/en-US/docs/Web/CSS/Reference/Values/number).

## Ví dụ

Sẽ được thêm.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
