---
title: "Selection: thuộc tính anchorNode"
short-title: anchorNode
slug: Web/API/Selection/anchorNode
page-type: web-api-instance-property
browser-compat: api.Selection.anchorNode
---

{{ ApiRef("DOM") }}

Thuộc tính chỉ đọc **`Selection.anchorNode`** trả về {{domxref("Node")}} mà tại đó vùng chọn bắt đầu. Nó có thể trả về `null` nếu vùng chọn chưa từng tồn tại trong tài liệu (ví dụ, một iframe chưa từng được bấm vào, hoặc nút thuộc về một cây tài liệu khác).

Người dùng có thể tạo vùng chọn từ trái sang phải (theo thứ tự tài liệu) hoặc từ phải sang trái (ngược thứ tự tài liệu). Anchor là nơi người dùng bắt đầu vùng chọn. Bạn có thể hình dung điều này bằng cách giữ phím <kbd>Shift</kbd> và nhấn các phím mũi tên trên bàn phím. Anchor của vùng chọn không di chuyển, nhưng focus của vùng chọn, tức đầu còn lại của vùng chọn, sẽ di chuyển.

## Giá trị

Một đối tượng {{domxref("Node")}} hoặc `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}
- {{domxref("Selection.focusNode")}}
