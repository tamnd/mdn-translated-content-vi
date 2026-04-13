---
title: PresentationConnectionAvailableEvent
slug: Web/API/PresentationConnectionAvailableEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PresentationConnectionAvailableEvent
---

{{SeeCompatTable}}{{securecontext_header}}{{APIRef("Presentation API")}}

Giao diện **`PresentationConnectionAvailableEvent`** của [Presentation API](/en-US/docs/Web/API/Presentation_API) được kích hoạt trên một {{domxref("PresentationRequest")}} khi một kết nối được liên kết với đối tượng được tạo.

[Tác nhân người dùng kiểm soát](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent) [kích hoạt](https://www.w3.org/TR/presentation-api/#dfn-firing-an-event) một [sự kiện đáng tin cậy](https://www.w3.org/TR/presentation-api/#dfn-trusted-event) có tên [`connectionavailable`](https://www.w3.org/TR/presentation-api/#dfn-connectionavailable) trên một [`PresentationRequest`](https://www.w3.org/TR/presentation-api/#idl-def-presentationrequest) khi một kết nối liên kết với đối tượng được tạo. Sự kiện được kích hoạt tại phiên bản `PresentationRequest`, sử dụng giao diện [`PresentationConnectionAvailableEvent`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnectionavailableevent), với thuộc tính [`connection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnectionavailableevent-connection) được đặt thành đối tượng [`PresentationConnection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection) đã được tạo.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PresentationConnectionAvailableEvent.PresentationConnectionAvailableEvent", "PresentationConnectionAvailableEvent()")}} {{Experimental_Inline}}
  - : Tạo một PresentationConnectionAvailableEvent mới.

## Thuộc tính phiên bản

- {{domxref("PresentationConnectionAvailableEvent.connection")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một tham chiếu đến đối tượng {{domxref("PresentationConnection")}} đã kích hoạt sự kiện.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
