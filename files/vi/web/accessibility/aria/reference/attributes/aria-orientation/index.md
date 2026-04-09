---
title: "ARIA: thuộc tính aria-orientation"
short-title: aria-orientation
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-orientation
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-orientation
sidebar: accessibilitysidebar
---

Thuộc tính `aria-orientation` cho biết hướng của phần tử là ngang, dọc hay không xác định/mơ hồ.

## Mô tả

Người dùng có thể cần biết hướng của một widget để biết cách điều hướng nó, vì hướng ảnh hưởng đến hành vi mong đợi của các phím mũi tên trái, phải, lên và xuống. Thuộc tính `aria-orientation` được dùng để cho người dùng công nghệ hỗ trợ biết một phần tử có hướng `horizontal`, `vertical` hay `undefined`.

Một số widget có hướng mặc định:

Mặc định là ngang:

- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role),
- [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)
- [`toolbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role)
- [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role)

Mặc định là dọc:

- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role)
- [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
- [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role)

Mỗi [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) nên có `aria-orientation` nhất quán với hướng của chính separator đó.

Khi các nút trong cây được sắp xếp theo chiều ngang thay vì mặc định là chiều dọc, hoặc khi một tab list là dọc thay vì mặc định là ngang, phím mũi tên xuống sẽ hoạt động như phím mũi tên phải, còn phím mũi tên lên sẽ hoạt động như phím mũi tên trái. Trong những trường hợp này, người dùng công nghệ hỗ trợ cần biết hướng của widget để điều hướng chính xác.

Phím mũi tên lên và xuống thường vẫn dùng để cuộn trình duyệt bình thường, ngay cả khi focus đang nằm bên trong một tree hoặc tab list. Hãy thêm `aria-orientation` để cho người dùng biết khi một widget không có hướng mặc định mà họ mong đợi, và để thông báo điều hướng liên quan.

Luôn nhớ rằng ARIA chỉ thay đổi cách công nghệ hỗ trợ trình bày nội dung cho người dùng; việc thay đổi hành vi của các phím mũi tên phải dùng JavaScript.

## Giá trị

- `horizontal`
  - : Phần tử có hướng ngang.
- `undefined` (mặc định)
  - : Hướng của phần tử không xác định/mơ hồ.
- `vertical`
  - : Phần tử có hướng dọc.

## Giao diện liên quan

- {{domxref("Element.ariaOrientation")}}
  - : Thuộc tính [`ariaOrientation`](/en-US/docs/Web/API/Element/ariaOrientation), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-orientation`.
- {{domxref("ElementInternals.ariaOrientation")}}
  - : Thuộc tính [`ariaOrientation`](/en-US/docs/Web/API/ElementInternals/ariaOrientation), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-orientation`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- [`select`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/select_role)
- [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role)
- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
- [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)
- [`toolbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role)

Kế thừa vào các vai trò:

- [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
- [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role)
- [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role)
- [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role)
- [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role)
- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Hiểu về WCAG: Bàn phím](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Keyboard)
