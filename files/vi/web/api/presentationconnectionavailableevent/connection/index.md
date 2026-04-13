---
title: "PresentationConnectionAvailableEvent: thuộc tính connection"
short-title: connection
slug: Web/API/PresentationConnectionAvailableEvent/connection
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PresentationConnectionAvailableEvent.connection
---

{{APIRef("Presentation API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Khi một kết nối đến được tạo, một [tác nhân người dùng nhận](https://www.w3.org/TR/presentation-api/#dfn-receiving-user-agent) [kích hoạt](https://www.w3.org/TR/presentation-api/#dfn-firing-an-event) một [sự kiện đáng tin cậy](https://www.w3.org/TR/presentation-api/#dfn-trusted-event) có tên [`connectionavailable`](https://www.w3.org/TR/presentation-api/#dfn-connectionavailable) trên một [`PresentationReceiver`](https://www.w3.org/TR/presentation-api/#idl-def-presentationreceiver). [Sự kiện đáng tin cậy](https://www.w3.org/TR/presentation-api/#dfn-trusted-event) được kích hoạt tại [màn hình của bộ điều khiển trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-controllers-monitor), sử dụng giao diện [`PresentationConnectionAvailableEvent`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnectionavailableevent), với thuộc tính [`connection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnectionavailableevent-connection) được đặt thành đối tượng [`PresentationConnection`](https://www.w3.org/TR/presentation-api/#idl-def-presentationconnection) đã được tạo.

Sự kiện được kích hoạt cho tất cả các kết nối được tạo khi [theo dõi các kết nối trình bày đến](https://www.w3.org/TR/presentation-api/#dfn-monitoring-incoming-presentation-connections).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
