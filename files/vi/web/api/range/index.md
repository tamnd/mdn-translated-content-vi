---
title: Range
slug: Web/API/Range
page-type: web-api-interface
browser-compat: api.Range
---

{{APIRef("DOM")}}

Giao diện **`Range`** đại diện cho một đoạn của tài liệu có thể chứa các nút và các phần của nút văn bản.

Bạn có thể tạo một range bằng phương thức {{domxref("Document.createRange()")}}. Đối tượng `Range` cũng có thể được lấy bằng phương thức {{domxref("Selection/getRangeAt", "getRangeAt()")}} của đối tượng {{domxref("Selection")}} hoặc phương thức {{domxref("Document/caretRangeFromPoint", "caretRangeFromPoint()")}} của đối tượng {{domxref("Document")}}.

Cũng có constructor {{domxref("Range.Range()", "Range()")}}.

{{InheritanceDiagram}}

## Constructor

- {{domxref("Range.Range()", "Range()")}}
  - : Trả về một đối tượng `Range` với {{domxref("Document")}} toàn cục làm điểm bắt đầu và kết thúc.

## Thuộc tính thể hiện

_Cũng kế thừa thuộc tính từ giao diện cha, {{domxref("AbstractRange")}}._

- {{domxref("Range.commonAncestorContainer")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("Node")}} sâu nhất chứa cả hai nút `startContainer` và `endContainer`.

## Phương thức thể hiện

_Không có phương thức kế thừa._

- {{domxref("Range.collapse()")}}
  - : Thu gọn `Range` về một trong các điểm biên của nó.
- {{domxref("Range.compareBoundaryPoints()")}}
  - : So sánh các điểm biên của `Range` với một `Range` khác.
- {{domxref("Range.compareNode()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về một hằng số biểu thị việc `Node` đứng trước, sau, bên trong hay bao quanh range.
- {{domxref("Range.comparePoint()")}}
  - : Trả về `-1`, `0` hoặc `1` cho biết điểm nằm trước, trong hay sau `Range`.
- {{domxref("Range.cloneContents()")}}
  - : Trả về một {{domxref("DocumentFragment")}} sao chép các nút của `Range`.
- {{domxref("Range.cloneRange()")}}
  - : Trả về một đối tượng `Range` có các điểm biên giống hệt `Range` được sao chép.
- {{domxref("Range.createContextualFragment()")}}
  - : Trả về một {{domxref("DocumentFragment")}} được tạo từ một chuỗi mã đã cho.
- {{domxref("Range.deleteContents()")}}
  - : Xóa nội dung của `Range` khỏi {{domxref("Document")}}.
- {{domxref("Range.detach()")}} {{deprecated_inline}}
  - : Không làm gì cả. Giữ lại để tương thích.
- {{domxref("Range.extractContents()")}}
  - : Di chuyển nội dung của `Range` từ cây tài liệu vào một {{domxref("DocumentFragment")}}.
- {{domxref("Range.getBoundingClientRect()")}}
  - : Trả về một đối tượng {{domxref("DOMRect")}} bao quanh toàn bộ nội dung của `Range`.
- {{domxref("Range.getClientRects()")}}
  - : Trả về danh sách các đối tượng {{domxref("DOMRect")}} tổng hợp kết quả của {{domxref("Element.getClientRects()")}} cho mọi phần tử trong `Range`.
- {{domxref("Range.isPointInRange()")}}
  - : Trả về `boolean` cho biết điểm đã cho có nằm trong `Range` hay không.
- {{domxref("Range.insertNode()")}}
  - : Chèn một {{domxref("Node")}} tại đầu `Range`.
- {{domxref("Range.intersectsNode()")}}
  - : Trả về `boolean` cho biết nút đã cho có giao với `Range` hay không.
- {{domxref("Range.selectNode()")}}
  - : Đặt `Range` để chứa {{domxref("Node")}} và nội dung của nó.
- {{domxref("Range.selectNodeContents()")}}
  - : Đặt `Range` để chứa nội dung của một {{domxref("Node")}}.
- {{domxref("Range.setEnd()")}}
  - : Đặt vị trí kết thúc của `Range`.
- {{domxref("Range.setStart()")}}
  - : Đặt vị trí bắt đầu của `Range`.
- {{domxref("Range.setEndAfter()")}}
  - : Đặt vị trí kết thúc của `Range` tương đối với một {{domxref("Node")}} khác.
- {{domxref("Range.setEndBefore()")}}
  - : Đặt vị trí kết thúc của `Range` tương đối với một {{domxref("Node")}} khác.
- {{domxref("Range.setStartAfter()")}}
  - : Đặt vị trí bắt đầu của `Range` tương đối với một {{domxref("Node")}} khác.
- {{domxref("Range.setStartBefore()")}}
  - : Đặt vị trí bắt đầu của `Range` tương đối với một {{domxref("Node")}} khác.
- {{domxref("Range.surroundContents()")}}
  - : Di chuyển nội dung của `Range` vào một {{domxref("Node")}} mới.
- {{domxref("Range.toString()")}}
  - : Trả về văn bản của `Range`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
