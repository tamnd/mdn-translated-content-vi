---
title: "ClipboardEvent: thuộc tính clipboardData"
short-title: clipboardData
slug: Web/API/ClipboardEvent/clipboardData
page-type: web-api-instance-property
browser-compat: api.ClipboardEvent.clipboardData
---

{{APIRef("Clipboard API")}}

Thuộc tính **`clipboardData`** của giao diện {{domxref("ClipboardEvent")}} chứa một đối tượng {{domxref("DataTransfer")}}, có thể được sử dụng để:

- chỉ định dữ liệu nào nên được đưa vào clipboard từ các trình xử lý sự kiện {{domxref("Element/cut_event", "cut")}} và {{domxref("Element/copy_event", "copy")}}, thường là bằng lệnh gọi {{domxref("DataTransfer.setData", "setData(format, data)")}};
- lấy dữ liệu cần dán từ trình xử lý sự kiện {{domxref("Element/paste_event", "paste")}}, thường là bằng lệnh gọi {{domxref("DataTransfer.getData", "getData(format)")}}.

Xem tài liệu về các sự kiện {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/copy_event", "copy")}}, và {{domxref("Element/paste_event", "paste")}} để biết thêm thông tin.

## Giá trị

Một đối tượng {{domxref("DataTransfer")}}.

Thuộc tính có thể là `null` khi sự kiện được tạo bằng constructor. Nó không bao giờ là `null` khi được trình duyệt dispatch.

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan đến sao chép: {{domxref("Element/copy_event", "copy")}}, {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/paste_event", "paste")}}
- Giao diện {{domxref("ClipboardEvent")}} mà nó thuộc về.
- [API Clipboard](/en-US/docs/Web/API/Clipboard_API)
