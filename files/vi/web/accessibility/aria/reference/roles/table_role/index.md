---
title: "ARIA: vai trò table"
short-title: table
slug: Web/Accessibility/ARIA/Reference/Roles/table_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#table
  - https://www.w3.org/WAI/ARIA/apg/patterns/table/examples/table/
sidebar: accessibilitysidebar
---

Giá trị `table` của thuộc tính ARIA `role` xác định phần tử chứa vai trò này là một cấu trúc bảng không tương tác, chứa dữ liệu sắp xếp theo hàng và cột, tương tự phần tử HTML {{HTMLElement('table')}} gốc.

```html
<div
  role="table"
  aria-label="Semantic Elements"
  aria-describedby="semantic_elements_table_desc"
  aria-rowcount="81">
  <div id="semantic_elements_table_desc">
    Semantic Elements to use instead of ARIA's roles
  </div>
  <div role="rowgroup">
    <div role="row">
      <span role="columnheader" aria-sort="none">ARIA Role</span>
      <span role="columnheader" aria-sort="none">Semantic Element</span>
    </div>
  </div>
  <div role="rowgroup">
    <div role="row" aria-rowindex="11">
      <span role="cell">header</span>
      <span role="cell">h1</span>
    </div>
    <div role="row" aria-rowindex="16">
      <span role="cell">header</span>
      <span role="cell">h6</span>
    </div>
    <div role="row" aria-rowindex="18">
      <span role="cell">rowgroup</span>
      <span role="cell">thead</span>
    </div>
    <div role="row" aria-rowindex="24">
      <span role="cell">term</span>
      <span role="cell">dt</span>
    </div>
  </div>
</div>
```

## Mô tả

Phần tử mang `role="table"` là một cấu trúc bảng tĩnh với các hàng chứa các ô. Các ô không thể focus hoặc chọn, mặc dù các widget bên trong từng ô của bảng có thể tương tác. Nên ưu tiên dùng phần tử HTML {{HTMLElement('table')}} gốc khi có thể.

> [!WARNING]
> Nếu một bảng duy trì trạng thái chọn, có điều hướng hai chiều, hoặc cho phép người dùng sắp xếp lại thứ tự ô, hãy dùng [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role) hoặc [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role) thay vào đó.

Để tạo một ARIA table, hãy thêm `role="table"` vào phần tử chứa. Bên trong vùng chứa đó, mỗi hàng có `role="row"` và chứa các ô con. Mỗi ô có vai trò là `columnheader`, `rowheader`, hoặc `cell`. Các hàng có thể là con của table hoặc nằm trong một `rowgroup`.

Chú thích bảng có thể được định nghĩa thông qua [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) hoặc [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label). Tất cả các phần tử bảng ngữ nghĩa khác, như {{HTMLElement('tbody')}}, {{HTMLElement('thead')}}, {{HTMLElement('tr')}}, {{HTMLElement('th')}}, và {{HTMLElement('td')}}, cần được thêm qua các vai trò liên quan như `rowgroup`, `row`, `columnheader`, và `cell`.

Nếu bảng chứa các cột hoặc hàng có thể sắp xếp, thuộc tính [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort) nên được thêm trên phần tử ô tiêu đề (không phải trên chính table). Nếu có hàng hoặc cột bị ẩn, cần bao gồm [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount) hoặc [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount) để chỉ ra tổng số cột hoặc hàng tương ứng, cùng với [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex) hoặc [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex) trên từng ô. [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex) hoặc [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex) được đặt bằng vị trí của một ô trong hàng hoặc cột tương ứng. Nếu bảng bao gồm các ô trải dài nhiều hàng hoặc nhiều cột, thì cũng nên bao gồm [`aria-rowspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowspan) hoặc [`aria-colspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colspan). Thực tế, sẽ đơn giản hơn nhiều nếu dùng phần tử {{HTMLElement('table')}} cùng toàn bộ các phần tử và thuộc tính ngữ nghĩa liên quan, vốn đều được tất cả công nghệ hỗ trợ hỗ trợ.

Để tạo một widget tương tác có cấu trúc dạng bảng, hãy dùng mẫu `grid` thay vào đó. Nếu tương tác cung cấp trạng thái chọn của từng ô, nếu có điều hướng từ trái sang phải và từ trên xuống dưới, hoặc nếu giao diện cho phép sắp xếp lại thứ tự ô hoặc thay đổi thứ tự ô riêng lẻ như kéo thả, hãy dùng [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role) hoặc [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role) thay vào đó.

