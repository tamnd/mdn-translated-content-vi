---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính jitter"
short-title: jitter
slug: Web/API/RTCRemoteInboundRtpStreamStats/jitter
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.jitter
---

{{APIRef("WebRTC")}}

Thuộc tính **`jitter`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} trả về {{glossary("Jitter", "jitter gói")}} cho [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/ssrc) được đo bởi điểm cuối từ xa.

Các giá trị jitter gói cao cho thấy tốc độ đến gói biến đổi đáng kể, có thể làm giảm chất lượng video, âm thanh và các thông tin liên lạc theo thời gian thực khác qua WebRTC.

## Giá trị

Jitter gói, tính bằng giây.

Giá trị được tính bằng thuật toán "interarrival jitter" được mô tả trong {{RFC("3550", "", "6.4.1")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRemoteInboundRtpStreamStats.ssrc")}}
- {{domxref("RTCInboundRtpStreamStats.jitter")}}
