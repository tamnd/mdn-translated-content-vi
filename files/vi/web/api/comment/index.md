---
title: Comment
slug: Web/API/Comment
page-type: web-api-interface
browser-compat: api.Comment
---

{{ ApiRef("DOM") }}

Giao diện **`Comment`** biểu diễn các ghi chú dạng văn bản bên trong markup; dù thường không được hiển thị trực quan, các chú thích như vậy vẫn có thể được đọc trong chế độ xem mã nguồn.

Trong HTML và XML, comment được biểu diễn dưới dạng nội dung nằm giữa `<!--` và `-->`. Trong XML, chẳng hạn bên trong markup SVG hoặc MathML, không được dùng chuỗi ký tự `--` bên trong một comment.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Giao diện này không có thuộc tính riêng, nhưng kế thừa các thuộc tính của giao diện cha {{domxref("CharacterData")}} và gián tiếp từ {{domxref("Node")}}._

## Hàm dựng

- {{ domxref("Comment.Comment()", "Comment()") }}
  - : Trả về một đối tượng `Comment` mới với tham số được dùng làm nội dung văn bản của nó. Nếu không có tham số, giá trị mặc định là chuỗi rỗng `''`.

## Phương thức thể hiện

_Giao diện này không có phương thức riêng, nhưng kế thừa các phương thức của giao diện cha {{domxref("CharacterData")}} và gián tiếp từ {{domxref("Node")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [DOM API](/en-US/docs/Web/API/Document_Object_Model)
