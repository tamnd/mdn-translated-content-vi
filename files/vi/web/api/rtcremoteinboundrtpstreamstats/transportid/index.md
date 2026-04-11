---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính transportId"
short-title: transportId
slug: Web/API/RTCRemoteInboundRtpStreamStats/transportId
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.transportId
---

{{APIRef("WebRTC")}}

Thuộc tính **`transportId`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} là một chuỗi xác định duy nhất đối tượng {{domxref("RTCTransportStats")}} thống kê liên kết cho kênh truyền dẫn cơ sở của luồng RTP này.

Các đối tượng `RTCRemoteInboundRtpStreamStats` và `RTCTransportStats` được tương quan bằng cách duyệt qua {{domxref("RTCStatsReport")}} để tìm các đối tượng thống kê trong đó `RTCRemoteInboundRtpStreamStats.transportId` bằng {{domxref("RTCTransportStats.id")}}.

## Giá trị

Một chuỗi chứa {{domxref("RTCTransportStats.id","id")}} của đối tượng được kiểm tra để tạo ra đối tượng {{domxref("RTCTransportStats")}} liên kết với luồng RTP này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
