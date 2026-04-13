---
title: "Element: thuộc tính ariaRowSpan"
short-title: ariaRowSpan
slug: Web/API/Element/ariaRowSpan
page-type: web-api-instance-property
browser-compat: api.Element.ariaRowSpan
---

{{APIRef("DOM")}}

Thuộc tính **`ariaRowSpan`** của giao diện {{domxref("Element")}} phản ánh giá trị của thuộc tính [`aria-rowspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowspan), định nghĩa số hàng mà một ô hoặc gridcell kéo dài trong bảng, grid hoặc treegrid.

## Giá trị

Một chuỗi chứa một số nguyên.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-rowspan` trên phần tử có ID là `spanning-heading` được đặt là "3". Sử dụng `ariaRowSpan`, chúng ta cập nhật giá trị thành "2".

```html
<table>
  <thead>
    <tr>
      <th id="spanning-heading" rowspan="3" aria-rowspan="3">
        Spanning heading
      </th>
      <th>Heading</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>One</td>
    </tr>
    <tr>
      <td>Two</td>
    </tr>
  </tbody>
</table>
```

```js
let el = document.getElementById("spanning-heading");
console.log(el.ariaRowSpan);
el.ariaRowSpan = "2";
console.log(el.ariaRowSpan);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [ARIA: vai trò table](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
