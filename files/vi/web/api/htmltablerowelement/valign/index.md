---
title: "HTMLTableRowElement: thuộc tính vAlign"
short-title: vAlign
slug: Web/API/HTMLTableRowElement/vAlign
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableRowElement.vAlign
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`vAlign`** của giao diện {{domxref("HTMLTableRowElement")}} là một chuỗi cho biết cách căn chỉnh văn bản theo chiều dọc trong một hàng bảng {{htmlelement("tr")}}. Các ô riêng lẻ có thể ghi đè giá trị này.

> [!NOTE]
> Thuộc tính này đã lỗi thời. Hãy dùng thuộc tính CSS {{cssxref("vertical-align")}} để căn chỉnh văn bản theo chiều dọc trong một hàng thay thế.

## Giá trị

Các giá trị có thể là: `"top"`, `"middle"`, `"bottom"` hoặc `"baseline"`

- `top`
  - : Căn chỉnh văn bản về phía trên cùng của ô. Hãy dùng `vertical-align: top` thay thế.
- `center`
  - : Căn giữa văn bản theo chiều dọc trong ô. Đồng nghĩa với `middle`. Hãy dùng `vertical-align: middle` thay thế.
- `middle`
  - : Căn giữa văn bản theo chiều dọc trong ô. Hãy dùng `vertical-align: middle` thay thế.
- `bottom`
  - : Căn chỉnh văn bản về phía dưới cùng của ô. Hãy dùng `vertical-align: bottom` thay thế.
- `baseline`
  - : Tương tự `top`, nhưng căn chỉnh đường cơ sở của văn bản sao cho không có phần nào của ký tự nằm ngoài ô.

## Ví dụ

Hãy dùng CSS {{cssxref("vertical-align")}} thay thế, vì nó có độ ưu tiên cao hơn, như được minh họa trong ví dụ [căn chỉnh dọc trong ô bảng](/en-US/docs/Web/CSS/Reference/Properties/vertical-align#vertical_alignment_in_a_table_cell).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("vertical-align")}}
- [Học: Tạo kiểu cho bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
