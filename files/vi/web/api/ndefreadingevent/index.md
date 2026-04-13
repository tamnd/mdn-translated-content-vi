---
title: NDEFReadingEvent
slug: Web/API/NDEFReadingEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.NDEFReadingEvent
---

{{APIRef("Web NFC API")}}{{securecontext_header}}{{SeeCompatTable}}

Giao diện **`NDEFReadingEvent`** của [Web NFC API](/en-US/docs/Web/API/Web_NFC_API) đại diện cho các sự kiện được gửi khi có đọc NFC mới do {{DOMxRef("NDEFReader")}} thu được.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{DOMxRef("NDEFReadingEvent.NDEFReadingEvent", "NDEFReadingEvent.NDEFReadingEvent()")}} {{Experimental_Inline}}
  - : Tạo một `NDEFReadingEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{DOMxRef("Event")}}_.

- {{DOMxRef("NDEFReadingEvent.message")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{DOMxRef("NDEFMessage")}} chứa tin nhắn đã nhận.
- {{DOMxRef("NDEFReadingEvent.serialNumber")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về số serial của thiết bị, được dùng để chống xung đột và nhận dạng, hoặc chuỗi rỗng nếu không có số serial nào có sẵn.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{DOMxRef("Event")}}_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
