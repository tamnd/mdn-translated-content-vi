---
title: "ARIA: thuộc tính aria-rowcount"
short-title: aria-rowcount
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-rowcount
sidebar: accessibilitysidebar
---

Thuộc tính `aria-rowcount` xác định tổng số hàng trong một bảng, grid hoặc treegrid.

## Mô tả

Một số bảng có hàng trăm, thậm chí hàng triệu hàng. Ngay cả với các bảng ít hàng hơn, chỉ tải một phần các hàng đôi khi là yêu cầu thiết kế, giúp cải thiện hiệu năng hoặc nâng cao trải nghiệm người dùng. Khi chỉ có một phần các hàng được tải, bạn cần cho tất cả người dùng biết rằng chỉ một phần dữ liệu đang được hiển thị. Thuộc tính `aria-rowcount` được dùng để xác định tổng số hàng trong một bảng, grid hoặc treegrid.

Khi được thêm vào phần tử {{HTMLElement('table')}} hoặc vào một phần tử có vai trò [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role), giá trị là số hàng của toàn bộ bảng, dưới dạng một số nguyên. Nếu chưa biết tổng số hàng, hãy đặt `aria-rowcount="-1"`, điều này cho trình duyệt biết không cần đếm tổng số hàng.

Nếu tất cả các hàng đều đã được tải và có trong DOM, bạn không cần thêm `aria-rowcount` vì trình duyệt sẽ tự động đếm tổng số hàng. Tuy nhiên, nếu không phải tất cả hàng đều hiện diện trong DOM tại bất kỳ thời điểm nào, thuộc tính này là cần thiết để cung cấp số hàng khi biết kích thước toàn bộ bảng và để yêu cầu trình duyệt không tự động đếm hàng khi chưa biết tổng số hàng.

## Ví dụ

Ví dụ sau cho thấy một grid có 24 hàng, trong đó hàng đầu tiên và các hàng 7 đến 9 được hiển thị cho người dùng.

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
      <span role="gridcell">Goalkeeper</span>
    </div>
  </div>
</div>
```

## Giá trị

- `<integer>`
  - : Số hàng của toàn bộ bảng hoặc `-1` nếu không biết kích thước bảng.

## Giao diện liên quan

- {{domxref("Element.ariaRowCount")}}
  - : Thuộc tính [`ariaRowCount`](/en-US/docs/Web/API/Element/ariaRowCount), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-rowcount`.
- {{domxref("ElementInternals.ariaRowCount")}}
  - : Thuộc tính [`ariaRowCount`](/en-US/docs/Web/API/ElementInternals/ariaRowCount), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-rowcount`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role)

Kế thừa vào các vai trò:

- [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex)
- [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount)
