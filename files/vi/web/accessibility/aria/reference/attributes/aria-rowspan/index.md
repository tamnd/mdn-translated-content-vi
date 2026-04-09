---
title: "ARIA: thuộc tính aria-rowspan"
short-title: aria-rowspan
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-rowspan
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-rowspan
sidebar: accessibilitysidebar
---

Thuộc tính `aria-rowspan` xác định số hàng mà một cell hoặc gridcell chiếm trong một bảng, grid hoặc treegrid.

## Mô tả

Tương tự như thuộc tính `rowspan` của các phần tử {{HTMLElement('td')}} và {{HTMLElement('th')}}, nhưng dành cho các cell và gridcell không nằm trong một bảng gốc, thuộc tính `aria-rowspan` xác định số hàng mà một `cell` hoặc `gridcell` chiếm trong một `table`, `grid` hoặc `treegrid`.

Thuộc tính này dành cho các cell và gridcell **không phải** là phần của một HTML {{HTMLElement('table')}}. Khi một cell được lồng trong một `<table>` ngữ nghĩa, hãy dùng thuộc tính `rowspan` khi `<td>` hoặc `<th>` chiếm hơn một hàng. Nếu cả hai đều có mặt, `rowspan` sẽ được ưu tiên hơn `aria-rowspan`. Nhưng giống như mọi thuộc tính ARIA khác, `aria-rowspan` chỉ ảnh hưởng đến cây trợ năng. Nó không thay đổi bố cục của bạn.

> [!NOTE]
> ARIA sửa đổi cây trợ năng và cách công nghệ hỗ trợ trình bày nội dung cho người dùng của bạn. ARIA không thay đổi chức năng, hành vi hay hình thức của phần tử. Khi dùng các phần tử không ngữ nghĩa, bạn phải dùng CSS để quản lý bố cục và hình thức.

Giá trị của `aria-rowspan` là một số nguyên lớn hơn hoặc bằng 0 và nhỏ hơn giá trị khiến cell hoặc gridcell chồng lên cell hoặc gridcell tiếp theo trong cùng một cột. Đặt giá trị bằng `0` cho biết cell hoặc gridcell sẽ chiếm toàn bộ các hàng còn lại trong nhóm hàng. Giá trị mặc định là `1`.

## Giá trị

- `<integer>`
  - : Một số nguyên lớn hơn hoặc bằng `0` và nhỏ hơn giá trị khiến một cell chồng lên cell tiếp theo trong cùng một cột.

## Giao diện liên quan

- {{domxref("Element.ariaRowSpan")}}
  - : Thuộc tính [`ariaRowSpan`](/en-US/docs/Web/API/Element/ariaRowSpan), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-rowspan`.
- {{domxref("ElementInternals.ariaRowSpan")}}
  - : Thuộc tính [`ariaRowSpan`](/en-US/docs/Web/API/ElementInternals/ariaRowSpan), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-rowspan`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role)

Kế thừa vào các vai trò:

- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Thuộc tính [`rowspan`](/en-US/docs/Web/HTML/Reference/Elements/td#rowspan) trên {{HTMLElement('td')}}
- [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex)
- [`aria-colspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colspan)
