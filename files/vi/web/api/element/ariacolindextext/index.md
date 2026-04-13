---
title: "Element: thuộc tính ariaColIndexText"
short-title: ariaColIndexText
slug: Web/API/Element/ariaColIndexText
page-type: web-api-instance-property
browser-compat: api.Element.ariaColIndexText
---

{{APIRef("DOM")}}

Thuộc tính **`ariaColIndexText`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-colindextext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindextext), định nghĩa phần thay thế văn bản dễ đọc cho con người của aria-colindex.

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-colindextext` trên phần tử có ID `role-heading` được đặt thành "Aria Role column". Sử dụng `ariaColIndexText` chúng ta cập nhật giá trị thành chuỗi "New column name".

```html
<table
  id="semantic-table"
  role="table"
  aria-label="Semantic Elements"
  aria-describedby="semantic_elements_table_desc"
  aria-rowcount="100">
  <caption id="semantic_elements_table_desc">
    Semantic Elements to use instead of ARIA's roles
  </caption>
  <thead role="rowgroup">
    <tr role="row">
      <th
        role="columnheader"
        id="role-heading"
        aria-sort="none"
        aria-rowindex="1"
        aria-colindex="1"
        aria-colindextext="Aria Role column">
        ARIA Role
      </th>
      <th
        role="columnheader"
        id="element-heading"
        aria-sort="none"
        aria-rowindex="1">
        Semantic Element
      </th>
    </tr>
  </thead>
  <tbody role="rowgroup">
    <tr role="row">
      <td role="cell" aria-rowindex="11">header</td>
      <td role="cell" aria-rowindex="11">h1</td>
    </tr>
    <tr role="row">
      <td role="cell" aria-rowindex="16">header</td>
      <td role="cell" aria-rowindex="16">h6</td>
    </tr>
    <tr role="row">
      <td role="cell" aria-rowindex="18">rowgroup</td>
      <td role="cell" aria-rowindex="18">thead</td>
    </tr>
    <tr role="row">
      <td role="cell" aria-rowindex="24">term</td>
      <td role="cell" aria-rowindex="24">dt</td>
    </tr>
  </tbody>
</table>
```

```js
let el = document.getElementById("role-heading");
console.log(el.ariaColIndexText); // "Aria Role"
el.ariaColIndexText = "New column name";
console.log(el.ariaColIndexText); // "New column name"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò table](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
