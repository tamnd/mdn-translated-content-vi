---
title: "Element: hasAttributeNS() method"
short-title: hasAttributeNS()
slug: Web/API/Element/hasAttributeNS
page-type: web-api-instance-method
browser-compat: api.Element.hasAttributeNS
---

{{ APIRef("DOM") }}

Thuộc tính **`hasAttributeNS()`** của giao diện {{domxref("Element")}} trả về a boolean value indicating whether the current element has the specified attribute with the specified namespace.

If you are working with HTML documents and you don't need to specify the requested attribute as being part of a specific namespace, use the {{domxref("Element.hasAttribute()", "hasAttribute()")}} method instead.

## Cú pháp

```js-nolint
hasAttributeNS(namespace,localName)
```

### Tham số

- `namespace`
  - : Một chuỗi specifying the namespace of the attribute.
- `localName`
  - : The name of the attribute.

### Giá trị trả về

Một boolean.

## Ví dụ

```js
// Check that the attribute exists before you set a value
const d = document.getElementById("div1");
if (
  d.hasAttributeNS("http://www.mozilla.org/ns/specialspace/", "special-align")
) {
  d.setAttribute("align", "center");
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.getAttributeNS()")}}
- {{domxref("Element.setAttributeNS()")}}
- {{domxref("Element.removeAttributeNS()")}}
