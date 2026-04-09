---
title: "ARIA: vai trò rowheader"
short-title: rowheader
slug: Web/Accessibility/ARIA/Reference/Roles/rowheader_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#rowheader
sidebar: accessibilitysidebar
---

Một phần tử với `role="rowheader"` là một [ô](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role) chứa thông tin tiêu đề cho một [hàng](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role) trong một cấu trúc dạng bảng của [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role), [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role) hoặc [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role).

## Mô tả

`Rowheader` là [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role) tiêu đề cho một hàng, thiết lập mối quan hệ giữa nó và các ô khác trong cùng [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role).

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
      <span role="rowheader">Finland</span>
      <span role="cell">5.5 million</span>
    </div>
    <div role="row">
      <span role="rowheader">France</span>
      <span role="cell">67 million</span>
    </div>
  </div>
</div>
```

Đây là phần tương đương về cấu trúc với phần tử {{HTMLElement('th')}} với scope là `row`, `<th scope="row">`. Nên ưu tiên dùng phần tử HTML {{HTMLElement('th')}} gốc.

Để tạo một row header theo ARIA, hãy thêm `role="rowheader"` vào phần tử. Row header đó phải được lồng trong một `row`, mà đến lượt nó lại được lồng trong một `rowgroup`, hoặc trực tiếp trong `grid`, `table` hay `treegrid`.

> [!NOTE]
> Việc dùng các [phần tử bảng](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics) gốc khi có thể là điều được khuyến khích mạnh mẽ.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

#### Vai trò ngữ cảnh

- [role="row"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
  - : Ngữ cảnh duy nhất nơi bạn sẽ gặp một row. Nó bao gồm một ô hoặc một nhóm ô trong hàng, trong đó chỉ một ô nên là kiểu rowheader. Tương tự phần tử HTML {{HTMLElement('tr')}} gốc.

### Tương tác bàn phím

Không có.

### Tính năng JavaScript bắt buộc

Không có.

> [!NOTE]
> Quy tắc đầu tiên khi dùng ARIA là nếu bạn có thể dùng một tính năng gốc đã có sẵn ngữ nghĩa và hành vi phù hợp, thay vì tái sử dụng một phần tử và **thêm** vai trò, trạng thái hoặc thuộc tính ARIA để làm nó có thể truy cập, thì hãy làm như vậy. Hãy dùng phần tử HTML `<table>`, `<tr>`, `<th>`, `<td>`, và các [phần tử bảng](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics) khác thay vì các vai trò bảng ARIA bất cứ khi nào có thể.

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
      <span role="rowheader">header</span>
      <span role="cell">h1</span>
    </div>
    <div role="row" aria-rowindex="16">
      <span role="rowheader">header</span>
      <span role="cell">h6</span>
    </div>
    <div role="row" aria-rowindex="18">
      <span role="rowheader">rowgroup</span>
      <span role="cell">thead</span>
    </div>
    <div role="row" aria-rowindex="24">
      <span role="rowheader">term</span>
      <span role="cell">dt</span>
    </div>
  </div>
</div>
```

Phần trên là một bảng ARIA không ngữ nghĩa với đầu bảng và thân bảng, trong đó có năm trong số 81 hàng hiện diện trong DOM: một hàng trong phần đầu bảng và bốn hàng trong phần thân bảng. Hàng tiêu đề, đứng một mình trong một rowgroup đầu bảng, có hai tiêu đề cột. Các cột có thể sắp xếp, nhưng hiện chưa được sắp xếp, như được chỉ ra bởi thuộc tính [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort). Thân bảng là một rowgroup riêng, với bốn hàng hiện có trong DOM. Mỗi hàng dữ liệu có một row header. Vì không phải tất cả các hàng đều có trong DOM, chúng tôi đã thêm thuộc tính [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex) trên mỗi hàng.

## Thực hành tốt nhất

Chỉ dùng {{HTMLElement('table')}}, {{HTMLElement('tbody')}}, {{HTMLElement('thead')}}, {{HTMLElement('tr')}}, {{HTMLElement('th')}}, {{HTMLElement('td')}}, và tương tự cho cấu trúc bảng dữ liệu. Bạn có thể thêm các vai trò ARIA này để đảm bảo khả năng truy cập nếu ngữ nghĩa gốc của table bị loại bỏ, chẳng hạn bằng CSS. Một trường hợp sử dụng phù hợp cho tất cả các vai trò bảng ARIA là khi thuộc tính `display` của CSS ghi đè ngữ nghĩa gốc của table, chẳng hạn bằng `display: grid`. Trong trường hợp này, bạn có thể dùng các vai trò ARIA table để thêm ngữ nghĩa trở lại.

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
      <th role="rowheader">header</th>
      <td role="cell">h1</td>
    </tr>
    <tr role="row" aria-rowindex="16">
      <th role="rowheader">header</th>
      <td role="cell">h6</td>
    </tr>
  </tbody>
</table>
```

Trên đây là cách viết table theo ngữ nghĩa. Các vai trò ARIA chỉ cần thiết nếu ngữ nghĩa gốc của table, và do đó là các row header của table, bị xóa bỏ, chẳng hạn bằng cách đặt [thuộc tính display thành flex hoặc grid](/en-US/docs/Web/CSS/Reference/Properties/display#accessibility).

### Lợi ích bổ sung

none

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [The HTML `<table>` element](/en-US/docs/Web/HTML/Reference/Elements/table)
- [The HTML `<th>` element](/en-US/docs/Web/HTML/Reference/Elements/th)
- [HTML table tutorial](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- [ARIA `cell` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role)
- [ARIA `row` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [ARIA `gridcell` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
