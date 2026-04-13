---
title: "Element: ariaActiveDescendantElement property"
short-title: ariaActiveDescendantElement
slug: Web/API/ElementInternals/ariaActiveDescendantElement
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaActiveDescendantElement
---

{{APIRef("DOM")}}

Thuộc tính **`ariaActiveDescendantElement`** của giao diện {{domxref("ElementInternals")}} đại diện cho phần tử đang hoạt động hiện tại khi tiêu điểm đang ở widget [`composite`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role), [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role), [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role), [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role) hoặc [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role).

Chủ đề [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant) chứa thông tin bổ sung về cách sử dụng thuộc tính và thuộc tính này.

## Giá trị

Một lớp con của {{domxref("HTMLElement")}} đại diện cho phần tử con đang hoạt động, hoặc `null` nếu không có phần tử con đang hoạt động.

## Mô tả

Thuộc tính là một thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant).
Không giống như `aria-activedescendant`, phần tử được gán cho thuộc tính này không nhất thiết phải có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Thuộc tính phản ánh thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage) của phần tử khi được xác định, nhưng chỉ cho các giá trị `id` tham chiếu khớp với các phần tử hợp lệ trong phạm vi.
Nếu thuộc tính được đặt, thuộc tính tương ứng sẽ bị xóa.
Để biết thêm thông tin về tham chiếu phần tử được phản ánh và phạm vi, xem [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính được phản ánh_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant)
- {{domxref("Element.ariaActiveDescendantElement")}}
- [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản ánh thuộc tính_.
