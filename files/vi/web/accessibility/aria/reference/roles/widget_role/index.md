---
title: "ARIA: vai trò widget"
short-title: widget
slug: Web/Accessibility/ARIA/Reference/Roles/widget_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#widget
sidebar: accessibilitysidebar
---

**Vai trò `widget`**, một [vai trò trừu tượng](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#6._abstract_roles), là một thành phần tương tác của giao diện người dùng đồ họa (GUI).

> [!WARNING]
> Vai trò `widget` là một vai trò trừu tượng được dùng cho ontology. Nó được đưa vào đây để tài liệu đầy đủ. Tác giả web không nên dùng nó.

## Mô tả

Vai trò trừu tượng `widget` là vai trò cha cho một số phần tử GUI tương tác và các vai trò nhóm. `role="widget"` không nên bị nhầm với các vai trò widget, như `option`, `menuitem`, và `searchbox`.

Vai trò `widget` là vai trò cha cho một số vai trò GUI tương tác trừu tượng, bao gồm [`command`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/command_role), [`composite`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role), [`input`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/input_role), [`range`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/range_role), và [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) (nếu có thể nhận focus), vốn không nên được dùng bởi tác giả web.

Vai trò trừu tượng `widget` cũng là vai trò cha cho một số vai trò nhóm có thể được dùng bởi tác giả web, bao gồm [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role), [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) (khi không thể nhận focus), và [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role), vốn có thể và nên được dùng khi phù hợp. Khi người dùng điều hướng tới một trong các vai trò widget không trừu tượng này, các sự kiện bàn phím có thể chuyển sang chế độ duyệt ứng dụng, và chuyển tiếp sự kiện bàn phím qua trình duyệt.

## Đặc tả

{{Specifications}}

## Xem thêm

- [ARIA: vai trò `roletype`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/roletype_role)

- [ARIA: vai trò `command`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/command_role)
- [ARIA: vai trò `composite`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role)
- [ARIA: vai trò `gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [ARIA: vai trò `input`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/input_role)
- [ARIA: vai trò `range`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/range_role)
- [ARIA: vai trò `row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [ARIA: vai trò `separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role)
- [ARIA: vai trò `tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)
