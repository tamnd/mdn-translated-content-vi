---
title: "ARIA: thuộc tính aria-colcount"
short-title: aria-colcount
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-colcount
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-colcount
sidebar: accessibilitysidebar
---

Thuộc tính `aria-colcount` định nghĩa tổng số cột trong một [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role), [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role), hoặc [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role) khi không phải tất cả các cột đều có mặt trong [DOM](/en-US/docs/Glossary/DOM).

## Mô tả

Một số bảng rất lớn, và không thể hiển thị tất cả các cột cho người dùng. Hoặc có thể hiển thị được, nhưng một bảng rộng như vậy sẽ mang lại trải nghiệm người dùng tệ. Hãy dùng thuộc tính `aria-colcount` để cho công nghệ hỗ trợ biết bảng sẽ có bao nhiêu cột nếu tất cả các cột đều có mặt. Giá trị là một số nguyên biểu thị số cột tạo thành toàn bộ bảng. Nếu bạn không biết tổng số cột mà bảng sẽ có, nhưng biết rằng không phải tất cả đều có trong DOM, hãy dùng giá trị -1, tức `aria-colcount="-1"`. Giá trị này cho tác nhân người dùng biết rằng số cột hiện có trong DOM có thể không phải là số cột thực tế của bảng.

Nếu tất cả các cột trong bảng đều có mặt trong DOM, thuộc tính `aria-colcount` là không cần thiết, vì trình duyệt sẽ tự động tính tổng số cột. Tuy nhiên, nếu chỉ một phần các cột có mặt trong DOM tại một thời điểm nhất định, thì lúc đó thuộc tính này mới hữu ích và cần thiết.

Khi dùng `aria-colcount` với số cột đã biết, hãy bảo đảm cũng dùng [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex) để gắn nhãn cho từng cột, hoặc nếu các cột liền kề nhau - tức là một nhóm cột theo đúng thứ tự gốc, không bị ngắt quãng - thì gắn nhãn cho từng hàng.

Ví dụ sau cho thấy một grid có 6 cột, trong đó các cột 1, 2, 5 và 6 được hiển thị cho người dùng. Tổng số cột tạo thành bảng được đặt là `aria-colcount="6"` trên chính bảng. Vì các cột không liền nhau, mọi [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role) - trong trường hợp này là các phần tử [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role) và [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role) - đều có thuộc tính `aria-colindex` được đặt.

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

Quy tắc đầu tiên khi dùng ARIA là: "nếu bạn có thể dùng một tính năng gốc có sẵn ngữ nghĩa và hành vi mà bạn cần, thay vì tái sử dụng một phần tử rồi **thêm** vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có trợ năng, thì hãy làm như vậy." Nếu chúng ta dùng ngữ nghĩa HTML gốc với {{HTMLElement('table')}}, {{HTMLElement('th')}}, {{HTMLElement('td')}}, v.v., thì thuộc tính `aria-colcount` vẫn cần thiết, nhưng markup sẽ bớt dài dòng hơn. Khi dùng các phần tử tiêu đề bảng ngữ nghĩa và không phải tất cả các cột đều có trong DOM, `aria-colcount` vẫn phải được dùng, nhưng thuộc tính `aria-colindex` chỉ cần được định nghĩa một lần cho mỗi cột ở phần tử tiêu đề cột {{HTMLElement('th')}}.

```html
<table aria-colcount="6">
  <thead>
    <tr>
      <th aria-colindex="1" scope="col">Tên</th>
      <th aria-colindex="2" scope="col">Họ</th>
      <th aria-colindex="5" scope="col">Thành phố</th>
      <th aria-colindex="6" scope="col">Mã bưu chính</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Debra</td>
      <td>Burks</td>
      <td>New York</td>
      <td>14127</td>
    </tr>
    …
  </tbody>
</table>
```

## Giá trị

- `<integer>`
  - : Số lượng cột trong toàn bộ bảng

## Vai trò liên quan

Được dùng trong vai trò:

- [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)

Kế thừa vào các vai trò:

- [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex)
