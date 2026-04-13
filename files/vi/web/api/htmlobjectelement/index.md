---
title: HTMLObjectElement
slug: Web/API/HTMLObjectElement
page-type: web-api-interface
browser-compat: api.HTMLObjectElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLObjectElement`** cung cấp các thuộc tính và phương thức đặc biệt (ngoài các thuộc tính và phương thức của giao diện {{domxref("HTMLElement")}} mà nó kế thừa) để thao tác bố cục và trình bày phần tử {{HTMLElement("object")}}, đại diện cho các tài nguyên bên ngoài.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha của nó, {{domxref("HTMLElement")}}._

- {{domxref("HTMLObjectElement.align")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho một thuộc tính được liệt kê cho biết căn chỉnh nội dung của phần tử so với ngữ cảnh xung quanh. Các giá trị có thể là `"left"`, `"right"`, `"justify"`, và `"center"`.
- {{domxref("HTMLObjectElement.archive")}} {{deprecated_inline}}
  - : Một chuỗi phản ánh thuộc tính HTML [`archive`](/en-US/docs/Web/HTML/Reference/Elements/object#archive), chứa danh sách lưu trữ cho các tài nguyên của đối tượng này.
- {{domxref("HTMLObjectElement.border")}} {{deprecated_inline}}
  - : Một chuỗi phản ánh thuộc tính HTML [`border`](/en-US/docs/Web/HTML/Reference/Elements/object#border), chỉ định độ rộng của đường viền xung quanh đối tượng.
- {{domxref("HTMLObjectElement.code")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho tên tệp lớp applet, chứa lớp con của applet, hoặc đường dẫn đến lớp đó, bao gồm cả tệp lớp.
- {{domxref("HTMLObjectElement.codeBase")}} {{deprecated_inline}}
  - : Một chuỗi phản ánh thuộc tính HTML [`codebase`](/en-US/docs/Web/HTML/Reference/Elements/object#codebase), chỉ định đường dẫn cơ sở để phân giải các URI tương đối.
- {{domxref("HTMLObjectElement.codeType")}} {{deprecated_inline}}
  - : Một chuỗi phản ánh thuộc tính HTML [`codetype`](/en-US/docs/Web/HTML/Reference/Elements/object#codetype), chỉ định loại nội dung của dữ liệu.
- {{domxref("HTMLObjectElement.contentDocument")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("Document")}} đại diện cho tài liệu đang hoạt động của ngữ cảnh duyệt lồng nhau của phần tử đối tượng, nếu có; nếu không thì `null`.
- {{domxref("HTMLObjectElement.contentWindow")}} {{ReadOnlyInline}}
  - : Trả về một {{glossary("WindowProxy")}} đại diện cho window proxy của ngữ cảnh duyệt lồng nhau của phần tử đối tượng, nếu có; nếu không thì `null`.
- {{domxref("HTMLObjectElement.data")}}
  - : Trả về một chuỗi phản ánh thuộc tính HTML [`data`](/en-US/docs/Web/HTML/Reference/Elements/object#data), chỉ định địa chỉ dữ liệu của tài nguyên.
- {{domxref("HTMLObjectElement.declare")}} {{deprecated_inline}}
  - : Một giá trị boolean phản ánh thuộc tính HTML [`declare`](/en-US/docs/Web/HTML/Reference/Elements/object#declare), cho biết đây là khai báo, không phải khởi tạo đối tượng.
- {{domxref("HTMLObjectElement.form")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("HTMLFormElement")}} đại diện cho form owner của phần tử đối tượng, hoặc null nếu không có form nào.
- {{domxref("HTMLObjectElement.height")}}
  - : Trả về một chuỗi phản ánh thuộc tính HTML [`height`](/en-US/docs/Web/HTML/Reference/Elements/object#height), chỉ định chiều cao hiển thị của tài nguyên tính bằng pixel CSS.
- {{domxref("HTMLObjectElement.hspace")}} {{deprecated_inline}}
  - : Một `long` đại diện cho khoảng trắng ngang tính bằng pixel xung quanh điều khiển.
- {{domxref("HTMLObjectElement.name")}}
  - : Trả về một chuỗi phản ánh thuộc tính HTML [`name`](/en-US/docs/Web/HTML/Reference/Elements/object#name), chỉ định tên của ngữ cảnh duyệt.
- {{domxref("HTMLObjectElement.standby")}} {{deprecated_inline}}
  - : Một chuỗi phản ánh thuộc tính HTML [`standby`](/en-US/docs/Web/HTML/Reference/Elements/object#standby), chỉ định thông báo hiển thị trong khi đối tượng đang tải.
- {{domxref("HTMLObjectElement.type")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`type`](/en-US/docs/Web/HTML/Reference/Elements/object#type), chỉ định MIME type của tài nguyên.
- {{domxref("HTMLObjectElement.useMap")}} {{deprecated_inline}}
  - : Một chuỗi phản ánh thuộc tính HTML [`usemap`](/en-US/docs/Web/HTML/Reference/Elements/object#usemap), chỉ định phần tử {{HTMLElement("map")}} cần sử dụng.
- {{domxref("HTMLObjectElement.validationMessage")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi đại diện cho thông báo được bản địa hóa mô tả các ràng buộc xác thực mà điều khiển không thỏa mãn (nếu có). Đây là chuỗi rỗng nếu điều khiển không phải là ứng cử viên cho xác thực ràng buộc (`willValidate` là `false`), hoặc nó thỏa mãn các ràng buộc của mình.
- {{domxref("HTMLObjectElement.validity")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("ValidityState")}} với các trạng thái hợp lệ mà phần tử này đang trong.
- {{domxref("HTMLObjectElement.vspace")}} {{deprecated_inline}}
  - : Một `long` đại diện cho khoảng trắng ngang tính bằng pixel xung quanh điều khiển.
- {{domxref("HTMLObjectElement.width")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`width`](/en-US/docs/Web/HTML/Reference/Elements/object#width), chỉ định chiều rộng hiển thị của tài nguyên tính bằng pixel CSS.
- {{domxref("HTMLObjectElement.willValidate")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean cho biết phần tử có phải là ứng cử viên cho xác thực ràng buộc hay không. Luôn là `false` đối với các đối tượng `HTMLObjectElement`.

## Phương thức phiên bản

_Kế thừa các phương thức từ cha của nó, {{domxref("HTMLElement")}}._

- {{domxref("HTMLObjectElement.checkValidity()")}}
  - : Luôn trả về `true` vì các phần tử {{HTMLElement("object")}} không bao giờ là ứng cử viên cho xác thực ràng buộc.
- {{domxref("HTMLObjectElement.getSVGDocument()")}}
  - : Trả về SVG nhúng dưới dạng một {{domxref("Document")}}.
- {{domxref("HTMLObjectElement.reportValidity()")}}
  - : Luôn trả về `true` vì các phần tử {{HTMLElement("object")}} không bao giờ là ứng cử viên cho xác thực ràng buộc.
- {{domxref("HTMLObjectElement.setCustomValidity()")}}
  - : Đặt thông báo hợp lệ tùy chỉnh cho phần tử. Nếu thông báo này không phải là chuỗi rỗng, thì phần tử đang gặp lỗi hợp lệ tùy chỉnh và không thông qua xác thực.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("object")}}
