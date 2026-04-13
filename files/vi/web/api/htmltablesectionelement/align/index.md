---
title: "HTMLTableSectionElement: thuộc tính align"
short-title: align
slug: Web/API/HTMLTableSectionElement/align
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableSectionElement.align
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`align`** của giao diện {{domxref("HTMLTableSectionElement")}} là một chuỗi cho biết cách căn chỉnh văn bản theo chiều ngang trong phần bảng {{htmlelement("thead")}}, {{htmlelement("tbody")}} hoặc {{htmlelement("tfoot")}}. Các hàng và ô riêng lẻ có thể ghi đè nó.

> [!NOTE]
> Thuộc tính này đã lỗi thời, và nên sử dụng CSS để căn chỉnh văn bản theo chiều ngang trong ô. Hãy sử dụng thuộc tính CSS {{cssxref("text-align")}}, có độ ưu tiên cao hơn, để căn chỉnh văn bản theo chiều ngang trong các ô phần thay thế.

## Giá trị

Các giá trị có thể là:

- `left`
  - : Căn chỉnh văn bản sang trái. Sử dụng `text-align: left` thay thế.
- `right`
  - : Căn chỉnh văn bản sang phải. Sử dụng `text-align: right` thay thế.
- `center`
  - : Căn giữa văn bản trong ô. Sử dụng `text-align: center` thay thế.

## Ví dụ

Sử dụng CSS `text-align` thay thế. Có [ví dụ](/en-US/docs/Web/CSS/Reference/Properties/text-align#table_alignment) trên trang {{cssxref("text-align")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-align")}}
- [Học: Định kiểu bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
