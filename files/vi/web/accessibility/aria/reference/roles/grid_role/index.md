---
title: "ARIA: vai trò grid"
short-title: grid
slug: Web/Accessibility/ARIA/Reference/Roles/grid_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#grid
sidebar: accessibilitysidebar
---

Vai trò grid dành cho một widget chứa một hoặc nhiều hàng ô. Vị trí của từng ô là quan trọng và có thể được đưa tiêu điểm bằng nhập liệu bàn phím.

## Mô tả

Vai trò `grid` là một widget tổ hợp chứa một tập hợp gồm một hoặc nhiều hàng với một hoặc nhiều ô, trong đó một số hoặc tất cả ô trong grid có thể nhận tiêu điểm bằng các phương pháp điều hướng hai chiều, chẳng hạn các phím mũi tên.

```html
<table role="grid" aria-labelledby="id-select-your-seat">
  <caption id="id-select-your-seat">
    Chọn ghế của bạn
  </caption>
  <tbody role="presentation">
    <tr role="presentation">
      <td></td>
      <th>Hàng A</th>
      <th>Hàng B</th>
    </tr>
    <tr>
      <th scope="row">Lối đi 1</th>
      <td tabindex="0">
        <button id="btn-1a" tabindex="-1">1A</button>
      </td>
      <td tabindex="-1">
        <button id="btn-1b" tabindex="-1">1B</button>
      </td>
      <!-- Thêm các cột khác -->
    </tr>
    <tr>
      <th scope="row">Lối đi 2</th>
      <td tabindex="-1">
        <button id="btn-2a" tabindex="-1">2A</button>
      </td>
      <td tabindex="-1">
        <button id="btn-2b" tabindex="-1">2B</button>
      </td>
      <!-- Thêm các cột khác -->
    </tr>
  </tbody>
</table>
```

