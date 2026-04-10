---
title: DocumentType
slug: Web/API/DocumentType
page-type: web-api-interface
browser-compat: api.DocumentType
---

{{APIRef("DOM")}}

Giao diện **`DocumentType`** đại diện cho một {{domxref("Node")}} chứa một doctype.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ lớp cha của nó, {{domxref("Node")}}._

- {{domxref("DocumentType.name")}} {{ReadOnlyInline}}
  - : Kiểu của tài liệu. Với tài liệu HTML, giá trị này luôn là `"html"`, nhưng sẽ thay đổi đối với tài liệu XML.
- {{domxref("DocumentType.publicId")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa mã định danh của kiểu tài liệu. Rỗng nếu doctype không chỉ định public ID.
- {{domxref("DocumentType.systemId")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa URL của DTD liên quan. Rỗng nếu doctype không chỉ định system ID.

## Phương thức thể hiện

_Kế thừa các phương thức từ lớp cha của nó, {{domxref("Node")}}._

- {{domxref("DocumentType.after()")}}
  - : Chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi vào danh sách con của nút cha của đối tượng, ngay sau nút này.
- {{domxref("DocumentType.before()")}}
  - : Chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi vào danh sách con của nút cha của đối tượng, ngay trước nút này.
- {{domxref("DocumentType.remove()")}}
  - : Loại bỏ đối tượng này khỏi danh sách các nút con của nút cha của nó.
- {{domxref("DocumentType.replaceWith()")}}
  - : Thay thế kiểu tài liệu bằng một tập hợp các nút đã cho.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
- {{domxref("DOMImplementation.createDocumentType()")}} để tạo một nút `DocumentType` mới.
