---
title: "Element: thuộc tính ariaSetSize"
short-title: ariaSetSize
slug: Web/API/Element/ariaSetSize
page-type: web-api-instance-property
browser-compat: api.Element.ariaSetSize
---

{{APIRef("DOM")}}

Thuộc tính **`ariaSetSize`** của giao diện {{domxref("Element")}} phản ánh giá trị của thuộc tính [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize), định nghĩa số lượng mục trong một nhóm hoặc tập hợp hiện tại.

## Giá trị

Một chuỗi chứa một số nguyên, hoặc `"0"` nếu không xác định.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-setsize` trên phần tử có ID là `tree-item` được đặt là "5". Sử dụng `ariaSetSize`, chúng ta cập nhật giá trị thành "7".

```html
<div role="tree">
  <div role="treeitem" id="tree-item" aria-setsize="5" aria-posinset="2">
    Mục cây
  </div>
</div>
```

```js
let el = document.getElementById("tree-item");
console.log(el.ariaSetSize); // "5"
el.ariaSetSize = "7";
console.log(el.ariaSetSize); // "7"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [ARIA: vai trò treeitem](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role)
