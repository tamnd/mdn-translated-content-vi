---
title: "Element: removeAttributeNode() method"
short-title: removeAttributeNode()
slug: Web/API/Element/removeAttributeNode
page-type: web-api-instance-method
browser-compat: api.Element.removeAttributeNode
---

{{ APIRef("DOM") }}

Thuộc tính **`removeAttributeNode()`** của giao diện {{domxref("Element")}} removes the specified {{domxref("Attr")}} node from the element.

If you don't need to inspect the attribute node before removing it, you can use the {{domxref("Element.removeAttribute()")}} method instead.

## Cú pháp

```js-nolint
removeAttributeNode(attributeNode)
```

### Tham số

- `attributeNode`
  - : The attribute node to remove from the element.

### Giá trị trả về

The attribute node that was removed.

### Ngoại lệ

- `NotFoundError` {{DOMxRef("DOMException")}}
  - : Thrown when the element's attribute list does not contain the attribute node.

## Ví dụ

```js
// Given: <div id="foo" lang="en-US" />
const d = document.getElementById("foo");
const dLang = d.getAttributeNode("lang");
d.removeAttributeNode(dLang);
// lang is now removed: <div id="foo" />
```

## Notes

If the removed attribute has a default value, it is immediately replaced. The replacing
attribute has the same namespace URI and local name, as well as the original prefix,
when applicable.

There is no `removeAttributeNodeNS` method; the
`removeAttributeNode` method can remove both namespaced attributes and
non-namespaced attributes.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Document.createAttribute()")}}
- {{domxref("Element.getAttributeNode()")}}
- {{domxref("Element.setAttributeNode()")}}
