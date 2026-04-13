---
title: "RTCRemoteOutboundRtpStreamStats: thuộc tính codecId"
short-title: codecId
slug: Web/API/RTCRemoteOutboundRtpStreamStats/codecId
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-outbound-rtp.codecId
---

{{APIRef("WebRTC")}}

Thuộc tính **`codecId`** của từ điển {{domxref("RTCRemoteOutboundRtpStreamStats")}} là một chuỗi nhận dạng duy nhất đối tượng đã được kiểm tra để tạo ra dữ liệu trong {{domxref("RTCCodecStats")}} cho luồng {{Glossary("RTP")}}.

Các đối tượng `RTCRemoteOutboundRtpStreamStats` và `RTCCodecStats` được tương quan bằng cách lặp qua {{domxref("RTCStatsReport")}} để tìm các đối tượng thống kê trong đó `RTCRemoteOutboundRtpStreamStats.codecId` bằng với {{domxref("RTCCodecStats.id")}}.

## Giá trị

Chuỗi chứa {{domxref("RTCCodecStats.id","id")}} của đối tượng đã được kiểm tra để tạo ra đối tượng {{domxref("RTCCodecStats")}} liên kết với luồng RTP này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
