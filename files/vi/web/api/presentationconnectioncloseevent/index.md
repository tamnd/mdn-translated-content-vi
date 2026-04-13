---
title: PresentationConnectionCloseEvent
slug: Web/API/PresentationConnectionCloseEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PresentationConnectionCloseEvent
---

{{SeeCompatTable}}{{securecontext_header}}{{APIRef("Presentation API")}}

Giao diện **`PresentationConnectionCloseEvent`** của [Presentation API](/en-US/docs/Web/API/Presentation_API) được kích hoạt trên một {{domxref("PresentationConnection")}} khi nó bị đóng.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PresentationConnectionCloseEvent.PresentationConnectionCloseEvent", "PresentationConnectionCloseEvent()")}} {{Experimental_Inline}}
  - : Tạo một PresentationConnectionCloseEvent mới.

## Thuộc tính phiên bản

- {{DOMxRef("PresentationConnectionCloseEvent.message")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một thông báo có thể đọc được của con người cung cấp thêm thông tin về lý do tại sao kết nối bị đóng.
- {{DOMxRef("PresentationConnectionCloseEvent.reason")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Cho biết tại sao kết nối bị đóng. Thuộc tính này nhận một trong các giá trị sau: `error`, `closed`, hoặc `wentaway`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
