---
title: "ARIA: vai trò generic"
short-title: generic
slug: Web/Accessibility/ARIA/Reference/Roles/generic_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#generic
sidebar: accessibilitysidebar
---

Vai trò `generic` tạo ra một phần tử vùng chứa không tên, bản thân nó không mang ý nghĩa ngữ nghĩa nào.

> [!NOTE]
> Vai trò `generic` là vai trò ngầm định của các phần tử generic được user agent dùng. Nó được đưa vào đây để tài liệu đầy đủ. Tác giả web không nên dùng nó.

## Mô tả

Trong khi ARIA chủ yếu được dùng để biểu đạt ngữ nghĩa, vẫn có một số phần tử không nên bộc lộ tên ngữ nghĩa cho công nghệ hỗ trợ. Vai trò `generic` cho biết vai trò của phần tử tương đương với các phần tử {{HTMLElement('div')}} và {{HTMLElement('span')}} không mang ngữ nghĩa.

Vai trò `generic` chỉ nhằm làm vai trò ngầm định của các phần tử generic trong ngôn ngữ chủ, để user agent dùng; không dành cho nhà phát triển. Thay vào đó, để loại bỏ ngữ nghĩa trợ năng ngầm định, hãy dùng [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) hoặc `none`, các phần tử {{HTMLElement('div')}} và {{HTMLElement('span')}} không mang ý nghĩa ngữ nghĩa, hoặc các vai trò vùng chứa ngữ nghĩa như [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role) để nhóm ngữ nghĩa các phần tử con trong một vùng chứa có tên.

Giống như một phần tử có vai trò `presentation`, một phần tử có `role="generic"` có thể cung cấp một số ít trạng thái và thuộc tính trợ năng cho các phần tử con của nó, chẳng hạn như thuộc tính [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live). Tuy nhiên, không giống các phần tử có vai trò `presentation`, các phần tử `generic` được bộc lộ trong các API trợ năng để công nghệ hỗ trợ có thể thu thập một số thuộc tính nhất định như bố cục và ranh giới.

Vì vai trò generic không có tên, các thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) và [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) bị cấm. Vì vai trò này là generic, các thuộc tính [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription) và [`aria-brailleroledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-brailleroledescription) cũng bị cấm.

> [!NOTE]
> Phần tử có `role="generic"` không nên có tên truy cập hoặc mô tả vai trò.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

Không có. Nếu một trạng thái và thuộc tính ARIA toàn cục được đặt, `generic` hoặc `none` sẽ bị bỏ qua, và vai trò ngầm định của phần tử sẽ được dùng.

## Ví dụ

Vai trò này dành cho user agent sử dụng, không phải cho nhà phát triển. Vì vậy, không có ví dụ phù hợp nào.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML {{HTMLElement('div')}} và {{HTMLElement('span')}}
- Các vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) như
- Vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