> [!NOTE]
> Việc dùng phần tử HTML table gốc khi có thể là điều được khuyến khích mạnh mẽ.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- `role="rowgroup"`
  - : Một phần tử con tùy chọn của table, row group bao bọc một nhóm hàng, tương tự {{HTMLElement('thead')}}, {{HTMLElement('tbody')}}, và {{HTMLElement('tfoot')}}.
- [`role="row"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
  - : Một hàng trong table, và tùy chọn trong rowgroup chứa một hoặc nhiều ô, tiêu đề cột hoặc tiêu đề hàng.
- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) attribute
  - : Nhận giá trị là id của phần tử đóng vai trò mô tả cho bảng.
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) attribute
  - : [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) cung cấp tên truy cập được cho bảng.
- [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount) attribute
  - : Thuộc tính này chỉ bắt buộc nếu các cột không luôn có mặt trong DOM. Nó cung cấp chỉ báo rõ ràng về tổng số cột trong toàn bộ bảng. Đặt giá trị bằng tổng số cột trong toàn bộ bảng. Nếu không biết, đặt `aria-colcount="-1"`.
- [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount) attribute
  - : Thuộc tính này chỉ bắt buộc nếu các hàng không luôn có mặt trong DOM, chẳng hạn các bảng có thể cuộn dùng lại hàng để giảm số node DOM. Nó cung cấp chỉ báo rõ ràng về tổng số hàng trong toàn bộ bảng. Đặt giá trị bằng tổng số hàng trong toàn bộ bảng. Nếu không biết, đặt `aria-rowcount="-1"`.

### Tương tác bàn phím

Không có.

### Tính năng JavaScript bắt buộc

Không có. Với các cột có thể sắp xếp, xem vai trò aria [columnheader](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role).

> [!NOTE]
> Quy tắc đầu tiên khi dùng ARIA là nếu bạn có thể dùng một tính năng gốc đã có sẵn ngữ nghĩa và hành vi phù hợp, thay vì tái sử dụng một phần tử và **thêm** vai trò, trạng thái hoặc thuộc tính ARIA để làm nó có thể truy cập, thì hãy làm như vậy. Hãy dùng phần tử HTML {{HTMLElement('table')}} thay vì vai trò table của ARIA bất cứ khi nào có thể.

## Ví dụ

```html
<div
  role="table"
  aria-label="Semantic Elements"
  aria-describedby="semantic_elements_table_desc"
  aria-rowcount="81">
  <div id="semantic_elements_table_desc">
    Semantic Elements to use instead of ARIA's roles
  </div>
  <div role="rowgroup">
    <div role="row">
      <span role="columnheader" aria-sort="none">ARIA Role</span>
      <span role="columnheader" aria-sort="none">Semantic Element</span>
    </div>
  </div>
  <div role="rowgroup">
    <div role="row" aria-rowindex="11">
      <span role="cell">header</span>
      <span role="cell">h1</span>
    </div>
    <div role="row" aria-rowindex="16">
      <span role="cell">header</span>
      <span role="cell">h6</span>
    </div>
    <div role="row" aria-rowindex="18">
      <span role="cell">rowgroup</span>
      <span role="cell">thead</span>
    </div>
    <div role="row" aria-rowindex="24">
      <span role="cell">term</span>
      <span role="cell">dt</span>
    </div>
  </div>
</div>
```

Phần trên là một phần của table. Mặc dù toàn bộ bảng có 81 mục, như được chỉ ra bởi thuộc tính [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount), hiện chỉ có bốn mục đang hiển thị. Các cột có thể sắp xếp, nhưng hiện chưa được sắp xếp, như được chỉ ra bởi thuộc tính [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort) trên các tiêu đề cột.

## Thực hành tốt nhất

Chỉ dùng {{HTMLElement('table')}}, {{HTMLElement('tbody')}}, {{HTMLElement('thead')}}, {{HTMLElement('tr')}}, {{HTMLElement('th')}}, {{HTMLElement('td')}}, v.v. cho cấu trúc bảng dữ liệu. Bạn có thể thêm các vai trò ARIA này để đảm bảo khả năng truy cập nếu ngữ nghĩa gốc của table bị loại bỏ, chẳng hạn bằng CSS. Một trường hợp sử dụng phù hợp cho vai trò ARIA table là khi thuộc tính display của CSS ghi đè ngữ nghĩa gốc của table, chẳng hạn bằng `display: grid`. Trong trường hợp này, bạn có thể dùng các vai trò ARIA table để thêm ngữ nghĩa trở lại.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Learn: HTML table accessibility](/en-US/docs/Learn_web_development/Core/Structuring_content/Table_accessibility)
- [Learn: HTML table basics](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- [ARIA: `grid` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
