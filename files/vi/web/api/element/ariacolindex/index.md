---
title: "Element: thuộc tính ariaColIndex"
short-title: ariaColIndex
slug: Web/API/Element/ariaColIndex
page-type: web-api-instance-property
browser-compat: api.Element.ariaColIndex
---

{{APIRef("DOM")}}

Thuộc tính **`ariaColIndex`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex), định nghĩa chỉ mục cột hoặc vị trí của phần tử so với tổng số cột trong bảng, lưới hoặc treegrid.

## Giá trị

Một chuỗi chứa một số nguyên.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-colindex` trên phần tử có ID `role-heading` được đặt thành "1". Sử dụng `ariaColIndex` chúng ta cập nhật giá trị thành "2".

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
        aria-colindex="1">
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
console.log(el.ariaColIndex); // 1
el.ariaColIndex = "2";
console.log(el.ariaColIndex); // 2
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò table](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
