---
title: "CSSPositionValue: y property"
short-title: y
slug: Web/API/CSSPositionValue/y
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.CSSPositionValue.y
---

{{deprecated_header}}{{APIRef("CSS Typed Object Model API")}}{{Non-standard_header}}

Thuộc tính **`y`** của giao diện
{{domxref("CSSPositionValue")}} trả về vị trí của phần tử dọc theo
trục dọc.

## Giá trị

Một {{domxref('CSSNumericValue')}}.

## Ví dụ

Ví dụ sau định vị container `<div>` cách 5 pixel từ
trên cùng và 10 pixel từ bên trái trang.

```js
let replaceEl = document.getElementById("container");
let position = new CSSPositionValue(CSS.px(5), CSS.px(10));

someDiv.attributeStyleMap.set("object-position", position);
console.log(position.x.value, position.y.value);
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSPositionValue.CSSPositionValue", "CSSPositionValue()")}}
- {{domxref("CSSPositionValue.x")}}
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
