---
title: "Element: replaceWith() method"
short-title: replaceWith()
slug: Web/API/Element/replaceWith
page-type: web-api-instance-method
browser-compat: api.Element.replaceWith
---

{{APIRef("DOM")}}

Thuộc tính **`Element.replaceWith()`** method replaces this
`Element` in the children list of its parent with a set of
{{domxref("Node")}} objects or strings. Strings are inserted as equivalent {{domxref("Text")}} nodes.

## Cú pháp

```js-nolint
replaceWith(param1)
replaceWith(param1, param2)
replaceWith(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, …, `paramN`
  - : A set of {{domxref("Node")}} objects or strings to replace.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Thrown when the node cannot be inserted at the specified point in the hierarchy.

## Ví dụ

### Sử dụng `replaceWith()`

```js
const div = document.createElement("div");
const p = document.createElement("p");
div.appendChild(p);
const span = document.createElement("span");

p.replaceWith(span);

console.log(div.outerHTML);
// "<div><span></span></div>"
```

### `replaceWith()` is unscopable

The `replaceWith()` method is not scoped into the `with`
statement. See {{jsxref("Symbol.unscopables")}} for more information.

```js
with (node) {
  replaceWith("foo");
}
// ReferenceError: replaceWith is not defined
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Node.replaceChild()")}}
- {{domxref("NodeList")}}
- {{domxref("CharacterData.replaceWith()")}}
- {{domxref("DocumentType.replaceWith()")}}
