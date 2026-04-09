---
title: "ARIA: thuộc tính aria-colindextext"
short-title: aria-colindextext
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-colindextext
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-colindextext
sidebar: accessibilitysidebar
---

Thuộc tính `aria-colindextext` xác định một giá trị văn bản dễ đọc cho chỉ số cột của phần tử.

## Mô tả

Thuộc tính `aria-colindextext` cung cấp cho công nghệ hỗ trợ một biểu diễn văn bản của chỉ số cột khi con số thô không đủ hữu ích cho người dùng. Nó thường được dùng cùng với [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex) để trình bày thông tin cột theo cách dễ hiểu hơn.

Ví dụ, trong một bảng có cột được đánh số bằng chữ cái hoặc tên thay vì số nguyên, `aria-colindextext` có thể cung cấp giá trị mà công nghệ hỗ trợ sẽ đọc ra cho người dùng.

Khi dùng thuộc tính này, hãy bảo đảm rằng giá trị văn bản ngắn gọn, rõ ràng và phù hợp với ngôn ngữ của tài liệu. Nó không thay thế cho `aria-colindex`; thay vào đó, nó bổ sung thêm thông tin mô tả cho chỉ số cột.

## Giá trị

- `<string>`
  - : Một chuỗi văn bản mô tả chỉ số cột theo cách dễ đọc.

## Giao diện liên quan

- {{domxref("Element.ariaColIndexText")}}
  - : Thuộc tính [`ariaColIndexText`](/en-US/docs/Web/API/Element/ariaColIndexText), là một phần của giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-colindextext`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role)
- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex)
- [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount)
