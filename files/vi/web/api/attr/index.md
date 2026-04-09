---
title: Attr
slug: Web/API/Attr
page-type: web-api-interface
browser-compat: api.Attr
---

{{APIRef("DOM")}}

Giao diện **`Attr`** biểu diễn một trong các thuộc tính của một phần tử dưới dạng một đối tượng. Trong hầu hết trường hợp, bạn sẽ lấy trực tiếp giá trị thuộc tính dưới dạng chuỗi (ví dụ {{domxref("Element.getAttribute()")}}), nhưng đôi khi bạn cần làm việc với các thể hiện `Attr` (ví dụ {{domxref("Element.getAttributeNode()")}}).

{{InheritanceDiagram}}

Ý tưởng cốt lõi của một đối tượng kiểu `Attr` là mối liên kết giữa một _tên_ và một _giá trị_. Một thuộc tính cũng có thể là một phần của một _không gian tên_ và, trong trường hợp đó, nó còn có một URI xác định không gian tên và một tiền tố là dạng viết tắt của không gian tên đó.

Tên được xem là _cục bộ_ khi nó bỏ qua tiền tố không gian tên nếu có, và được xem là _đủ điều kiện_ khi nó bao gồm tiền tố của không gian tên, nếu có, được tách khỏi tên cục bộ bằng dấu hai chấm (`:`). Có ba trường hợp: thuộc tính nằm ngoài không gian tên, thuộc tính nằm trong không gian tên nhưng không có tiền tố được định nghĩa, và thuộc tính nằm trong không gian tên có tiền tố:

| Attribute | Namespace name | Namespace prefix | Attribute local name | Attribute qualified name |
| --------- | -------------- | ---------------- | -------------------- | ------------------------ |
| `myAttr`  | _none_         | _none_           | `myAttr`             | `myAttr`                 |
| `myAttr`  | `mynamespace`  | _none_           | `myAttr`             | `myAttr`                 |
| `myAttr`  | `mynamespace`  | `myns`           | `myAttr`             | `myns:myAttr`            |

> [!NOTE]
> Giao diện này chỉ biểu diễn các thuộc tính có mặt trong biểu diễn cây của {{domxref("Element")}}, dù đó là phần tử SVG, HTML hay MathML. Nó không biểu diễn _thuộc tính_ của một giao diện gắn với phần tử đó, như {{domxref("HTMLTableElement")}} đối với phần tử {{HTMLElement("table")}}. (Xem {{Glossary("Attribute", "bài viết này")}} để biết thêm thông tin về thuộc tính và cách chúng được _phản chiếu_ thành các thuộc tính của đối tượng.)

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính của giao diện cha, {{domxref("Node")}} và {{domxref("EventTarget")}}._

- {{domxref("Attr.localName", "localName")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn phần cục bộ của tên đủ điều kiện của thuộc tính.
- {{domxref("Attr.name", "name")}} {{ReadOnlyInline}}
  - : _Tên đủ điều kiện_ của thuộc tính. Nếu thuộc tính không nằm trong không gian tên, nó sẽ giống với thuộc tính {{domxref("attr.localName", "localName")}}.
- {{domxref("Attr.namespaceURI", "namespaceURI")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn URI của không gian tên của thuộc tính, hoặc `null` nếu không có không gian tên.
- {{domxref("Attr.ownerElement", "ownerElement")}} {{ReadOnlyInline}}
  - : {{domxref("Element")}} mà thuộc tính thuộc về.
- {{domxref("Attr.prefix", "prefix")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn tiền tố không gian tên của thuộc tính, hoặc `null` nếu không có tiền tố hoặc không có không gian tên.
- {{domxref("Attr.specified", "specified")}} {{ReadOnlyInline}} {{deprecated_inline}}
  - : Thuộc tính này luôn trả về `true`.
- {{domxref("Attr.value", "value")}}
  - : Giá trị của thuộc tính, một chuỗi có thể được đặt và lấy bằng thuộc tính này.

## Phương thức thể hiện

_Giao diện này không có phương thức riêng, nhưng kế thừa các phương thức của giao diện cha, {{domxref("Node")}} và {{domxref("EventTarget")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các nút khác là {{domxref("CDATASection")}}, {{domxref("CharacterData")}}, {{domxref("Comment")}}, {{domxref("Document")}}, {{domxref("Element")}}, {{domxref("ProcessingInstruction")}}, và {{domxref("Text")}}.
