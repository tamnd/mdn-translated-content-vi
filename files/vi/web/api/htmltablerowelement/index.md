---
title: HTMLTableRowElement
slug: Web/API/HTMLTableRowElement
page-type: web-api-interface
browser-compat: api.HTMLTableRowElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLTableRowElement`** cung cấp các thuộc tính và phương thức đặc biệt (ngoài giao diện {{domxref("HTMLElement")}} mà nó cũng có thể truy cập thông qua kế thừa) để thao tác bố cục và trình bày của các hàng trong bảng HTML.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLTableRowElement.cells")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("HTMLCollection")}} trực tiếp chứa các ô trong hàng. `HTMLCollection` này là trực tiếp và được cập nhật tự động khi các ô được thêm hoặc xóa.
- {{domxref("HTMLTableRowElement.rowIndex")}} {{ReadOnlyInline}}
  - : Trả về một số cho biết vị trí logic của hàng trong toàn bộ bảng. Nếu hàng không thuộc bảng nào, trả về `-1`.
- {{domxref("HTMLTableRowElement.sectionRowIndex")}} {{ReadOnlyInline}}
  - : Trả về một số cho biết vị trí logic của hàng trong phần bảng mà nó thuộc về. Nếu hàng không thuộc phần nào, trả về `-1`.

## Phương thức phiên bản

_Kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}_.

- {{domxref("HTMLTableRowElement.deleteCell()")}}
  - : Xóa ô tương ứng với `index`. Nếu `index` là `-1`, ô cuối cùng của hàng sẽ bị xóa. Nếu `index` nhỏ hơn `-1` hoặc lớn hơn số lượng ô trong bộ sưu tập, một {{DOMxRef("DOMException")}} với giá trị `IndexSizeError` sẽ được ném ra.
- {{domxref("HTMLTableRowElement.insertCell()")}}
  - : Trả về một {{domxref("HTMLTableCellElement")}} đại diện cho một ô mới của hàng. Ô được chèn vào bộ sưu tập các ô ngay trước vị trí `index` đã cho trong hàng. Nếu `index` là `-1`, ô mới được thêm vào cuối bộ sưu tập. Nếu `index` nhỏ hơn `-1` hoặc lớn hơn số ô trong bộ sưu tập, một {{DOMxRef("DOMException")}} với giá trị `IndexSizeError` sẽ được ném ra.

## Thuộc tính đã lỗi thời

> [!WARNING]
> Các thuộc tính này đã lỗi thời và không nên được sử dụng nữa. Chúng được ghi lại chủ yếu để giúp hiểu các cơ sở mã cũ hơn.

- {{domxref("HTMLTableRowElement.align")}} {{deprecated_inline}}
  - : Một chuỗi chứa giá trị liệt kê phản ánh thuộc tính [`align`](/en-US/docs/Web/HTML/Reference/Elements/tr#align). Nó cho biết căn chỉnh nội dung của phần tử với ngữ cảnh xung quanh. Các giá trị có thể là `"left"`, `"right"` và `"center"`.
- {{domxref("HTMLTableRowElement.bgColor")}} {{deprecated_inline}}
  - : Một chuỗi chứa màu nền của các ô. Nó phản ánh thuộc tính lỗi thời [`bgColor`](/en-US/docs/Web/HTML/Reference/Elements/tr#bgcolor).
- {{domxref("HTMLTableRowElement.ch")}} {{deprecated_inline}}
  - : Một chuỗi chứa một ký tự duy nhất. Ký tự này là ký tự để căn chỉnh tất cả các ô của một cột. Nó phản ánh thuộc tính [`char`](/en-US/docs/Web/HTML/Reference/Elements/tr#char) và mặc định là dấu thập phân liên quan đến ngôn ngữ, ví dụ: `'.'` cho tiếng Anh, hoặc `','` cho tiếng Pháp. Thuộc tính này là tùy chọn và không được hỗ trợ tốt.
- {{domxref("HTMLTableRowElement.chOff")}} {{deprecated_inline}}
  - : Một chuỗi chứa số nguyên cho biết bao nhiêu ký tự phải được để lại ở bên phải (đối với ngôn ngữ viết từ trái sang phải; hoặc bên trái đối với ngôn ngữ viết từ phải sang trái) của ký tự được xác định bởi `HTMLTableRowElement.ch`. Thuộc tính này là tùy chọn và không được hỗ trợ tốt.
- {{domxref("HTMLTableRowElement.vAlign")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho giá trị liệt kê cho biết cách nội dung ô phải được căn chỉnh theo chiều dọc. Nó phản ánh thuộc tính [`valign`](/en-US/docs/Web/HTML/Reference/Elements/tr#valign) và có thể có một trong các giá trị sau: `"top"`, `"middle"`, `"bottom"` hoặc `"baseline"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("tr")}}.
