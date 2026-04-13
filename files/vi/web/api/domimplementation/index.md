---
title: DOMImplementation
slug: Web/API/DOMImplementation
page-type: web-api-interface
browser-compat: api.DOMImplementation
---

{{ ApiRef("DOM") }}

Giao diện **`DOMImplementation`** đại diện cho một đối tượng cung cấp các phương thức không phụ thuộc vào bất kỳ tài liệu cụ thể nào. Đối tượng như vậy được trả về bởi thuộc tính {{domxref("Document.implementation")}}.

## Thuộc tính

_Giao diện này không có thuộc tính cụ thể và không kế thừa thuộc tính nào._

## Phương thức phiên bản

_Không có phương thức kế thừa._

- {{domxref("DOMImplementation.createDocument()")}}
  - : Tạo và trả về một {{domxref("XMLDocument")}}.
- {{domxref("DOMImplementation.createDocumentType()")}}
  - : Tạo và trả về một {{domxref("DocumentType")}}.
- {{domxref("DOMImplementation.createHTMLDocument()")}}
  - : Tạo và trả về một HTML {{domxref("Document")}}.
- {{domxref("DOMImplementation.hasFeature()")}} {{Deprecated_Inline}}
  - : Trả về giá trị boolean cho biết một tính năng nhất định có được hỗ trợ hay không. Hàm này không đáng tin cậy và chỉ được giữ lại vì lý do tương thích: ngoài các truy vấn liên quan đến SVG, nó luôn trả về `true`. Các trình duyệt cũ rất không nhất quán trong hành vi của họ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM.](/en-US/docs/Web/API/Document_Object_Model)
