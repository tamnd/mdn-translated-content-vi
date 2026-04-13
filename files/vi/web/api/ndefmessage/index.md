---
title: NDEFMessage
slug: Web/API/NDEFMessage
page-type: web-api-interface
status:
  - experimental
browser-compat: api.NDEFMessage
---

{{securecontext_header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Giao diện **`NDEFMessage`** của [Web NFC API](/en-US/docs/Web/API/Web_NFC_API) đại diện cho nội dung của một thông điệp NDEF đã được đọc từ hoặc có thể được ghi vào một thẻ NFC. Một phiên bản được lấy bằng cách gọi hàm khởi tạo `NDEFMessage()` hoặc từ thuộc tính {{domxref("NDEFReadingEvent.message")}}, được truyền vào sự kiện {{domxref("NDEFReader.reading_event", "reading")}}.

## Hàm khởi tạo

- {{DOMxRef("NDEFMessage.NDEFMessage", "NDEFMessage()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `NDEFMessage` mới, được khởi tạo với các bản ghi NDEF đã cho.

## Thuộc tính

- {{DOMxRef("NDEFMessage.records")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về danh sách các bản ghi NDEF có trong thông điệp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
