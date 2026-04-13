---
title: "Element: removeAttributeNS() method"
short-title: removeAttributeNS()
slug: Web/API/Element/removeAttributeNS
page-type: web-api-instance-method
browser-compat: api.Element.removeAttributeNS
---

{{ APIRef("DOM") }}

Thuộc tính **`removeAttributeNS()`** method of the
{{domxref("Element")}} interface removes the specified attribute with the specified namespace from an element.

If you are working with HTML and you don't need to specify the requested attribute as being part of a specific namespace, use the {{domxref("Element.removeAttribute()", "removeAttribute()")}} method instead.

## Cú pháp

```js-nolint
removeAttributeNS(namespace, attrName)
```

### Tham số

- `namespace`
  - : Một chuỗi that chứa the namespace of the attribute.
- `attrName`
  - : Một chuỗi that names the attribute to be removed from the
    current node.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
// Given:
//   <div id="div1" xmlns:special="http://www.mozilla.org/ns/specialspace"
//     special:specialAlign="utterleft" width="200px" />
d = document.getElementById("div1");
d.removeAttributeNS("http://www.mozilla.org/ns/specialspace", "specialAlign");
// Now: <div id="div1" width="200px" />
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.hasAttributeNS()")}}
- {{domxref("Element.getAttributeNS()")}}
- {{domxref("Element.setAttributeNS()")}}
