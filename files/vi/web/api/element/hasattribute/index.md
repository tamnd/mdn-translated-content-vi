---
title: "Element: hasAttribute() method"
short-title: hasAttribute()
slug: Web/API/Element/hasAttribute
page-type: web-api-instance-method
browser-compat: api.Element.hasAttribute
---

{{APIRef("DOM")}}

Thuộc tính **`Element.hasAttribute()`** method trả về a
**Boolean** value indicating whether the specified element has the
specified attribute or not.

## Cú pháp

```js-nolint
hasAttribute(name)
```

### Tham số

- `name`
  - : is a string representing the name of the attribute.

### Giá trị trả về

Một boolean.

## Ví dụ

```js
const foo = document.getElementById("foo");
if (foo.hasAttribute("bar")) {
  // do something
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.hasAttributes()")}}
- {{domxref("Element.getAttribute()")}}
- {{domxref("Element.setAttribute()")}}
- {{domxref("Element.removeAttribute()")}}
- {{domxref("Element.toggleAttribute()")}}
