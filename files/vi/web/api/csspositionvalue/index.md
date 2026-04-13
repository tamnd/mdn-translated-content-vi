---
title: CSSPositionValue
slug: Web/API/CSSPositionValue
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.CSSPositionValue
---

{{deprecated_header}}{{APIRef("CSS Typed Object Model API")}}{{Non-standard_header}}

Giao diện **`CSSPositionValue`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model#css_typed_object_model) đại diện cho các giá trị cho các thuộc tính nhận vị trí, ví dụ {{cssxref('object-position')}}.

## Hàm khởi tạo

- {{domxref("CSSPositionValue.CSSPositionValue", "CSSPositionValue()")}} {{Non-standard_Inline}} {{Deprecated_Inline}}
  - : Tạo một đối tượng `CSSPositionValue` mới.

## Thuộc tính phiên bản

- {{domxref('CSSPositionValue.x')}} {{Non-standard_Inline}} {{Deprecated_Inline}}
  - : Trả về vị trí của phần tử dọc theo trục ngang của trang web.
- {{domxref('CSSPositionValue.y')}} {{Non-standard_Inline}} {{Deprecated_Inline}}
  - : Trả về vị trí của phần tử dọc theo trục dọc.

## Phương thức phiên bản

Không có.

## Ví dụ

Ví dụ sau định vị container `<div>` cách 5 pixel từ trên cùng và 10 pixel từ bên trái trang.

```js
const replacedEl = document.getElementById("image");
const position = new CSSPositionValue(CSS.px(35), CSS.px(40));

replacedEl.attributeStyleMap.set("object-position", position);
console.log(position.x.value, position.y.value);
console.log(replacedEl.computedStyleMap().get("object-position"));
```

Chúng ta đặt thuộc tính {{cssxref('object-position')}}, sau đó kiểm tra các giá trị được trả về.

```css hidden
#image {
  width: 300px;
  height: 300px;
  border: 1px solid black;
  background-color: #dededf;
  object-fit: none;
}
```

```html hidden
<p>
  Check the developer tools to see the log in the console and to inspect the
  style attribute on the image.
</p>
<img id="image" src="mdn.svg" alt="MDN Logo" />
```

{{EmbedLiveSample("Examples", 300, 300)}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('CSSImageValue')}}
- {{domxref('CSSKeywordValue')}}
- {{domxref('CSSNumericValue')}}
- {{domxref('CSSTransformValue')}}
- {{domxref('CSSUnparsedValue')}}
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
