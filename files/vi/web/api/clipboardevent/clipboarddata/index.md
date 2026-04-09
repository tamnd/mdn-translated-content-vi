---
title: "ClipboardEvent: thuộc tính clipboardData"
short-title: clipboardData
slug: Web/API/ClipboardEvent/clipboardData
page-type: web-api-instance-property
browser-compat: api.ClipboardEvent.clipboardData
---

{{APIRef("Clipboard API")}}

Thuộc tính **`clipboardData`** của giao diện {{domxref("ClipboardEvent")}} giữ một đối tượng {{domxref("DataTransfer")}}, có thể được dùng để:

- chỉ định dữ liệu nào sẽ được đưa vào clipboard từ trình xử lý sự kiện {{domxref("Element/cut_event", "cut")}} và {{domxref("Element/copy_event", "copy")}}, thường bằng lệnh gọi {{domxref("DataTransfer.setData", "setData(format, data)")}};
- lấy dữ liệu cần dán từ trình xử lý sự kiện {{domxref("Element/paste_event", "paste")}}, thường bằng lệnh gọi {{domxref("DataTransfer.getData", "getData(format)")}}.

Hãy xem tài liệu về các sự kiện {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/copy_event", "copy")}} và {{domxref("Element/paste_event", "paste")}} để biết thêm thông tin.

## Giá trị

Một đối tượng {{domxref("DataTransfer")}}.

Thuộc tính này có thể là `null` khi sự kiện được tạo bằng hàm tạo. Nó không bao giờ là `null` khi được trình duyệt gửi đi.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan đến sao chép: {{domxref("Element/copy_event", "copy")}}, {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/paste_event", "paste")}}
- Giao diện {{domxref("ClipboardEvent")}} mà thuộc tính này thuộc về.
- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
