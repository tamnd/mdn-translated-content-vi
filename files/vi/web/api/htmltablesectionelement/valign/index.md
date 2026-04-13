---
title: "HTMLTableSectionElement: thuộc tính vAlign"
short-title: vAlign
slug: Web/API/HTMLTableSectionElement/vAlign
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableSectionElement.vAlign
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`vAlign`** của giao diện {{domxref("HTMLTableSectionElement")}} là một chuỗi cho biết cách căn chỉnh văn bản theo chiều dọc trong phần bảng {{htmlelement("thead")}}, {{htmlelement("tbody")}} hoặc {{htmlelement("tfoot")}}. Các hàng và ô riêng lẻ có thể ghi đè nó.

> [!NOTE]
> Thuộc tính này đã lỗi thời. Sử dụng thuộc tính CSS {{cssxref("vertical-align")}} để căn chỉnh văn bản theo chiều dọc trong các ô phần thay thế.

## Giá trị

Các giá trị có thể là: `"top"`, `"middle"`, `"bottom"` hoặc `"baseline"`

- `top`
  - : Căn chỉnh văn bản lên đầu ô. Sử dụng `vertical-align: top` thay thế.
- `center`
  - : Căn giữa văn bản theo chiều dọc trong ô. Đồng nghĩa với `middle`. Sử dụng `vertical-align: middle` thay thế.
- `middle`
  - : Căn giữa văn bản theo chiều dọc trong ô. Sử dụng `vertical-align: middle` thay thế.
- `bottom`
  - : Căn chỉnh văn bản xuống dưới ô. Sử dụng `vertical-align: bottom` thay thế.
- `baseline`
  - : Tương tự `top`, nhưng căn chỉnh đường cơ sở của văn bản gần đỉnh nhất sao cho không có phần nào của ký tự nằm ngoài ô.

## Ví dụ

Sử dụng CSS {{cssxref("vertical-align")}} thay thế, có độ ưu tiên cao hơn, như được minh họa trong ví dụ [căn chỉnh theo chiều dọc trong ô bảng](/en-US/docs/Web/CSS/Reference/Properties/vertical-align#vertical_alignment_in_a_table_cell).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("vertical-align")}}
- [Học: Định kiểu bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
