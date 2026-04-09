---
title: "ARIA: vai trò gridcell"
short-title: gridcell
slug: Web/Accessibility/ARIA/Reference/Roles/gridcell_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#gridcell
sidebar: accessibilitysidebar
---

Vai trò `gridcell` được dùng để tạo một ô trong một [grid](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role) hoặc [treegrid](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role). Nó nhằm mô phỏng chức năng của phần tử HTML {{HTMLElement('td')}} cho việc nhóm thông tin theo kiểu bảng.

```html
<div role="gridcell">Khoai tây</div>
<div role="gridcell">Bắp cải</div>
<div role="gridcell">Hành tây</div>
```

Các phần tử có `role="gridcell"` phải là phần tử con của một phần tử có vai trò [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role).

```html
<div role="row">
  <div role="gridcell">Jane</div>
  <div role="gridcell">Smith</div>
  <div role="gridcell">496-619-5098</div>
  …
</div>
```

Quy tắc đầu tiên của ARIA là nếu một phần tử hoặc thuộc tính HTML gốc đã có sẵn ngữ nghĩa và hành vi bạn cần, hãy dùng nó thay vì tái sử dụng một phần tử rồi thêm ARIA. Thay vào đó, hãy dùng phần tử HTML {{HTMLElement('td')}}:

```html
<td>Khoai tây</td>
<td>Bắp cải</td>
<td>Hành tây</td>
```

## Mô tả

### gridcell với các hàng và cột được thêm, ẩn hoặc xóa động

Bất kỳ phần tử nào có `role="gridcell"` nên dùng ARIA để mô tả thứ tự của nó trong nhóm kiểu bảng, nếu bảng, grid hoặc treegrid có khả năng thêm, ẩn hoặc xóa động các hàng và/hoặc cột.

