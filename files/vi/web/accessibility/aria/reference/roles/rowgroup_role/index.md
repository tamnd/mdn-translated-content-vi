---
title: "ARIA: vai trò rowgroup"
short-title: rowgroup
slug: Web/Accessibility/ARIA/Reference/Roles/rowgroup_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#rowgroup
sidebar: accessibilitysidebar
---

Một phần tử với `role="rowgroup"` là một nhóm [hàng](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role) trong một cấu trúc dạng bảng. Một `rowgroup` chứa một hoặc nhiều hàng [ô](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role), [ô lưới](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), [tiêu đề cột](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role), hoặc [tiêu đề hàng](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role) trong một [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role), [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role) hoặc [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role).

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

`Rowgroup` thiết lập mối quan hệ giữa các phần tử row mà nó sở hữu và là phần tương đương về cấu trúc với các phần tử {{HTMLElement('thead')}}, {{HTMLElement('tfoot')}} và {{HTMLElement('tbody')}} trong HTML. Tuy nhiên, không có sự phân biệt giữa các loại nhóm hàng khác nhau. Các phần tử của chúng phải được chứa trong, hoặc được sở hữu bởi, các phần tử có vai trò [table](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role) hoặc [grid](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role). Việc dùng các phần tử HTML {{HTMLElement('thead')}}, {{HTMLElement('tfoot')}} và {{HTMLElement('tbody')}} gốc, khi có thể, là điều được khuyến khích mạnh mẽ.

Để tạo đầu bảng, chân bảng hoặc thân bảng theo ARIA, hãy thêm `role="rowgroup"` vào phần tử. Rowgroup đó nên được lồng bên trong grid, table hoặc treegrid, bao trùm một nhóm gồm một hoặc nhiều hàng. Mỗi hàng, đến lượt nó, chứa các ô con. Các ô này có thể thuộc các kiểu khác nhau, tùy theo đó là tiêu đề cột hay tiêu đề hàng, hoặc ô bình thường hay ô lưới.

> [!NOTE]
> Việc dùng phần tử HTML table gốc ({{HTMLElement('table')}}) cùng với các phần tử header ({{HTMLElement('thead')}}), footer ({{HTMLElement('tfoot')}}), và body ({{HTMLElement('tbody')}}) của table khi có thể là điều được khuyến khích mạnh mẽ.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

#### Vai trò ngữ cảnh

- [role="table"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
  - : Một trong ba ngữ cảnh có thể (cùng với grid và treegrid) nơi bạn sẽ gặp một row. Nó xác định row là một phần của cấu trúc bảng không tương tác chứa dữ liệu sắp xếp theo hàng và cột, tương tự phần tử HTML {{HTMLElement('table')}} gốc.
- [role="grid"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
  - : Một trong ba ngữ cảnh có thể (cùng với table và treegrid) nơi bạn sẽ gặp một row. Nó xác định row là một phần của cấu trúc bảng không tương tác chứa dữ liệu sắp xếp theo hàng và cột, tương tự phần tử HTML {{HTMLElement('table')}} gốc.
- [role="treegrid"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)
  - : Tương tự grid, nhưng với các hàng có thể được mở rộng và thu gọn theo cách giống cây.

#### Vai trò con

- [role="row"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
  - : Một hàng các ô trong một cấu trúc dạng bảng. Một hàng chứa một hoặc nhiều [ô](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role), [gridcell](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), hoặc [tiêu đề cột](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role), và đôi khi có một [tiêu đề hàng](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role).

### Tương tác bàn phím

Không có.

### Tính năng JavaScript bắt buộc

Không có.

> [!NOTE]
> Quy tắc đầu tiên khi dùng ARIA là nếu bạn có thể dùng một tính năng gốc đã có sẵn ngữ nghĩa và hành vi phù hợp, thay vì tái sử dụng một phần tử và **thêm** vai trò, trạng thái hoặc thuộc tính ARIA để làm nó có thể truy cập, thì hãy làm như vậy. Hãy dùng phần tử HTML `<table>` thay vì vai trò table của ARIA bất cứ khi nào có thể.

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

Phần trên là một bảng ARIA không ngữ nghĩa với đầu bảng và thân bảng, trong đó có năm trong số 81 hàng hiện diện trong DOM: một hàng trong phần đầu bảng và bốn hàng trong phần thân bảng. Hàng tiêu đề, đứng một mình trong một rowgroup đầu bảng, có hai tiêu đề cột. Các cột có thể sắp xếp, nhưng hiện chưa được sắp xếp, như được chỉ ra bởi thuộc tính [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort). Thân bảng là một rowgroup riêng, với bốn hàng hiện có trong DOM. Vì không phải tất cả các hàng đều có trong DOM, chúng tôi đã thêm thuộc tính [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex) trên mỗi hàng.

## Thực hành tốt nhất

Chỉ dùng {{HTMLElement('table')}}, {{HTMLElement('tbody')}}, {{HTMLElement('thead')}}, {{HTMLElement('tr')}}, {{HTMLElement('th')}}, {{HTMLElement('td')}}, và tương tự cho cấu trúc bảng dữ liệu. Bạn có thể thêm các vai trò ARIA này để đảm bảo khả năng truy cập nếu ngữ nghĩa gốc của table bị loại bỏ, chẳng hạn bằng CSS. Một trường hợp sử dụng phù hợp cho vai trò ARIA table là khi thuộc tính display của CSS ghi đè ngữ nghĩa gốc của table, chẳng hạn bằng `display: grid`. Trong trường hợp này, bạn có thể dùng các vai trò ARIA table để thêm ngữ nghĩa trở lại.

```html
<table
  role="table"
  aria-label="Semantic Elements"
  aria-describedby="semantic_elements_table_desc"
  aria-rowcount="81">
  <caption id="semantic_elements_table_desc">
    Semantic Elements to use instead of ARIA's roles
  </caption>
  <thead role="rowgroup">
    <tr role="row">
      <th role="columnheader" aria-sort="none">ARIA Role</th>
      <th role="columnheader" aria-sort="none">Semantic Element</th>
    </tr>
  </thead>
  <tbody role="rowgroup">
    <tr role="row" aria-rowindex="11">
      <td role="cell">header</td>
      <td role="cell">h1</td>
    </tr>
    <tr role="row" aria-rowindex="16">
      <td role="cell">header</td>
      <td role="cell">h6</td>
    </tr>
  </tbody>
</table>
```

Trên đây là cách viết table theo ngữ nghĩa. Các vai trò ARIA chỉ cần thiết nếu ngữ nghĩa gốc của table, và do đó là các hàng table, bị xóa bỏ, chẳng hạn bằng cách đặt [thuộc tính display thành flex hoặc grid](/en-US/docs/Web/CSS/Reference/Properties/display#accessibility).

### Lợi ích bổ sung

none

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [HTML table](/en-US/docs/Web/HTML/Reference/Elements/table)
- [HTML table body](/en-US/docs/Web/HTML/Reference/Elements/tbody)
- [HTML table footer](/en-US/docs/Web/HTML/Reference/Elements/tfoot)
- [HTML table header](/en-US/docs/Web/HTML/Reference/Elements/thead)
