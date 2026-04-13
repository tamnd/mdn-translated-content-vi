---
title: "RTCTransportStats: thuộc tính iceState"
short-title: iceState
slug: Web/API/RTCTransportStats/iceState
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_transport.iceState
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`iceState`** của từ điển {{domxref("RTCTransportStats")}} là một chuỗi chỉ ra trạng thái ICE hiện tại của {{domxref("RTCIceTransport")}} bên dưới.

Nó có cùng giá trị với thuộc tính {{domxref("RTCIceTransport.state")}} tương ứng.

## Giá trị

Một chuỗi sẽ là một trong các giá trị sau: `new`, `checking`, `connected`, `completed`, `disconnected`, `failed`, hoặc `closed`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
