---
title: "Selection: thuộc tính anchorOffset"
short-title: anchorOffset
slug: Web/API/Selection/anchorOffset
page-type: web-api-instance-property
browser-compat: api.Selection.anchorOffset
---

{{ ApiRef("DOM") }}

Thuộc tính chỉ đọc **`Selection.anchorOffset`** trả về số ký tự mà anchor của vùng chọn bị lệch bên trong {{domxref("Selection.anchorNode")}} nếu nút đó có kiểu {{domxref("Text")}}, {{domxref("CDATASection")}} hoặc {{domxref("Comment")}}.

Nếu {{domxref("Selection.anchorNode")}} là một kiểu nút khác, **`Selection.anchorOffset`** trả về số lượng {{domxref("Node.childNodes")}} mà anchor của vùng chọn bị lệch bên trong {{domxref("Selection.anchorNode")}}.

Con số này có chỉ số bắt đầu từ 0. Nếu vùng chọn bắt đầu tại ký tự đầu tiên trong {{domxref("Selection.anchorNode")}}, giá trị `0` sẽ được trả về.

## Giá trị

Một số.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện mà nó thuộc về.
