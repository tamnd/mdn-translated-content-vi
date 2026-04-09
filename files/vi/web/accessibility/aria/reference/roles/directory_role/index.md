---
title: "ARIA: vai trò directory"
short-title: directory
slug: Web/Accessibility/ARIA/Reference/Roles/directory_role
page-type: aria-role
status:
  - deprecated
spec-urls: https://w3c.github.io/aria/#directory
sidebar: accessibilitysidebar
---

Vai trò `directory` dành cho một danh sách các tham chiếu tới các thành viên của một nhóm, chẳng hạn một mục lục tĩnh.

> [!WARNING]
> Vai trò `directory` đã bị loại bỏ trong ARIA 1.2

## Mô tả

Directory là một mục lục tĩnh, dù có liên kết hay không. Điều này bao gồm các mục lục được tạo bằng danh sách, kể cả danh sách lồng nhau. Tuy nhiên, với mục lục động, có thể dùng vai trò tree thay thế.

Vai trò `directory` đã bị loại bỏ từng được dùng cho các danh sách tham chiếu đến các thành viên của một nhóm, chẳng hạn một mục lục tĩnh.
Hãy dùng vai trò [`list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role) thay thế. Hoặc tốt hơn nữa, hãy dùng các phần tử {{HTMLElement('ul')}} hoặc {{HTMLElement('ol')}}, vì dùng `directory` không mang lại thêm lợi ích nào cho người dùng công nghệ hỗ trợ.

## Đặc tả

{{Specifications}}

## Xem thêm

- [vai trò `list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role)
- Phần tử {{HTMLElement('ul')}} của HTML
- Phần tử {{HTMLElement('ol')}} của HTML
