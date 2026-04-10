---
title: HTMLTableCellElement
slug: Web/API/HTMLTableCellElement
page-type: web-api-interface
browser-compat: api.HTMLTableCellElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLTableCellElement`** cung cấp các thuộc tính và phương thức đặc biệt (bên ngoài giao diện {{domxref("HTMLElement")}} thông thường mà nó kế thừa) để thao tác bố cục và cách trình bày của các ô bảng, bao gồm cả ô tiêu đề ({{HTMLElement("th")}}) hoặc ô dữ liệu ({{HTMLElement("td")}}), trong tài liệu HTML.

{{InheritanceDiagram}}

## Thuộc tính instance

_Kế thừa thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLTableCellElement.abbr")}}
  - : Một chuỗi có thể được sử dụng trên các phần tử `<th>` (không dùng cho {{HTMLElement("td")}}), chỉ định một nhãn thay thế cho ô tiêu đề. Nhãn thay thế này có thể được sử dụng trong các ngữ cảnh khác, chẳng hạn như khi mô tả các tiêu đề áp dụng cho một ô dữ liệu. Thuộc tính này được sử dụng để cung cấp một thuật ngữ ngắn hơn đặc biệt hữu ích cho trình đọc màn hình; và là một công cụ hỗ trợ khả năng tiếp cận giá trị. Thông thường, giá trị của `abbr` là một từ viết tắt hoặc chữ viết tắt, nhưng có thể là bất kỳ văn bản nào phù hợp với ngữ cảnh.
- {{domxref("HTMLTableCellElement.cellIndex")}} {{ReadOnlyInline}}
  - : Một số đại diện cho vị trí của ô trong tập hợp {{domxref("HTMLTableRowElement.cells", "cells")}} của {{HTMLElement("tr")}} chứa ô đó. Nếu ô không thuộc về một `<tr>`, nó trả về `-1`.
- {{domxref("HTMLTableCellElement.colSpan")}}
  - : Một số dương cho biết số cột mà ô này phải trải rộng; điều này cho phép ô chiếm không gian trên nhiều cột của bảng. Nó phản ánh thuộc tính [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan).
- {{domxref("HTMLTableCellElement.headers")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMTokenList")}} mô tả danh sách `id` của các phần tử {{HTMLElement("th")}} đại diện cho các tiêu đề liên kết với ô. Nó phản ánh thuộc tính [`headers`](/en-US/docs/Web/HTML/Reference/Elements/td#headers).
- {{domxref("HTMLTableCellElement.rowSpan")}}
  - : Một số dương cho biết số hàng mà ô này phải trải rộng; điều này cho phép một ô chiếm không gian trên nhiều hàng của bảng. Nó phản ánh thuộc tính [`rowspan`](/en-US/docs/Web/HTML/Reference/Elements/td#rowspan).
- {{domxref("HTMLTableCellElement.scope")}}
  - : Một chuỗi cho biết phạm vi của một ô {{HTMLElement("th")}}. Các giá trị có thể có cho `scope` là: `col`, `colgroup`, `row`, `rowgroup`, hoặc chuỗi rỗng (`""`).

## Phương thức instance

_Không có phương thức cụ thể; kế thừa phương thức từ phần tử cha, {{domxref("HTMLElement")}}_.

## Thuộc tính đã lỗi thời

> [!WARNING]
> Các thuộc tính này đã lỗi thời và không nên được sử dụng nữa. Chúng được ghi chép chủ yếu để hỗ trợ hiểu các cơ sở mã cũ.

- {{domxref("HTMLTableCellElement.align")}} {{deprecated_inline}}
  - : Một chuỗi chứa giá trị của thuộc tính [`align`](/en-US/docs/Web/HTML/Reference/Elements/td#align), nếu có, hoặc chuỗi rỗng nếu không được đặt. Nó có thể được sử dụng để đặt căn chỉnh nội dung của phần tử theo ngữ cảnh xung quanh với các giá trị `"left"`, `"right"`, và `"center"`. Thay vào đó, hãy sử dụng thuộc tính CSS {{cssxref("text-align")}}.
- {{domxref("HTMLTableCellElement.axis")}} {{deprecated_inline}}
  - : Một chuỗi chứa tên nhóm các ô trong ảo. Nó phản ánh thuộc tính [`axis`](/en-US/docs/Web/HTML/Reference/Elements/td#axis) đã lỗi thời.
- {{domxref("HTMLTableCellElement.bgColor")}} {{deprecated_inline}}
  - : Một chuỗi chứa màu nền của ô. Nó phản ánh thuộc tính [`bgColor`](/en-US/docs/Web/HTML/Reference/Elements/td#bgcolor) đã lỗi thời.
- {{domxref("HTMLTableCellElement.ch")}} {{deprecated_inline}}
  - : Một chuỗi chứa một ký tự đơn. Ký tự này là ký tự để căn chỉnh tất cả các ô của một cột. Nó phản ánh thuộc tính [`char`](/en-US/docs/Web/HTML/Reference/Elements/td#char) và mặc định là dấu thập phân liên quan đến ngôn ngữ, ví dụ: `'.'` cho tiếng Anh, hoặc `','` cho tiếng Pháp. Thuộc tính này là tùy chọn và không được hỗ trợ rộng rãi.
- {{domxref("HTMLTableCellElement.chOff")}} {{deprecated_inline}}
  - : Một chuỗi chứa một số nguyên cho biết số ký tự phải để ở bên phải (đối với các kịch bản từ trái sang phải; hoặc ở bên trái đối với các kịch bản từ phải sang trái) của ký tự được xác định bởi `HTMLTableCellElement.ch`. Thuộc tính này là tùy chọn và không được hỗ trợ rộng rãi.
- {{domxref("HTMLTableCellElement.height")}} {{deprecated_inline}}
  - : Một chuỗi chứa độ dài pixel của chiều cao gợi ý của ô. Nó phản ánh thuộc tính [`height`](/en-US/docs/Web/HTML/Reference/Elements/td#height) đã lỗi thời.
- {{domxref("HTMLTableCellElement.noWrap")}} {{deprecated_inline}}
  - : Một giá trị kiểu logic phản ánh thuộc tính `nowrap` và cho biết liệu nội dung ô có thể được ngắt thành nhiều dòng hay không.
- {{domxref("HTMLTableCellElement.vAlign")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho một giá trị liệt kê cho biết cách nội dung của ô phải được căn chỉnh theo chiều dọc. Nó phản ánh thuộc tính [`valign`](/en-US/docs/Web/HTML/Reference/Elements/td#valign) và có thể có một trong các giá trị sau: `"top"`, `"middle"`, `"bottom"`, hoặc `"baseline"`. Thay vào đó, hãy sử dụng thuộc tính CSS {{cssxref("vertical-align")}}.
- {{domxref("HTMLTableCellElement.width")}} {{deprecated_inline}}
  - : Một chuỗi chỉ định số pixel chiều rộng mà ô nên được vẽ, nếu có thể. Thuộc tính này phản ánh thuộc tính [`width`](/en-US/docs/Web/HTML/Reference/Elements/td#width) cũng đã lỗi thời. Thay vào đó, hãy sử dụng thuộc tính CSS {{cssxref("width")}}.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử HTML triển khai giao diện này: {{HTMLElement("th")}} và {{HTMLElement("td")}}.
