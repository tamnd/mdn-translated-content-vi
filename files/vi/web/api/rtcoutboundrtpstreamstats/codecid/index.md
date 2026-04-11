---
title: "RTCOutboundRtpStreamStats: codecId property"
short-title: codecId
slug: Web/API/RTCOutboundRtpStreamStats/codecId
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.codecId
---

{{APIRef("WebRTC")}}

Thuộc tính **`codecId`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là một chuỗi xác định duy nhất đối tượng đã được kiểm tra để tạo ra dữ liệu trong {{domxref("RTCCodecStats")}} cho luồng {{Glossary("RTP")}}.

Các đối tượng `RTCOutboundRtpStreamStats` và `RTCCodecStats` được liên kết bằng cách lặp qua {{domxref("RTCStatsReport")}} để tìm các đối tượng thống kê trong đó `RTCOutboundRtpStreamStats.codecId` bằng {{domxref("RTCCodecStats.id")}}.

## Giá trị

Chuỗi chứa {{domxref("RTCCodecStats.id","id")}} của đối tượng đã được kiểm tra để tạo ra đối tượng {{domxref("RTCCodecStats")}} liên quan đến luồng RTP này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
