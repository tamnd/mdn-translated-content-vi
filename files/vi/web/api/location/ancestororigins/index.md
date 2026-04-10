---
title: "Location: thuộc tính ancestorOrigins"
short-title: ancestorOrigins
slug: Web/API/Location/ancestorOrigins
page-type: web-api-instance-property
browser-compat: api.Location.ancestorOrigins
---

{{APIRef("Location")}}

Thuộc tính chỉ đọc **`ancestorOrigins`** của giao diện {{domxref("Location")}} là một {{domxref("DOMStringList")}} tĩnh chứa, theo thứ tự ngược, các origin của mọi ngữ cảnh duyệt web tổ tiên của tài liệu liên kết với đối tượng {{domxref("Location")}} đã cho.

Bạn có thể dùng `location.ancestorOrigins` trong script của một tài liệu để xác định, chẳng hạn, liệu tài liệu đó có đang được đóng khung bởi một site mà bạn không mong đợi hay không. Bạn cũng có thể dùng nó để thay đổi hành vi của tài liệu dựa trên site hoặc danh sách site đang đóng khung nó.

## Giá trị

Một {{domxref("DOMStringList")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
