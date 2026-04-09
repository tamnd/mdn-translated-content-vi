---
title: "ARIA: vai trò columnheader"
short-title: columnheader
slug: Web/Accessibility/ARIA/Reference/Roles/columnheader_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#columnheader
  - https://www.w3.org/WAI/ARIA/apg/patterns/table/examples/table/
sidebar: accessibilitysidebar
---

Giá trị `columnheader` của thuộc tính vai trò ARIA xác định một phần tử là một ô trong một hàng chứa thông tin tiêu đề cho một cột, tương tự như phần tử gốc {{HTMLElement('th')}} với phạm vi cột.

## Mô tả

Một phần tử có `role="columnheader"` được lồng làm phần tử con bên trong phần tử có `role="row"` là một ô tiêu đề cột tĩnh trong một vùng chứa bảng, hoặc bảng hay lưới, hoặc biểu đồ khác cần hiển thị quan hệ dữ liệu. Để được hỗ trợ, columnheader phải được lồng trong một phần tử có [vai trò `row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role).

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

Tất cả tiêu đề cột nên được lồng bên trong một [row](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role). Mỗi row, đến lượt nó, nên được lồng bên trong một [grid](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role), [table](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role), hoặc [treegrid](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role), hoặc trong một [rowgroup](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role) được lồng bên trong một trong các phần tử trên.

- [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort)
  - : Chỉ áp dụng cho một tiêu đề cột tại một thời điểm, nếu có. Thuộc tính `aria-sort` cho biết cột có được sắp xếp theo một trong ba giá trị `ascending` hoặc `descending`, hoặc `none` nếu chưa sắp xếp.

### Tương tác bàn phím

Vai trò này không hỗ trợ tương tác bàn phím cụ thể nào.

### Các tính năng JavaScript bắt buộc

JavaScript chỉ cần nếu dùng thuộc tính `aria-sort`.

## Ví dụ

```html
<table>
  <thead>
    <tr role="row">
      <th role="columnheader" scope="col">
        <button>Tên</button>
      </th>
      <th role="columnheader" scope="col">
        <button>Họ</button>
      </th>
      <th role="columnheader" scope="col" aria-sort="ascending">
        <button>Tên công ty</button>
      </th>
      <th role="columnheader" scope="col">
        <button>Chức danh</button>
      </th>
    </tr>
  </thead>
  <tbody>
    …
  </tbody>
</table>
```

## Thực hành tốt nhất

Tiêu đề cột nên chứa tiêu đề hoặc thông tin tiêu đề cho cột.

Quy tắc đầu tiên của ARIA là: nếu một phần tử hoặc thuộc tính HTML gốc có sẵn ngữ nghĩa và hành vi bạn cần, hãy dùng nó thay vì tái sử dụng một phần tử rồi thêm vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có thể truy cập. Nên dùng phần tử HTML gốc `<th>` với thuộc tính `scope` được đặt thành `<th scope="col">` thay vì một `<div>` hoặc phần tử khác. Nếu bạn dùng HTML ngữ nghĩa `<th scope="col">`, thuộc tính vai trò không bắt buộc, nhưng có thể được bao gồm như một phương án dự phòng để bảo đảm bảng vẫn giữ được ngữ nghĩa nếu ngữ nghĩa mặc định bị loại bỏ bằng giá trị của thuộc tính CSS display.

Thuộc tính `aria-sort` có thể được thêm vào `<th scope="col">` ngay cả khi thuộc tính vai trò ARIA không được chỉ định.

### Ưu tiên HTML

Columnheader có cùng ngữ nghĩa với `<th scope="col">`.

## Đặc tả

{{Specifications}}

## Xem thêm

- [vai trò `table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
- [vai trò `grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
- [vai trò `treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [vai trò `row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [vai trò `rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role)
- [Phần tử `<th>`](/en-US/docs/Web/HTML/Reference/Elements/th)
- [Phần tử `<table>`](/en-US/docs/Web/HTML/Reference/Elements/table)
- [Phần tử `<tr>`](/en-US/docs/Web/HTML/Reference/Elements/tr)
- [Phần tử `<td>`](/en-US/docs/Web/HTML/Reference/Elements/td)
