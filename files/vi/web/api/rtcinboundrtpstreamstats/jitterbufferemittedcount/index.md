---
title: "RTCInboundRtpStreamStats: thuộc tính jitterBufferEmittedCount"
short-title: jitterBufferEmittedCount
slug: Web/API/RTCInboundRtpStreamStats/jitterBufferEmittedCount
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.jitterBufferEmittedCount
---

{{APIRef("WebRTC")}}

Thuộc tính **`jitterBufferEmittedCount`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng số mẫu âm thanh và/hoặc khung hình video đã ra khỏi {{glossary("jitter","bộ đệm jitter")}}.

`jitterBufferEmittedCount` và {{domxref("RTCInboundRtpStreamStats.jitterBufferDelay", "jitterBufferDelay")}} được tăng khi mẫu hoặc khung hình rời khỏi bộ đệm.
Độ trễ bộ đệm jitter trung bình là `jitterBufferDelay / jitterBufferEmittedCount`.

## Giá trị

Một số dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats/jitterBufferDelay", "jitterBufferDelay")}}
