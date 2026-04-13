---
title: "Element: hasAttributes() method"
short-title: hasAttributes()
slug: Web/API/Element/hasAttributes
page-type: web-api-instance-method
browser-compat: api.Element.hasAttributes
---

{{ApiRef("DOM")}}

Thuộc tính **`hasAttributes()`** method of the {{domxref("Element")}}
interface trả về a boolean value indicating whether the current element has any
attributes or not.

## Cú pháp

```js-nolint
hasAttributes()
```

### Tham số

None.

### Giá trị trả về

Một boolean.

## Ví dụ

```js
let foo = document.getElementById("foo");
if (foo.hasAttributes()) {
  // Do something with 'foo.attributes'
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.attributes")}}
- {{domxref("Element.hasAttribute()")}}
- {{domxref("Element.getAttribute()")}}
- {{domxref("Element.setAttribute()")}}
- {{domxref("Element.removeAttribute()")}}
- {{domxref("Element.toggleAttribute()")}}
