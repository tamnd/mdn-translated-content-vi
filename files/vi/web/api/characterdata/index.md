---
title: CharacterData
slug: Web/API/CharacterData
page-type: web-api-interface
browser-compat: api.CharacterData
---

{{APIRef("DOM")}}

Giao diện trừu tượng **`CharacterData`** biểu diễn một đối tượng {{domxref("Node")}} chứa ký tự. Đây là một giao diện trừu tượng, nghĩa là không có đối tượng nào thuộc kiểu `CharacterData`: nó được hiện thực bởi các giao diện khác như {{domxref("Text")}}, {{domxref("Comment")}}, {{domxref("CDATASection")}} hoặc {{domxref("ProcessingInstruction")}}, vốn không phải là giao diện trừu tượng.

{{InheritanceDiagram}}

## Thuộc tính thực thể

_Giao diện này cũng kế thừa các thuộc tính từ các giao diện cha của nó là {{domxref("Node")}} và {{domxref("EventTarget")}}._

- {{domxref("CharacterData.data")}}
  - : Một chuỗi biểu diễn dữ liệu văn bản được chứa trong đối tượng này.
- {{domxref("CharacterData.length")}} {{ReadOnlyInline}}
  - : Trả về một số biểu diễn kích thước của chuỗi được chứa trong đối tượng.
- {{domxref("CharacterData.nextElementSibling")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("Element")}} đầu tiên đứng _sau_ nút này và là nút anh em.
- {{domxref("CharacterData.previousElementSibling")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("Element")}} đầu tiên đứng _trước_ nút này và là nút anh em.

## Phương thức thực thể

_Giao diện này cũng kế thừa các phương thức từ các giao diện cha của nó là {{domxref("Node")}} và {{domxref("EventTarget")}}._

- {{domxref("CharacterData.after()")}}
  - : Chèn một tập các đối tượng {{domxref("Node")}} hoặc chuỗi vào danh sách phần tử con của nút cha của `CharacterData`, ngay sau đối tượng `CharacterData`.
- {{domxref("CharacterData.appendData()")}}
  - : Nối chuỗi đã cho vào chuỗi `CharacterData.data`; khi phương thức này trả về, `data` sẽ chứa chuỗi đã được ghép.
- {{domxref("CharacterData.before()")}}
  - : Chèn một tập các đối tượng {{domxref("Node")}} hoặc chuỗi vào danh sách phần tử con của nút cha của `CharacterData`, ngay trước đối tượng `CharacterData`.
- {{domxref("CharacterData.deleteData()")}}
  - : Xóa số lượng ký tự được chỉ định, bắt đầu tại vị trí bù được chỉ định, khỏi chuỗi `CharacterData.data`; khi phương thức này trả về, `data` sẽ chứa chuỗi đã được rút ngắn.
- {{domxref("CharacterData.insertData()")}}
  - : Chèn các ký tự được chỉ định, tại vị trí bù được chỉ định, vào chuỗi `CharacterData.data`; khi phương thức này trả về, `data` sẽ chứa chuỗi đã được chỉnh sửa.
- {{domxref("CharacterData.remove()")}}
  - : Xóa đối tượng khỏi danh sách phần tử con của nút cha của nó.
- {{domxref("CharacterData.replaceData()")}}
  - : Thay thế số lượng ký tự được chỉ định, bắt đầu tại vị trí bù được chỉ định, bằng chuỗi được chỉ định; khi phương thức này trả về, `data` sẽ chứa chuỗi đã được chỉnh sửa.
- {{DOMxRef("CharacterData.replaceWith()")}}
  - : Thay thế các ký tự trong danh sách phần tử con của nút cha của nó bằng một tập các đối tượng {{domxref("Node")}} hoặc chuỗi.
- {{domxref("CharacterData.substringData()")}}
  - : Trả về một chuỗi chứa phần của `CharacterData.data` có độ dài được chỉ định và bắt đầu tại vị trí bù được chỉ định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Trang tổng quan về DOM](/en-US/docs/Web/API/Document_Object_Model).
- Các giao diện cụ thể hiện thực giao diện này: {{domxref("Text")}}, {{domxref("CDATASection")}}, {{domxref("ProcessingInstruction")}} và {{domxref("Comment")}}.
