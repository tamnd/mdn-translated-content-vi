---
title: "HTMLTableColElement: thuộc tính vAlign"
short-title: vAlign
slug: Web/API/HTMLTableColElement/vAlign
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableColElement.vAlign
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`vAlign`** của giao diện {{domxref("HTMLTableColElement")}} là một chuỗi cho biết cách căn chỉnh văn bản theo chiều dọc trong phần tử cột bảng {{htmlelement("col")}}.

> [!NOTE]
> Thuộc tính này đã lỗi thời và nên sử dụng CSS để căn chỉnh văn bản theo chiều dọc trong một cột. Hãy sử dụng thuộc tính CSS {{cssxref("vertical-align")}}, thuộc tính này có độ ưu tiên cao hơn, để căn chỉnh văn bản theo chiều dọc trong mỗi ô của cột thay thế.
>
> Vì {{htmlelement("td")}} không phải là con của {{htmlelement("col")}}, bạn không thể đặt trực tiếp trên phần tử {{HTMLElement("col")}}, bạn cần chọn các ô của cột bằng `td:nth-child(n)` hoặc tương tự (`n` là số cột).

## Giá trị

Các giá trị có thể là: `"top"`, `"middle"`, `"bottom"` hoặc `"baseline"`

- `top`
  - : Căn chỉnh văn bản lên đầu cột. Thay vào đó hãy dùng `vertical-align: top`.
- `center`
  - : Căn giữa văn bản theo chiều dọc trong cột. Đồng nghĩa với `middle`. Thay vào đó hãy dùng `vertical-align: middle`.
- `middle`
  - : Căn giữa văn bản theo chiều dọc trong cột. Thay vào đó hãy dùng `vertical-align: middle`.
- `bottom`
  - : Căn chỉnh văn bản xuống đáy cột. Thay vào đó hãy dùng `vertical-align: bottom`.
- `baseline`
  - : Tương tự `top`, nhưng căn chỉnh baseline của văn bản gần lên đầu nhất sao cho không có phần nào của ký tự nằm ngoài ô.

## Ví dụ

Hãy sử dụng CSS `vertical-align`. Vì các phần tử {{htmlelement("td")}} của một cột không phải là con của {{htmlelement("col")}}, bạn không thể đặt trực tiếp trên {{HTMLElement("col")}}, bạn cần chọn các ô bằng `td:nth-child(n)` hoặc tương tự (`n` là số cột).

Có [ví dụ](/en-US/docs/Web/CSS/Reference/Selectors/:nth-child#styling_a_table_column) trên trang {{cssxref(":nth-child()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("vertical-align")}}
- {{cssxref(":nth-child()")}}
- [Học: Tạo kiểu dáng cho bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
