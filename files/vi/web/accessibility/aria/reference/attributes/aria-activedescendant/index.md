---
title: "ARIA: thuộc tính aria-activedescendant"
short-title: aria-activedescendant
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-activedescendant
sidebar: accessibilitysidebar
---

Thuộc tính `aria-activedescendant` xác định phần tử hiện đang hoạt động khi tiêu điểm nằm trên một widget [`composite`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role), [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role), [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role), [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role), hoặc [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role).

## Mô tả

Thuộc tính `aria-activedescendant` cung cấp một cách quản lý tiêu điểm cho công nghệ hỗ trợ trên các phần tử tương tác khi chúng chứa nhiều phần tử con có thể nhận tiêu điểm, chẳng hạn menu, lưới và thanh công cụ. Thay vì trình đọc màn hình di chuyển tiêu điểm giữa các phần tử thuộc quyền sở hữu, `aria-activedescendant` có thể được dùng trên phần tử vùng chứa để tham chiếu tới phần tử hiện đang hoạt động, thông báo cho người dùng công nghệ hỗ trợ về phần tử hiện đang hoạt động khi được lấy tiêu điểm.

Với `aria-activedescendant`, trình duyệt giữ tiêu điểm DOM trên phần tử vùng chứa hoặc trên một phần tử nhập liệu điều khiển phần tử vùng chứa. Tuy nhiên, tác nhân người dùng truyền các sự kiện và trạng thái tiêu điểm trên desktop tới công nghệ hỗ trợ như thể phần tử được tham chiếu bởi `aria-activedescendant` đang có tiêu điểm.

Thuộc tính này chỉ có ý nghĩa trên các phần tử có vai trò [`composite`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role), [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role), [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role), [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role), hoặc [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role) mà `id` của chúng được tham chiếu như giá trị thuộc tính.

Thuộc tính này chỉ quản lý việc cung cấp thông tin cho công nghệ hỗ trợ về phần tử nào đang có tiêu điểm, chứ không thực sự tạo ra tiêu điểm. Việc thay đổi tiêu điểm và quản lý giá trị thuộc tính được thực hiện bằng JavaScript. Ngoài việc quản lý giá trị thuộc tính đó, hãy bảo đảm phần tử con đang hoạt động hiện tại là hiển thị và nằm trong khung nhìn (hoặc cuộn vào khung nhìn) khi được lấy tiêu điểm.

Khi đặt giá trị của `aria-activedescendant` trên một phần tử đang có tiêu điểm DOM, hãy bảo đảm giá trị đó tham chiếu tới một phần tử thuộc quyền sở hữu, tức là một phần tử con của phần tử đang có tiêu điểm DOM HOẶC một phần tử con logic như được chỉ ra bởi thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns).

Khi phần tử đang có tiêu điểm DOM là combobox, textbox, hoặc searchbox, hãy bao gồm [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) để tham chiếu tới phần tử hỗ trợ `aria-activedescendant`.

Giá trị của `aria-activedescendant` tham chiếu tới một phần tử thuộc quyền sở hữu của phần tử được điều khiển. Ví dụ, trong một combobox, tiêu điểm có thể vẫn nằm trên combobox trong khi giá trị `aria-activedescendant` trên phần tử combobox tham chiếu tới một phần tử con của danh sách nổi listbox được điều khiển bởi combobox đó.

> [!NOTE]
> Thuộc tính này chỉ được hỗ trợ trên một số vai trò nhất định. Ví dụ, `dialog` không hỗ trợ `aria-activedescendant`. Khi một combobox mở một dialog, tiêu điểm DOM sẽ chuyển từ combobox vào dialog vì nó không thể được tham chiếu bằng thuộc tính này.

> [!NOTE]
> Khi một phần tử con của popup `listbox`, `grid`, hoặc `tree` được lấy tiêu điểm, tiêu điểm DOM vẫn nằm trên combobox và combobox có `aria-activedescendant` được đặt thành một giá trị tham chiếu tới phần tử đang được lấy tiêu điểm trong popup.

## Giá trị

- Tham chiếu ID
  - : lấy `id` của phần tử hiện đang được lấy tiêu điểm làm giá trị.

## Giao diện liên quan

- {{domxref("Element.ariaActiveDescendantElement")}}
  - : Thuộc tính `ariaActiveDescendantElement` là một phần của giao diện của mỗi phần tử.
    Giá trị của nó là một thể hiện của một lớp con của {{domxref("Element")}} phản ánh tham chiếu `id` trong thuộc tính `aria-activedescendant` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).
- {{domxref("ElementInternals.ariaActiveDescendantElement")}}
  - : Thuộc tính `ariaActiveDescendantElement` là một phần của giao diện của mỗi phần tử tùy chỉnh.
    Giá trị của nó là một thể hiện của một lớp con của {{domxref("Element")}} phản ánh tham chiếu `id` trong thuộc tính `aria-activedescendant` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).

## Vai trò liên quan

Chỉ có ý nghĩa như một thuộc tính trên các phần tử có các vai trò sau:

- [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role)
- [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- [`composite`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role)
- [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
- [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)

## Đặc tả

{{Specifications}}
