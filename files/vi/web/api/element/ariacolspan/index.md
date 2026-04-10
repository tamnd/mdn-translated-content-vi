---
title: "Element: thuộc tính ariaColSpan"
short-title: ariaColSpan
slug: Web/API/Element/ariaColSpan
page-type: web-api-instance-property
browser-compat: api.Element.ariaColSpan
---

{{APIRef("DOM")}}

Thuộc tính **`ariaColSpan`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-colspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colspan), định nghĩa số cột mà một ô hoặc gridcell kéo dài trong bảng, lưới hoặc treegrid.

## Giá trị

Một chuỗi chứa một số nguyên.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-colspan` trên phần tử có ID `spanning-heading` được đặt thành "2". Sử dụng `ariaColSpan` chúng ta cập nhật giá trị thành "3".

```html
<table>
  <thead>
    <tr>
      <th>Heading 1</th>
      <th>Heading 2</th>
      <th>Heading 3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2" aria-colspan="2" id="spanning-column">Spanning</td>
      <td>One</td>
    </tr>
  </tbody>
</table>
```

```js
let el = document.getElementById("spanning-column");
console.log(el.ariaColSpan);
el.ariaColSpan = "3";
console.log(el.ariaColSpan);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò table](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
