---
title: "Element: before() method"
short-title: before()
slug: Web/API/Element/before
page-type: web-api-instance-method
browser-compat: api.Element.before
---

{{APIRef("DOM")}}

Thuộc tính **`Element.before()`** method inserts a set of
{{domxref("Node")}} objects or strings in the children list of this
`Element`'s parent, just before this `Element`.
Strings are inserted as equivalent {{domxref("Text")}} nodes.

## Cú pháp

```js-nolint
before(param1)
before(param1, param2)
before(param1, param2, /* …, */ paramN)
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

### Inserting an element

```js
let container = document.createElement("div");
let p = document.createElement("p");
container.appendChild(p);
let span = document.createElement("span");

p.before(span);

console.log(container.outerHTML);
// "<div><span></span><p></p></div>"
```

### Inserting text

```js
let container = document.createElement("div");
let p = document.createElement("p");
container.appendChild(p);

p.before("Text");

console.log(container.outerHTML);
// "<div>Text<p></p></div>"
```

### Inserting an element and text

```js
let container = document.createElement("div");
let p = document.createElement("p");
container.appendChild(p);
let span = document.createElement("span");

p.before(span, "Text");

console.log(container.outerHTML);
// "<div><span></span>Text<p></p></div>"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.after()")}}
- {{domxref("Element.append()")}}
- {{domxref("Element.insertAdjacentElement()")}}
- {{domxref("CharacterData.before()")}}
- {{domxref("DocumentType.before()")}}
- {{domxref("Node.appendChild()")}}
- {{domxref("Node.insertBefore()")}}
- {{domxref("NodeList")}}
