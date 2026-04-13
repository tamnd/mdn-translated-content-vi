---
title: "HTMLTableRowElement: thuộc tính align"
short-title: align
slug: Web/API/HTMLTableRowElement/align
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableRowElement.align
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`align`** của giao diện {{domxref("HTMLTableRowElement")}} là một chuỗi cho biết cách căn chỉnh văn bản theo chiều ngang trong hàng bảng {{htmlelement("tr")}}. Các ô riêng lẻ có thể ghi đè thuộc tính này.

> [!NOTE]
> Thuộc tính này đã lỗi thời và nên sử dụng CSS để căn chỉnh văn bản theo chiều ngang trong một ô. Thay vào đó, hãy sử dụng thuộc tính CSS {{cssxref("text-align")}}, thuộc tính này có độ ưu tiên cao hơn, để căn chỉnh văn bản theo chiều ngang trong một hàng.

## Giá trị

Các giá trị có thể là:

- `left`
  - : Căn chỉnh văn bản sang bên trái. Thay vào đó hãy dùng `text-align: left`.
- `right`
  - : Căn chỉnh văn bản sang bên phải. Thay vào đó hãy dùng `text-align: right`.
- `center`
  - : Căn chỉnh văn bản vào giữa ô. Thay vào đó hãy dùng `text-align: center`.
- `justify`
  - : Trải đều văn bản trên toàn ô. Thay vào đó hãy dùng `text-align: justify`.
- `char`
  - : Chưa bao giờ được hỗ trợ đầy đủ, căn chỉnh văn bản theo một ký tự cụ thể. Thay vào đó hãy dùng `text-align: <string>`, trong đó chuỗi là một ký tự duy nhất, khi được hỗ trợ.

## Ví dụ

Hãy dùng CSS `text-align` thay thế. Có thể xem [ví dụ](/en-US/docs/Web/CSS/Reference/Properties/text-align#table_alignment) trên trang {{cssxref("text-align")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-align")}}
- [Học: Tạo kiểu cho bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
