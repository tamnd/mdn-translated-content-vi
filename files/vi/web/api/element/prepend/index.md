---
title: "Element: prepend() method"
short-title: prepend()
slug: Web/API/Element/prepend
page-type: web-api-instance-method
browser-compat: api.Element.prepend
---

{{APIRef("DOM")}}

Thuộc tính **`Element.prepend()`** method inserts a set of
{{domxref("Node")}} objects or strings before the first child
of the {{domxref("Element")}}. Strings are inserted as
equivalent {{domxref("Text")}} nodes.

## Cú pháp

```js-nolint
prepend(param1)
prepend(param1, param2)
prepend(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, …, `paramN`
  - : A set of {{domxref("Node")}} objects or strings to insert.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Thrown when the node cannot be inserted at the specified point in the hierarchy.

## Ví dụ

### Prepending an element

```js
let div = document.createElement("div");
let p = document.createElement("p");
let span = document.createElement("span");
div.append(p);
div.prepend(span);

console.log(div.childNodes); // NodeList [ <span>, <p> ]
```

### Prepending text

```js
let div = document.createElement("div");
div.append("Some text");
div.prepend("Headline: ");

console.log(div.textContent); // "Headline: Some text"
```

### Prepending an element and text

```js
let div = document.createElement("div");
let p = document.createElement("p");
div.prepend("Some text", p);

console.log(div.childNodes); // NodeList [ #text "Some text", <p> ]
```

### The prepend method is unscopable

The `prepend()` method is not scoped into the `with` statement.
See {{jsxref("Symbol.unscopables")}} for more information.

```js
let div = document.createElement("div");

with (div) {
  prepend("foo");
}
// ReferenceError: prepend is not defined
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.append()")}}
- {{domxref("Node.appendChild()")}}
- {{domxref("Node.insertBefore()")}}
- {{domxref("Element.before()")}}
- {{domxref("Element.insertAdjacentElement()")}}
- {{domxref("NodeList")}}
