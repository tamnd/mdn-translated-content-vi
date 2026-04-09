---
title: "ARIA: thuộc tính aria-colindex"
short-title: aria-colindex
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-colindex
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-colindex
sidebar: accessibilitysidebar
---

Thuộc tính `aria-colindex` định nghĩa chỉ số cột hoặc vị trí của một phần tử so với tổng số cột trong một `table`, `grid`, hoặc `treegrid`.

## Mô tả

Một số bảng rất lớn, và kết quả là chỉ một phần nội dung của chúng được hiển thị ban đầu. Dù chỉ tải một phần các cột có thể cải thiện trải nghiệm người dùng, bạn vẫn cần cho tất cả người dùng biết những phần nội dung nào đang được hiển thị, và rằng không phải toàn bộ nội dung bảng đều hiện diện.

ARIA cung cấp một số thuộc tính để cung cấp thông tin về cấu trúc `table`, `grid`, và `treegrid`. Thuộc tính `aria-colindex` định nghĩa cấu trúc con, tức là chỉ số cột hoặc vị trí của một phần tử so với tổng số cột, trong các cấu trúc như vậy.

Khi được dùng cùng với thuộc tính [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount), vốn cho công nghệ hỗ trợ biết bảng sẽ có bao nhiêu cột nếu tất cả các cột đều có mặt, `aria-colindex` được dùng để chỉ ra chỉ số cột hoặc vị trí của một phần tử so với tổng số đó.

Nếu tất cả các cột đều có mặt trong DOM, việc bao gồm `aria-colindex` là không cần thiết vì tác nhân người dùng có thể tính toán chỉ số cột của từng ô hoặc gridcell. Tuy nhiên, nếu bất kỳ cột nào bị bỏ khỏi DOM vào bất kỳ thời điểm nào, hãy dùng `aria-colindex` để chỉ ra cột của từng ô hoặc gridcell so với toàn bộ bảng.

Giá trị của `aria-colindex` là một số nguyên lớn hơn hoặc bằng 1. Mỗi giá trị nên lớn hơn `aria-colindex` của cột trước đó và nhỏ hơn hoặc bằng số cột trong toàn bộ bảng.

Nếu một ô hoặc gridcell chiếm nhiều cột, hãy đặt [`aria-colspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colspan) bằng số cột mà nó chiếm nếu không dùng các phần tử HTML {{htmlelement('td')}} và {{htmlelement('th')}}, và đặt `aria-colindex` bằng giá trị bắt đầu của phạm vi đó; tức giá trị mà nó sẽ có nếu chỉ rộng một cột và chỉ chiếm cột đầu tiên trong số các cột của nó.

Nếu tập các cột hiện diện trong DOM là liền kề nhau, và nếu không có ô nào trong tập đó chiếm nhiều hơn một hàng hoặc một cột, bạn chỉ cần đặt `aria-colindex` một lần trên mỗi hàng tại cột đầu tiên của tập. Nếu các cột không liền nhau, hãy bao gồm giá trị `aria-colindex` trên tất cả phần tử con hoặc phần tử thuộc quyền sở hữu của mỗi hàng.

Ví dụ sau cho thấy một grid với 6 cột, trong đó các cột 1, 2, 5 và 6 được hiển thị cho người dùng. Tổng số cột tạo nên bảng được đặt là `aria-colcount="6"` trên chính bảng. Vì các cột không liền kề, mọi [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role) - trong trường hợp này là các phần tử [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role) và [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role) - đều có thuộc tính `aria-colindex` được đặt.

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

Quy tắc đầu tiên khi dùng ARIA là: "nếu bạn có thể dùng một tính năng gốc có sẵn ngữ nghĩa và hành vi mà bạn cần, thay vì tái sử dụng một phần tử rồi **thêm** một vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có trợ năng, thì hãy làm như vậy." Nếu chúng ta dùng ngữ nghĩa HTML gốc với {{HTMLElement('table')}}, {{HTMLElement('th')}}, {{HTMLElement('td')}}, v.v., thì thuộc tính `aria-colcount` vẫn cần thiết, nhưng markup sẽ bớt dài dòng hơn. Khi dùng các phần tử tiêu đề bảng ngữ nghĩa và không phải tất cả các cột đều có trong DOM, `aria-colcount` vẫn phải được dùng, nhưng thuộc tính `aria-colindex` chỉ cần được định nghĩa một lần cho mỗi cột ở phần tử tiêu đề cột {{HTMLElement('th')}}.

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
  - : Số nguyên lớn hơn hoặc bằng 1

## Vai trò liên quan

Được dùng trong các vai trò:

- [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role)

Kế thừa vào các vai trò:

- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount)
