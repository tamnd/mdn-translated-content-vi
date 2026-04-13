---
title: "Element: thuộc tính ariaMultiSelectable"
short-title: ariaMultiSelectable
slug: Web/API/Element/ariaMultiSelectable
page-type: web-api-instance-property
browser-compat: api.Element.ariaMultiSelectable
---

{{APIRef("DOM")}}

Thuộc tính **`ariaMultiSelectable`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-multiselectable`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable), cho biết người dùng có thể chọn nhiều mục từ các hậu duệ có thể chọn hiện tại.

> [!NOTE]
> Khi có thể, hãy sử dụng phần tử HTML {{htmlelement("select")}} vì nó có ngữ nghĩa tích hợp sẵn và không yêu cầu thuộc tính ARIA.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Có thể chọn nhiều mục cùng lúc.
- `"false"`
  - : Chỉ có thể chọn một mục.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-multiselectable` trên phần tử có ID `listbox1` được đặt thành "true" cho biết đầu vào này chấp nhận nhiều mục được chọn. Sử dụng `ariaMultiSelectable` chúng ta cập nhật giá trị thành "false".

```html
<div
  role="listbox"
  tabindex="0"
  id="listbox1"
  aria-multiselectable="true"
  aria-labelledby="listbox1label"
  aria-activedescendant="listbox1-1">
  <div role="option" id="listbox1-1" class="selected" aria-selected="true">
    Green
  </div>
  <div role="option" id="listbox1-2">Orange</div>
  <div role="option" id="listbox1-3">Red</div>
</div>
```

```js
let el = document.getElementById("listbox1");
console.log(el.ariaMultiSelectable); // "true"
el.ariaMultiSelectable = "false";
console.log(el.ariaMultiSelectable); // "false"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò listbox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
