---
title: "Element: getAttribute() method"
short-title: getAttribute()
slug: Web/API/Element/getAttribute
page-type: web-api-instance-method
browser-compat: api.Element.getAttribute
---

{{APIRef("DOM")}}

Thuộc tính **`getAttribute()`** method of the
{{domxref("Element")}} interface trả về the value of a specified attribute on the
element.

If the given attribute does not exist, the value returned will be `null`.

If you need to inspect the {{domxref("Attr")}} node's properties, you can use the {{domxref("Element.getAttributeNode()", "getAttributeNode()")}} method instead.

## Cú pháp

```js-nolint
getAttribute(attributeName)
```

### Tham số

- `attributeName`
  - : The name of the attribute whose value you want to get.

### Giá trị trả về

Một chuỗi chứa the value of `attributeName` if the attribute exists, otherwise `null`.

## Ví dụ

```html
<!-- example div in an HTML DOC -->
<div id="div1">Hi Champ!</div>
```

```js
const div1 = document.getElementById("div1");
// <div id="div1">Hi Champ!</div>

const exampleAttr = div1.getAttribute("id");
// "div1"

const lang = div1.getAttribute("lang");
// null
```

## Mô tả

### Lower casing

When called on an HTML element in a DOM flagged as an HTML document,
`getAttribute()` lower-cases its argument before proceeding.

### Retrieving nonce values

For security reasons, [CSP](/en-US/docs/Web/HTTP/Guides/CSP) nonces from non-script
sources, such as CSS selectors, and `.getAttribute("nonce")` calls are
hidden.

```js example-bad
let nonce = script.getAttribute("nonce");
// trả về empty string
```

Instead of retrieving the nonce from the content attribute, use the
{{domxref("HTMLElement/nonce", "nonce")}} property:

```js
let nonce = script.nonce;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.hasAttribute()")}}
- {{domxref("Element.setAttribute()")}}
- {{domxref("Element.removeAttribute()")}}
- {{domxref("Element.toggleAttribute()")}}
