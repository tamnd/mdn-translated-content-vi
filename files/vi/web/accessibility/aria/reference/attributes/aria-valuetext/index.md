---
title: "ARIA: thuộc tính aria-valuetext"
short-title: aria-valuetext
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-valuetext
sidebar: accessibilitysidebar
---

Thuộc tính `aria-valuetext` xác định văn bản thay thế thân thiện với con người cho `aria-valuenow` của một widget dạng range.

## Mô tả

Số, kể cả phần trăm, không phải lúc nào cũng thân thiện với người dùng. Công nghệ hỗ trợ trình bày [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow) dưới dạng giá trị số. Nếu một thanh tiến trình đang ở mức 8%, điều đó có nghĩa là gì? `aria-valuetext` cung cấp cách trình bày giá trị hiện tại theo cách thân thiện hơn, dễ hiểu hơn với con người. Ví dụ, giá trị của một pin meter có thể được truyền đạt bằng `aria-valuetext="8% (34 minutes) remaining"`.

Thuộc tính `aria-valuetext` được dùng cùng với thuộc tính `aria-valuenow`, không phải thay thế nó, trừ khi giá trị đó không được biết.

`aria-valuetext` chỉ cần khi giá trị số của `aria-valuenow` không có ý nghĩa. Ví dụ, các giá trị của một range có thể là số, nhưng lại được dùng cho những giá trị không phải số, chẳng hạn cấp lớp đại học. Giá trị `aria-valuenow` của một trường đại học 4 năm có thể từ 1 đến 4, biểu thị vị trí của từng giá trị trong không gian giá trị. Trong trường hợp này, `aria-valuetext` có thể là một trong các chuỗi: "first year", "sophomore", "junior", và "senior".

Nếu giá trị số có ý nghĩa, chẳng hạn một spinner với `aria-valuenow="3"` cho biết bạn muốn gọi mấy lát pizza, thì không cần `aria-valuetext`.

Khi cả `aria-valuetext` và `aria-valuenow` đều được bao gồm, giá trị `aria-valuetext` sẽ được đọc. Khi không có thuộc tính `aria-valuetext`, công nghệ hỗ trợ sẽ đọc thuộc tính `aria-valuenow` cho giá trị hiện tại.

## Giá trị

- `<string>`
  - : Văn bản thay thế thân thiện với con người cho giá trị `aria-valuenow`.

## Giao diện liên quan

- {{domxref("Element.ariaValueText")}}
  - : Thuộc tính [`ariaValueText`](/en-US/docs/Web/API/Element/ariaValueText), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-valuetext`.
- {{domxref("ElementInternals.ariaValueText")}}
  - : Thuộc tính [`ariaValueText`](/en-US/docs/Web/API/ElementInternals/ariaValueText), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-valuetext`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`range`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/range_role)
- [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)

Kế thừa vào các vai trò:

- [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role)
- [`progressbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role)
- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow)
