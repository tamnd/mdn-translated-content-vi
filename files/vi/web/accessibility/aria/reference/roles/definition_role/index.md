---
title: "ARIA: vai trò definition"
short-title: definition
slug: Web/Accessibility/ARIA/Reference/Roles/definition_role
page-type: aria-role
sidebar: accessibilitysidebar
---

Vai trò `definition` biểu thị phần tử đang cung cấp định nghĩa cho một thuật ngữ.

## Mô tả

Vai trò `definition` được dùng để xác định một phần nội dung là định nghĩa của một thuật ngữ. Nó tương đương về ngữ nghĩa với phần tử HTML {{HTMLElement('dfn')}} khi phần tử đó dùng để đánh dấu thuật ngữ được định nghĩa.

Nó thường xuất hiện cùng với vai trò `term`, để tạo ra mối liên hệ giữa thuật ngữ và phần định nghĩa của nó.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

Không có.

### Tương tác bàn phím

Không có.

### Các tính năng JavaScript bắt buộc

Không có.

## Ví dụ

```html
<p>
  <span role="term" aria-details="def1">ARIA</span>
  <span role="definition" id="def1">
    Là Accessible Rich Internet Applications, một tập hợp vai trò và thuộc tính
    để làm nội dung web dễ tiếp cận hơn.
  </span>
</p>
```

## Thực hành tốt nhất

Nếu có thể, hãy dùng phần tử {{HTMLElement('dfn')}} để đánh dấu thuật ngữ và định nghĩa của nó.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML `dfn`
- [ARIA: vai trò `term`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/term_role)
