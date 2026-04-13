---
title: "HTMLTableColElement: thuộc tính align"
short-title: align
slug: Web/API/HTMLTableColElement/align
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableColElement.align
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`align`** của giao diện {{domxref("HTMLTableColElement")}} là một chuỗi cho biết cách căn chỉnh ngang văn bản trong phần tử cột bảng {{htmlelement("col")}}.

> [!NOTE]
> Thuộc tính này đã lỗi thời và CSS nên được dùng để căn chỉnh văn bản theo chiều ngang trong cột. Dùng thuộc tính CSS {{cssxref("text-align")}}, có độ ưu tiên cao hơn, để căn chỉnh văn bản theo chiều ngang trong cột thay thế.
>
> Vì {{htmlelement("td")}} không phải là con của {{htmlelement("col")}}, bạn không thể đặt trực tiếp trên phần tử {{HTMLElement("col")}}, bạn cần chọn các ô của cột bằng `td:nth-last-child(n)` hoặc tương tự (`n` là số cột, đếm từ cuối).

## Giá trị

Các giá trị có thể là:

- `left`
  - : Căn chỉnh văn bản sang trái. Dùng `text-align: left` áp dụng trực tiếp cho {{HTMLElement("td")}} hoặc {{HTMLElement("th")}} thay thế.
- `right`
  - : Căn chỉnh văn bản sang phải. Dùng `text-align: right` áp dụng trực tiếp cho `<td>` hoặc `<th>` thay thế.
- `center`
  - : Căn giữa văn bản trong ô. Dùng `text-align: center` thay thế.

## Ví dụ

Dùng CSS `text-align` trên các phần tử {{htmlelement("td")}} và {{htmlelement("th")}}. Vì các phần tử {{htmlelement("td")}} của một cột không phải là con của {{htmlelement("col")}}, việc đặt thuộc tính `align` trong HTML hoặc thuộc tính `text-align` trong CSS trên phần tử {{HTMLElement("col")}} sẽ không có hiệu lực. Thay vào đó, hãy chọn các ô của cột bằng [`:is(td, tr):nth-child(n)`](/en-US/docs/Web/CSS/Reference/Selectors/:nth-child), trong đó `n` là số cột, hoặc tương tự.

Có sẵn [ví dụ](/en-US/docs/Web/CSS/Reference/Selectors/:nth-child#styling_a_table_column) trên trang {{cssxref(":nth-child()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-align")}}
- {{cssxref(":nth-child()")}}
- {{cssxref(":nth-last-child()")}}
- [Tìm hiểu: Tạo kiểu bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
