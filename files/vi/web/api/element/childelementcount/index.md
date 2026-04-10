---
title: "Element: childElementCount property"
short-title: childElementCount
slug: Web/API/Element/childElementCount
page-type: web-api-instance-property
browser-compat: api.Element.childElementCount
---

{{ APIRef("DOM") }}

Thuộc tính **`Element.childElementCount`** read-only property
returns the number of child elements of this element.

## Ví dụ

```js
let sidebar = document.getElementById("sidebar");
if (sidebar.childElementCount > 0) {
  // Do something
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Document.childElementCount")}}
- {{domxref("DocumentFragment.childElementCount")}}