Một widget grid chứa một hoặc nhiều hàng với một hoặc nhiều ô có nội dung tương tác liên quan theo chủ đề. Mặc dù nó không ngụ ý một cách trình bày trực quan cụ thể, nó ngụ ý một mối quan hệ giữa các phần tử. Các cách dùng được chia thành hai nhóm: trình bày thông tin dạng bảng (data grid) và nhóm các widget khác (layout grid). Dù cả data grid và layout grid đều dùng cùng các vai trò, trạng thái và thuộc tính ARIA, sự khác nhau về nội dung và mục đích làm phát sinh các yếu tố quan trọng cần cân nhắc trong thiết kế tương tác bàn phím. Xem [ARIA Authoring Practices Guide](https://www.w3.org/WAI/ARIA/apg/patterns/grid/) để biết thêm chi tiết.

Các phần tử ô có vai trò [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), trừ khi chúng là tiêu đề hàng hoặc cột, khi đó các phần tử tương ứng là [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role) và [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role). Các phần tử ô cần được sở hữu bởi các phần tử có vai trò [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role). Các hàng có thể được nhóm bằng vai trò [`rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role).

Nếu grid được dùng như một widget tương tác, cần triển khai [tương tác bàn phím](#keyboard_interactions).

### Các vai trò, trạng thái và thuộc tính ARIA liên quan

#### Vai trò

- [treegrid](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role) (vai trò con)
  - : Nếu grid có các cột có thể mở rộng hoặc thu gọn, có thể dùng treegrid.
- [row](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
  - : Một hàng bên trong grid.
- [rowgroup](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role)
  - : Một nhóm chứa một hoặc nhiều hàng [row](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role).

#### Trạng thái và thuộc tính

- [aria-level](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level)
  - : Cho biết cấp độ phân cấp của grid trong các cấu trúc khác.
- [aria-multiselectable](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable)
  - : Nếu `aria-multiselectable` được đặt thành `true`, có thể chọn nhiều mục trong grid. Giá trị mặc định là `false`.
- [aria-readonly](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly)
  - : Nếu người dùng có thể điều hướng grid nhưng không thể thay đổi giá trị của grid, thuộc tính [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly) nên được đặt thành `true`. Giá trị mặc định là `false`.

> [!NOTE]
> Với nhiều trường hợp sử dụng, phần tử HTML {{HTMLElement('table')}} là đủ vì nó và các phần tử bảng khác đã bao gồm nhiều vai trò ARIA.

### Tương tác bàn phím

Khi người dùng bàn phím gặp một grid, họ điều hướng các hàng và cột bằng các phím <kbd>left</kbd>, <kbd>right</kbd>, <kbd>top</kbd> và <kbd>down</kbd>. Để kích hoạt thành phần tương tác, họ sẽ dùng các phím <kbd>return</kbd> và <kbd>space</kbd>.

| Phím | Hành động |
| --- | --- |
| <kbd>→</kbd> | Di chuyển tiêu điểm sang một ô bên phải. Tùy chọn (layout grid), nếu tiêu điểm đang ở ô ngoài cùng bên phải của hàng, tiêu điểm có thể chuyển tới ô đầu tiên của hàng tiếp theo. Nếu tiêu điểm đang ở ô cuối cùng của grid, tiêu điểm không di chuyển. |
| <kbd>←</kbd> | Di chuyển tiêu điểm sang một ô bên trái. Tùy chọn (layout grid), nếu tiêu điểm đang ở ô ngoài cùng bên trái của hàng, tiêu điểm có thể chuyển tới ô cuối cùng của hàng trước đó. Nếu tiêu điểm đang ở ô đầu tiên của grid, tiêu điểm không di chuyển. |
| <kbd>↓</kbd> | Di chuyển tiêu điểm xuống một ô. Tùy chọn (layout grid), nếu tiêu điểm đang ở ô dưới cùng của cột, tiêu điểm có thể chuyển tới ô trên cùng của cột kế tiếp. Nếu tiêu điểm đang ở ô cuối cùng của grid, tiêu điểm không di chuyển. |
| <kbd>↑</kbd> | Di chuyển tiêu điểm lên một ô. Tùy chọn (layout grid), nếu tiêu điểm đang ở ô trên cùng của cột, tiêu điểm có thể chuyển tới ô dưới cùng của cột trước đó. Nếu tiêu điểm đang ở ô đầu tiên của grid, tiêu điểm không di chuyển. |
| <kbd>Page Down</kbd> | Di chuyển tiêu điểm xuống một số hàng do tác giả quyết định, thường là cuộn sao cho hàng dưới cùng trong tập hàng hiện đang hiển thị trở thành một trong những hàng đầu tiên được nhìn thấy. Nếu tiêu điểm đang ở hàng cuối cùng của grid, tiêu điểm không di chuyển. |
| <kbd>Page Up</kbd> | Di chuyển tiêu điểm lên một số hàng do tác giả quyết định, thường là cuộn sao cho hàng trên cùng trong tập hàng hiện đang hiển thị trở thành một trong những hàng cuối cùng được nhìn thấy. Nếu tiêu điểm đang ở hàng đầu tiên của grid, tiêu điểm không di chuyển. |
| <kbd>Home</kbd> | Di chuyển tiêu điểm tới ô đầu tiên trong hàng đang chứa tiêu điểm. |
| <kbd>End</kbd> | Di chuyển tiêu điểm tới ô cuối cùng trong hàng đang chứa tiêu điểm. |
| <kbd>ctrl</kbd> + <kbd>Home</kbd> | Di chuyển tiêu điểm tới ô đầu tiên trong hàng đầu tiên. |
| <kbd>ctrl</kbd> + <kbd>End</kbd> | Di chuyển tiêu điểm tới ô cuối cùng trong hàng cuối cùng. |

Nếu có thể chọn ô, hàng hoặc cột, các tổ hợp phím sau thường được dùng:

| Tổ hợp phím | Hành động |
| --- | --- |
| <kbd>ctrl</kbd> + <kbd>Space</kbd> | Chọn cột chứa tiêu điểm. |
| <kbd>shift</kbd> + <kbd>Space</kbd> | Chọn hàng chứa tiêu điểm. Nếu grid bao gồm một cột có checkbox để chọn hàng, tổ hợp này có thể được dùng để đánh dấu checkbox đó ngay cả khi tiêu điểm không nằm trên checkbox. |
| <kbd>ctrl</kbd> + <kbd>A</kbd> | Chọn tất cả các ô. |
| <kbd>shift</kbd> + <kbd>→</kbd> | Mở rộng vùng chọn sang một ô bên phải. |
| <kbd>shift</kbd> + <kbd>←</kbd> | Mở rộng vùng chọn sang một ô bên trái. |
| <kbd>shift</kbd> + <kbd>↓</kbd> | Mở rộng vùng chọn xuống một ô. |
| <kbd>shift</kbd> + <kbd>↑</kbd> | Mở rộng vùng chọn lên một ô. |

## Ví dụ

### Ví dụ lịch

{{EmbedLiveSample("Calendar_example", "100%", "300")}}

#### HTML

```html
<table role="grid" aria-labelledby="calendarheader">
  <caption id="calendarheader">
    Tháng 9 năm 2018
  </caption>
  <thead role="rowgroup">
    <tr role="row">
      <td></td>
      <th role="columnheader" aria-label="Chủ nhật">CN</th>
      <th role="columnheader" aria-label="Thứ hai">T2</th>
      <th role="columnheader" aria-label="Thứ ba">T3</th>
      <th role="columnheader" aria-label="Thứ tư">T4</th>
      <th role="columnheader" aria-label="Thứ năm">T5</th>
      <th role="columnheader" aria-label="Thứ sáu">T6</th>
      <th role="columnheader" aria-label="Thứ bảy">T7</th>
    </tr>
  </thead>
  <tbody role="rowgroup">
    <tr role="row">
      <th scope="row" role="rowheader">Tuần 1</th>
      <td>26</td>
      <td>27</td>
      <td>28</td>
      <td>29</td>
      <td>30</td>
      <td>31</td>
      <td role="gridcell" tabindex="-1">1</td>
    </tr>
    <tr role="row">
      <th scope="row" role="rowheader">Tuần 2</th>
      <td role="gridcell" tabindex="-1">2</td>
      <td role="gridcell" tabindex="-1">3</td>
      <td role="gridcell" tabindex="-1">4</td>
      <td role="gridcell" tabindex="-1">5</td>
      <td role="gridcell" tabindex="-1">6</td>
      <td role="gridcell" tabindex="-1">7</td>
      <td role="gridcell" tabindex="-1">8</td>
    </tr>
    <tr role="row">
      <th scope="row" role="rowheader">Tuần 3</th>
      <td role="gridcell" tabindex="-1">9</td>
      <td role="gridcell" tabindex="-1">10</td>
      <td role="gridcell" tabindex="-1">11</td>
      <td role="gridcell" tabindex="-1">12</td>
      <td role="gridcell" tabindex="-1">13</td>
      <td role="gridcell" tabindex="-1">14</td>
      <td role="gridcell" tabindex="-1">15</td>
    </tr>
    <tr role="row">
      <th scope="row" role="rowheader">Tuần 4</th>
      <td role="gridcell" tabindex="-1">16</td>
      <td role="gridcell" tabindex="-1">17</td>
      <td role="gridcell" tabindex="-1">18</td>
      <td role="gridcell" tabindex="-1">19</td>
      <td role="gridcell" tabindex="-1">20</td>
      <td role="gridcell" tabindex="-1">21</td>
      <td role="gridcell" tabindex="-1">22</td>
    </tr>
    <tr role="row">
      <th scope="row" role="rowheader">Tuần 5</th>
      <td role="gridcell" tabindex="-1">23</td>
      <td role="gridcell" tabindex="-1">24</td>
      <td role="gridcell" tabindex="-1">25</td>
      <td role="gridcell" tabindex="-1">26</td>
      <td role="gridcell" tabindex="-1">27</td>
      <td role="gridcell" tabindex="-1">28</td>
      <td role="gridcell" tabindex="-1">29</td>
    </tr>
    <tr role="row">
      <th scope="row" role="rowheader">Tuần 6</th>
      <td role="gridcell" tabindex="-1">30</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
table {
  margin: 0;
  border-collapse: collapse;
  font-variant-numeric: tabular-nums;
}

tbody th,
tbody td {
  padding: 5px;
}

tbody td {
  border: 1px solid black;
  text-align: right;
  color: #767676;
}

tbody td[role="gridcell"] {
  color: black;
}

tbody td[role="gridcell"]:hover,
tbody td[role="gridcell"]:focus {
  background-color: #f6f6f6;
  outline: 3px solid blue;
}
```

#### JavaScript

```js
const selectables = document.querySelectorAll('table td[role="gridcell"]');

selectables[0].setAttribute("tabindex", 0);

const trs = document.querySelectorAll("table tbody tr");
let rowIndex = 0;
let colIndex = 0;
let maxRow = trs.length - 1;
let maxCol = 0;

trs.forEach((row) => {
  row.querySelectorAll("td").forEach((el) => {
    el.dataset.row = rowIndex;
    el.dataset.col = colIndex;
    colIndex++;
  });
  if (colIndex > maxCol) {
    maxCol = colIndex - 1;
  }
  colIndex = 0;
  rowIndex++;
});

function moveTo(newRow, newCol) {
  const tgt = document.querySelector(
    `[data-row="${newRow}"][data-col="${newCol}"]`,
  );
  if (tgt?.getAttribute("role") !== "gridcell") {
    return false;
  }
  document.querySelectorAll("[role=gridcell]").forEach((el) => {
    el.setAttribute("tabindex", "-1");
  });
  tgt.setAttribute("tabindex", "0");
  tgt.focus();
  return true;
}

document.querySelector("table").addEventListener("keydown", (event) => {
  const col = parseInt(event.target.dataset.col, 10);
  const row = parseInt(event.target.dataset.row, 10);
  switch (event.key) {
    case "ArrowRight": {
      const newRow = col === 6 ? row + 1 : row;
      const newCol = col === 6 ? 0 : col + 1;
      moveTo(newRow, newCol);
      break;
    }
    case "ArrowLeft": {
      const newRow = col === 0 ? row - 1 : row;
      const newCol = col === 0 ? 6 : col - 1;
      moveTo(newRow, newCol);
      break;
    }
    case "ArrowDown":
      moveTo(row + 1, col);
      break;
    case "ArrowUp":
      moveTo(row - 1, col);
      break;
    case "Home": {
      if (event.ctrlKey) {
        let i = 0;
        let result;
        do {
          let j = 0;
          do {
            result = moveTo(i, j);
            j++;
          } while (!result);
          i++;
        } while (!result);
      } else {
        moveTo(row, 0);
      }
      break;
    }
    case "End": {
      if (event.ctrlKey) {
        let i = maxRow;
        let result;
        do {
          let j = maxCol;
          do {
            result = moveTo(i, j);
            j--;
          } while (!result);
          i--;
        } while (!result);
      } else {
        moveTo(
          row,
          document.querySelector(
            `[data-row="${event.target.dataset.row}"]:last-of-type`,
          ).dataset.col,
        );
      }
      break;
    }
    case "PageUp": {
      let i = 0;
      let result;
      do {
        result = moveTo(i, col);
        i++;
      } while (!result);
      break;
    }
    case "PageDown": {
      let i = maxRow;
      let result;
      do {
        result = moveTo(i, col);
        i--;
      } while (!result);
      break;
    }
    case "Enter": {
      console.log(event.target.textContent);
      break;
    }
  }
  event.preventDefault();
});
```

### Thêm ví dụ

- [Ví dụ Data Grid](https://www.w3.org/WAI/ARIA/apg/example-index/grid/dataGrids.html)
- [Ví dụ Layout Grid](https://www.w3.org/WAI/ARIA/apg/example-index/grid/LayoutGrids.html)
- [W3C/WAI Tutorial: Tables](https://www.w3.org/WAI/tutorials/tables/)

## Các vấn đề về khả năng truy cập

Ngay cả khi việc dùng bàn phím đã được triển khai đúng, một số người dùng có thể không nhận ra rằng họ phải dùng các phím mũi tên. Hãy bảo đảm chức năng và tương tác cần thiết có thể đạt được tốt nhất bằng vai trò grid.

## Đặc tả

{{Specifications}}

## Xem thêm

- [ARIA `composite` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role)
- [ARIA `table` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
- [ARIA `treegrid` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)
- [ARIA `row` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [ARIA `rowgroup` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role)
- [ARIA: `gridcell` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [ARIA: `rowheader` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)
- [ARIA: columnheader role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- {{HTMLElement('table','Phần tử HTML <code>&lt;table&gt;</code>')}}
- [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level)
- [`aria-multiselectable`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable)
- [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly)
