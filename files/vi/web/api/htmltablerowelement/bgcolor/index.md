---
title: "HTMLTableRowElement: thuộc tính bgColor"
short-title: bgColor
slug: Web/API/HTMLTableRowElement/bgColor
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableRowElement.bgColor
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`HTMLTableRowElement.bgColor`** được dùng để đặt màu nền của một hàng hoặc lấy giá trị của thuộc tính lỗi thời [`bgColor`](/en-US/docs/Web/HTML/Reference/Elements/tr#bgcolor), nếu có.

> [!NOTE]
> Thuộc tính này đã lỗi thời và nên dùng CSS để đặt màu nền thay thế. Hãy dùng thuộc tính {{cssxref("background-color")}} thay thế.

## Giá trị

Có thể sử dụng một trong các loại giá trị sau:

- tên màu, ví dụ `red` hoặc `blue`
- mã hex, ví dụ `#0000dd`

> [!NOTE]
> Các giá trị được chấp nhận ở đây là một tập con của các giá trị màu CSS. Bạn có thể tái sử dụng các giá trị màu HTML trong CSS, nhưng không theo chiều ngược lại: các màu không xác định sẽ hiển thị khác với mong đợi.

## Ví dụ

Hãy dùng `background-color` của CSS thay thế. Một [ví dụ](/en-US/docs/Web/CSS/Reference/Properties/background-color#colorize_tables) có sẵn trên trang {{cssxref("background-color")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTableCellElement.bgColor")}}
