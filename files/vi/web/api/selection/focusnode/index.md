---
title: "Selection: thuộc tính focusNode"
short-title: focusNode
slug: Web/API/Selection/focusNode
page-type: web-api-instance-property
browser-compat: api.Selection.focusNode
---

{{ ApiRef("DOM") }}

Thuộc tính chỉ đọc **`Selection.focusNode`** trả về {{domxref("Node")}} mà tại đó vùng chọn kết thúc. Nó có thể trả về `null` nếu vùng chọn chưa từng tồn tại trong tài liệu (ví dụ, một iframe chưa từng được bấm vào, hoặc nút thuộc về một cây tài liệu khác).

Người dùng có thể tạo vùng chọn từ trái sang phải (theo thứ tự tài liệu) hoặc từ phải sang trái (ngược thứ tự tài liệu). Focus là nơi người dùng kết thúc vùng chọn. Bạn có thể hình dung điều này bằng cách giữ phím <kbd>Shift</kbd> và nhấn các phím mũi tên trên bàn phím. Focus của vùng chọn di chuyển, nhưng anchor của vùng chọn, tức đầu còn lại của vùng chọn, không di chuyển.

## Giá trị

Một đối tượng {{domxref("Node")}} hoặc `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}
- {{domxref("Selection.anchorNode")}}
