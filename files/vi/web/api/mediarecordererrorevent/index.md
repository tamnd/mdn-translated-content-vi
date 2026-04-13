---
title: MediaRecorderErrorEvent
slug: Web/API/MediaRecorderErrorEvent
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.MediaRecorderErrorEvent
---

{{APIRef("MediaStream Recording")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`MediaRecorderErrorEvent`** đại diện cho các lỗi do [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API) trả về. Đây là đối tượng {{domxref("Event")}} đóng gói tham chiếu đến {{domxref("DOMException")}} mô tả lỗi đã xảy ra.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("MediaRecorderErrorEvent.MediaRecorderErrorEvent", "MediaStreamRecorderEvent()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Tạo và trả về đối tượng sự kiện `MediaRecorderErrorEvent` mới với các tham số đã cho.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("Event")}}_.

- {{domxref("MediaRecorderErrorEvent.error", "error")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : {{domxref("DOMException")}} chứa thông tin về lỗi đã xảy ra.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha của nó, {{domxref("Event")}}_.

## Thông số kỹ thuật

Tính năng này không còn là một phần của bất kỳ đặc tả nào.

## Tương thích trình duyệt

{{Compat}}
