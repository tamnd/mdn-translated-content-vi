---
title: "HTMLTableCellElement: thuộc tính bgColor"
short-title: bgColor
slug: Web/API/HTMLTableCellElement/bgColor
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableCellElement.bgColor
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`HTMLTableCellElement.bgColor`** được sử dụng để đặt màu nền của một ô hoặc lấy giá trị của thuộc tính [`bgColor`](/en-US/docs/Web/HTML/Reference/Elements/td#bgcolor) đã lỗi thời, nếu có.

> [!NOTE]
> Thuộc tính này đã lỗi thời và CSS nên được sử dụng để đặt màu nền. Thay vào đó, hãy sử dụng thuộc tính {{cssxref("background-color")}}.

## Giá trị

Một trong các loại giá trị sau có thể được sử dụng:

- một màu có tên, như `red` hoặc `blue`
- một mã hex, như `#0000dd` hoặc `#00d`

> [!NOTE]
> Các giá trị được chấp nhận ở đây là một tập hợp con giới hạn của các giá trị màu CSS. Chỉ {{cssxref("named-color")}} và {{cssxref("hex-color")}} 3 hoặc 6 chữ số (không có kênh alpha). Mặc dù tất cả các giá trị màu HTML hợp lệ trong CSS, nhưng điều này không đúng theo hướng ngược lại.

## Ví dụ

Thay vào đó, sử dụng CSS `background-color`. Một ví dụ về việc sử dụng [`background-color` với các phần tử bảng HTML](/en-US/docs/Web/CSS/Reference/Properties/background-color#colorize_tables) có sẵn trên trang {{cssxref("background-color")}}.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTableRowElement.bgColor")}}
