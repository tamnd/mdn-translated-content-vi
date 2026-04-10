---
title: "Element: thuộc tính ariaRowCount"
short-title: ariaRowCount
slug: Web/API/Element/ariaRowCount
page-type: web-api-instance-property
browser-compat: api.Element.ariaRowCount
---

{{APIRef("DOM")}}

Thuộc tính **`ariaRowCount`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount), định nghĩa tổng số hàng trong bảng, lưới hoặc treegrid.

## Giá trị

Một chuỗi chứa một số nguyên.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-rowcount` trên phần tử có ID `semantic-table` được đặt thành "100", đại diện cho tổng số hàng trong bảng, thay vì các hàng hiện đang hiển thị. Sử dụng `ariaRowCount` chúng ta cập nhật giá trị thành "101".

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
console.log(el.ariaRowCount); // 100
el.ariaRowCount = "101";
console.log(el.ariaRowCount); // 101
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò table](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
