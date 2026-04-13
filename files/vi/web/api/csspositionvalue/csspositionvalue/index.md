---
title: "CSSPositionValue: CSSPositionValue() constructor"
short-title: CSSPositionValue()
slug: Web/API/CSSPositionValue/CSSPositionValue
page-type: web-api-constructor
status:
  - deprecated
  - non-standard
browser-compat: api.CSSPositionValue.CSSPositionValue
---

{{APIRef("CSS Typed Object Model API")}}{{deprecated_header}}{{Non-standard_header}}

Hàm khởi tạo **`CSSPositionValue()`**
tạo đối tượng {{domxref("CSSPositionValue")}} mới đại diện cho các giá trị cho
các thuộc tính nhận vị trí, ví dụ {{cssxref('object-position')}}.

## Cú pháp

```js-nolint
new CSSPositionValue(x, y)
```

### Tham số

- `x`
  - : Vị trí dọc theo trục ngang của trang web.
- `y`
  - : Vị trí dọc theo trục dọc của trang web.

## Ví dụ

Ví dụ sau định vị container `<div>` cách 5 pixel từ
trên cùng và 10 pixel từ bên trái trang.

```js
let someDiv = document.getElementById("container");
let position = new CSSPositionValue(CSS.px(5), CSS.px(10));

someDiv.attributeStyleMap.set("object-position", position);
console.log(position.x.value, position.y.value); // 5 10
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSPositionValue.x")}}
- {{domxref("CSSPositionValue.y")}}
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
