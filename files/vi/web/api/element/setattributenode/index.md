---
title: "Element: setAttributeNode() method"
short-title: setAttributeNode()
slug: Web/API/Element/setAttributeNode
page-type: web-api-instance-method
browser-compat: api.Element.setAttributeNode
---

{{ APIRef("DOM") }}

Thuộc tính **`setAttributeNode()`** của giao diện {{domxref("Element")}} adds a new {{domxref("Attr")}} node to the specified element.

If you don't need to work with the attribute node (such as cloning from another element) before adding it, you can use the {{domxref("Element.setAttribute()", "setAttribute()")}} method instead.

## Cú pháp

```js-nolint
setAttributeNode(attribute)
```

### Tham số

- `attribute`
  - : The {{domxref("Attr")}} node to add to the element.

### Giá trị trả về

The replaced attribute node, if any, returned by this function.

## Ví dụ

Ví dụ này copies the `lang` attribute from one element to another.

### HTML

```html
<div id="one" lang="en-US">one</div>
<div id="two">two</div>
```

### JavaScript

```js
const d1 = document.getElementById("one");
const d2 = document.getElementById("two");
const a = d1.getAttributeNode("lang");

d2.setAttributeNode(a.cloneNode(true));

// Returns: 'en-US'
console.log(d2.attributes[1].value);
```

## Notes

If the attribute named already exists trên phần tử, that attribute is replaced with
the new one and the replaced one is returned.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Document.createAttribute()")}}
- {{domxref("Element.getAttributeNode()")}}
- {{domxref("Element.removeAttributeNode()")}}
