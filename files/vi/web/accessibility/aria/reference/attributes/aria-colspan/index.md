---
title: "ARIA: thuộc tính aria-colspan"
short-title: aria-colspan
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-colspan
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-colspan
sidebar: accessibilitysidebar
---

Thuộc tính `aria-colspan` định nghĩa số cột mà một ô hoặc gridcell chiếm trong một table, grid, hoặc treegrid.

## Mô tả

Các phần tử {{HTMLElement('td')}} và {{HTMLElement('th')}} của HTML đã có thuộc tính [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#attributes). Khi dùng {{HTMLElement('table')}} ngữ nghĩa, hãy dùng thuộc tính `colspan` gốc như được thiết kế. Thuộc tính ARIA này nhằm cho các ô và gridcell không nằm trong một bảng gốc, và sẽ bị bỏ qua nếu được dùng trên một ô trong {{HTMLElement('table')}}.

> [!NOTE]
> Quy tắc đầu tiên khi dùng ARIA là nếu bạn có thể dùng một tính năng gốc có sẵn ngữ nghĩa và hành vi mà bạn cần, thay vì tái sử dụng một phần tử rồi **thêm** một vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có trợ năng, thì hãy làm như vậy. Hãy dùng các phần tử {{HTMLelement('table')}} của HTML, bao gồm {{HTMLelement('td')}} và {{HTMLelement('th')}}, với thuộc tính `colspan` thay vì các phần tử không ngữ nghĩa có vai trò và thuộc tính ARIA bất cứ khi nào có thể.

Giá trị của `aria-colspan` nên là một số nguyên dương. Giá trị mặc định hoặc được ngầm hiểu của phạm vi ô là 1. Hãy bảo đảm giá trị được đưa vào không làm cho ô hoặc gridcell chồng lên ô hoặc gridcell tiếp theo trong cùng một hàng và không làm cho ô vượt ra ngoài bảng, grid, hoặc treegrid chứa nó.

## Ví dụ

Ví dụ sau là một phần của bảng tính điểm cho giải bowling. Mỗi game kéo dài 10 frame, và mỗi frame gồm 3 điểm: hai lần ném bóng và tổng hiện tại. Frame thứ 10 (và cuối cùng) trong mỗi game chiếm 4 cột trong trường hợp người chơi ghi được toàn strike.

```html
<div role="grid" aria-rowcount="27">
  aria-label="Điểm giải bowling"
  <div role="rowgroup">
    <div role="row" aria-rowindex="1">
      <!--
            aria-rowspan và aria-colspan cung cấp
            cho công nghệ hỗ trợ thông tin tiêu đề ô dữ liệu chính xác
            khi các ô tiêu đề chiếm nhiều hơn một hàng hoặc một cột.
          -->

      <span role="columnheader" aria-rowspan="2">Đội</span>
      <span role="columnheader" aria-colspan="2">Người chơi</span>
      <span role="columnheader" aria-colspan="31">Ván 1 - frame</span>
      <span role="columnheader" aria-colspan="31">Ván 2 - frame</span>
      <span role="columnheader" aria-colspan="31">Ván 3 - frame</span>
      <span role="columnheader" aria-rowspan="2">Tổng</span>
    </div>
    <div role="row" aria-rowindex="2">
      <span role="columnheader">Họ</span>
      <span role="columnheader">Tên</span>
      <span role="columnheader" aria-colspan="3">1</span>
      <span role="columnheader" aria-colspan="3">2</span>
      <span role="columnheader" aria-colspan="3">3</span>
      <span role="columnheader" aria-colspan="3">4</span>
      <span role="columnheader" aria-colspan="3">5</span>
      <span role="columnheader" aria-colspan="3">6</span>
      <span role="columnheader" aria-colspan="3">7</span>
      <span role="columnheader" aria-colspan="3">8</span>
      <span role="columnheader" aria-colspan="3">9</span>
      <span role="columnheader" aria-colspan="4">10</span>
      <span role="columnheader" aria-colspan="3">1</span>
      <span role="columnheader" aria-colspan="3">2</span>
      <span role="columnheader" aria-colspan="3">3</span>
      <span role="columnheader" aria-colspan="3">4</span>
      <span role="columnheader" aria-colspan="3">5</span>
      <span role="columnheader" aria-colspan="3">6</span>
      <span role="columnheader" aria-colspan="3">7</span>
      <span role="columnheader" aria-colspan="3">8</span>
      <span role="columnheader" aria-colspan="3">9</span>
      <span role="columnheader" aria-colspan="4">10</span>
      <span role="columnheader" aria-colspan="3">1</span>
      <span role="columnheader" aria-colspan="3">2</span>
      <span role="columnheader" aria-colspan="3">3</span>
      <span role="columnheader" aria-colspan="3">4</span>
      <span role="columnheader" aria-colspan="3">5</span>
      <span role="columnheader" aria-colspan="3">6</span>
      <span role="columnheader" aria-colspan="3">7</span>
      <span role="columnheader" aria-colspan="3">8</span>
      <span role="columnheader" aria-colspan="3">9</span>
      <span role="columnheader" aria-colspan="4">10</span>
    </div>
  </div>
  <div role="rowgroup">
    <div role="row" aria-rowindex="10">
      <span role="rowheader" aria-rowspan="3">The Mighty Quokkas</span>
      <span role="cell">Henderson</span>
      <span role="cell">Alice</span>
      <span role="cell">7</span>
      <span role="cell">/</span>
      <span role="cell">20</span>
      <span role="cell" aria-colspan="2">X</span>
      <span role="cell">39</span>
      <span role="cell">9</span>
      <span role="cell">-</span>
      <span role="cell">48</span>
      <span role="cell" aria-colspan="2">X</span>
      <span role="cell">76</span>
      <span role="cell" aria-colspan="2">X</span>
      <span role="cell">96</span>
      <span role="cell">8</span>
      <span role="cell">/</span>
      <span role="cell">113</span>
      <span role="cell">7</span>
      <span role="cell">-</span>
      <span role="cell">120</span>
      <span role="cell" aria-colspan="2">X</span>
      <span role="cell">146</span>
      <span role="cell" aria-colspan="2">X</span>
      <span role="cell">166</span>
      <span role="cell">6</span>
      <span role="cell">/</span>
      <span role="cell">X</span>
      <span role="cell">186</span>
      <span role="cell">7</span>
      <span role="cell">2</span>
      <span role="cell">9</span>
      <span role="cell">6</span>
      <span role="cell">-</span>
      <span role="cell">15</span>
      <span role="cell" aria-colspan="2">X</span>
      <span role="cell">35</span>
      <span role="cell">7</span>
      <span role="cell">/</span>
      …
    </div>
    <div role="row" aria-rowindex="11">
      <span role="cell">McPherson</span>
      <span role="cell">Leslie</span>
      <span role="cell">9</span>
      <span role="cell">-</span>
      <span role="cell">9</span>
      <span role="cell">8</span>
      <span role="cell">1</span>
      <span role="cell">18</span>
      …
    </div>
  </div>
</div>
```

Nếu chúng ta dùng một {{HTMLElement('table')}} và các phần tử bảng ngữ nghĩa, markup của chúng ta sẽ ít dài dòng hơn và mặc định đã có thể tiếp cận.

## Giá trị

- `<integer>`
  - : Một số nguyên dương bằng hoặc lớn hơn giá trị mặc định là 1, xác định số cột mà ô chiếm. Giá trị phải nhỏ hơn mức khiến một ô chồng lên ô tiếp theo trong cùng hàng.

## Giao diện liên quan

- {{domxref("Element.ariaColSpan")}}
  - : Thuộc tính [`ariaColSpan`](/en-US/docs/Web/API/Element/ariaColSpan), là một phần của giao diện của mỗi phần tử, phản ánh giá trị của thuộc tính `aria-colspan`, vốn định nghĩa số cột mà một ô hoặc gridcell chiếm trong một table, grid, hoặc treegrid.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role)

Kế thừa vào các vai trò:

- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)

## Đặc tả

{{Specifications}}

## Xem thêm

- Thuộc tính `colspan` của {{HTMLElement('th')}} và {{HTMLElement('td')}} [/en-US/docs/Web/HTML/Reference/Elements/td#attributes)
- thuộc tính [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex)
- thuộc tính [`aria-rowspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowspan)
- vai trò [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role)
- vai trò [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- vai trò [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
