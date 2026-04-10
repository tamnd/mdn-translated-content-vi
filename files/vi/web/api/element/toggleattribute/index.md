---
title: "Element: toggleAttribute() method"
short-title: toggleAttribute()
slug: Web/API/Element/toggleAttribute
page-type: web-api-instance-method
browser-compat: api.Element.toggleAttribute
---

{{APIRef("DOM")}}

Thuộc tính **`toggleAttribute()`** của giao diện {{domxref("Element")}} toggles a Boolean attribute on the given element, removing it if present and adding it if not present.

## Cú pháp

```js-nolint
toggleAttribute(name)
toggleAttribute(name, force)
```

### Tham số

- `name`
  - : Một chuỗi specifying the name of the attribute to be toggled.
    The attribute name is automatically converted to all lower-case when `toggleAttribute()` is called on an HTML element in an HTML document.
- `force` {{optional_inline}}
  - : Một boolean value which has the following effects:
    - if not specified at all, the `toggleAttribute` method "toggles" the attribute named `name` — removing it if it is present, or else adding it if it is not present
    - if true, the `toggleAttribute` method adds an attribute named `name`
    - if false, the `toggleAttribute` method removes the attribute named `name`

### Giá trị trả về

`true` if attribute **`name`** is eventually
present, and `false` otherwise.

### Ngoại lệ

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : The specified attribute `name` chứa one or more characters that are not valid in attribute names.
    The `name` must have at least one character, and may not contain ASCII whitespace, `NULL`, `/`, `=` or `>` (U+0000, U+002F, U+003D, or U+003E, respectively).

## Ví dụ

### Basic usage

Trong ví dụ sau, `toggleAttribute()` is used to toggle the `disabled` attribute of an {{HTMLElement("input")}}.

### HTML

```html
<input value="text" /> <button>toggleAttribute("disabled")</button>
```

### JavaScript

```js
const button = document.querySelector("button");
const input = document.querySelector("input");

button.addEventListener("click", () => {
  input.toggleAttribute("disabled");
});
```

### Result

{{ EmbedLiveSample('Examples', '300', '50') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.hasAttribute()")}}
- {{domxref("Element.getAttribute()")}}
- {{domxref("Element.removeAttribute()")}}
- {{domxref("Element.setAttribute()")}}
