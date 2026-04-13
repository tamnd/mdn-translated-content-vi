---
title: "HTMLTableCaptionElement: thuộc tính align"
short-title: align
slug: Web/API/HTMLTableCaptionElement/align
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableCaptionElement.align
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`align`** của giao diện {{domxref("HTMLTableCaptionElement")}} là một chuỗi cho biết cách căn chỉnh văn bản theo chiều ngang trong phần tử bảng {{htmlelement("caption")}}.

> [!NOTE]
> Thuộc tính này đã lỗi thời và nên sử dụng CSS để căn chỉnh văn bản theo chiều ngang trong một ô. Hãy sử dụng thuộc tính CSS {{cssxref("text-align")}}, thuộc tính này có độ ưu tiên cao hơn, để căn chỉnh văn bản theo chiều ngang trong ô caption thay thế.

## Giá trị

Các giá trị có thể là:

- `left`
  - : Căn chỉnh văn bản sang trái. Thay vào đó hãy dùng `text-align: left`.
- `right`
  - : Căn chỉnh văn bản sang phải. Thay vào đó hãy dùng `text-align: right`.
- `center`
  - : Căn giữa văn bản trong ô. Thay vào đó hãy dùng `text-align: center`.

## Ví dụ

Hãy sử dụng CSS `text-align`. Có [ví dụ](/en-US/docs/Web/CSS/Reference/Properties/text-align#table_alignment) trên trang {{cssxref("text-align")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-align")}}
- {{cssxref("caption-side")}}
- [Học: Tạo kiểu dáng cho bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
