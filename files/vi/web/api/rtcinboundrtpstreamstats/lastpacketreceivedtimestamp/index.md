---
title: "RTCInboundRtpStreamStats: thuộc tính lastPacketReceivedTimestamp"
short-title: lastPacketReceivedTimestamp
slug: Web/API/RTCInboundRtpStreamStats/lastPacketReceivedTimestamp
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.lastPacketReceivedTimestamp
---

{{APIRef("WebRTC")}}

Thuộc tính **`lastPacketReceivedTimestamp`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết thời điểm gói được nhận gần đây nhất đến từ nguồn này.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} chỉ ra thời điểm gói được nhận gần đây nhất đến trên luồng RTP này.

> [!NOTE]
> Giá trị này khác với {{domxref("RTCInboundRtpStreamStats.timestamp", "timestamp")}},
> vốn đại diện cho thời điểm đối tượng thống kê được tạo ra.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
