---
title: "RTCCodecStats: transportId property"
short-title: transportId
slug: Web/API/RTCCodecStats/transportId
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_codec.transportId
---

{{APIRef("WebRTC")}}

Thuộc tính **`transportId`** của từ điển {{domxref("RTCCodecStats")}} là một chuỗi chứa mã định danh duy nhất của transport tương ứng đang sử dụng codec này.

Bạn có thể liên kết codec và thống kê transport liên quan bằng cách khớp `RTCCodecStats.transportId` với giá trị {{domxref("RTCTransportStats.id")}}.

## Giá trị

Một chuỗi định danh duy nhất cho đối tượng {{domxref("RTCTransportStats")}} khớp bằng thuộc tính `id` của nó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
