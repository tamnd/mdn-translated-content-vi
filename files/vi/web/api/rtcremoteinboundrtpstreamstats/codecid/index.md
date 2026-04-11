---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính codecId"
short-title: codecId
slug: Web/API/RTCRemoteInboundRtpStreamStats/codecId
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.codecId
---

{{APIRef("WebRTC")}}

Thuộc tính **`codecId`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} là một chuỗi xác định duy nhất đối tượng được kiểm tra để tạo ra dữ liệu trong {{domxref("RTCCodecStats")}} cho luồng {{Glossary("RTP")}}.

Các đối tượng `RTCRemoteInboundRtpStreamStats` và `RTCCodecStats` được tương quan bằng cách duyệt qua {{domxref("RTCStatsReport")}} để tìm các đối tượng thống kê trong đó `RTCRemoteInboundRtpStreamStats.codecId` bằng {{domxref("RTCCodecStats.id")}}.

## Giá trị

Một chuỗi chứa {{domxref("RTCCodecStats.id","id")}} của đối tượng được kiểm tra để tạo ra đối tượng {{domxref("RTCCodecStats")}} liên kết với luồng RTP này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
