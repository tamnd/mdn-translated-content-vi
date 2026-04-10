---
title: "Element: lastElementChild property"
short-title: lastElementChild
slug: Web/API/Element/lastElementChild
page-type: web-api-instance-property
browser-compat: api.Element.lastElementChild
---

{{ APIRef("DOM") }}

Thuộc tính **`Element.lastElementChild`** là thuộc tính chỉ đọc
trả về an element's last child {{domxref("Element")}}, or `null` if there
are no child elements.

`Element.lastElementChild` includes only element nodes.
To get all child nodes, including non-element nodes like text and comment nodes, use {{domxref("Node.lastChild")}}.

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
console.log(list.lastElementChild.textContent);
// logs "Third (3)"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.previousElementSibling")}}
- {{domxref("Element.firstElementChild")}}
