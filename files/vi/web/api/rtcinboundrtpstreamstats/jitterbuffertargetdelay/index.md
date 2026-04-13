---
title: "RTCInboundRtpStreamStats: thuộc tính jitterBufferTargetDelay"
short-title: jitterBufferTargetDelay
slug: Web/API/RTCInboundRtpStreamStats/jitterBufferTargetDelay
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.jitterBufferTargetDelay
---

{{APIRef("WebRTC")}}

Thuộc tính **`jitterBufferTargetDelay`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng độ trễ {{glossary("jitter","bộ đệm jitter")}} mục tiêu tích lũy, tính bằng giây.

Độ trễ bộ đệm jitter mục tiêu là độ trễ phát mà bộ đệm jitter ước tính cần duy trì để bù đắp cho jitter và đảm bảo phát mượt mà.
Ước tính bị ảnh hưởng bởi sự biến động và độ trễ mạng cũng như các cơ chế như đồng bộ hóa AV. Các nhà phát triển có thể ảnh hưởng đến nó bằng cách đặt thuộc tính {{domxref("RTCRtpReceiver.jitterBufferTarget")}}.

Thuộc tính được cập nhật khi {{domxref("RTCInboundRtpStreamStats.jitterBufferEmittedCount", "jitterBufferEmittedCount")}} được cập nhật.
Độ trễ bộ đệm jitter mục tiêu trung bình là `jitterBufferTargetDelay / jitterBufferEmittedCount`.

Thuộc tính có thể được so sánh với giá trị trung bình của {{domxref("RTCInboundRtpStreamStats.jitterBufferMinimumDelay", "jitterBufferMinimumDelay")}} để xác định tác động của các yếu tố bên ngoài lên mục tiêu, chẳng hạn như gợi ý `jitterBufferTarget` đã được cấu hình.

## Giá trị

Một số dương, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.jitterBufferEmittedCount", "jitterBufferEmittedCount")}}
- {{domxref("RTCInboundRtpStreamStats.jitterBufferMinimumDelay", "jitterBufferMinimumDelay")}}
- {{domxref("RTCInboundRtpStreamStats.jitterBufferDelay", "jitterBufferDelay")}}
