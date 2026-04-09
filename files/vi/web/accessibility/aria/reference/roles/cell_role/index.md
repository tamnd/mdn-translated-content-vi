---
title: "ARIA: vai trò cell"
short-title: cell
slug: Web/Accessibility/ARIA/Reference/Roles/cell_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#cell
  - https://www.w3.org/WAI/ARIA/apg/patterns/table/examples/table/
sidebar: accessibilitysidebar
---

Giá trị `cell` của thuộc tính _role_ ARIA xác định một phần tử là một ô trong một vùng chứa dạng bảng không chứa thông tin tiêu đề cột hoặc hàng. Để được hỗ trợ, ô phải được lồng trong một phần tử có vai trò `row`.

```html
<div role="row">
  <span role="cell">Pháp</span>
  <span role="cell">67 triệu</span>
</div>
```

Cách viết ô ở trên theo hướng ngữ nghĩa hơn sẽ là dùng phần tử ngữ nghĩa [`<td>`](/en-US/docs/Web/HTML/Reference/Elements/td).

```html
<tr role="row">
  <td role="cell">Pháp</td>
  <td role="cell">67 triệu</td>
</tr>
```

## Mô tả

Phần tử có `role="cell"` là một ô nằm trong một hàng, tùy chọn nằm trong một [`rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role), trong một [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role). Nếu ô nằm trong một [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role) hoặc [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role), hãy dùng [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role) thay thế. Nên ưu tiên dùng phần tử HTML {{HTMLElement('td')}} nguyên gốc bất cứ khi nào có thể.

Mỗi phần tử có `role="cell"` PHẢI được lồng trong một phần tử chứa có [`role="row"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role). Sau đó, hàng đó có thể được lồng trong một phần tử có [`role="rowgroup"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role), và nên được lồng trong `grid`, `table` hoặc `treegrid`. Nếu một ô chứa thông tin tiêu đề cột hoặc hàng, hãy dùng các vai trò `columnheader` hoặc `rowheader` tương ứng. Nếu ô không chứa thông tin tiêu đề và được lồng trong `grid` hoặc `treegrid`, vai trò `gridcell` có thể phù hợp hơn.

Một ô có thể chứa nhiều thuộc tính mô tả vị trí của ô trong cấu trúc dữ liệu dạng bảng, bao gồm [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex), [`aria-colspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colspan), [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex), và [`aria-rowspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowspan).

> [!NOTE]
> Việc dùng phần tử bảng HTML nguyên gốc ({{HTMLElement('table')}}), cùng với phần tử hàng của bảng ({{HTMLElement('tr')}}), và phần tử ô của bảng ({{HTMLElement('td')}}), bất cứ khi nào có thể, là rất được khuyến khích.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

#### Vai trò ngữ cảnh

- [role="row"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
  - : Phần tử có `role="row"` là một hàng các ô trong một cấu trúc dạng bảng. Một hàng chứa một hoặc nhiều ô, gridcell, tiêu đề cột hoặc tiêu đề hàng trong một [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role), [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role) hoặc `treegrid`, và tùy chọn nằm trong một [`rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role).
- [role="rowgroup"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role)
  - : `Row` là phần tử cha bắt buộc của cell. `Rowgroup` là phần tử cha theo ngữ cảnh tùy chọn của row. Nó thiết lập mối quan hệ giữa các hàng con. Nó là tương đương về mặt cấu trúc với các phần tử [`thead`](/en-US/docs/Web/HTML/Reference/Elements/thead), [`tfoot`](/en-US/docs/Web/HTML/Reference/Elements/tfoot), và [`tbody`](/en-US/docs/Web/HTML/Reference/Elements/tbody) trong phần tử [HTML `table`](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics).
