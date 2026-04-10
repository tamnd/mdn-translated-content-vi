---
title: "HTMLTableCellElement: thuộc tính vAlign"
short-title: vAlign
slug: Web/API/HTMLTableCellElement/vAlign
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLTableCellElement.vAlign
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`vAlign`** của giao diện {{domxref("HTMLTableCellElement")}} là một chuỗi cho biết cách căn chỉnh văn bản theo chiều dọc trong một ô bảng {{htmlelement("th")}} hoặc {{htmlelement("td")}}.

> [!NOTE]
> Thuộc tính này đã lỗi thời. Sử dụng thuộc tính CSS {{cssxref("vertical-align")}} để căn chỉnh văn bản theo chiều dọc trong ô thay thế.

## Giá trị

Các giá trị có thể có là: `"top"`, `"middle"`, `"bottom"`, hoặc `"baseline"`

- `top`
  - : Căn chỉnh văn bản lên đầu ô. Thay vào đó, sử dụng `vertical-align: top`.
- `center`
  - : Căn giữa văn bản theo chiều dọc trong ô. Từ đồng nghĩa với `middle`. Thay vào đó, sử dụng `vertical-align: middle`.
- `middle`
  - : Căn giữa văn bản theo chiều dọc trong ô. Thay vào đó, sử dụng `vertical-align: middle`.
- `bottom`
  - : Căn chỉnh văn bản xuống đáy ô. Thay vào đó, sử dụng `vertical-align: bottom`.
- `baseline`
  - : Tương tự như `top`, nhưng căn chỉnh đường cơ sở của văn bản càng gần đầu càng tốt để không có phần nào của ký tự nằm ngoài ô.

## Ví dụ

Thay vào đó, sử dụng CSS {{cssxref("vertical-align")}}, thuộc tính này được ưu tiên hơn, như được minh họa trong ví dụ [căn chỉnh dọc trong ô bảng](/en-US/docs/Web/CSS/Reference/Properties/vertical-align#vertical_alignment_in_a_table_cell).

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("vertical-align")}}
- [Learn: Tạo kiểu bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
