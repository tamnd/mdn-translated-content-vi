---
title: "ARIA: vai trò row"
short-title: row
slug: Web/Accessibility/ARIA/Reference/Roles/row_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#row
  - https://www.w3.org/WAI/ARIA/apg/patterns/table/examples/table/
sidebar: accessibilitysidebar
---

Một phần tử với `role="row"` là một hàng các ô trong một cấu trúc dạng bảng. Một hàng chứa một hoặc nhiều ô, ô lưới hoặc tiêu đề cột, và có thể có thêm tiêu đề hàng, bên trong một [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role), [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role) hoặc [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role), và tùy chọn bên trong một [`rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role).

```html
<div
  role="table"
  aria-label="Populations"
  aria-describedby="country_population_desc">
  <div id="country_population_desc">World Populations by Country</div>
  <div role="rowgroup">
    <div role="row">
      <span role="columnheader" aria-sort="descending">Country</span>
      <span role="columnheader" aria-sort="none">Population</span>
    </div>
  </div>
  <div role="rowgroup">
    <div role="row">
      <span role="cell">Finland</span>
      <span role="cell">5.5 million</span>
    </div>
    <div role="row">
      <span role="cell">France</span>
      <span role="cell">67 million</span>
    </div>
  </div>
</div>
```

## Mô tả

Phần tử mang `role="row"` là một hàng trong một [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role), [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role), hoặc [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role), và tùy chọn bên trong một [`rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role) chứa một hoặc nhiều phần tử [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role), [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role), hoặc [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role) trong một cấu trúc bảng tĩnh.

Để tạo một hàng ARIA, hãy thêm `role="row"` vào phần tử chứa. Hàng đó nên được lồng bên trong grid, table hoặc treegrid. Một nhóm hàng có thể được lồng trực tiếp trong grid, table hoặc treegrid, hoặc bên trong rowgroup trong một trong các vùng chứa đó. Mỗi hàng chứa các ô con. Các ô này có thể thuộc các kiểu khác nhau, tùy theo đó là tiêu đề cột hay hàng, hoặc ô bình thường hay ô lưới.

Một hàng có thể chứa một số thuộc tính làm rõ vai trò của hàng, bao gồm [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex), [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level), [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex), và [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected).

Nếu hàng nằm trong treegrid, các hàng có thể bao gồm thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded), dùng thuộc tính này để chỉ trạng thái hiện tại. Điều này không áp dụng cho table hoặc grid thông thường, trong đó thuộc tính `aria-expanded` không xuất hiện.

Để tạo một widget tương tác có cấu trúc dạng bảng, hãy dùng mẫu grid thay vào đó. Nếu tương tác cung cấp trạng thái chọn của từng ô, nếu có điều hướng từ trái sang phải và từ trên xuống dưới, hoặc nếu giao diện cho phép sắp xếp lại thứ tự ô hoặc thay đổi thứ tự ô riêng lẻ bằng kéo thả, hãy dùng [grid](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role) hoặc [treegrid](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role) thay vào đó.

> [!NOTE]
> Việc dùng phần tử HTML table gốc ({{HTMLElement('table')}}) cùng với phần tử table row ({{HTMLElement('tr')}}) khi có thể là điều được khuyến khích mạnh mẽ.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

#### Vai trò ngữ cảnh

- [role="rowgroup"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role)
  - : Một phần tử cha theo ngữ cảnh tùy chọn của row, nó thiết lập mối quan hệ giữa các row con. Đây là phần tương đương về cấu trúc với các phần tử thead, tfoot và tbody trong một bảng HTML.
