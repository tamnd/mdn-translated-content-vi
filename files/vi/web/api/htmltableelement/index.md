---
title: HTMLTableElement
slug: Web/API/HTMLTableElement
page-type: web-api-interface
browser-compat: api.HTMLTableElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLTableElement`** cung cấp các thuộc tính và phương thức đặc biệt để thao tác bố cục và cách trình bày của bảng trong tài liệu HTML, ngoài những gì giao diện đối tượng {{DOMxRef("HTMLElement")}} thông thường đã có sẵn thông qua kế thừa.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ phần tử cha, {{DOMxRef("HTMLElement")}}._

- {{DOMxRef("HTMLTableElement.caption")}}
  - : Một {{DOMxRef("HTMLTableCaptionElement")}} đại diện cho phần tử {{HTMLElement("caption")}} đầu tiên là phần tử con của bảng, hoặc `null` nếu không tìm thấy. Khi được đặt, nếu đối tượng không đại diện cho một `<caption>`, sẽ ném một {{DOMxRef("DOMException")}} với tên `HierarchyRequestError`. Nếu cung cấp đối tượng hợp lệ, nó sẽ được chèn vào cây như phần tử con đầu tiên của bảng và phần tử `<caption>` đầu tiên là con của bảng sẽ bị xóa khỏi cây, nếu có.
- {{DOMxRef("HTMLTableElement.tHead")}}
  - : Một {{DOMxRef("HTMLTableSectionElement")}} đại diện cho phần tử {{HTMLElement("thead")}} đầu tiên là phần tử con của bảng, hoặc `null` nếu không tìm thấy. Khi được đặt, nếu đối tượng không đại diện cho một `<thead>`, sẽ ném một {{DOMxRef("DOMException")}} với tên `HierarchyRequestError`. Nếu cung cấp đối tượng hợp lệ, nó sẽ được chèn vào cây ngay trước phần tử đầu tiên không phải là {{HTMLElement("caption")}} hoặc {{HTMLElement("colgroup")}}, hoặc làm phần tử con cuối cùng nếu không có phần tử như vậy, và phần tử `<thead>` đầu tiên là con của bảng sẽ bị xóa khỏi cây, nếu có.
- {{DOMxRef("HTMLTableElement.tFoot")}}
  - : Một {{DOMxRef("HTMLTableSectionElement")}} đại diện cho phần tử {{HTMLElement("tfoot")}} đầu tiên là phần tử con của bảng, hoặc `null` nếu không tìm thấy. Khi được đặt, nếu đối tượng không đại diện cho một `<tfoot>`, sẽ ném một {{DOMxRef("DOMException")}} với tên `HierarchyRequestError`. Nếu cung cấp đối tượng hợp lệ, nó sẽ được chèn vào cây ngay trước phần tử đầu tiên không phải là {{HTMLElement("caption")}}, {{HTMLElement("colgroup")}}, hoặc {{HTMLElement("thead")}}, hoặc làm phần tử con cuối cùng nếu không có phần tử như vậy, và phần tử `<tfoot>` đầu tiên là con của bảng sẽ bị xóa khỏi cây, nếu có.
- {{DOMxRef("HTMLTableElement.rows")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("HTMLCollection")}} sống chứa tất cả các hàng của bảng, tức là mọi {{HTMLElement("tr")}} là con của bảng, hoặc là con của các phần tử {{HTMLElement("thead")}}, {{HTMLElement("tbody")}}, và {{HTMLElement("tfoot")}}. Các hàng thuộc `<thead>` xuất hiện trước, theo thứ tự cây, và các hàng thuộc `<tbody>` xuất hiện sau cùng, cũng theo thứ tự cây. {{DOMxRef("HTMLCollection")}} này là sống và tự động cập nhật khi {{DOMxRef("HTMLTableElement")}} thay đổi.
- {{DOMxRef("HTMLTableElement.tBodies")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("HTMLCollection")}} sống chứa tất cả các phần tử {{HTMLElement("tbody")}} của bảng. {{DOMxRef("HTMLCollection")}} này là sống và tự động cập nhật khi {{DOMxRef("HTMLTableElement")}} thay đổi.

### Thuộc tính lỗi thời

> [!WARNING]
> Các thuộc tính sau đã lỗi thời. Bạn nên tránh sử dụng chúng.

- {{DOMxRef("HTMLTableElement.align")}} {{deprecated_inline}}
  - : Một chuỗi chứa giá trị liệt kê phản ánh thuộc tính [`align`](/en-US/docs/Web/HTML/Reference/Elements/table#align). Nó cho biết căn chỉnh nội dung của bảng so với ngữ cảnh xung quanh. Các giá trị có thể là `"left"`, `"right"`, và `"center"`.
- {{DOMxRef("HTMLTableElement.bgColor")}} {{deprecated_inline}}
  - : Một chuỗi chứa màu nền của các ô. Nó phản ánh thuộc tính lỗi thời [`bgColor`](/en-US/docs/Web/HTML/Reference/Elements/table#bgcolor).
- {{DOMxRef("HTMLTableElement.border")}} {{deprecated_inline}}
  - : Một chuỗi chứa độ rộng theo pixel của đường viền của bảng. Nó phản ánh thuộc tính lỗi thời [`border`](/en-US/docs/Web/HTML/Reference/Elements/table#border).
- {{DOMxRef("HTMLTableElement.cellPadding")}} {{deprecated_inline}}
  - : Một chuỗi chứa độ rộng theo pixel của khoảng trống ngang và dọc giữa nội dung ô và đường viền ô. Nó phản ánh thuộc tính lỗi thời [`cellpadding`](/en-US/docs/Web/HTML/Reference/Elements/table#cellpadding).
- {{DOMxRef("HTMLTableElement.cellSpacing")}} {{deprecated_inline}}
  - : Một chuỗi chứa độ rộng theo pixel của khoảng cách ngang và dọc giữa các ô. Nó phản ánh thuộc tính lỗi thời [`cellspacing`](/en-US/docs/Web/HTML/Reference/Elements/table#cellspacing).
- {{DOMxRef("HTMLTableElement.frame")}} {{deprecated_inline}}
  - : Một chuỗi chứa kiểu của các đường viền ngoài của bảng. Nó phản ánh thuộc tính lỗi thời [`frame`](/en-US/docs/Web/HTML/Reference/Elements/table#frame) và có thể nhận một trong các giá trị sau: `"void"`, `"above"`, `"below"`, `"hsides"`, `"vsides"`, `"lhs"`, `"rhs"`, `"box"`, hoặc `"border"`.
- {{DOMxRef("HTMLTableElement.rules")}} {{deprecated_inline}}
  - : Một chuỗi chứa kiểu của các đường viền bên trong của bảng. Nó phản ánh thuộc tính lỗi thời [`rules`](/en-US/docs/Web/HTML/Reference/Elements/table#rules) và có thể nhận một trong các giá trị sau: `"none"`, `"groups"`, `"rows"`, `"cols"`, hoặc `"all"`.
- {{DOMxRef("HTMLTableElement.summary")}} {{deprecated_inline}}
  - : Một chuỗi chứa mô tả mục đích hoặc cấu trúc của bảng. Nó phản ánh thuộc tính lỗi thời [`summary`](/en-US/docs/Web/HTML/Reference/Elements/table#summary).
- {{DOMxRef("HTMLTableElement.width")}} {{deprecated_inline}}
  - : Một chuỗi chứa chiều rộng mong muốn của toàn bộ bảng, tính bằng pixel hoặc phần trăm. Nó phản ánh thuộc tính lỗi thời [`width`](/en-US/docs/Web/HTML/Reference/Elements/table#width).

## Phương thức thể hiện

_Kế thừa các phương thức từ phần tử cha, {{DOMxRef("HTMLElement")}}._

- {{DOMxRef("HTMLTableElement.createTHead()")}}
  - : Trả về một {{DOMxRef("HTMLTableSectionElement")}} đại diện cho phần tử {{HTMLElement("thead")}} đầu tiên là phần tử con của bảng. Nếu không tìm thấy, một phần tử mới sẽ được tạo và chèn vào cây ngay trước phần tử đầu tiên không phải là {{HTMLElement("caption")}} hoặc {{HTMLElement("colgroup")}}, hoặc làm phần tử con cuối cùng nếu không có phần tử như vậy.
- {{DOMxRef("HTMLTableElement.deleteTHead()")}}
  - : Xóa phần tử {{HTMLElement("thead")}} đầu tiên là con của bảng.
- {{DOMxRef("HTMLTableElement.createTFoot()")}}
  - : Trả về một {{DOMxRef("HTMLTableSectionElement")}} đại diện cho phần tử {{HTMLElement("tfoot")}} đầu tiên là con của bảng. Nếu không tìm thấy, một phần tử mới sẽ được tạo và chèn vào cây làm phần tử con cuối cùng.
- {{DOMxRef("HTMLTableElement.deleteTFoot()")}}
  - : Xóa phần tử {{HTMLElement("tfoot")}} đầu tiên là con của bảng.
- {{DOMxRef("HTMLTableElement.createTBody()")}}
  - : Trả về một {{DOMxRef("HTMLTableSectionElement")}} đại diện cho một phần tử {{HTMLElement("tbody")}} mới là con của bảng. Nó được chèn vào cây sau phần tử {{HTMLElement("tbody")}} cuối cùng, hoặc làm phần tử con cuối cùng nếu không có phần tử như vậy.
- {{DOMxRef("HTMLTableElement.createCaption()")}}
  - : Trả về một {{DOMxRef("HTMLElement")}} đại diện cho phần tử {{HTMLElement("caption")}} đầu tiên là con của bảng. Nếu không tìm thấy, một phần tử mới sẽ được tạo và chèn vào cây làm phần tử con đầu tiên của phần tử {{HTMLElement("table")}}.
- {{DOMxRef("HTMLTableElement.deleteCaption()")}}
  - : Xóa phần tử {{HTMLElement("caption")}} đầu tiên là con của bảng.
- {{DOMxRef("HTMLTableElement.insertRow()")}}
  - : Trả về một {{DOMxRef("HTMLTableRowElement")}} đại diện cho một hàng mới của bảng. Nó chèn hàng này vào tập hợp các hàng ngay trước phần tử {{HTMLElement("tr")}} ở vị trí `index` đã cho. Nếu cần, một phần tử {{HTMLElement("tbody")}} sẽ được tạo. Nếu `index` là `-1`, hàng mới sẽ được thêm vào cuối tập hợp. Nếu `index` nhỏ hơn `-1` hoặc lớn hơn số lượng hàng trong tập hợp, sẽ ném một {{DOMxRef("DOMException")}} với giá trị `IndexSizeError`.
- {{DOMxRef("HTMLTableElement.deleteRow()")}}
  - : Xóa hàng tương ứng với `index` được truyền vào. Nếu giá trị `index` là `-1`, hàng cuối cùng sẽ bị xóa; nếu nhỏ hơn `-1` hoặc lớn hơn số lượng hàng trong tập hợp, sẽ ném một {{DOMxRef("DOMException")}} với giá trị `IndexSizeError`.

## Ví dụ

### Sử dụng giao diện bảng DOM

Giao diện `HTMLTableElement` cung cấp một số phương thức tiện lợi để tạo và thao tác bảng. Hai phương thức thường dùng là {{domxref("HTMLTableElement.insertRow")}} và {{domxref("HTMLTableRowElement.insertCell")}}.

Để thêm một hàng và một số ô vào một bảng hiện có:

```html
<table id="table0">
  <tbody>
    <tr>
      <td>Row 0 Cell 0</td>
      <td>Row 0 Cell 1</td>
    </tr>
  </tbody>
</table>
```

```js
const table = document.getElementById("table0");
const row = table.insertRow(-1);

for (let i = 0; i < 2; i++) {
  const cell = row.insertCell(-1);
  const text = `Row ${row.rowIndex} Cell ${i}`;
  cell.appendChild(document.createTextNode(text));
}
```

{{EmbedLiveSample("using_the_dom_table_interface", "", "300")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("table")}}.