- [role="table"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
  - : Một trong ba ngữ cảnh có thể có (cùng với `grid` và `treegrid`) nơi bạn sẽ thấy một hàng chứa các ô. Table xác định ô là một phần của cấu trúc bảng không tương tác chứa dữ liệu được sắp xếp theo hàng và cột, tương tự như phần tử HTML gốc [`<table>`](/en-US/docs/Web/HTML/Reference/Elements/table).
- [role="grid"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
  - : Một trong ba ngữ cảnh có thể có (cùng với `table` và `treegrid`) nơi bạn sẽ thấy một hàng chứa `cells` và `gridcells`. `Grid` xác định một ô là một phần của cấu trúc bảng có thể tương tác, chứa dữ liệu được sắp xếp theo hàng và cột, tương tự phần tử HTML [`<table>`](/en-US/docs/Web/HTML/Reference/Elements/table) gốc.
- [role="treegrid"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)
  - : Tương tự grid, nhưng các hàng có thể được mở rộng và thu gọn theo cách giống như cây.

#### Vai trò con

- [role="gridcell"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
  - : Một ô trong một hàng bên trong `grid` hoặc `treegrid`.
- [role="columnheader"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
  - : Một ô tiêu đề là tương đương về mặt cấu trúc với phần tử HTML [`<th>`](/en-US/docs/Web/HTML/Reference/Elements/th) có phạm vi cột. Không giống một ô thông thường, vai trò `columnheader` thiết lập quan hệ giữa nó và tất cả các ô trong cột tương ứng.
- [role="rowheader"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)
  - : Một ô tiêu đề là tương đương về mặt cấu trúc với phần tử HTML [`<th>`](/en-US/docs/Web/HTML/Reference/Elements/th) có phạm vi hàng. Không giống một ô thông thường, vai trò `rowheader` thiết lập quan hệ giữa nó và tất cả các ô trong hàng tương ứng.

#### Trạng thái và thuộc tính

- [`aria-colspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colspan)
  - : Tương tự thuộc tính HTML [`<th>`](/en-US/docs/Web/HTML/Reference/Elements/th) và [`<td>` colspan attribute](/en-US/docs/Web/HTML/Reference/Elements/td), nó xác định số cột mà ô trải rộng.
- [`aria-rowspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowspan)
  - : Tương tự thuộc tính HTML [`<th>`](/en-US/docs/Web/HTML/Reference/Elements/th) và [`<td>` rowspan attribute](/en-US/docs/Web/HTML/Reference/Elements/td), nó xác định số hàng mà ô trải rộng.
- [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex) attribute
  - : Thuộc tính `aria-colindex` chỉ cần khi các cột bị ẩn khỏi DOM. Thuộc tính này nhận một số nguyên giữa 1 và tổng số cột trong `table`, `grid` hoặc `treegrid`. `aria-colindex` xác định chỉ số cột hoặc vị trí của một phần tử so với tổng số cột trong một hàng. Nếu tất cả cột đều có trong DOM, thuộc tính này không cần thiết.
- [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex) attribute
  - : Thuộc tính `aria-rowindex` chỉ cần khi các hàng bị ẩn khỏi DOM, để chỉ ra ô hiện tại nằm ở hàng nào trong danh sách tổng số hàng. Thuộc tính này nhận một số nguyên giữa 1 và tổng số hàng trong bảng, grid hoặc treegrid, cho biết vị trí, hay chỉ số, của ô. Ví dụ, một ô ở hàng đầu tiên của phần đầu bảng có thể sẽ được đặt `aria-rowindex="1"`, và các ô ở hàng 47 sẽ có `aria-rowindex="47"`, nếu cần `aria-rowindex` vì không phải tất cả hàng đều có trong DOM. Nếu các hàng hiển thị là liên tục, và không có ô nào có `colspan` hoặc `rowspan` lớn hơn một, thuộc tính này có thể được thêm vào các hàng cha thay vì tất cả các ô của hàng.

### Tương tác bàn phím

Không có.

### Các tính năng JavaScript bắt buộc

Quy tắc đầu tiên của việc dùng ARIA là nếu bạn có thể dùng một tính năng gốc với ngữ nghĩa và hành vi bạn cần đã được tích hợp sẵn, thay vì tái sử dụng một phần tử và **thêm** vai trò, trạng thái hoặc thuộc tính ARIA để làm nó có thể truy cập, thì hãy làm vậy. Hãy dùng phần tử HTML [`<td>`](/en-US/docs/Web/HTML/Reference/Elements/td) thay cho vai trò ARIA `cell` bất cứ khi nào có thể.

## Ví dụ

```html
<div
  role="table"
  aria-label="Các phần tử ngữ nghĩa"
  aria-describedby="semantic_elements_table_desc"
  aria-rowcount="81">
  <div id="semantic_elements_table_desc">
    Các phần tử ngữ nghĩa nên dùng thay cho vai trò ARIA
  </div>
  <div role="rowgroup">
    <div role="row">
      <span role="columnheader" aria-sort="none" aria-rowindex="1"
        >Vai trò ARIA</span
      >
      <span role="columnheader" aria-sort="none" aria-rowindex="1"
        >Phần tử ngữ nghĩa</span
      >
    </div>
  </div>
  <div role="rowgroup">
    <div role="row">
      <span role="cell" aria-rowindex="11">header</span>
      <span role="cell" aria-rowindex="11">h1</span>
    </div>
    <div role="row">
      <span role="cell" aria-rowindex="16">header</span>
      <span role="cell" aria-rowindex="16">h6</span>
    </div>
    <div role="row">
      <span role="cell" aria-rowindex="18">rowgroup</span>
      <span role="cell" aria-rowindex="18">thead</span>
    </div>
    <div role="row">
      <span role="cell" aria-rowindex="24">term</span>
      <span role="cell" aria-rowindex="24">dt</span>
    </div>
  </div>
</div>
```

Đoạn trên là một bảng ARIA không ngữ nghĩa với năm trong số 81 hàng có mặt trong DOM: một hàng trong phần đầu bảng và bốn hàng trong phần thân bảng. Vì không phải tất cả hàng đều có trong DOM, chúng ta đã bao gồm thuộc tính `aria-rowindex` trên mọi ô. Nếu không có ô nào trải rộng hơn một hàng hoặc một cột, `aria-rowindex` có thể được đặt trên hàng thay vì trên các ô riêng lẻ của hàng.

## Thực hành tốt nhất

Chỉ dùng {{HTMLElement('table')}}, {{HTMLElement('tbody')}}, {{HTMLElement('thead')}}, {{HTMLElement('tr')}}, {{HTMLElement('th')}}, {{HTMLElement('td')}}, v.v. cho cấu trúc bảng dữ liệu. Bạn có thể thêm các vai trò ARIA để bảo đảm khả năng truy cập nếu ngữ nghĩa gốc của bảng bị loại bỏ, chẳng hạn bằng CSS. Một trường hợp dùng phù hợp cho vai trò bảng ARIA là khi ngữ nghĩa gốc của bảng bị ghi đè bởi [thuộc tính display của CSS, chẳng hạn display: grid](/en-US/docs/Web/CSS/Reference/Properties/display#accessibility). Trong trường hợp này, bạn có thể dùng các vai trò bảng ARIA để thêm lại ngữ nghĩa.

```html
<table
  role="table"
  aria-label="Các phần tử ngữ nghĩa"
  aria-describedby="semantic_elements_table_desc"
  aria-rowcount="81">
  <caption id="semantic_elements_table_desc">
    Các phần tử ngữ nghĩa nên dùng thay cho vai trò ARIA
  </caption>
  <thead role="rowgroup">
    <tr role="row">
      <th role="columnheader" aria-sort="none" aria-rowindex="1">
        Vai trò ARIA
      </th>
      <th role="columnheader" aria-sort="none" aria-rowindex="1">
        Phần tử ngữ nghĩa
      </th>
    </tr>
  </thead>
  <tbody role="rowgroup">
    <tr role="row">
      <td role="cell" aria-rowindex="11">header</td>
      <td role="cell" aria-rowindex="11">h1</td>
    </tr>
    <tr role="row">
      <td role="cell" aria-rowindex="16">header</td>
      <td role="cell" aria-rowindex="16">h6</td>
    </tr>
    <tr role="row">
      <td role="cell" aria-rowindex="18">rowgroup</td>
      <td role="cell" aria-rowindex="18">thead</td>
    </tr>
    <tr role="row">
      <td role="cell" aria-rowindex="24">term</td>
      <td role="cell" aria-rowindex="24">dt</td>
    </tr>
  </tbody>
</table>
```

Ở trên là cách viết bảng theo ngữ nghĩa. Các vai trò ARIA không cần thiết nếu ngữ nghĩa gốc của bảng, và do đó cả các hàng của bảng, chưa bị thay đổi, chẳng hạn thông qua [thuộc tính display](/en-US/docs/Web/CSS/Reference/Properties/display#accessibility).

### Lợi ích bổ sung

Khi được áp dụng cho một {{HTMLElement('td')}}, nó trả lại ngữ nghĩa ô cho phần tử trong trường hợp ngữ nghĩa đã bị loại bỏ, chẳng hạn bởi `display: grid;`.

## Đặc tả

{{Specifications}}

## Xem thêm

- [`role="row"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [`role="gridcell"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [Phần tử HTML `<td>`](/en-US/docs/Web/HTML/Reference/Elements/td)
- [Phần tử HTML `<th>`](/en-US/docs/Web/HTML/Reference/Elements/th)
- [Học: Khả năng truy cập của bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Table_accessibility)
- [Học: Kiến thức cơ bản về bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
