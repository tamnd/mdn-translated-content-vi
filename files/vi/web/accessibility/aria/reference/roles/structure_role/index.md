---
title: "ARIA: vai trò structure"
short-title: structure
slug: Web/Accessibility/ARIA/Reference/Roles/structure_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#structure
sidebar: accessibilitysidebar
---

Vai trò `structure` dành cho các phần tử cấu trúc tài liệu.

> [!WARNING]
> Vai trò `structure` là một [vai trò trừu tượng](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#6._abstract_roles). Nó được đưa vào đây để tài liệu đầy đủ. Tác giả web không nên dùng nó. Hãy dùng HTML và các vai trò cấu trúc con.

## Mô tả

`Structure` là một vai trò trừu tượng cha cho các cấu trúc tài liệu, như [`document`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role),
[`rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role), và [`sectionhead`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/sectionhead_role), hỗ trợ khả năng tiếp cận của nội dung web động bằng cách giúp công nghệ hỗ trợ xác định nội dung đang hoạt động so với nội dung tài liệu tĩnh. Một số vai trò con, như
[`section` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/section_role), lại là vai trò cha của các vai trò khác.

Vai trò `structure` là vai trò cha cho tất cả các vai trò cấu trúc tài liệu, vốn được dùng để cung cấp mô tả cấu trúc cho một phần nội dung. Hầu hết các vai trò cấu trúc giờ đây không còn nên dùng nữa vì trình duyệt đã hỗ trợ các phần tử HTML ngữ nghĩa có cùng ý nghĩa. Các vai trò cấu trúc không có phần tử HTML tương đương, như vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) có nghĩa là nội dung chỉ mang tính trình bày, cung cấp thông tin về cấu trúc tài liệu cho công nghệ hỗ trợ như trình đọc màn hình khi không có thẻ HTML gốc tương đương.

## Đặc tả

{{Specifications}}

## Xem thêm

- [ARIA: vai trò `roletype`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/roletype_role)
- [ARIA: vai trò `generic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role)
- [ARIA: vai trò `presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role)
- [ARIA: vai trò `range`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/range_role)
- [ARIA: vai trò `section`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/section_role)
- [ARIA: vai trò `sectionhead`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/sectionhead_role)

<!-- these shouldn't be used so we shouldn't link to them
- [ARIA: `application` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role)
- [ARIA: `document` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role)
- [ARIA: `rowgroup` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role)
- [ARIA: `separator` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role)
-->
