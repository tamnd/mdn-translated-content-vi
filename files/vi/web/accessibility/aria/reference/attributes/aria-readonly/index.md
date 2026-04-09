---
title: "ARIA: thuộc tính aria-readonly"
short-title: aria-readonly
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-readonly
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-readonly
sidebar: accessibilitysidebar
---

Thuộc tính `aria-readonly` cho biết rằng phần tử không thể chỉnh sửa, nhưng vẫn có thể thao tác.

## Mô tả

Khi bạn muốn cho biết rằng một phần tử tương tác vẫn hoạt động nhưng không thể chỉnh sửa, hãy đặt `aria-readonly="true"`. Điều này cho người dùng biết rằng một phần tử tương tác vốn thường có thể focus và sao chép đã được đặt vào trạng thái chỉ đọc, không phải vô hiệu hóa.

Khi `aria-readonly` được đặt thành `true`, điều đó có nghĩa là người dùng có thể đọc nhưng không thể đặt giá trị của widget. Các phần tử chỉ đọc vẫn có liên quan với người dùng, vì vậy bạn không nên chặn người dùng điều hướng đến phần tử đó hoặc các phần tử con có thể focus của nó, cũng như không nên chặn việc sao chép giá trị.

Ví dụ gồm:

- Các trường biểu mẫu không nên thay đổi.
- Tiêu đề hàng và cột trong bảng tính.
- Tổng giá trị trong giỏ hàng.

Nếu giá trị không thể thay đổi không nên nhận focus, hãy dùng [`aria-disabled`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled) thay thế.

> [!NOTE]
> Khi dùng các form control HTML ngữ nghĩa, nếu bạn đặt thuộc tính `readonly`, bạn không cần thêm `aria-readonly="true"`.

> [!NOTE]
> Giá trị của `<input type="checkbox">` không thể chỉnh sửa, nên `readonly` không còn liên quan. Tuy nhiên, khi tạo checkbox bằng `role="checkbox"` thì thuộc tính `aria-readonly` _được_ hỗ trợ.

## Giá trị

- `true`
  - : Phần tử là chỉ đọc.
- `false` (mặc định)
  - : Phần tử không phải chỉ đọc.

## Giao diện liên quan

- {{domxref("Element.ariaReadOnly")}}
  - : Thuộc tính [`ariaReadOnly`](/en-US/docs/Web/API/Element/ariaReadOnly), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-readonly`.
- {{domxref("ElementInternals.ariaReadOnly")}}
  - : Thuộc tính [`ariaReadOnly`](/en-US/docs/Web/API/ElementInternals/ariaReadOnly), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-readonly`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role)
- [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
- [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
- [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role)
- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)
- [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)

Kế thừa vào các vai trò:

- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)
- [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)
- [`switch`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role)
- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Thuộc tính HTML [`readonly`](/en-US/docs/Web/HTML/Reference/Attributes/readonly)
- [`aria-disabled`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled)
