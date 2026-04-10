---
title: "Element: thuộc tính ariaSelected"
short-title: ariaSelected
slug: Web/API/Element/ariaSelected
page-type: web-api-instance-property
browser-compat: api.Element.ariaSelected
---

{{APIRef("DOM")}}

Thuộc tính **`ariaSelected`** của giao diện {{domxref("Element")}} phản ánh giá trị của thuộc tính [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected), cho biết phần tử con của phần tử hiện tại có được chọn hay không.

## Giá trị

Một chuỗi có giá trị `"true"` hoặc `"false"`.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-selected` trên phần tử có ID là `selected-item` được đặt là "true". Sử dụng `ariaSelected`, chúng ta cập nhật giá trị thành "false".

```html
<div role="listbox">
  <div role="option" id="selected-item" aria-selected="true">
    Mục đã chọn
  </div>
  <div role="option">Mục chưa chọn</div>
</div>
```

```js
let el = document.getElementById("selected-item");
console.log(el.ariaSelected); // "true"
el.ariaSelected = "false";
console.log(el.ariaSelected); // "false"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [ARIA: vai trò option](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
