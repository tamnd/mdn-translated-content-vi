---
title: "ARIA: thuộc tính aria-rowindextext"
short-title: aria-rowindextext
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-rowindextext
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-rowindextext
sidebar: accessibilitysidebar
---

Thuộc tính `aria-rowindextext` xác định một văn bản thay thế thân thiện với con người cho `aria-rowindex`.

## Mô tả

Khi bạn có một bảng rất dài hoặc khi bạn cố ý chỉ muốn hiển thị một phần của bảng, không phải tất cả hàng đều có thể hiện diện trong DOM. Khi điều này xảy ra, chúng ta dùng [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount) với giá trị số nguyên để xác định bảng (hoặc grid) sẽ có bao nhiêu hàng nếu tất cả các hàng đều hiện diện, rồi thêm thuộc tính [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex) lên từng hàng và các ô chiếm nhiều hàng để cung cấp thông tin về chỉ số hàng trong bảng lớn hơn đó. Khi giá trị của `aria-rowindex` không có ý nghĩa hoặc không phản ánh chỉ số đang được hiển thị, chúng ta cũng có thể thêm `aria-rowindextext` để cung cấp một văn bản thay thế thân thiện với con người cho giá trị số nguyên của `aria-rowindex`.

`aria-rowindextext` chỉ nên được thêm **bổ sung**, không phải thay thế cho `aria-rowindex`. Một số công nghệ hỗ trợ dùng chỉ số hàng dạng số để theo dõi vị trí của người dùng hoặc cung cấp điều hướng bảng thay thế. `aria-rowindextext` hữu ích nếu giá trị số đó không có ý nghĩa hoặc không phản ánh chỉ số đang được hiển thị, chẳng hạn như trong một ván Cờ vua hoặc Battleship.

`aria-rowindextext` được thêm vào mỗi {{HTMLElement('tr')}} hoặc vào các phần tử có vai trò `row`. Nó cũng có thể được thêm vào các ô hoặc phần tử được sở hữu của từng hàng.

## Giá trị

- `<string>`
  - Văn bản thay thế thân thiện với con người cho giá trị số của [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex)

## Giao diện liên quan

- {{domxref("Element.ariaRowIndexText")}}
  - : Thuộc tính [`ariaRowIndexText`](/en-US/docs/Web/API/Element/ariaRowIndexText), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-rowindextext`.
- {{domxref("ElementInternals.ariaRowIndexText")}}
  - : Thuộc tính [`ariaRowIndexText`](/en-US/docs/Web/API/ElementInternals/ariaRowIndexText), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-rowindextext`.

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

- [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex)
- [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount)
- [`aria-rowspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowspan)
- [`aria-colindextext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindextext)
- [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex)
