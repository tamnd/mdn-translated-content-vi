---
title: "Element: getElementsByTagNameNS() method"
short-title: getElementsByTagNameNS()
slug: Web/API/Element/getElementsByTagNameNS
page-type: web-api-instance-method
browser-compat: api.Element.getElementsByTagNameNS
---

{{APIRef("DOM")}}

Thuộc tính **`Element.getElementsByTagNameNS()`** method trả về a
live {{domxref("HTMLCollection")}} of elements with the given tag name belonging to the
given namespace. It is similar to {{Domxref("Document.getElementsByTagNameNS")}}, except
that its search is restricted to descendants of the specified element.

## Cú pháp

```js-nolint
getElementsByTagNameNS(namespaceURI, localName)
```

### Tham số

- `namespaceURI`
  - : The namespace URI of elements to look for (see
    {{domxref("Element.namespaceURI")}} and {{domxref("Attr.namespaceURI")}}). For
    example, if you need to look for XHTML elements, use the XHTML namespace URI,
    `http://www.w3.org/1999/xhtml`.
- `localName`
  - : Either the local name of elements to look for or the
    special value `"*"`, which matches all elements (see
    {{domxref("Element.localName")}} and {{domxref("Attr.localName")}}).

### Giá trị trả về

A live {{domxref("HTMLCollection")}} of found elements in the order they appear in the tree.

## Ví dụ

```js
// Check the alignment on a number of cells in a table in an XHTML document.
const table = document.getElementById("forecast-table");
const cells = table.getElementsByTagNameNS(
  "http://www.w3.org/1999/xhtml",
  "td",
);

for (const cell of cells) {
  const axis = cell.getAttribute("axis");
  if (axis === "year") {
    // Grab the data
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
