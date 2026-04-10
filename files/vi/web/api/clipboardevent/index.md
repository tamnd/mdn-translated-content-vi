---
title: ClipboardEvent
slug: Web/API/ClipboardEvent
page-type: web-api-interface
browser-compat: api.ClipboardEvent
---

{{APIRef("Clipboard API")}}

Giao diện **`ClipboardEvent`** của [API Clipboard](/en-US/docs/Web/API/Clipboard_API) đại diện cho các sự kiện cung cấp thông tin liên quan đến việc sửa đổi clipboard, đó là các sự kiện {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/copy_event", "copy")}}, và {{domxref("Element/paste_event", "paste")}}.

{{InheritanceDiagram}}

## Constructor

- {{domxref("ClipboardEvent.ClipboardEvent", "ClipboardEvent()")}}
  - : Tạo một sự kiện `ClipboardEvent` với các tham số đã cho.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính từ {{domxref("Event")}} cha._

- {{domxref("ClipboardEvent.clipboardData")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("DataTransfer")}} chứa dữ liệu bị ảnh hưởng bởi thao tác {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/copy_event", "copy")}}, hoặc {{domxref("Element/paste_event", "paste")}} do người dùng khởi tạo, cùng với kiểu MIME của nó.

## Phương thức instance

_Không có phương thức cụ thể; kế thừa các phương thức từ {{domxref("Event")}} cha._

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan đến sao chép: {{domxref("Element/copy_event", "copy")}}, {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/paste_event", "paste")}}
- {{domxref("ClipboardChangeEvent")}}
- [API Clipboard](/en-US/docs/Web/API/Clipboard_API)
- [Bài viết về hỗ trợ hình ảnh cho Async Clipboard](https://web.dev/articles/async-clipboard)
