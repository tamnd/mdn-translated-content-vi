---
title: "RTCRemoteOutboundRtpStreamStats: thuộc tính transportId"
short-title: transportId
slug: Web/API/RTCRemoteOutboundRtpStreamStats/transportId
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-outbound-rtp.transportId
---

{{APIRef("WebRTC")}}

Thuộc tính **`transportId`** của từ điển {{domxref("RTCRemoteOutboundRtpStreamStats")}} là một chuỗi nhận dạng duy nhất đối tượng {{domxref("RTCTransportStats")}} thống kê liên kết cho truyền tải nền của luồng RTP này.

Các đối tượng `RTCRemoteOutboundRtpStreamStats` và `RTCTransportStats` được tương quan bằng cách lặp qua {{domxref("RTCStatsReport")}} để tìm các đối tượng thống kê trong đó `RTCRemoteOutboundRtpStreamStats.transportId` bằng với {{domxref("RTCTransportStats.id")}}.

## Giá trị

Chuỗi chứa {{domxref("RTCTransportStats.id","id")}} của đối tượng đã được kiểm tra để tạo ra đối tượng {{domxref("RTCTransportStats")}} liên kết với luồng RTP này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
