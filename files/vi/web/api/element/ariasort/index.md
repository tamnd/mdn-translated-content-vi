---
title: "Element: thuộc tính ariaSort"
short-title: ariaSort
slug: Web/API/Element/ariaSort
page-type: web-api-instance-property
browser-compat: api.Element.ariaSort
---

{{APIRef("DOM")}}

Thuộc tính **`ariaSort`** của giao diện {{domxref("Element")}} phản ánh giá trị của thuộc tính [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort), cho biết các phần tử con trong phần tử hiện tại được sắp xếp theo thứ tự nào.

## Giá trị

Một chuỗi có giá trị là một trong các giá trị sau: `"ascending"`, `"descending"`, `"none"`, hoặc `"other"`.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-sort` trên phần tử có ID là `sortable-header` được đặt là "ascending". Sử dụng `ariaSort`, chúng ta cập nhật giá trị thành "descending".

```html
<table>
  <thead>
    <tr>
      <th id="sortable-header" aria-sort="ascending">Cột có thể sắp xếp</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Dữ liệu 1</td></tr>
    <tr><td>Dữ liệu 2</td></tr>
  </tbody>
</table>
```

```js
let el = document.getElementById("sortable-header");
console.log(el.ariaSort); // "ascending"
el.ariaSort = "descending";
console.log(el.ariaSort); // "descending"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [ARIA: vai trò columnheader](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
