---
title: "ARIA: thuộc tính aria-rowindex"
short-title: aria-rowindex
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-rowindex
sidebar: accessibilitysidebar
---

Thuộc tính `aria-rowindex` xác định vị trí của một phần tử so với tổng số hàng trong một bảng, grid hoặc treegrid.

## Mô tả

Một số bảng có rất, rất nhiều hàng. Việc chỉ tải một phần các hàng có thể là yêu cầu thiết kế, để cải thiện hiệu năng, hoặc để nâng cao trải nghiệm người dùng.

Khi chỉ có một phần các hàng được tải, bạn cần cho tất cả người dùng biết những phần hàng nào đang được hiển thị. Thuộc tính `aria-rowindex` được dùng để xác định chỉ số hoặc vị trí của hàng hay ô so với tổng số hàng trong một bảng, grid hoặc treegrid.

Khi được thêm vào phần tử {{HTMLElement('tr')}} hoặc vào một phần tử có vai trò [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role), hoặc trực tiếp lên {{HTMLElement('td')}}, {{HTMLElement('th')}}, hoặc phần tử có vai trò [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role) hay [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), giá trị là vị trí của hàng so với toàn bộ bảng.

Giá trị của `aria-rowindex` là một số nguyên lớn hơn hoặc bằng `1`, lớn hơn giá trị `aria-rowindex` của bất kỳ hàng trước đó nào, và nhỏ hơn hoặc bằng số hàng của toàn bộ bảng.

Nếu tất cả các hàng đều đã được tải và có trong DOM, bạn không cần thêm `aria-rowindex` vì trình duyệt sẽ tự động tính chỉ số của từng hàng. Tuy nhiên, khi chỉ có một phần các hàng hiện diện trong DOM, `aria-rowindex` là cần thiết để chỉ ra vị trí của từng hàng so với toàn bộ bảng. Nếu chỉ có một phần các hàng được tải, bạn cũng cần thêm [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount) vào phần tử tổ tiên của bảng, ngay cả khi bạn chưa biết tổng số hàng.

Nếu bảng chỉ có một phần các hàng có một ô chiếm nhiều hơn một hàng, cả hàng và ô đó đều cần có `aria-rowindex`. Nếu một ô chiếm nhiều hơn một hàng, tức là phần tử cell có thuộc tính `aria-rowspan` hoặc ô HTML có `rowspan` lớn hơn 1, hãy thêm giá trị `aria-rowindex` của hàng lên ô đang chiếm nhiều hàng đó, ngoài thuộc tính rowspan phù hợp. Giá trị đó phải là chỉ số của hàng nơi phần chiếm bắt đầu.

> [!NOTE]
> `aria-rowindex` phải được thêm vào từng hàng, nhưng là tùy chọn trên các ô, trừ các ô chiếm nhiều hàng: thuộc tính `aria-rowindex` là bắt buộc trên mọi ô chiếm nhiều hàng.

## Ví dụ

Ví dụ sau cho thấy một grid có 24 hàng, trong đó hàng đầu tiên và các hàng 7 đến 10 được hiển thị cho người dùng. Ô "Position" cuối cùng chiếm hai cột 9 và 10.

```html
<div role="grid" aria-rowcount="24">
  <div role="rowgroup">
    <div role="row" aria-rowindex="1">
      <span role="columnheader">First Name</span>
      <span role="columnheader">Last Name</span>
      <span role="columnheader">Position</span>
    </div>
  </div>
  <div role="rowgroup">
    <div role="row" aria-rowindex="7">
      <span role="gridcell">Morgan</span>
      <span role="gridcell">Brian</span>
      <span role="gridcell">Midfielder</span>
    </div>
    <div role="row" aria-rowindex="8">
      <span role="gridcell">Abby</span>
      <span role="gridcell">Dahlkemper</span>
      <span role="gridcell">Defender</span>
    </div>
    <div role="row" aria-rowindex="9">
      <span role="gridcell">Ashlyn</span>
      <span role="gridcell">Harris</span>
      <span role="gridcell" aria-rowspan="2" aria-rowindex="9">Goalkeeper</span>
    </div>
    <div role="row" aria-rowindex="10">
      <span role="gridcell">Alyssa</span>
      <span role="gridcell">Naeher</span>
    </div>
  </div>
</div>
```

Lưu ý rằng cả `aria-rowspan` và `aria-rowindex` đều có mặt trên ô Goalkeeper, vì ô này chiếm hai hàng.

## Giá trị

- `<integer>`
  - : Một số nguyên lớn hơn hoặc bằng 1, lớn hơn `aria-rowindex` của hàng trước đó nếu có, và nhỏ hơn hoặc bằng giá trị của [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount).

## Giao diện liên quan

- {{domxref("Element.ariaRowIndex")}}
  - : Thuộc tính [`ariaRowIndex`](/en-US/docs/Web/API/Element/ariaRowIndex), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-rowindex`.
- {{domxref("ElementInternals.ariaRowIndex")}}
  - : Thuộc tính [`ariaRowIndex`](/en-US/docs/Web/API/ElementInternals/ariaRowIndex), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-rowindex`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role)
- [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)

Kế thừa vào các vai trò:

- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`aria-rowindextext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindextext)
- [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount)
- [`aria-rowspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowspan)
- [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex)
- Thuộc tính [`rowspan`](/en-US/docs/Web/HTML/Reference/Elements/td#rowspan) trên {{HTMLElement('td')}}
