---
title: "Element: thuộc tính ariaColCount"
short-title: ariaColCount
slug: Web/API/Element/ariaColCount
page-type: web-api-instance-property
browser-compat: api.Element.ariaColCount
---

{{APIRef("DOM")}}

Thuộc tính **`ariaColCount`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount), định nghĩa số cột trong bảng, lưới hoặc treegrid.

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-colcount` trên phần tử có ID `semantic-table` được đặt thành "2". Sử dụng `ariaColCount` chúng ta cập nhật giá trị thành "3".

```html
<table
  id="semantic-table"
  role="table"
  aria-label="Semantic Elements"
  aria-describedby="semantic_elements_table_desc"
  aria-rowcount="100"
  aria-colcount="2">
  <caption id="semantic_elements_table_desc">
    Semantic Elements to use instead of ARIA's roles
  </caption>
  <thead role="rowgroup">
    <tr role="row">
      <th role="columnheader" aria-sort="none" aria-rowindex="1">ARIA Role</th>
      <th role="columnheader" aria-sort="none" aria-rowindex="1">
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
let el = document.getElementById("semantic-table");
console.log(el.ariaColCount); // 2
el.ariaColCount = "3";
console.log(el.ariaColCount); // 3
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò table](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
