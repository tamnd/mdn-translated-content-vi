---
title: CSSImageValue
slug: Web/API/CSSImageValue
page-type: web-api-interface
browser-compat: api.CSSImageValue
---

{{APIRef("CSS Typed Object Model API")}}

Giao diện **`CSSImageValue`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model#css_typed_object_model) đại diện cho các giá trị của các thuộc tính nhận ảnh, ví dụ {{cssxref('background-image')}}, {{cssxref('list-style-image')}} hoặc {{cssxref('border-image-source')}}.

Đối tượng CSSImageValue đại diện cho {{cssxref("image")}} liên quan đến URL, chẳng hạn như {{cssxref("url_function", "url()")}} hoặc {{cssxref("image()")}}, nhưng không phải {{cssxref("gradient/linear-gradient", "linear-gradient()")}} hoặc {{cssxref("element()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

_Kế thừa các phương thức từ {{domxref('CSSStyleValue')}}._

## Ví dụ

Chúng ta tạo một phần tử:

```html
<button>Magic Wand</button>
```

Chúng ta thêm một số CSS, bao gồm ảnh nền yêu cầu tệp nhị phân:

```css
button {
  display: inline-block;
  min-height: 100px;
  min-width: 100px;
  background: no-repeat 5% center url("magic-wand.png") aqua;
}
```

Chúng ta lấy style map của phần tử. Sau đó chúng ta `get()` background-image từ style map và stringify nó:

```js
// get the element
const button = document.querySelector("button");

// Retrieve all computed styles with computedStyleMap()
const allComputedStyles = button.computedStyleMap();

// Return the CSSImageValue Example
console.log(allComputedStyles.get("background-image"));
console.log(allComputedStyles.get("background-image").toString());
```

{{EmbedLiveSample("Examples", 120, 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('CSSKeywordValue')}}
- {{domxref('CSSNumericValue')}}
- {{domxref('CSSPositionValue')}}
- {{domxref('CSSTransformValue')}}
- {{domxref('CSSUnparsedValue')}}
