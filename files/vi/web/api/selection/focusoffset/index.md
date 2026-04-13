---
title: "Selection: thuộc tính focusOffset"
short-title: focusOffset
slug: Web/API/Selection/focusOffset
page-type: web-api-instance-property
browser-compat: api.Selection.focusOffset
---

{{ ApiRef("DOM") }}

Thuộc tính chỉ đọc **`Selection.focusOffset`** trả về số ký tự mà focus của vùng chọn bị lệch bên trong {{domxref("Selection.focusNode")}} nếu nút đó có kiểu {{domxref("Text")}}, {{domxref("CDATASection")}} hoặc {{domxref("Comment")}}.

Nếu {{domxref("Selection.focusNode")}} là một kiểu nút khác, **`Selection.focusOffset`** trả về số lượng {{domxref("Node.childNodes")}} mà focus của vùng chọn bị lệch bên trong {{domxref("Selection.focusNode")}}.

Con số này có chỉ số bắt đầu từ 0. Nếu vùng chọn kết thúc tại ký tự đầu tiên trong {{domxref("Selection.focusNode")}}, giá trị `0` sẽ được trả về.

## Giá trị

Một số.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện mà nó thuộc về.
