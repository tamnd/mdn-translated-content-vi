---
title: "RTCTransportStats: thuộc tính iceRole"
short-title: iceRole
slug: Web/API/RTCTransportStats/iceRole
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_transport.iceRole
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`iceRole`** của từ điển {{domxref("RTCTransportStats")}} là một chuỗi chỉ ra vai trò ICE mà transport đang thực hiện: vai trò của tác nhân điều khiển, hoặc tác nhân bị điều khiển.

Nó có cùng giá trị với thuộc tính {{domxref("RTCIceTransport.role")}} của {{domxref("RTCDtlsTransport.iceTransport")}} bên dưới.

## Giá trị

Một chuỗi sẽ là một trong các giá trị sau: `controlled`, `controlling`, hoặc `unknown`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