Dùng [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex) để mô tả thứ tự của `gridcell` trong danh sách cột, và [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex) để mô tả thứ tự của gridcell trong danh sách hàng. Dùng [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount) và [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount) trên phần tử cha có áp dụng [`role="grid"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role) để đặt tổng số cột hoặc hàng.

Đoạn mã mẫu này cho thấy một nhóm thông tin theo kiểu bảng nơi cột thứ ba và thứ tư đã bị loại bỏ. [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex) được dùng để mô tả vị trí của các hàng và cho phép người dùng công nghệ hỗ trợ suy ra rằng một số cột đã bị xóa:

```html
<div role="grid" aria-colcount="6">
  <div role="rowgroup">
    <div role="row">
      <div role="columnheader" aria-colindex="1">Tên</div>
      <div role="columnheader" aria-colindex="2">Họ</div>
      <div role="columnheader" aria-colindex="5">Thành phố</div>
      <div role="columnheader" aria-colindex="6">Mã bưu chính</div>
    </div>
  </div>
  <div role="rowgroup">
    <div role="row">
      <div role="gridcell" aria-colindex="1">Debra</div>
      <div role="gridcell" aria-colindex="2">Burks</div>
      <div role="gridcell" aria-colindex="5">New York</div>
      <div role="gridcell" aria-colindex="6">14127</div>
    </div>
  </div>
  …
</div>
```

### Mô tả vị trí của gridcell khi chưa biết toàn bộ cấu trúc

Trong những tình huống mà nhóm nội dung theo kiểu bảng không cung cấp thông tin về các cột và hàng, gridcell phải được mô tả vị trí một cách có thể lập trình bằng cách dùng [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby). Các `id` được cung cấp cho `aria-describedby` nên tương ứng với các phần tử cha được dự định là hàng và cột.

Bằng cách tham chiếu đến các phần tử cha có vai trò [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role) hoặc [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role) thông qua `aria-describedby`, công nghệ hỗ trợ có thể hiểu vị trí và mối quan hệ của phần tử `gridcell` với phần còn lại của nhóm nội dung kiểu bảng.

### Grid tương tác và treegrid

#### Ô có thể chỉnh sửa

Cả phần tử `<td>` và các phần tử có vai trò `gridcell` đều có thể được làm cho có thể chỉnh sửa, mô phỏng chức năng tương tự việc sửa bảng tính. Điều này được thực hiện bằng cách áp dụng thuộc tính HTML [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).

```html
<td contenteditable="true">Ghi chú</td>

<div role="gridcell" contenteditable="true">Chi phí mặt hàng</div>
```

`contenteditable` sẽ làm cho phần tử mà nó được áp dụng có thể nhận tiêu điểm bằng phím <kbd>Tab</kbd>. Nếu một gridcell được chuyển sang trạng thái mà việc chỉnh sửa bị cấm, hãy bật/tắt [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly) trên phần tử gridcell.

#### Ô có thể mở rộng

Trong một [treegrid](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role), gridcell có thể được làm cho có thể mở rộng bằng cách bật/tắt thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded). Lưu ý rằng nếu thuộc tính này được cung cấp, nó chỉ áp dụng cho từng gridcell riêng lẻ.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- `grid`
  - : Cho biết phần tử cha là một nhóm thông tin kiểu bảng hoặc kiểu cây.
- `row`
  - : Bắt buộc để cho biết `gridcell` là một phần của một hàng trong nhóm thông tin kiểu bảng.
- `columnheader`
  - : Xác định phần tử nào là tiêu đề cột liên quan.
- [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex)
  - : Xác định vị trí của một phần tử so với các cột còn lại của nhóm thông tin kiểu bảng.
- `rowheader`
  - : Xác định phần tử nào là tiêu đề hàng liên quan.
- [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex)
  - : Xác định vị trí của một phần tử so với các hàng còn lại của nhóm thông tin kiểu bảng.

### Ví dụ

Ví dụ sau tạo một nhóm thông tin theo kiểu bảng:

```html
<h3 id="table-title">Các hành tinh khổng lồ khí Jovian</h3>
<div role="grid" aria-describedby="table-title">
  <div role="rowgroup">
    <div role="row">
      <div role="columnheader">Tên</div>
      <div role="columnheader">Đường kính (km)</div>
      <div role="columnheader">Độ dài ngày (giờ)</div>
      <div role="columnheader">Khoảng cách từ Mặt Trời (10<sup>6</sup>km)</div>
      <div role="columnheader">Số vệ tinh</div>
    </div>
  </div>
  <div role="rowgroup">
    <div role="row">
      <div role="gridcell">Jupiter</div>
      <div role="gridcell">142,984</div>
      <div role="gridcell">9.9</div>
      <div role="gridcell">778.6</div>
      <div role="gridcell">67</div>
    </div>
  </div>
  <div role="rowgroup">
    <div role="row">
      <div role="gridcell">Saturn</div>
      <div role="gridcell">120,536</div>
      <div role="gridcell">10.7</div>
      <div role="gridcell">1433.5</div>
      <div role="gridcell">62</div>
    </div>
  </div>
</div>
```

## Các vấn đề về khả năng truy cập

Hỗ trợ cho `gridcell` và một số vai trò, thuộc tính liên quan đến `gridcell` khác còn kém trong các công nghệ hỗ trợ. Nếu có thể, hãy dùng [markup bảng HTML](/en-US/docs/Web/HTML/Reference/Elements/table) thay thế.

## Thực hành tốt nhất

Quy tắc đầu tiên của ARIA là: nếu một phần tử hoặc thuộc tính HTML gốc đã có ngữ nghĩa và hành vi bạn cần, hãy dùng nó thay vì tái sử dụng một phần tử rồi thêm vai trò, trạng thái hoặc thuộc tính ARIA để làm nó có thể truy cập. Vì vậy, nên dùng [markup bảng HTML gốc](/en-US/docs/Web/HTML/Reference/Elements/table) thay vì tái tạo hình thức và chức năng của bảng bằng ARIA và JavaScript.

## Đặc tả

{{Specifications}}

## Xem thêm

- [Phần tử Table](/en-US/docs/Web/HTML/Reference/Elements/table)
- [ARIA: vai trò Grid](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
- [Phần tử Table row](/en-US/docs/Web/HTML/Reference/Elements/tr)
- [ARIA: vai trò row](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [ARIA: vai trò rowgroup](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role)
- [Phần tử Table header](/en-US/docs/Web/HTML/Reference/Elements/th)
- [Phần tử Table Data Cell](/en-US/docs/Web/HTML/Reference/Elements/td)
