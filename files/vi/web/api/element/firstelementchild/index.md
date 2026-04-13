---
title: "Element: firstElementChild property"
short-title: firstElementChild
slug: Web/API/Element/firstElementChild
page-type: web-api-instance-property
browser-compat: api.Element.firstElementChild
---

{{ APIRef("DOM") }}

Thuộc tính **`Element.firstElementChild`** là thuộc tính chỉ đọc
trả về an element's first child {{domxref("Element")}}, or `null` if there
are no child elements.

`Element.firstElementChild` includes only element nodes.
To get all child nodes, including non-element nodes like text and comment nodes, use {{domxref("Node.firstChild")}}.

## Giá trị

Một {{domxref("Element")}} object, or `null`.

## Ví dụ

```html
<ul id="list">
  <li>First (1)</li>
  <li>Second (2)</li>
  <li>Third (3)</li>
</ul>
```

```js
const list = document.getElementById("list");
console.log(list.firstElementChild.textContent);
// logs "First (1)"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.nextElementSibling")}}
- {{domxref("Element.lastElementChild")}}
