---
title: "RTCInboundRtpStreamStats: thuộc tính jitterBufferMinimumDelay"
short-title: jitterBufferMinimumDelay
slug: Web/API/RTCInboundRtpStreamStats/jitterBufferMinimumDelay
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.jitterBufferMinimumDelay
---

{{APIRef("WebRTC")}}

Thuộc tính **`jitterBufferMinimumDelay`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết độ trễ {{glossary("jitter","bộ đệm jitter")}} tối thiểu có thể đạt được chỉ dựa trên các đặc tính mạng như jitter và mất gói.

Độ trễ bộ đệm jitter có thể bị ảnh hưởng bởi các cài đặt người dùng như {{domxref("RTCRtpReceiver.jitterBufferTarget")}} và các cơ chế WebRTC như đồng bộ hóa AV.
`jitterBufferMinimumDelay` có thể được so sánh với {{domxref("RTCInboundRtpStreamStats.jitterBufferTargetDelay", "jitterBufferTargetDelay")}} để xem xét tác động của các yếu tố bên ngoài này lên độ trễ.

Thuộc tính được cập nhật khi {{domxref("RTCInboundRtpStreamStats.jitterBufferEmittedCount", "jitterBufferEmittedCount")}} được cập nhật.

## Giá trị

Một số dương, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.jitterBufferEmittedCount", "jitterBufferEmittedCount")}}
- {{domxref("RTCInboundRtpStreamStats.jitterBufferDelay", "jitterBufferDelay")}}
- {{domxref("RTCInboundRtpStreamStats.jitterBufferTargetDelay", "jitterBufferTargetDelay")}}
