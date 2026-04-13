---
title: HTMLTableSectionElement
slug: Web/API/HTMLTableSectionElement
page-type: web-api-interface
browser-compat: api.HTMLTableSectionElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLTableSectionElement`** cung cấp các thuộc tính và phương thức đặc biệt (ngoài giao diện {{domxref("HTMLElement")}} mà nó cũng có sẵn thông qua kế thừa) để thao tác bố cục và trình bày các phần, tức là header, footer và body ({{HTMLElement("thead")}}, {{HTMLElement("tfoot")}}, và {{HTMLElement("tbody")}}, tương ứng) trong bảng HTML.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha {{domxref("HTMLElement")}}._

- {{domxref("HTMLTableSectionElement.align")}} {{deprecated_inline}}
  - : Một chuỗi chứa giá trị kiểu liệt kê phản ánh thuộc tính [`align`](/en-US/docs/Web/HTML/Reference/Elements/tr#align). Nó cho biết căn chỉnh nội dung của phần tử với ngữ cảnh xung quanh. Các giá trị có thể là `"left"`, `"right"` và `"center"`.
- {{domxref("HTMLTableSectionElement.rows")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("HTMLCollection")}} trực tiếp chứa các hàng trong phần. `HTMLCollection` là trực tiếp và được cập nhật tự động khi các hàng được thêm hoặc xóa.
- {{domxref("HTMLTableSectionElement.ch")}} {{deprecated_inline}}
  - : Một chuỗi chứa một ký tự đơn. Ký tự này là ký tự để căn chỉnh tất cả các ô của một cột. Nó phản ánh [`char`](/en-US/docs/Web/HTML/Reference/Elements/tr#char) và mặc định là dấu thập phân liên kết với ngôn ngữ, ví dụ: `'.'` cho tiếng Anh hoặc `','` cho tiếng Pháp. Thuộc tính này là tùy chọn và không được hỗ trợ tốt lắm.
- {{domxref("HTMLTableSectionElement.chOff")}} {{deprecated_inline}}
  - : Một chuỗi chứa số nguyên cho biết có bao nhiêu ký tự phải để ở bên phải (đối với chữ viết từ trái sang phải; hoặc ở bên trái đối với chữ viết từ phải sang trái) của ký tự được xác định bởi `HTMLTableRowElement.ch`. Thuộc tính này là tùy chọn và không được hỗ trợ tốt lắm.
- {{domxref("HTMLTableSectionElement.vAlign")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho giá trị kiểu liệt kê cho biết nội dung của ô phải được căn chỉnh theo chiều dọc như thế nào. Nó phản ánh thuộc tính [`valign`](/en-US/docs/Web/HTML/Reference/Elements/tr#valign) và có thể có một trong các giá trị sau: `"top"`, `"middle"`, `"bottom"` hoặc `"baseline"`.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha {{domxref("HTMLElement")}}._

- {{domxref("HTMLTableSectionElement.deleteRow()")}}
  - : Xóa hàng, tương ứng với `index` đã cho trong tham số, trong phần. Nếu giá trị `index` là `-1` hàng cuối cùng sẽ bị xóa; nếu nó nhỏ hơn `-1` hoặc lớn hơn số hàng trong collection, một {{DOMxRef("DOMException")}} với giá trị `IndexSizeError` sẽ được ném.
- {{domxref("HTMLTableSectionElement.insertRow()")}}
  - : Trả về một {{DOMxRef("HTMLTableRowElement")}} đại diện cho hàng mới của phần. Nó chèn vào collection hàng ngay trước phần tử {{HTMLElement("tr")}} tại vị trí `index` đã cho. Nếu `index` là `-1`, hàng mới được thêm vào cuối collection. Nếu `index` nhỏ hơn `-1` hoặc lớn hơn số hàng trong collection, một {{DOMxRef("DOMException")}} với giá trị `IndexSizeError` sẽ được ném.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử HTML triển khai giao diện này: {{HTMLElement("tfoot")}}, {{HTMLElement("thead")}}, và {{HTMLElement("tbody")}}.
