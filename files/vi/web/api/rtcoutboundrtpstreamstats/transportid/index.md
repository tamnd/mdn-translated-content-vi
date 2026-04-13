---
title: "RTCOutboundRtpStreamStats: transportId property"
short-title: transportId
slug: Web/API/RTCOutboundRtpStreamStats/transportId
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.transportId
---

{{APIRef("WebRTC")}}

Thuộc tính **`transportId`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là một chuỗi xác định duy nhất đối tượng {{domxref("RTCTransportStats")}} liên quan cho transport bên dưới của luồng RTP này.

Các đối tượng `RTCOutboundRtpStreamStats` và `RTCTransportStats` được liên kết bằng cách lặp qua {{domxref("RTCStatsReport")}} để tìm các đối tượng thống kê trong đó `RTCOutboundRtpStreamStats.transportId` bằng {{domxref("RTCTransportStats.id")}}.

## Giá trị

Chuỗi chứa {{domxref("RTCTransportStats.id","id")}} của đối tượng đã được kiểm tra để tạo ra đối tượng {{domxref("RTCTransportStats")}} liên quan đến luồng RTP này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
