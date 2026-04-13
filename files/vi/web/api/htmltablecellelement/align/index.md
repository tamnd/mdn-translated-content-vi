---
title: "HTMLTableCellElement: thuộc tính align"
short-title: align
slug: Web/API/HTMLTableCellElement/align
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableCellElement.align
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`align`** của giao diện {{domxref("HTMLTableCellElement")}} là một chuỗi cho biết cách căn chỉnh văn bản theo chiều ngang trong ô bảng {{htmlelement("th")}} hoặc {{htmlelement("td")}}.

> [!NOTE]
> Thuộc tính này đã lỗi thời và CSS nên được sử dụng để căn chỉnh văn bản theo chiều ngang trong ô. Sử dụng thuộc tính CSS {{cssxref("text-align")}}, thuộc tính này được ưu tiên hơn, để căn chỉnh văn bản theo chiều ngang trong ô.

## Giá trị

Các giá trị có thể có là:

- `left`
  - : Căn chỉnh văn bản sang trái. Thay vào đó, sử dụng `text-align: left`.
- `right`
  - : Căn chỉnh văn bản sang phải. Thay vào đó, sử dụng `text-align: right`.
- `center`
  - : Căn giữa văn bản trong ô. Thay vào đó, sử dụng `text-align: center`.

## Ví dụ

Thay vào đó, sử dụng CSS `text-align`. Một [ví dụ](/en-US/docs/Web/CSS/Reference/Properties/text-align#table_alignment) có sẵn trên trang {{cssxref("text-align")}}.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-align")}}
- [Learn: Tạo kiểu bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