- [role="table"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
  - : Một trong ba ngữ cảnh có thể (cùng với grid và treegrid) nơi bạn sẽ gặp row, nó xác định row là một phần của cấu trúc bảng không tương tác chứa dữ liệu sắp xếp theo hàng và cột, tương tự phần tử HTML {{HTMLElement('table')}} gốc.
- [role="grid"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
  - : Một trong ba ngữ cảnh có thể (cùng với table và treegrid) nơi bạn sẽ gặp row, nó xác định row là một phần của cấu trúc bảng không tương tác chứa dữ liệu sắp xếp theo hàng và cột, tương tự phần tử HTML {{HTMLElement('table')}} gốc.
- [role="treegrid"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)
  - : Tương tự một grid, nhưng với các hàng có thể được mở rộng và thu gọn theo cách giống cây.

#### Vai trò con

- [role="cell"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role)
  - : Một ô trong hàng bên trong vùng chứa bảng.
- [role="gridcell"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
  - : Một ô trong hàng bên trong grid hoặc treegrid.
- [role="columnheader"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
  - : Một ô tiêu đề là phần tương đương về cấu trúc với phần tử HTML {{HTMLElement('th')}} với phạm vi cột ({{HTMLElement('tr', '<code>&lt;tr scope="col"&gt;</code>')}}). Không giống một ô thường, vai trò columnheader thiết lập mối quan hệ giữa nó và tất cả các ô trong cột tương ứng.
- [role="rowheader"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)
  - : Một ô tiêu đề là phần tương đương về cấu trúc với phần tử HTML {{HTMLElement('th')}} với phạm vi hàng ({{HTMLElement('tr', '<code>&lt;tr scope="row"&gt;</code>')}}). Không giống một ô thường, vai trò rowheader thiết lập mối quan hệ giữa nó và tất cả các ô trong cùng hàng.

#### Trạng thái và thuộc tính

- Trạng thái [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
  - : Thuộc tính `aria-expanded`, xác định trạng thái của hàng, có thể nhận một trong ba giá trị hoặc có thể bị bỏ qua:
    - `aria-expanded="true"`: Hàng hiện đang được mở rộng.
    - `aria-expanded="false"`: Hàng hiện đang bị thu gọn.
    - `aria-expanded="undefined"` hoặc thuộc tính bị thiếu: Hàng không thể mở rộng cũng không thể thu gọn.

    Nếu phần tử có thuộc tính `aria-expanded` điều khiển việc mở rộng của một vùng chứa nhóm khác không phải do phần tử đó "sở hữu", tác giả **nên** tham chiếu vùng chứa đó bằng thuộc tính `aria-controls`.

- Trạng thái [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected)
  - : Chỉ liên quan nếu hàng nằm trong vùng chứa tương tác, như grid hoặc treegrid, nhưng không liên quan nếu hàng nằm trong table. Thuộc tính `aria-selected` có thể nhận một trong ba giá trị hoặc có thể bị bỏ qua:
    - `aria-selected="true"`: Hàng hiện đang được chọn
    - `aria-selected="false"`: Hàng hiện chưa được chọn.
    - `aria-selected="undefined"` hoặc thuộc tính bị thiếu: Hàng không thể chọn.

- Thuộc tính [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex)
  - : Thuộc tính `aria-colindex` chỉ cần nếu các cột bị ẩn khỏi DOM. Nó thường được đặt trên các phần tử con của row, thay vì trên chính row. Nếu các cột hiển thị liền kề nhau, thì có thể đặt nó trên row.

    Thuộc tính nhận một số nguyên giữa 1 và tổng số cột trong table, grid hoặc treegrid làm giá trị. Khi đặt trên row, `aria-colindex` xác định chỉ số hoặc vị trí cột của phần tử so với tổng số cột trong một hàng. Ví dụ, trong một bảng có 15 cột, và các cột 4, 5, và 6 có trong DOM, `aria-colindex="4"` có thể được đặt trên mỗi row.

    Nếu tập hợp các cột có trong DOM **không** liền kề, hoặc nếu có các ô trải dài nhiều hàng hay cột, hãy đặt `aria-colindex` trên tất cả các phần tử con của mỗi hàng thay vì trên chính hàng.

    Nếu tất cả các cột đều có trong DOM, thuộc tính này là không cần thiết.

- Thuộc tính [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex)
  - : Thuộc tính `aria-rowindex` chỉ cần nếu hàng bị ẩn khỏi DOM, để cho biết hàng nào trong danh sách tất cả các hàng đang được đọc. Thuộc tính, khi được đặt với một giá trị duy nhất trên mỗi row, nhận một số nguyên giữa 1 và tổng số hàng trong table, grid hoặc treegrid, cho biết vị trí hoặc chỉ số của từng hàng. Ví dụ, nếu một bảng có 1.500 hàng, nhưng chỉ hàng tiêu đề và hàng 47 và 52 có trong DOM, `aria-rowindex="1"` sẽ được đặt trên hàng tiêu đề, và `aria-rowindex="47"` và `aria-rowindex="52"` sẽ được đặt tương ứng trên hàng 47 và hàng 52.

    Nếu tất cả các hàng đều có trong DOM, thuộc tính này là không cần thiết.

### Tương tác bàn phím

Không có.

### Tính năng JavaScript bắt buộc

Không có. Với các cột có thể sắp xếp, xem vai trò aria [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role).

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

Phần trên là một phần của table. Mặc dù toàn bộ table có 81 mục, như được chỉ ra bởi thuộc tính [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount), hiện chỉ có bốn mục đang hiển thị. Các cột có thể sắp xếp, nhưng hiện chưa được sắp xếp, như được chỉ ra bởi thuộc tính [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort) trên các tiêu đề cột.

## Thực hành tốt nhất

Chỉ dùng {{HTMLElement('table')}}, {{HTMLElement('tbody')}}, {{HTMLElement('thead')}}, {{HTMLElement('tr')}}, {{HTMLElement('th')}}, {{HTMLElement('td')}}, v.v. cho cấu trúc bảng dữ liệu. Bạn có thể thêm các vai trò ARIA này để đảm bảo khả năng truy cập nếu ngữ nghĩa gốc của table bị loại bỏ, chẳng hạn bằng CSS. Một trường hợp sử dụng phù hợp cho vai trò ARIA table là khi thuộc tính display của CSS ghi đè ngữ nghĩa gốc của table, chẳng hạn bằng `display: grid`. Trong trường hợp này, bạn có thể dùng các vai trò ARIA table để thêm ngữ nghĩa trở lại.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Tìm hiểu: khả năng truy cập bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Table_accessibility)
- [Tìm hiểu: kiến thức cơ bản về bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- [ARIA: vai trò `grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
